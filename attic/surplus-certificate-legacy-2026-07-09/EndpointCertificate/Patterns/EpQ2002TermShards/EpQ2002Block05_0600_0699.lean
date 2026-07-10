/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 5:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_05_0600_0699 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0600 : Poly :=
[
  term ((6069105022 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 5. -/
def ep_Q2_002_partial_05_0600 : Poly :=
[
  term ((6069105022 : Rat) / 1057331035) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6069105022 : Rat) / 1057331035) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6069105022 : Rat) / 1057331035) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6069105022 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 5. -/
theorem ep_Q2_002_partial_05_0600_valid :
    mulPoly ep_Q2_002_coefficient_05_0600
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0601 : Poly :=
[
  term ((15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1)]
]

/-- Partial product 601 for generator 5. -/
def ep_Q2_002_partial_05_0601 : Poly :=
[
  term ((15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (11, 1)],
  term ((15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(3, 2), (7, 1), (11, 1)],
  term ((-15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (14, 2)],
  term ((-15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 5. -/
theorem ep_Q2_002_partial_05_0601_valid :
    mulPoly ep_Q2_002_coefficient_05_0601
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0602 : Poly :=
[
  term ((-3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 602 for generator 5. -/
def ep_Q2_002_partial_05_0602 : Poly :=
[
  term ((-3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 5. -/
theorem ep_Q2_002_partial_05_0602_valid :
    mulPoly ep_Q2_002_coefficient_05_0602
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0603 : Poly :=
[
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 603 for generator 5. -/
def ep_Q2_002_partial_05_0603 : Poly :=
[
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 5. -/
theorem ep_Q2_002_partial_05_0603_valid :
    mulPoly ep_Q2_002_coefficient_05_0603
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0604 : Poly :=
[
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)]
]

/-- Partial product 604 for generator 5. -/
def ep_Q2_002_partial_05_0604 : Poly :=
[
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 2)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (14, 2)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 5. -/
theorem ep_Q2_002_partial_05_0604_valid :
    mulPoly ep_Q2_002_coefficient_05_0604
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0605 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 605 for generator 5. -/
def ep_Q2_002_partial_05_0605 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 5. -/
theorem ep_Q2_002_partial_05_0605_valid :
    mulPoly ep_Q2_002_coefficient_05_0605
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0606 : Poly :=
[
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 606 for generator 5. -/
def ep_Q2_002_partial_05_0606 : Poly :=
[
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 5. -/
theorem ep_Q2_002_partial_05_0606_valid :
    mulPoly ep_Q2_002_coefficient_05_0606
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0607 : Poly :=
[
  term ((12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 607 for generator 5. -/
def ep_Q2_002_partial_05_0607 : Poly :=
[
  term ((12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 5. -/
theorem ep_Q2_002_partial_05_0607_valid :
    mulPoly ep_Q2_002_coefficient_05_0607
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0608 : Poly :=
[
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 608 for generator 5. -/
def ep_Q2_002_partial_05_0608 : Poly :=
[
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 5. -/
theorem ep_Q2_002_partial_05_0608_valid :
    mulPoly ep_Q2_002_coefficient_05_0608
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0609 : Poly :=
[
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 609 for generator 5. -/
def ep_Q2_002_partial_05_0609 : Poly :=
[
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 5. -/
theorem ep_Q2_002_partial_05_0609_valid :
    mulPoly ep_Q2_002_coefficient_05_0609
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0610 : Poly :=
[
  term ((5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 5. -/
def ep_Q2_002_partial_05_0610 : Poly :=
[
  term ((5653247164 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5653247164 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 5. -/
theorem ep_Q2_002_partial_05_0610_valid :
    mulPoly ep_Q2_002_coefficient_05_0610
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0611 : Poly :=
[
  term ((44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 611 for generator 5. -/
def ep_Q2_002_partial_05_0611 : Poly :=
[
  term ((44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 5. -/
theorem ep_Q2_002_partial_05_0611_valid :
    mulPoly ep_Q2_002_coefficient_05_0611
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0612 : Poly :=
[
  term ((18886077736 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 5. -/
def ep_Q2_002_partial_05_0612 : Poly :=
[
  term ((18886077736 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((18886077736 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18886077736 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18886077736 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 5. -/
theorem ep_Q2_002_partial_05_0612_valid :
    mulPoly ep_Q2_002_coefficient_05_0612
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0613 : Poly :=
[
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 613 for generator 5. -/
def ep_Q2_002_partial_05_0613 : Poly :=
[
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 5. -/
theorem ep_Q2_002_partial_05_0613_valid :
    mulPoly ep_Q2_002_coefficient_05_0613
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0614 : Poly :=
[
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 614 for generator 5. -/
def ep_Q2_002_partial_05_0614 : Poly :=
[
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 5. -/
theorem ep_Q2_002_partial_05_0614_valid :
    mulPoly ep_Q2_002_coefficient_05_0614
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0615 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 5. -/
def ep_Q2_002_partial_05_0615 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 5. -/
theorem ep_Q2_002_partial_05_0615_valid :
    mulPoly ep_Q2_002_coefficient_05_0615
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0616 : Poly :=
[
  term ((-426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 616 for generator 5. -/
def ep_Q2_002_partial_05_0616 : Poly :=
[
  term ((-426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((-426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)],
  term ((426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 5. -/
theorem ep_Q2_002_partial_05_0616_valid :
    mulPoly ep_Q2_002_coefficient_05_0616
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0617 : Poly :=
[
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 617 for generator 5. -/
def ep_Q2_002_partial_05_0617 : Poly :=
[
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 5. -/
theorem ep_Q2_002_partial_05_0617_valid :
    mulPoly ep_Q2_002_coefficient_05_0617
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0618 : Poly :=
[
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 618 for generator 5. -/
def ep_Q2_002_partial_05_0618 : Poly :=
[
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 5. -/
theorem ep_Q2_002_partial_05_0618_valid :
    mulPoly ep_Q2_002_coefficient_05_0618
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0619 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 5. -/
def ep_Q2_002_partial_05_0619 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 5. -/
theorem ep_Q2_002_partial_05_0619_valid :
    mulPoly ep_Q2_002_coefficient_05_0619
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0620 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 620 for generator 5. -/
def ep_Q2_002_partial_05_0620 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 5. -/
theorem ep_Q2_002_partial_05_0620_valid :
    mulPoly ep_Q2_002_coefficient_05_0620
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0621 : Poly :=
[
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 621 for generator 5. -/
def ep_Q2_002_partial_05_0621 : Poly :=
[
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 3)],
  term ((227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 5. -/
theorem ep_Q2_002_partial_05_0621_valid :
    mulPoly ep_Q2_002_coefficient_05_0621
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0622 : Poly :=
[
  term ((971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 5. -/
def ep_Q2_002_partial_05_0622 : Poly :=
[
  term ((971178168349 : Rat) / 88815806940) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((971178168349 : Rat) / 88815806940) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-971178168349 : Rat) / 88815806940) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 5. -/
theorem ep_Q2_002_partial_05_0622_valid :
    mulPoly ep_Q2_002_coefficient_05_0622
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0623 : Poly :=
[
  term ((-1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 623 for generator 5. -/
def ep_Q2_002_partial_05_0623 : Poly :=
[
  term ((-1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((-1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)],
  term ((1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 5. -/
theorem ep_Q2_002_partial_05_0623_valid :
    mulPoly ep_Q2_002_coefficient_05_0623
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0624 : Poly :=
[
  term ((-2171750877743 : Rat) / 88815806940) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 5. -/
def ep_Q2_002_partial_05_0624 : Poly :=
[
  term ((-2171750877743 : Rat) / 88815806940) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2171750877743 : Rat) / 88815806940) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2171750877743 : Rat) / 88815806940) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((2171750877743 : Rat) / 88815806940) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 5. -/
theorem ep_Q2_002_partial_05_0624_valid :
    mulPoly ep_Q2_002_coefficient_05_0624
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0625 : Poly :=
[
  term ((-4144552972962889184208 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 625 for generator 5. -/
def ep_Q2_002_partial_05_0625 : Poly :=
[
  term ((-4144552972962889184208 : Rat) / 253528477699481291099) [(2, 2), (7, 2)],
  term ((-4144552972962889184208 : Rat) / 253528477699481291099) [(3, 2), (7, 2)],
  term ((4144552972962889184208 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((4144552972962889184208 : Rat) / 253528477699481291099) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 5. -/
theorem ep_Q2_002_partial_05_0625_valid :
    mulPoly ep_Q2_002_coefficient_05_0625
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0626 : Poly :=
[
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1)]
]

/-- Partial product 626 for generator 5. -/
def ep_Q2_002_partial_05_0626 : Poly :=
[
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(2, 2), (7, 2), (12, 1)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(3, 2), (7, 2), (12, 1)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (14, 2)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 5. -/
theorem ep_Q2_002_partial_05_0626_valid :
    mulPoly ep_Q2_002_coefficient_05_0626
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0627 : Poly :=
[
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1)]
]

/-- Partial product 627 for generator 5. -/
def ep_Q2_002_partial_05_0627 : Poly :=
[
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(2, 2), (7, 2), (14, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (7, 2), (14, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1), (15, 2)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 5. -/
theorem ep_Q2_002_partial_05_0627_valid :
    mulPoly ep_Q2_002_coefficient_05_0627
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0628 : Poly :=
[
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 628 for generator 5. -/
def ep_Q2_002_partial_05_0628 : Poly :=
[
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 5. -/
theorem ep_Q2_002_partial_05_0628_valid :
    mulPoly ep_Q2_002_coefficient_05_0628
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0629 : Poly :=
[
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 629 for generator 5. -/
def ep_Q2_002_partial_05_0629 : Poly :=
[
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 5. -/
theorem ep_Q2_002_partial_05_0629_valid :
    mulPoly ep_Q2_002_coefficient_05_0629
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0630 : Poly :=
[
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 5. -/
def ep_Q2_002_partial_05_0630 : Poly :=
[
  term ((24320858914 : Rat) / 7401317245) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((24320858914 : Rat) / 7401317245) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 5. -/
theorem ep_Q2_002_partial_05_0630_valid :
    mulPoly ep_Q2_002_coefficient_05_0630
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0631 : Poly :=
[
  term ((-26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 631 for generator 5. -/
def ep_Q2_002_partial_05_0631 : Poly :=
[
  term ((-26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 5. -/
theorem ep_Q2_002_partial_05_0631_valid :
    mulPoly ep_Q2_002_coefficient_05_0631
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0632 : Poly :=
[
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 632 for generator 5. -/
def ep_Q2_002_partial_05_0632 : Poly :=
[
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 5. -/
theorem ep_Q2_002_partial_05_0632_valid :
    mulPoly ep_Q2_002_coefficient_05_0632
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0633 : Poly :=
[
  term ((-1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 633 for generator 5. -/
def ep_Q2_002_partial_05_0633 : Poly :=
[
  term ((-1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 5. -/
theorem ep_Q2_002_partial_05_0633_valid :
    mulPoly ep_Q2_002_coefficient_05_0633
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0634 : Poly :=
[
  term ((-9446552534 : Rat) / 1057331035) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 5. -/
def ep_Q2_002_partial_05_0634 : Poly :=
[
  term ((-9446552534 : Rat) / 1057331035) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9446552534 : Rat) / 1057331035) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9446552534 : Rat) / 1057331035) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9446552534 : Rat) / 1057331035) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 5. -/
theorem ep_Q2_002_partial_05_0634_valid :
    mulPoly ep_Q2_002_coefficient_05_0634
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0635 : Poly :=
[
  term ((40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 635 for generator 5. -/
def ep_Q2_002_partial_05_0635 : Poly :=
[
  term ((40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((-40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((-40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 5. -/
theorem ep_Q2_002_partial_05_0635_valid :
    mulPoly ep_Q2_002_coefficient_05_0635
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0636 : Poly :=
[
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 636 for generator 5. -/
def ep_Q2_002_partial_05_0636 : Poly :=
[
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2), (12, 1)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2), (12, 1)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 5. -/
theorem ep_Q2_002_partial_05_0636_valid :
    mulPoly ep_Q2_002_coefficient_05_0636
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0637 : Poly :=
[
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 637 for generator 5. -/
def ep_Q2_002_partial_05_0637 : Poly :=
[
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 5. -/
theorem ep_Q2_002_partial_05_0637_valid :
    mulPoly ep_Q2_002_coefficient_05_0637
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0638 : Poly :=
[
  term ((4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 5. -/
def ep_Q2_002_partial_05_0638 : Poly :=
[
  term ((4452383839 : Rat) / 1057331035) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 5. -/
theorem ep_Q2_002_partial_05_0638_valid :
    mulPoly ep_Q2_002_coefficient_05_0638
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0639 : Poly :=
[
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 639 for generator 5. -/
def ep_Q2_002_partial_05_0639 : Poly :=
[
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 5. -/
theorem ep_Q2_002_partial_05_0639_valid :
    mulPoly ep_Q2_002_coefficient_05_0639
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0640 : Poly :=
[
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 640 for generator 5. -/
def ep_Q2_002_partial_05_0640 : Poly :=
[
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 5. -/
theorem ep_Q2_002_partial_05_0640_valid :
    mulPoly ep_Q2_002_coefficient_05_0640
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0641 : Poly :=
[
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 5. -/
def ep_Q2_002_partial_05_0641 : Poly :=
[
  term ((26580130506 : Rat) / 7401317245) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((26580130506 : Rat) / 7401317245) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 5. -/
theorem ep_Q2_002_partial_05_0641_valid :
    mulPoly ep_Q2_002_coefficient_05_0641
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0642 : Poly :=
[
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 642 for generator 5. -/
def ep_Q2_002_partial_05_0642 : Poly :=
[
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 5. -/
theorem ep_Q2_002_partial_05_0642_valid :
    mulPoly ep_Q2_002_coefficient_05_0642
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0643 : Poly :=
[
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 5. -/
def ep_Q2_002_partial_05_0643 : Poly :=
[
  term ((-26580130506 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 5. -/
theorem ep_Q2_002_partial_05_0643_valid :
    mulPoly ep_Q2_002_coefficient_05_0643
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0644 : Poly :=
[
  term ((1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 644 for generator 5. -/
def ep_Q2_002_partial_05_0644 : Poly :=
[
  term ((1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 5. -/
theorem ep_Q2_002_partial_05_0644_valid :
    mulPoly ep_Q2_002_coefficient_05_0644
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0645 : Poly :=
[
  term ((8703508886 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 5. -/
def ep_Q2_002_partial_05_0645 : Poly :=
[
  term ((8703508886 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8703508886 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8703508886 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8703508886 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 5. -/
theorem ep_Q2_002_partial_05_0645_valid :
    mulPoly ep_Q2_002_coefficient_05_0645
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0646 : Poly :=
[
  term ((-95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 646 for generator 5. -/
def ep_Q2_002_partial_05_0646 : Poly :=
[
  term ((-95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2)],
  term ((-95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2)],
  term ((95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 5. -/
theorem ep_Q2_002_partial_05_0646_valid :
    mulPoly ep_Q2_002_coefficient_05_0646
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0647 : Poly :=
[
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 647 for generator 5. -/
def ep_Q2_002_partial_05_0647 : Poly :=
[
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2), (14, 1)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2), (14, 1)],
  term ((19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 5. -/
theorem ep_Q2_002_partial_05_0647_valid :
    mulPoly ep_Q2_002_coefficient_05_0647
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0648 : Poly :=
[
  term ((-889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 648 for generator 5. -/
def ep_Q2_002_partial_05_0648 : Poly :=
[
  term ((-889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((-889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 5. -/
theorem ep_Q2_002_partial_05_0648_valid :
    mulPoly ep_Q2_002_coefficient_05_0648
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0649 : Poly :=
[
  term ((5555401972 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 5. -/
def ep_Q2_002_partial_05_0649 : Poly :=
[
  term ((5555401972 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((5555401972 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5555401972 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5555401972 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 5. -/
theorem ep_Q2_002_partial_05_0649_valid :
    mulPoly ep_Q2_002_coefficient_05_0649
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0650 : Poly :=
[
  term ((-1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1)]
]

/-- Partial product 650 for generator 5. -/
def ep_Q2_002_partial_05_0650 : Poly :=
[
  term ((-1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1)],
  term ((-1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1)],
  term ((1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (14, 2)],
  term ((1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 5. -/
theorem ep_Q2_002_partial_05_0650_valid :
    mulPoly ep_Q2_002_coefficient_05_0650
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0651 : Poly :=
[
  term ((-176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 651 for generator 5. -/
def ep_Q2_002_partial_05_0651 : Poly :=
[
  term ((-176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 5. -/
theorem ep_Q2_002_partial_05_0651_valid :
    mulPoly ep_Q2_002_coefficient_05_0651
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0652 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 652 for generator 5. -/
def ep_Q2_002_partial_05_0652 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 5. -/
theorem ep_Q2_002_partial_05_0652_valid :
    mulPoly ep_Q2_002_coefficient_05_0652
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0653 : Poly :=
[
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 653 for generator 5. -/
def ep_Q2_002_partial_05_0653 : Poly :=
[
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(2, 2), (9, 1), (11, 1), (12, 2)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(3, 2), (9, 1), (11, 1), (12, 2)],
  term ((-5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((-5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 5. -/
theorem ep_Q2_002_partial_05_0653_valid :
    mulPoly ep_Q2_002_coefficient_05_0653
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0654 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 654 for generator 5. -/
def ep_Q2_002_partial_05_0654 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 5. -/
theorem ep_Q2_002_partial_05_0654_valid :
    mulPoly ep_Q2_002_coefficient_05_0654
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0655 : Poly :=
[
  term ((183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 655 for generator 5. -/
def ep_Q2_002_partial_05_0655 : Poly :=
[
  term ((183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 5. -/
theorem ep_Q2_002_partial_05_0655_valid :
    mulPoly ep_Q2_002_coefficient_05_0655
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0656 : Poly :=
[
  term ((332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 656 for generator 5. -/
def ep_Q2_002_partial_05_0656 : Poly :=
[
  term ((332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 5. -/
theorem ep_Q2_002_partial_05_0656_valid :
    mulPoly ep_Q2_002_coefficient_05_0656
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0657 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 657 for generator 5. -/
def ep_Q2_002_partial_05_0657 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 5. -/
theorem ep_Q2_002_partial_05_0657_valid :
    mulPoly ep_Q2_002_coefficient_05_0657
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0658 : Poly :=
[
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 658 for generator 5. -/
def ep_Q2_002_partial_05_0658 : Poly :=
[
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 5. -/
theorem ep_Q2_002_partial_05_0658_valid :
    mulPoly ep_Q2_002_coefficient_05_0658
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0659 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 5. -/
def ep_Q2_002_partial_05_0659 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 5. -/
theorem ep_Q2_002_partial_05_0659_valid :
    mulPoly ep_Q2_002_coefficient_05_0659
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0660 : Poly :=
[
  term ((-263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 660 for generator 5. -/
def ep_Q2_002_partial_05_0660 : Poly :=
[
  term ((-263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 5. -/
theorem ep_Q2_002_partial_05_0660_valid :
    mulPoly ep_Q2_002_coefficient_05_0660
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0661 : Poly :=
[
  term ((15429109301 : Rat) / 1480263449) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 5. -/
def ep_Q2_002_partial_05_0661 : Poly :=
[
  term ((15429109301 : Rat) / 1480263449) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((15429109301 : Rat) / 1480263449) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15429109301 : Rat) / 1480263449) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15429109301 : Rat) / 1480263449) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 5. -/
theorem ep_Q2_002_partial_05_0661_valid :
    mulPoly ep_Q2_002_coefficient_05_0661
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0662 : Poly :=
[
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 662 for generator 5. -/
def ep_Q2_002_partial_05_0662 : Poly :=
[
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 5. -/
theorem ep_Q2_002_partial_05_0662_valid :
    mulPoly ep_Q2_002_coefficient_05_0662
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0663 : Poly :=
[
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 663 for generator 5. -/
def ep_Q2_002_partial_05_0663 : Poly :=
[
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 5. -/
theorem ep_Q2_002_partial_05_0663_valid :
    mulPoly ep_Q2_002_coefficient_05_0663
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0664 : Poly :=
[
  term ((-4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 5. -/
def ep_Q2_002_partial_05_0664 : Poly :=
[
  term ((-4452383839 : Rat) / 1057331035) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 5. -/
theorem ep_Q2_002_partial_05_0664_valid :
    mulPoly ep_Q2_002_coefficient_05_0664
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0665 : Poly :=
[
  term ((3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1)]
]

/-- Partial product 665 for generator 5. -/
def ep_Q2_002_partial_05_0665 : Poly :=
[
  term ((3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (13, 1)],
  term ((3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (13, 1)],
  term ((-3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (14, 2)],
  term ((-3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 5. -/
theorem ep_Q2_002_partial_05_0665_valid :
    mulPoly ep_Q2_002_coefficient_05_0665
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0666 : Poly :=
[
  term ((-345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 666 for generator 5. -/
def ep_Q2_002_partial_05_0666 : Poly :=
[
  term ((-345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 5. -/
theorem ep_Q2_002_partial_05_0666_valid :
    mulPoly ep_Q2_002_coefficient_05_0666
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0667 : Poly :=
[
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 667 for generator 5. -/
def ep_Q2_002_partial_05_0667 : Poly :=
[
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 5. -/
theorem ep_Q2_002_partial_05_0667_valid :
    mulPoly ep_Q2_002_coefficient_05_0667
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0668 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 5. -/
def ep_Q2_002_partial_05_0668 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 5. -/
theorem ep_Q2_002_partial_05_0668_valid :
    mulPoly ep_Q2_002_coefficient_05_0668
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0669 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 669 for generator 5. -/
def ep_Q2_002_partial_05_0669 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 5. -/
theorem ep_Q2_002_partial_05_0669_valid :
    mulPoly ep_Q2_002_coefficient_05_0669
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0670 : Poly :=
[
  term ((-2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 670 for generator 5. -/
def ep_Q2_002_partial_05_0670 : Poly :=
[
  term ((-2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 3)],
  term ((2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 5. -/
theorem ep_Q2_002_partial_05_0670_valid :
    mulPoly ep_Q2_002_coefficient_05_0670
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0671 : Poly :=
[
  term ((-25536398142 : Rat) / 1057331035) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 5. -/
def ep_Q2_002_partial_05_0671 : Poly :=
[
  term ((-25536398142 : Rat) / 1057331035) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25536398142 : Rat) / 1057331035) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((25536398142 : Rat) / 1057331035) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((25536398142 : Rat) / 1057331035) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 5. -/
theorem ep_Q2_002_partial_05_0671_valid :
    mulPoly ep_Q2_002_coefficient_05_0671
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0672 : Poly :=
[
  term ((27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(9, 1), (15, 1)]
]

/-- Partial product 672 for generator 5. -/
def ep_Q2_002_partial_05_0672 : Poly :=
[
  term ((27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (9, 1), (15, 1)],
  term ((27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (9, 1), (15, 1)],
  term ((-27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(9, 1), (14, 2), (15, 1)],
  term ((-27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 5. -/
theorem ep_Q2_002_partial_05_0672_valid :
    mulPoly ep_Q2_002_coefficient_05_0672
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0673 : Poly :=
[
  term ((10343573018 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 5. -/
def ep_Q2_002_partial_05_0673 : Poly :=
[
  term ((10343573018 : Rat) / 1480263449) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((10343573018 : Rat) / 1480263449) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10343573018 : Rat) / 1480263449) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10343573018 : Rat) / 1480263449) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 5. -/
theorem ep_Q2_002_partial_05_0673_valid :
    mulPoly ep_Q2_002_coefficient_05_0673
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0674 : Poly :=
[
  term ((2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 674 for generator 5. -/
def ep_Q2_002_partial_05_0674 : Poly :=
[
  term ((2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 5. -/
theorem ep_Q2_002_partial_05_0674_valid :
    mulPoly ep_Q2_002_coefficient_05_0674
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0675 : Poly :=
[
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 675 for generator 5. -/
def ep_Q2_002_partial_05_0675 : Poly :=
[
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 5. -/
theorem ep_Q2_002_partial_05_0675_valid :
    mulPoly ep_Q2_002_coefficient_05_0675
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0676 : Poly :=
[
  term ((515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 676 for generator 5. -/
def ep_Q2_002_partial_05_0676 : Poly :=
[
  term ((515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 5. -/
theorem ep_Q2_002_partial_05_0676_valid :
    mulPoly ep_Q2_002_coefficient_05_0676
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0677 : Poly :=
[
  term ((128029371553 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 5. -/
def ep_Q2_002_partial_05_0677 : Poly :=
[
  term ((128029371553 : Rat) / 14802634490) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((128029371553 : Rat) / 14802634490) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128029371553 : Rat) / 14802634490) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128029371553 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 5. -/
theorem ep_Q2_002_partial_05_0677_valid :
    mulPoly ep_Q2_002_coefficient_05_0677
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0678 : Poly :=
[
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 678 for generator 5. -/
def ep_Q2_002_partial_05_0678 : Poly :=
[
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 5. -/
theorem ep_Q2_002_partial_05_0678_valid :
    mulPoly ep_Q2_002_coefficient_05_0678
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0679 : Poly :=
[
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 679 for generator 5. -/
def ep_Q2_002_partial_05_0679 : Poly :=
[
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 5. -/
theorem ep_Q2_002_partial_05_0679_valid :
    mulPoly ep_Q2_002_coefficient_05_0679
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0680 : Poly :=
[
  term ((-11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 5. -/
def ep_Q2_002_partial_05_0680 : Poly :=
[
  term ((-11619879158 : Rat) / 1480263449) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 5. -/
theorem ep_Q2_002_partial_05_0680_valid :
    mulPoly ep_Q2_002_coefficient_05_0680
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0681 : Poly :=
[
  term ((306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 681 for generator 5. -/
def ep_Q2_002_partial_05_0681 : Poly :=
[
  term ((306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((-306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((-306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 5. -/
theorem ep_Q2_002_partial_05_0681_valid :
    mulPoly ep_Q2_002_coefficient_05_0681
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0682 : Poly :=
[
  term ((-22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 682 for generator 5. -/
def ep_Q2_002_partial_05_0682 : Poly :=
[
  term ((-22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 5. -/
theorem ep_Q2_002_partial_05_0682_valid :
    mulPoly ep_Q2_002_coefficient_05_0682
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0683 : Poly :=
[
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 683 for generator 5. -/
def ep_Q2_002_partial_05_0683 : Poly :=
[
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 5. -/
theorem ep_Q2_002_partial_05_0683_valid :
    mulPoly ep_Q2_002_coefficient_05_0683
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0684 : Poly :=
[
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 684 for generator 5. -/
def ep_Q2_002_partial_05_0684 : Poly :=
[
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 3)],
  term ((-3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 5. -/
theorem ep_Q2_002_partial_05_0684_valid :
    mulPoly ep_Q2_002_coefficient_05_0684
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0685 : Poly :=
[
  term ((-142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 1)]
]

/-- Partial product 685 for generator 5. -/
def ep_Q2_002_partial_05_0685 : Poly :=
[
  term ((-142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((-142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (14, 2), (15, 1)],
  term ((142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 5. -/
theorem ep_Q2_002_partial_05_0685_valid :
    mulPoly ep_Q2_002_coefficient_05_0685
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0686 : Poly :=
[
  term ((62885662779 : Rat) / 7401317245) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 5. -/
def ep_Q2_002_partial_05_0686 : Poly :=
[
  term ((62885662779 : Rat) / 7401317245) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((62885662779 : Rat) / 7401317245) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62885662779 : Rat) / 7401317245) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62885662779 : Rat) / 7401317245) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 5. -/
theorem ep_Q2_002_partial_05_0686_valid :
    mulPoly ep_Q2_002_coefficient_05_0686
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0687 : Poly :=
[
  term ((-7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(11, 2)]
]

/-- Partial product 687 for generator 5. -/
def ep_Q2_002_partial_05_0687 : Poly :=
[
  term ((-7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 2)],
  term ((-7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 2)],
  term ((7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(11, 2), (14, 2)],
  term ((7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 5. -/
theorem ep_Q2_002_partial_05_0687_valid :
    mulPoly ep_Q2_002_coefficient_05_0687
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0688 : Poly :=
[
  term ((-81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 688 for generator 5. -/
def ep_Q2_002_partial_05_0688 : Poly :=
[
  term ((-81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((-81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 5. -/
theorem ep_Q2_002_partial_05_0688_valid :
    mulPoly ep_Q2_002_coefficient_05_0688
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0689 : Poly :=
[
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)]
]

/-- Partial product 689 for generator 5. -/
def ep_Q2_002_partial_05_0689 : Poly :=
[
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 2)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 2)],
  term ((-65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (14, 2)],
  term ((-65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 5. -/
theorem ep_Q2_002_partial_05_0689_valid :
    mulPoly ep_Q2_002_coefficient_05_0689
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0690 : Poly :=
[
  term ((-498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(12, 1)]
]

/-- Partial product 690 for generator 5. -/
def ep_Q2_002_partial_05_0690 : Poly :=
[
  term ((-498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1)],
  term ((-498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1)],
  term ((498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(12, 1), (14, 2)],
  term ((498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 5. -/
theorem ep_Q2_002_partial_05_0690_valid :
    mulPoly ep_Q2_002_coefficient_05_0690
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0691 : Poly :=
[
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 691 for generator 5. -/
def ep_Q2_002_partial_05_0691 : Poly :=
[
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 5. -/
theorem ep_Q2_002_partial_05_0691_valid :
    mulPoly ep_Q2_002_coefficient_05_0691
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0692 : Poly :=
[
  term ((-1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 5. -/
def ep_Q2_002_partial_05_0692 : Poly :=
[
  term ((-1967992099 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 5. -/
theorem ep_Q2_002_partial_05_0692_valid :
    mulPoly ep_Q2_002_coefficient_05_0692
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0693 : Poly :=
[
  term ((-1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 693 for generator 5. -/
def ep_Q2_002_partial_05_0693 : Poly :=
[
  term ((-1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 5. -/
theorem ep_Q2_002_partial_05_0693_valid :
    mulPoly ep_Q2_002_coefficient_05_0693
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0694 : Poly :=
[
  term ((34451417373 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 5. -/
def ep_Q2_002_partial_05_0694 : Poly :=
[
  term ((34451417373 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((34451417373 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34451417373 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-34451417373 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 5. -/
theorem ep_Q2_002_partial_05_0694_valid :
    mulPoly ep_Q2_002_coefficient_05_0694
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0695 : Poly :=
[
  term ((162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 695 for generator 5. -/
def ep_Q2_002_partial_05_0695 : Poly :=
[
  term ((162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)],
  term ((-162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((-162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 5. -/
theorem ep_Q2_002_partial_05_0695_valid :
    mulPoly ep_Q2_002_coefficient_05_0695
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0696 : Poly :=
[
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 696 for generator 5. -/
def ep_Q2_002_partial_05_0696 : Poly :=
[
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 5. -/
theorem ep_Q2_002_partial_05_0696_valid :
    mulPoly ep_Q2_002_coefficient_05_0696
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0697 : Poly :=
[
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1)]
]

/-- Partial product 697 for generator 5. -/
def ep_Q2_002_partial_05_0697 : Poly :=
[
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(2, 2), (12, 1), (14, 1)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(3, 2), (12, 1), (14, 1)],
  term ((-3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1), (15, 2)],
  term ((-3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 5. -/
theorem ep_Q2_002_partial_05_0697_valid :
    mulPoly ep_Q2_002_coefficient_05_0697
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0698 : Poly :=
[
  term ((56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (15, 2)]
]

/-- Partial product 698 for generator 5. -/
def ep_Q2_002_partial_05_0698 : Poly :=
[
  term ((56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (14, 2), (15, 2)],
  term ((-56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 5. -/
theorem ep_Q2_002_partial_05_0698_valid :
    mulPoly ep_Q2_002_coefficient_05_0698
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0699 : Poly :=
[
  term ((-8778693733 : Rat) / 1057331035) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 5. -/
def ep_Q2_002_partial_05_0699 : Poly :=
[
  term ((-8778693733 : Rat) / 1057331035) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8778693733 : Rat) / 1057331035) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((8778693733 : Rat) / 1057331035) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((8778693733 : Rat) / 1057331035) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 5. -/
theorem ep_Q2_002_partial_05_0699_valid :
    mulPoly ep_Q2_002_coefficient_05_0699
        ep_Q2_002_generator_05_0600_0699 =
      ep_Q2_002_partial_05_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_05_0600_0699 : List Poly :=
[
  ep_Q2_002_partial_05_0600,
  ep_Q2_002_partial_05_0601,
  ep_Q2_002_partial_05_0602,
  ep_Q2_002_partial_05_0603,
  ep_Q2_002_partial_05_0604,
  ep_Q2_002_partial_05_0605,
  ep_Q2_002_partial_05_0606,
  ep_Q2_002_partial_05_0607,
  ep_Q2_002_partial_05_0608,
  ep_Q2_002_partial_05_0609,
  ep_Q2_002_partial_05_0610,
  ep_Q2_002_partial_05_0611,
  ep_Q2_002_partial_05_0612,
  ep_Q2_002_partial_05_0613,
  ep_Q2_002_partial_05_0614,
  ep_Q2_002_partial_05_0615,
  ep_Q2_002_partial_05_0616,
  ep_Q2_002_partial_05_0617,
  ep_Q2_002_partial_05_0618,
  ep_Q2_002_partial_05_0619,
  ep_Q2_002_partial_05_0620,
  ep_Q2_002_partial_05_0621,
  ep_Q2_002_partial_05_0622,
  ep_Q2_002_partial_05_0623,
  ep_Q2_002_partial_05_0624,
  ep_Q2_002_partial_05_0625,
  ep_Q2_002_partial_05_0626,
  ep_Q2_002_partial_05_0627,
  ep_Q2_002_partial_05_0628,
  ep_Q2_002_partial_05_0629,
  ep_Q2_002_partial_05_0630,
  ep_Q2_002_partial_05_0631,
  ep_Q2_002_partial_05_0632,
  ep_Q2_002_partial_05_0633,
  ep_Q2_002_partial_05_0634,
  ep_Q2_002_partial_05_0635,
  ep_Q2_002_partial_05_0636,
  ep_Q2_002_partial_05_0637,
  ep_Q2_002_partial_05_0638,
  ep_Q2_002_partial_05_0639,
  ep_Q2_002_partial_05_0640,
  ep_Q2_002_partial_05_0641,
  ep_Q2_002_partial_05_0642,
  ep_Q2_002_partial_05_0643,
  ep_Q2_002_partial_05_0644,
  ep_Q2_002_partial_05_0645,
  ep_Q2_002_partial_05_0646,
  ep_Q2_002_partial_05_0647,
  ep_Q2_002_partial_05_0648,
  ep_Q2_002_partial_05_0649,
  ep_Q2_002_partial_05_0650,
  ep_Q2_002_partial_05_0651,
  ep_Q2_002_partial_05_0652,
  ep_Q2_002_partial_05_0653,
  ep_Q2_002_partial_05_0654,
  ep_Q2_002_partial_05_0655,
  ep_Q2_002_partial_05_0656,
  ep_Q2_002_partial_05_0657,
  ep_Q2_002_partial_05_0658,
  ep_Q2_002_partial_05_0659,
  ep_Q2_002_partial_05_0660,
  ep_Q2_002_partial_05_0661,
  ep_Q2_002_partial_05_0662,
  ep_Q2_002_partial_05_0663,
  ep_Q2_002_partial_05_0664,
  ep_Q2_002_partial_05_0665,
  ep_Q2_002_partial_05_0666,
  ep_Q2_002_partial_05_0667,
  ep_Q2_002_partial_05_0668,
  ep_Q2_002_partial_05_0669,
  ep_Q2_002_partial_05_0670,
  ep_Q2_002_partial_05_0671,
  ep_Q2_002_partial_05_0672,
  ep_Q2_002_partial_05_0673,
  ep_Q2_002_partial_05_0674,
  ep_Q2_002_partial_05_0675,
  ep_Q2_002_partial_05_0676,
  ep_Q2_002_partial_05_0677,
  ep_Q2_002_partial_05_0678,
  ep_Q2_002_partial_05_0679,
  ep_Q2_002_partial_05_0680,
  ep_Q2_002_partial_05_0681,
  ep_Q2_002_partial_05_0682,
  ep_Q2_002_partial_05_0683,
  ep_Q2_002_partial_05_0684,
  ep_Q2_002_partial_05_0685,
  ep_Q2_002_partial_05_0686,
  ep_Q2_002_partial_05_0687,
  ep_Q2_002_partial_05_0688,
  ep_Q2_002_partial_05_0689,
  ep_Q2_002_partial_05_0690,
  ep_Q2_002_partial_05_0691,
  ep_Q2_002_partial_05_0692,
  ep_Q2_002_partial_05_0693,
  ep_Q2_002_partial_05_0694,
  ep_Q2_002_partial_05_0695,
  ep_Q2_002_partial_05_0696,
  ep_Q2_002_partial_05_0697,
  ep_Q2_002_partial_05_0698,
  ep_Q2_002_partial_05_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_05_0600_0699 : Poly :=
[
  term ((6069105022 : Rat) / 1057331035) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (11, 1)],
  term ((-3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 2)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5653247164 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((18886077736 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((971178168349 : Rat) / 88815806940) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((-2171750877743 : Rat) / 88815806940) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4144552972962889184208 : Rat) / 253528477699481291099) [(2, 2), (7, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(2, 2), (7, 2), (12, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(2, 2), (7, 2), (14, 1)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((24320858914 : Rat) / 7401317245) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-9446552534 : Rat) / 1057331035) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2), (12, 1)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4452383839 : Rat) / 1057331035) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((26580130506 : Rat) / 7401317245) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((8703508886 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2), (14, 1)],
  term ((-889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((5555401972 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1)],
  term ((-176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(2, 2), (9, 1), (11, 1), (12, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((351733096 : Rat) / 22496405) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((15429109301 : Rat) / 1480263449) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (13, 1)],
  term ((-345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((351733096 : Rat) / 22496405) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-25536398142 : Rat) / 1057331035) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (9, 1), (15, 1)],
  term ((10343573018 : Rat) / 1480263449) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((128029371553 : Rat) / 14802634490) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((-22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((62885662779 : Rat) / 7401317245) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 2)],
  term ((-81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 2)],
  term ((-498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((34451417373 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(2, 2), (12, 1), (14, 1)],
  term ((56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((-8778693733 : Rat) / 1057331035) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((6069105022 : Rat) / 1057331035) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(3, 2), (7, 1), (11, 1)],
  term ((-3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 2)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5653247164 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((18886077736 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((971178168349 : Rat) / 88815806940) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)],
  term ((-2171750877743 : Rat) / 88815806940) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4144552972962889184208 : Rat) / 253528477699481291099) [(3, 2), (7, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(3, 2), (7, 2), (12, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (7, 2), (14, 1)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((24320858914 : Rat) / 7401317245) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-9446552534 : Rat) / 1057331035) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2), (12, 1)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4452383839 : Rat) / 1057331035) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((26580130506 : Rat) / 7401317245) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((8703508886 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2), (14, 1)],
  term ((-889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((5555401972 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1)],
  term ((-176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(3, 2), (9, 1), (11, 1), (12, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((351733096 : Rat) / 22496405) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((15429109301 : Rat) / 1480263449) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (13, 1)],
  term ((-345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((351733096 : Rat) / 22496405) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-25536398142 : Rat) / 1057331035) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (9, 1), (15, 1)],
  term ((10343573018 : Rat) / 1480263449) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((128029371553 : Rat) / 14802634490) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((-22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((62885662779 : Rat) / 7401317245) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 2)],
  term ((-81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 2)],
  term ((-498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((34451417373 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(3, 2), (12, 1), (14, 1)],
  term ((56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-8778693733 : Rat) / 1057331035) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6069105022 : Rat) / 1057331035) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6069105022 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((3940992961396022620344719780352 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (14, 2)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (14, 2)],
  term ((89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 3)],
  term ((-15182838221972110160445107734482 : Rat) / 97983883872014706756151952089) [(7, 1), (11, 1), (15, 2)],
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((-12483071951322667385181712100544 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-18886077736 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-44812835897154084567775313340699561942864 : Rat) / 103601401347717117429703636119532782115) [(7, 1), (12, 1), (15, 3)],
  term ((-18886077736 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 3)],
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 3)],
  term ((426493959213494372416410595187808 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 4)],
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 3)],
  term ((227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 3)],
  term ((-971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((2171750877743 : Rat) / 88815806940) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 3), (15, 1)],
  term ((-971178168349 : Rat) / 88815806940) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((1399525196622259672013473737117035299495143 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)],
  term ((2171750877743 : Rat) / 88815806940) [(7, 1), (15, 3), (16, 1)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (14, 2)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (15, 2)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1), (15, 2)],
  term ((4144552972962889184208 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 3)],
  term ((4144552972962889184208 : Rat) / 253528477699481291099) [(7, 2), (15, 2)],
  term ((47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 3)],
  term ((26364713507887937700204237760146 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((9446552534 : Rat) / 1057331035) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1485756359549519546289914976067234987438656 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (15, 3)],
  term ((9446552534 : Rat) / 1057331035) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((-40863013397590564551399897136464 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)],
  term ((34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 4)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8703508886 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 3), (15, 1)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1523896204022941355297902141686901849133682 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 3)],
  term ((-8703508886 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 3)],
  term ((95266664918887955620647147687864 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)],
  term ((889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((-5555401972 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((889095997844258128300490402791400462620776 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)],
  term ((-5555401972 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 3)],
  term ((176404302942782558973960287608056 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((-5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (14, 2)],
  term ((-183613469604947808827888038634712 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 3)],
  term ((1653236388415729083649466312172 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (15, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((-332202337992873731361603239389152 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-15429109301 : Rat) / 1480263449) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((263802066620796471770178037059539111765652 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (12, 1), (15, 3)],
  term ((-15429109301 : Rat) / 1480263449) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 3)],
  term ((4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (14, 2)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((345778548891359431747135087089504 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 3)],
  term ((-3113353723943672984152065595824 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 1), (15, 2)],
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 4)],
  term ((-351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 3)],
  term ((2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 3)],
  term ((25536398142 : Rat) / 1057331035) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(9, 1), (14, 2), (15, 1)],
  term ((-10343573018 : Rat) / 1480263449) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2310908925536094581244237441630347098697808 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 3), (15, 1)],
  term ((25536398142 : Rat) / 1057331035) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-27390796780432111801272041522616961787268 : Rat) / 24487603954914955028839041264616839409) [(9, 1), (15, 3)],
  term ((-10343573018 : Rat) / 1480263449) [(9, 1), (15, 3), (16, 1)],
  term ((-89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-2984701219779374316393453498168 : Rat) / 97983883872014706756151952089) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-128029371553 : Rat) / 14802634490) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-515900682597135530815193598489561741736278 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 3)],
  term ((-128029371553 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 3)],
  term ((11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((22758795391707541092655245424068 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1), (14, 3)],
  term ((-306001438337708553354047208449136 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 3)],
  term ((-3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 3)],
  term ((142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (14, 2), (15, 1)],
  term ((-62885662779 : Rat) / 7401317245) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 3), (15, 1)],
  term ((142996896605576071539122303457594915240147 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 3)],
  term ((-62885662779 : Rat) / 7401317245) [(11, 1), (15, 3), (16, 1)],
  term ((81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((81760113562899037680656086195008 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)],
  term ((-65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (14, 2)],
  term ((-65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (15, 2)],
  term ((7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(11, 2), (14, 2)],
  term ((7161566361336527426831546303904 : Rat) / 97983883872014706756151952089) [(11, 2), (15, 2)],
  term ((-2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-34451417373 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1145916896459192922489885483063475627777284 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 3)],
  term ((-34451417373 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 3)],
  term ((-162485382089541691068495162173856 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)],
  term ((-3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1), (15, 2)],
  term ((498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(12, 1), (14, 2)],
  term ((-56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (14, 2), (15, 2)],
  term ((8778693733 : Rat) / 1057331035) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 3)],
  term ((498390728085943425190346881104 : Rat) / 1273790490336191187829975377157) [(12, 1), (15, 2)],
  term ((-56126549923860702427964600397108151414296 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (15, 4)],
  term ((8778693733 : Rat) / 1057331035) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 600 through 699. -/
theorem ep_Q2_002_block_05_0600_0699_valid :
    checkProductSumEq ep_Q2_002_partials_05_0600_0699
      ep_Q2_002_block_05_0600_0699 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
