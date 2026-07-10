/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:600-691

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0600_0691 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0600 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 1)]
]

/-- Partial product 600 for generator 21. -/
def ep_Q2_002_partial_21_0600 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 21. -/
theorem ep_Q2_002_partial_21_0600_valid :
    mulPoly ep_Q2_002_coefficient_21_0600
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0601 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 601 for generator 21. -/
def ep_Q2_002_partial_21_0601 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 21. -/
theorem ep_Q2_002_partial_21_0601_valid :
    mulPoly ep_Q2_002_coefficient_21_0601
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0602 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 602 for generator 21. -/
def ep_Q2_002_partial_21_0602 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 21. -/
theorem ep_Q2_002_partial_21_0602_valid :
    mulPoly ep_Q2_002_coefficient_21_0602
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0603 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 1), (15, 2)]
]

/-- Partial product 603 for generator 21. -/
def ep_Q2_002_partial_21_0603 : Poly :=
[
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 1), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 21. -/
theorem ep_Q2_002_partial_21_0603_valid :
    mulPoly ep_Q2_002_coefficient_21_0603
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0604 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 604 for generator 21. -/
def ep_Q2_002_partial_21_0604 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(7, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 21. -/
theorem ep_Q2_002_partial_21_0604_valid :
    mulPoly ep_Q2_002_coefficient_21_0604
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0605 : Poly :=
[
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 605 for generator 21. -/
def ep_Q2_002_partial_21_0605 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 21. -/
theorem ep_Q2_002_partial_21_0605_valid :
    mulPoly ep_Q2_002_coefficient_21_0605
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0606 : Poly :=
[
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (12, 1)]
]

/-- Partial product 606 for generator 21. -/
def ep_Q2_002_partial_21_0606 : Poly :=
[
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (10, 1), (12, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 21. -/
theorem ep_Q2_002_partial_21_0606_valid :
    mulPoly ep_Q2_002_coefficient_21_0606
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0607 : Poly :=
[
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 607 for generator 21. -/
def ep_Q2_002_partial_21_0607 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 21. -/
theorem ep_Q2_002_partial_21_0607_valid :
    mulPoly ep_Q2_002_coefficient_21_0607
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0608 : Poly :=
[
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

/-- Partial product 608 for generator 21. -/
def ep_Q2_002_partial_21_0608 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 1), (15, 2)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 21. -/
theorem ep_Q2_002_partial_21_0608_valid :
    mulPoly ep_Q2_002_coefficient_21_0608
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0609 : Poly :=
[
  term ((-88171245013 : Rat) / 44407903470) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 609 for generator 21. -/
def ep_Q2_002_partial_21_0609 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 44407903470) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 21. -/
theorem ep_Q2_002_partial_21_0609_valid :
    mulPoly ep_Q2_002_coefficient_21_0609
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0610 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (11, 1)]
]

/-- Partial product 610 for generator 21. -/
def ep_Q2_002_partial_21_0610 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (11, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 21. -/
theorem ep_Q2_002_partial_21_0610_valid :
    mulPoly ep_Q2_002_coefficient_21_0610
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0611 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (13, 1)]
]

/-- Partial product 611 for generator 21. -/
def ep_Q2_002_partial_21_0611 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (13, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 21. -/
theorem ep_Q2_002_partial_21_0611_valid :
    mulPoly ep_Q2_002_coefficient_21_0611
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0612 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 1), (15, 1)]
]

/-- Partial product 612 for generator 21. -/
def ep_Q2_002_partial_21_0612 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 21. -/
theorem ep_Q2_002_partial_21_0612_valid :
    mulPoly ep_Q2_002_coefficient_21_0612
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0613 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 21. -/
def ep_Q2_002_partial_21_0613 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(7, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 21. -/
theorem ep_Q2_002_partial_21_0613_valid :
    mulPoly ep_Q2_002_coefficient_21_0613
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0614 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

/-- Partial product 614 for generator 21. -/
def ep_Q2_002_partial_21_0614 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 21. -/
theorem ep_Q2_002_partial_21_0614_valid :
    mulPoly ep_Q2_002_coefficient_21_0614
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0615 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

/-- Partial product 615 for generator 21. -/
def ep_Q2_002_partial_21_0615 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 1), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 21. -/
theorem ep_Q2_002_partial_21_0615_valid :
    mulPoly ep_Q2_002_coefficient_21_0615
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0616 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

/-- Partial product 616 for generator 21. -/
def ep_Q2_002_partial_21_0616 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 1), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 21. -/
theorem ep_Q2_002_partial_21_0616_valid :
    mulPoly ep_Q2_002_coefficient_21_0616
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0617 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 617 for generator 21. -/
def ep_Q2_002_partial_21_0617 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 21. -/
theorem ep_Q2_002_partial_21_0617_valid :
    mulPoly ep_Q2_002_coefficient_21_0617
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0618 : Poly :=
[
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 618 for generator 21. -/
def ep_Q2_002_partial_21_0618 : Poly :=
[
  term ((-267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 21. -/
theorem ep_Q2_002_partial_21_0618_valid :
    mulPoly ep_Q2_002_coefficient_21_0618
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0619 : Poly :=
[
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 619 for generator 21. -/
def ep_Q2_002_partial_21_0619 : Poly :=
[
  term ((503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 21. -/
theorem ep_Q2_002_partial_21_0619_valid :
    mulPoly ep_Q2_002_coefficient_21_0619
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0620 : Poly :=
[
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 620 for generator 21. -/
def ep_Q2_002_partial_21_0620 : Poly :=
[
  term ((-4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 21. -/
theorem ep_Q2_002_partial_21_0620_valid :
    mulPoly ep_Q2_002_coefficient_21_0620
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0621 : Poly :=
[
  term ((28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 21. -/
def ep_Q2_002_partial_21_0621 : Poly :=
[
  term ((57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 21. -/
theorem ep_Q2_002_partial_21_0621_valid :
    mulPoly ep_Q2_002_coefficient_21_0621
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0622 : Poly :=
[
  term ((-34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 622 for generator 21. -/
def ep_Q2_002_partial_21_0622 : Poly :=
[
  term ((34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 21. -/
theorem ep_Q2_002_partial_21_0622_valid :
    mulPoly ep_Q2_002_coefficient_21_0622
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0623 : Poly :=
[
  term ((-7708161749022132336497949971496132377916 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 623 for generator 21. -/
def ep_Q2_002_partial_21_0623 : Poly :=
[
  term ((7708161749022132336497949971496132377916 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-15416323498044264672995899942992264755832 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 21. -/
theorem ep_Q2_002_partial_21_0623_valid :
    mulPoly ep_Q2_002_coefficient_21_0623
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0624 : Poly :=
[
  term ((253160212 : Rat) / 157474835) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 21. -/
def ep_Q2_002_partial_21_0624 : Poly :=
[
  term ((-253160212 : Rat) / 157474835) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((506320424 : Rat) / 157474835) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 21. -/
theorem ep_Q2_002_partial_21_0624_valid :
    mulPoly ep_Q2_002_coefficient_21_0624
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0625 : Poly :=
[
  term ((64873256317991083888103676969072 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 625 for generator 21. -/
def ep_Q2_002_partial_21_0625 : Poly :=
[
  term ((-64873256317991083888103676969072 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (13, 2)],
  term ((129746512635982167776207353938144 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 21. -/
theorem ep_Q2_002_partial_21_0625_valid :
    mulPoly ep_Q2_002_coefficient_21_0625
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0626 : Poly :=
[
  term ((-177315239269114618126135657617648 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 626 for generator 21. -/
def ep_Q2_002_partial_21_0626 : Poly :=
[
  term ((-354630478538229236252271315235296 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((177315239269114618126135657617648 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 21. -/
theorem ep_Q2_002_partial_21_0626_valid :
    mulPoly ep_Q2_002_coefficient_21_0626
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0627 : Poly :=
[
  term ((7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 627 for generator 21. -/
def ep_Q2_002_partial_21_0627 : Poly :=
[
  term ((14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 21. -/
theorem ep_Q2_002_partial_21_0627_valid :
    mulPoly ep_Q2_002_coefficient_21_0627
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0628 : Poly :=
[
  term ((-253160212 : Rat) / 157474835) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 21. -/
def ep_Q2_002_partial_21_0628 : Poly :=
[
  term ((-506320424 : Rat) / 157474835) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((253160212 : Rat) / 157474835) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 21. -/
theorem ep_Q2_002_partial_21_0628_valid :
    mulPoly ep_Q2_002_coefficient_21_0628
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0629 : Poly :=
[
  term ((82735243723347589216357245602802 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 629 for generator 21. -/
def ep_Q2_002_partial_21_0629 : Poly :=
[
  term ((165470487446695178432714491205604 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-82735243723347589216357245602802 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 21. -/
theorem ep_Q2_002_partial_21_0629_valid :
    mulPoly ep_Q2_002_coefficient_21_0629
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0630 : Poly :=
[
  term ((25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 630 for generator 21. -/
def ep_Q2_002_partial_21_0630 : Poly :=
[
  term ((51538607193724645868226464504826368652192 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 21. -/
theorem ep_Q2_002_partial_21_0630_valid :
    mulPoly ep_Q2_002_coefficient_21_0630
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0631 : Poly :=
[
  term ((3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 21. -/
def ep_Q2_002_partial_21_0631 : Poly :=
[
  term ((6993659964 : Rat) / 1480263449) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 21. -/
theorem ep_Q2_002_partial_21_0631_valid :
    mulPoly ep_Q2_002_coefficient_21_0631
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0632 : Poly :=
[
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 632 for generator 21. -/
def ep_Q2_002_partial_21_0632 : Poly :=
[
  term ((-42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 21. -/
theorem ep_Q2_002_partial_21_0632_valid :
    mulPoly ep_Q2_002_coefficient_21_0632
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0633 : Poly :=
[
  term ((34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 633 for generator 21. -/
def ep_Q2_002_partial_21_0633 : Poly :=
[
  term ((68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 21. -/
theorem ep_Q2_002_partial_21_0633_valid :
    mulPoly ep_Q2_002_coefficient_21_0633
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0634 : Poly :=
[
  term ((727161560668674096245895621519442327933584 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 634 for generator 21. -/
def ep_Q2_002_partial_21_0634 : Poly :=
[
  term ((1454323121337348192491791243038884655867168 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-727161560668674096245895621519442327933584 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 21. -/
theorem ep_Q2_002_partial_21_0634_valid :
    mulPoly ep_Q2_002_coefficient_21_0634
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0635 : Poly :=
[
  term ((91681691232 : Rat) / 7401317245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 21. -/
def ep_Q2_002_partial_21_0635 : Poly :=
[
  term ((183363382464 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 21. -/
theorem ep_Q2_002_partial_21_0635_valid :
    mulPoly ep_Q2_002_coefficient_21_0635
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0636 : Poly :=
[
  term ((211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 636 for generator 21. -/
def ep_Q2_002_partial_21_0636 : Poly :=
[
  term ((423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 21. -/
theorem ep_Q2_002_partial_21_0636_valid :
    mulPoly ep_Q2_002_coefficient_21_0636
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0637 : Poly :=
[
  term ((652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 637 for generator 21. -/
def ep_Q2_002_partial_21_0637 : Poly :=
[
  term ((1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 21. -/
theorem ep_Q2_002_partial_21_0637_valid :
    mulPoly ep_Q2_002_coefficient_21_0637
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0638 : Poly :=
[
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 638 for generator 21. -/
def ep_Q2_002_partial_21_0638 : Poly :=
[
  term ((48641717828 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 21. -/
theorem ep_Q2_002_partial_21_0638_valid :
    mulPoly ep_Q2_002_coefficient_21_0638
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0639 : Poly :=
[
  term ((119579192948890114929184902060637056620682 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 639 for generator 21. -/
def ep_Q2_002_partial_21_0639 : Poly :=
[
  term ((239158385897780229858369804121274113241364 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-119579192948890114929184902060637056620682 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 21. -/
theorem ep_Q2_002_partial_21_0639_valid :
    mulPoly ep_Q2_002_coefficient_21_0639
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0640 : Poly :=
[
  term ((-2328275361 : Rat) / 1480263449) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 21. -/
def ep_Q2_002_partial_21_0640 : Poly :=
[
  term ((-4656550722 : Rat) / 1480263449) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2328275361 : Rat) / 1480263449) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 21. -/
theorem ep_Q2_002_partial_21_0640_valid :
    mulPoly ep_Q2_002_coefficient_21_0640
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0641 : Poly :=
[
  term ((-80959622747056351293807937338696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 641 for generator 21. -/
def ep_Q2_002_partial_21_0641 : Poly :=
[
  term ((-161919245494112702587615874677392 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (13, 2)],
  term ((80959622747056351293807937338696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 21. -/
theorem ep_Q2_002_partial_21_0641_valid :
    mulPoly ep_Q2_002_coefficient_21_0641
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0642 : Poly :=
[
  term ((133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 642 for generator 21. -/
def ep_Q2_002_partial_21_0642 : Poly :=
[
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 21. -/
theorem ep_Q2_002_partial_21_0642_valid :
    mulPoly ep_Q2_002_coefficient_21_0642
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0643 : Poly :=
[
  term ((2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 643 for generator 21. -/
def ep_Q2_002_partial_21_0643 : Poly :=
[
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 21. -/
theorem ep_Q2_002_partial_21_0643_valid :
    mulPoly ep_Q2_002_coefficient_21_0643
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0644 : Poly :=
[
  term ((-28647436304 : Rat) / 7401317245) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 21. -/
def ep_Q2_002_partial_21_0644 : Poly :=
[
  term ((-57294872608 : Rat) / 7401317245) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 21. -/
theorem ep_Q2_002_partial_21_0644_valid :
    mulPoly ep_Q2_002_coefficient_21_0644
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0645 : Poly :=
[
  term ((-251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)]
]

/-- Partial product 645 for generator 21. -/
def ep_Q2_002_partial_21_0645 : Poly :=
[
  term ((-503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (13, 2)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 21. -/
theorem ep_Q2_002_partial_21_0645_valid :
    mulPoly ep_Q2_002_coefficient_21_0645
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0646 : Poly :=
[
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 646 for generator 21. -/
def ep_Q2_002_partial_21_0646 : Poly :=
[
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1)],
  term ((42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 21. -/
theorem ep_Q2_002_partial_21_0646_valid :
    mulPoly ep_Q2_002_coefficient_21_0646
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0647 : Poly :=
[
  term ((-39744499276776348933339888461664 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 647 for generator 21. -/
def ep_Q2_002_partial_21_0647 : Poly :=
[
  term ((39744499276776348933339888461664 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (13, 1)],
  term ((-79488998553552697866679776923328 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 21. -/
theorem ep_Q2_002_partial_21_0647_valid :
    mulPoly ep_Q2_002_coefficient_21_0647
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0648 : Poly :=
[
  term ((-25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 648 for generator 21. -/
def ep_Q2_002_partial_21_0648 : Poly :=
[
  term ((25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (10, 1), (15, 1)],
  term ((-51538607193724645868226464504826368652192 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 21. -/
theorem ep_Q2_002_partial_21_0648_valid :
    mulPoly ep_Q2_002_coefficient_21_0648
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0649 : Poly :=
[
  term ((-3496829982 : Rat) / 1480263449) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 21. -/
def ep_Q2_002_partial_21_0649 : Poly :=
[
  term ((3496829982 : Rat) / 1480263449) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6993659964 : Rat) / 1480263449) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 21. -/
theorem ep_Q2_002_partial_21_0649_valid :
    mulPoly ep_Q2_002_coefficient_21_0649
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0650 : Poly :=
[
  term ((10552455369654949027646359999596 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 650 for generator 21. -/
def ep_Q2_002_partial_21_0650 : Poly :=
[
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1)],
  term ((-10552455369654949027646359999596 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 21. -/
theorem ep_Q2_002_partial_21_0650_valid :
    mulPoly ep_Q2_002_coefficient_21_0650
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0651 : Poly :=
[
  term ((-67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 651 for generator 21. -/
def ep_Q2_002_partial_21_0651 : Poly :=
[
  term ((-135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 21. -/
theorem ep_Q2_002_partial_21_0651_valid :
    mulPoly ep_Q2_002_coefficient_21_0651
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0652 : Poly :=
[
  term ((112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 652 for generator 21. -/
def ep_Q2_002_partial_21_0652 : Poly :=
[
  term ((224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 21. -/
theorem ep_Q2_002_partial_21_0652_valid :
    mulPoly ep_Q2_002_coefficient_21_0652
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0653 : Poly :=
[
  term ((127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 653 for generator 21. -/
def ep_Q2_002_partial_21_0653 : Poly :=
[
  term ((255949133123239495528746788094240 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 21. -/
theorem ep_Q2_002_partial_21_0653_valid :
    mulPoly ep_Q2_002_coefficient_21_0653
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0654 : Poly :=
[
  term ((-287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 654 for generator 21. -/
def ep_Q2_002_partial_21_0654 : Poly :=
[
  term ((-574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 21. -/
theorem ep_Q2_002_partial_21_0654_valid :
    mulPoly ep_Q2_002_coefficient_21_0654
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0655 : Poly :=
[
  term ((35210407088 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 21. -/
def ep_Q2_002_partial_21_0655 : Poly :=
[
  term ((70420814176 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35210407088 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 21. -/
theorem ep_Q2_002_partial_21_0655_valid :
    mulPoly ep_Q2_002_coefficient_21_0655
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0656 : Poly :=
[
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 656 for generator 21. -/
def ep_Q2_002_partial_21_0656 : Poly :=
[
  term ((-423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 21. -/
theorem ep_Q2_002_partial_21_0656_valid :
    mulPoly ep_Q2_002_coefficient_21_0656
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0657 : Poly :=
[
  term ((-707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 657 for generator 21. -/
def ep_Q2_002_partial_21_0657 : Poly :=
[
  term ((-1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 21. -/
theorem ep_Q2_002_partial_21_0657_valid :
    mulPoly ep_Q2_002_coefficient_21_0657
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0658 : Poly :=
[
  term ((-91681691232 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 21. -/
def ep_Q2_002_partial_21_0658 : Poly :=
[
  term ((-183363382464 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((91681691232 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 21. -/
theorem ep_Q2_002_partial_21_0658_valid :
    mulPoly ep_Q2_002_coefficient_21_0658
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0659 : Poly :=
[
  term ((-19872249638388174466669944230832 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 659 for generator 21. -/
def ep_Q2_002_partial_21_0659 : Poly :=
[
  term ((-39744499276776348933339888461664 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (13, 1)],
  term ((19872249638388174466669944230832 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 21. -/
theorem ep_Q2_002_partial_21_0659_valid :
    mulPoly ep_Q2_002_coefficient_21_0659
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0660 : Poly :=
[
  term ((-12884651798431161467056616126206592163048 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (15, 1)]
]

/-- Partial product 660 for generator 21. -/
def ep_Q2_002_partial_21_0660 : Poly :=
[
  term ((-25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (10, 1), (15, 1)],
  term ((12884651798431161467056616126206592163048 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 21. -/
theorem ep_Q2_002_partial_21_0660_valid :
    mulPoly ep_Q2_002_coefficient_21_0660
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0661 : Poly :=
[
  term ((-1748414991 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 21. -/
def ep_Q2_002_partial_21_0661 : Poly :=
[
  term ((-3496829982 : Rat) / 1480263449) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1748414991 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 21. -/
theorem ep_Q2_002_partial_21_0661_valid :
    mulPoly ep_Q2_002_coefficient_21_0661
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0662 : Poly :=
[
  term ((-448951490888226031848303325458 : Rat) / 1273790490336191187829975377157) [(10, 1)]
]

/-- Partial product 662 for generator 21. -/
def ep_Q2_002_partial_21_0662 : Poly :=
[
  term ((448951490888226031848303325458 : Rat) / 1273790490336191187829975377157) [(10, 1)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 21. -/
theorem ep_Q2_002_partial_21_0662_valid :
    mulPoly ep_Q2_002_coefficient_21_0662
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0663 : Poly :=
[
  term ((-1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 663 for generator 21. -/
def ep_Q2_002_partial_21_0663 : Poly :=
[
  term ((1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 21. -/
theorem ep_Q2_002_partial_21_0663_valid :
    mulPoly ep_Q2_002_coefficient_21_0663
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0664 : Poly :=
[
  term ((-107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 664 for generator 21. -/
def ep_Q2_002_partial_21_0664 : Poly :=
[
  term ((107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (13, 1)],
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 21. -/
theorem ep_Q2_002_partial_21_0664_valid :
    mulPoly ep_Q2_002_coefficient_21_0664
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0665 : Poly :=
[
  term ((3056817395514114038742323522446200566664 : Rat) / 122438019774574775144195206323084197045) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 665 for generator 21. -/
def ep_Q2_002_partial_21_0665 : Poly :=
[
  term ((-3056817395514114038742323522446200566664 : Rat) / 122438019774574775144195206323084197045) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((6113634791028228077484647044892401133328 : Rat) / 122438019774574775144195206323084197045) [(10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 21. -/
theorem ep_Q2_002_partial_21_0665_valid :
    mulPoly ep_Q2_002_coefficient_21_0665
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0666 : Poly :=
[
  term ((14389252022 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 21. -/
def ep_Q2_002_partial_21_0666 : Poly :=
[
  term ((-14389252022 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28778504044 : Rat) / 7401317245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 21. -/
theorem ep_Q2_002_partial_21_0666_valid :
    mulPoly ep_Q2_002_coefficient_21_0666
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0667 : Poly :=
[
  term ((3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 667 for generator 21. -/
def ep_Q2_002_partial_21_0667 : Poly :=
[
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(10, 1), (12, 1), (13, 2)],
  term ((7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 21. -/
theorem ep_Q2_002_partial_21_0667_valid :
    mulPoly ep_Q2_002_coefficient_21_0667
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0668 : Poly :=
[
  term ((526381348291934216219806429831434567688086 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 668 for generator 21. -/
def ep_Q2_002_partial_21_0668 : Poly :=
[
  term ((-526381348291934216219806429831434567688086 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (13, 1), (15, 1)],
  term ((1052762696583868432439612859662869135376172 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 21. -/
theorem ep_Q2_002_partial_21_0668_valid :
    mulPoly ep_Q2_002_coefficient_21_0668
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0669 : Poly :=
[
  term ((164320952911 : Rat) / 14802634490) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 21. -/
def ep_Q2_002_partial_21_0669 : Poly :=
[
  term ((-164320952911 : Rat) / 14802634490) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((164320952911 : Rat) / 7401317245) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 21. -/
theorem ep_Q2_002_partial_21_0669_valid :
    mulPoly ep_Q2_002_coefficient_21_0669
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0670 : Poly :=
[
  term ((232182606804828886912027267467648 : Rat) / 1273790490336191187829975377157) [(10, 1), (13, 2)]
]

/-- Partial product 670 for generator 21. -/
def ep_Q2_002_partial_21_0670 : Poly :=
[
  term ((-232182606804828886912027267467648 : Rat) / 1273790490336191187829975377157) [(10, 1), (13, 2)],
  term ((464365213609657773824054534935296 : Rat) / 1273790490336191187829975377157) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 21. -/
theorem ep_Q2_002_partial_21_0670_valid :
    mulPoly ep_Q2_002_coefficient_21_0670
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0671 : Poly :=
[
  term ((-231263123784283833415009197375672 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 671 for generator 21. -/
def ep_Q2_002_partial_21_0671 : Poly :=
[
  term ((-462526247568567666830018394751344 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((231263123784283833415009197375672 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 21. -/
theorem ep_Q2_002_partial_21_0671_valid :
    mulPoly ep_Q2_002_coefficient_21_0671
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0672 : Poly :=
[
  term ((-486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 672 for generator 21. -/
def ep_Q2_002_partial_21_0672 : Poly :=
[
  term ((-973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 21. -/
theorem ep_Q2_002_partial_21_0672_valid :
    mulPoly ep_Q2_002_coefficient_21_0672
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0673 : Poly :=
[
  term ((-164320952911 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 21. -/
def ep_Q2_002_partial_21_0673 : Poly :=
[
  term ((-164320952911 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((164320952911 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 21. -/
theorem ep_Q2_002_partial_21_0673_valid :
    mulPoly ep_Q2_002_coefficient_21_0673
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0674 : Poly :=
[
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 674 for generator 21. -/
def ep_Q2_002_partial_21_0674 : Poly :=
[
  term ((-7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 21. -/
theorem ep_Q2_002_partial_21_0674_valid :
    mulPoly ep_Q2_002_coefficient_21_0674
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0675 : Poly :=
[
  term ((35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 675 for generator 21. -/
def ep_Q2_002_partial_21_0675 : Poly :=
[
  term ((70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 21. -/
theorem ep_Q2_002_partial_21_0675_valid :
    mulPoly ep_Q2_002_coefficient_21_0675
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0676 : Poly :=
[
  term ((-14389252022 : Rat) / 7401317245) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 21. -/
def ep_Q2_002_partial_21_0676 : Poly :=
[
  term ((-28778504044 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((14389252022 : Rat) / 7401317245) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 21. -/
theorem ep_Q2_002_partial_21_0676_valid :
    mulPoly ep_Q2_002_coefficient_21_0676
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0677 : Poly :=
[
  term ((-53976637431010072561900911418296 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 677 for generator 21. -/
def ep_Q2_002_partial_21_0677 : Poly :=
[
  term ((-107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (13, 1)],
  term ((53976637431010072561900911418296 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 21. -/
theorem ep_Q2_002_partial_21_0677_valid :
    mulPoly ep_Q2_002_coefficient_21_0677
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0678 : Poly :=
[
  term ((107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 678 for generator 21. -/
def ep_Q2_002_partial_21_0678 : Poly :=
[
  term ((215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 2), (12, 1)],
  term ((-107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 21. -/
theorem ep_Q2_002_partial_21_0678_valid :
    mulPoly ep_Q2_002_coefficient_21_0678
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0679 : Poly :=
[
  term ((1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 2)]
]

/-- Partial product 679 for generator 21. -/
def ep_Q2_002_partial_21_0679 : Poly :=
[
  term ((3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 2), (12, 2)],
  term ((-1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 21. -/
theorem ep_Q2_002_partial_21_0679_valid :
    mulPoly ep_Q2_002_coefficient_21_0679
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0680 : Poly :=
[
  term ((845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(12, 1)]
]

/-- Partial product 680 for generator 21. -/
def ep_Q2_002_partial_21_0680 : Poly :=
[
  term ((1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1)],
  term ((-845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 21. -/
theorem ep_Q2_002_partial_21_0680_valid :
    mulPoly ep_Q2_002_coefficient_21_0680
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0681 : Poly :=
[
  term ((110368989874483531733216641409830229285268 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 681 for generator 21. -/
def ep_Q2_002_partial_21_0681 : Poly :=
[
  term ((220737979748967063466433282819660458570536 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-110368989874483531733216641409830229285268 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 21. -/
theorem ep_Q2_002_partial_21_0681_valid :
    mulPoly ep_Q2_002_coefficient_21_0681
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0682 : Poly :=
[
  term ((5868681899 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 682 for generator 21. -/
def ep_Q2_002_partial_21_0682 : Poly :=
[
  term ((11737363798 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5868681899 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 21. -/
theorem ep_Q2_002_partial_21_0682_valid :
    mulPoly ep_Q2_002_coefficient_21_0682
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0683 : Poly :=
[
  term ((-1731558720928092564893149269792 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 683 for generator 21. -/
def ep_Q2_002_partial_21_0683 : Poly :=
[
  term ((-3463117441856185129786298539584 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1), (13, 2)],
  term ((1731558720928092564893149269792 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 21. -/
theorem ep_Q2_002_partial_21_0683_valid :
    mulPoly ep_Q2_002_coefficient_21_0683
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0684 : Poly :=
[
  term ((-161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 684 for generator 21. -/
def ep_Q2_002_partial_21_0684 : Poly :=
[
  term ((-323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (15, 2)],
  term ((161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 21. -/
theorem ep_Q2_002_partial_21_0684_valid :
    mulPoly ep_Q2_002_coefficient_21_0684
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0685 : Poly :=
[
  term ((-57035734191 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 685 for generator 21. -/
def ep_Q2_002_partial_21_0685 : Poly :=
[
  term ((-57035734191 : Rat) / 7401317245) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((57035734191 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 21. -/
theorem ep_Q2_002_partial_21_0685_valid :
    mulPoly ep_Q2_002_coefficient_21_0685
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0686 : Poly :=
[
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 686 for generator 21. -/
def ep_Q2_002_partial_21_0686 : Poly :=
[
  term ((-245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 21. -/
theorem ep_Q2_002_partial_21_0686_valid :
    mulPoly ep_Q2_002_coefficient_21_0686
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0687 : Poly :=
[
  term ((-112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 2), (15, 2)]
]

/-- Partial product 687 for generator 21. -/
def ep_Q2_002_partial_21_0687 : Poly :=
[
  term ((-225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(10, 1), (12, 2), (15, 2)],
  term ((112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 21. -/
theorem ep_Q2_002_partial_21_0687_valid :
    mulPoly ep_Q2_002_coefficient_21_0687
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0688 : Poly :=
[
  term ((-11619879158 : Rat) / 1480263449) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 688 for generator 21. -/
def ep_Q2_002_partial_21_0688 : Poly :=
[
  term ((-23239758316 : Rat) / 1480263449) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((11619879158 : Rat) / 1480263449) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 21. -/
theorem ep_Q2_002_partial_21_0688_valid :
    mulPoly ep_Q2_002_coefficient_21_0688
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0689 : Poly :=
[
  term ((263190674145967108109903214915717283844043 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 689 for generator 21. -/
def ep_Q2_002_partial_21_0689 : Poly :=
[
  term ((526381348291934216219806429831434567688086 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (13, 1), (15, 1)],
  term ((-263190674145967108109903214915717283844043 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 21. -/
theorem ep_Q2_002_partial_21_0689_valid :
    mulPoly ep_Q2_002_coefficient_21_0689
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0690 : Poly :=
[
  term ((164320952911 : Rat) / 29605268980) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 21. -/
def ep_Q2_002_partial_21_0690 : Poly :=
[
  term ((164320952911 : Rat) / 14802634490) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-164320952911 : Rat) / 29605268980) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 21. -/
theorem ep_Q2_002_partial_21_0690_valid :
    mulPoly ep_Q2_002_coefficient_21_0690
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0691 : Poly :=
[
  term ((116091303402414443456013633733824 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 691 for generator 21. -/
def ep_Q2_002_partial_21_0691 : Poly :=
[
  term ((232182606804828886912027267467648 : Rat) / 1273790490336191187829975377157) [(10, 1), (13, 2)],
  term ((-116091303402414443456013633733824 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 21. -/
theorem ep_Q2_002_partial_21_0691_valid :
    mulPoly ep_Q2_002_coefficient_21_0691
        ep_Q2_002_generator_21_0600_0691 =
      ep_Q2_002_partial_21_0691 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0600_0691 : List Poly :=
[
  ep_Q2_002_partial_21_0600,
  ep_Q2_002_partial_21_0601,
  ep_Q2_002_partial_21_0602,
  ep_Q2_002_partial_21_0603,
  ep_Q2_002_partial_21_0604,
  ep_Q2_002_partial_21_0605,
  ep_Q2_002_partial_21_0606,
  ep_Q2_002_partial_21_0607,
  ep_Q2_002_partial_21_0608,
  ep_Q2_002_partial_21_0609,
  ep_Q2_002_partial_21_0610,
  ep_Q2_002_partial_21_0611,
  ep_Q2_002_partial_21_0612,
  ep_Q2_002_partial_21_0613,
  ep_Q2_002_partial_21_0614,
  ep_Q2_002_partial_21_0615,
  ep_Q2_002_partial_21_0616,
  ep_Q2_002_partial_21_0617,
  ep_Q2_002_partial_21_0618,
  ep_Q2_002_partial_21_0619,
  ep_Q2_002_partial_21_0620,
  ep_Q2_002_partial_21_0621,
  ep_Q2_002_partial_21_0622,
  ep_Q2_002_partial_21_0623,
  ep_Q2_002_partial_21_0624,
  ep_Q2_002_partial_21_0625,
  ep_Q2_002_partial_21_0626,
  ep_Q2_002_partial_21_0627,
  ep_Q2_002_partial_21_0628,
  ep_Q2_002_partial_21_0629,
  ep_Q2_002_partial_21_0630,
  ep_Q2_002_partial_21_0631,
  ep_Q2_002_partial_21_0632,
  ep_Q2_002_partial_21_0633,
  ep_Q2_002_partial_21_0634,
  ep_Q2_002_partial_21_0635,
  ep_Q2_002_partial_21_0636,
  ep_Q2_002_partial_21_0637,
  ep_Q2_002_partial_21_0638,
  ep_Q2_002_partial_21_0639,
  ep_Q2_002_partial_21_0640,
  ep_Q2_002_partial_21_0641,
  ep_Q2_002_partial_21_0642,
  ep_Q2_002_partial_21_0643,
  ep_Q2_002_partial_21_0644,
  ep_Q2_002_partial_21_0645,
  ep_Q2_002_partial_21_0646,
  ep_Q2_002_partial_21_0647,
  ep_Q2_002_partial_21_0648,
  ep_Q2_002_partial_21_0649,
  ep_Q2_002_partial_21_0650,
  ep_Q2_002_partial_21_0651,
  ep_Q2_002_partial_21_0652,
  ep_Q2_002_partial_21_0653,
  ep_Q2_002_partial_21_0654,
  ep_Q2_002_partial_21_0655,
  ep_Q2_002_partial_21_0656,
  ep_Q2_002_partial_21_0657,
  ep_Q2_002_partial_21_0658,
  ep_Q2_002_partial_21_0659,
  ep_Q2_002_partial_21_0660,
  ep_Q2_002_partial_21_0661,
  ep_Q2_002_partial_21_0662,
  ep_Q2_002_partial_21_0663,
  ep_Q2_002_partial_21_0664,
  ep_Q2_002_partial_21_0665,
  ep_Q2_002_partial_21_0666,
  ep_Q2_002_partial_21_0667,
  ep_Q2_002_partial_21_0668,
  ep_Q2_002_partial_21_0669,
  ep_Q2_002_partial_21_0670,
  ep_Q2_002_partial_21_0671,
  ep_Q2_002_partial_21_0672,
  ep_Q2_002_partial_21_0673,
  ep_Q2_002_partial_21_0674,
  ep_Q2_002_partial_21_0675,
  ep_Q2_002_partial_21_0676,
  ep_Q2_002_partial_21_0677,
  ep_Q2_002_partial_21_0678,
  ep_Q2_002_partial_21_0679,
  ep_Q2_002_partial_21_0680,
  ep_Q2_002_partial_21_0681,
  ep_Q2_002_partial_21_0682,
  ep_Q2_002_partial_21_0683,
  ep_Q2_002_partial_21_0684,
  ep_Q2_002_partial_21_0685,
  ep_Q2_002_partial_21_0686,
  ep_Q2_002_partial_21_0687,
  ep_Q2_002_partial_21_0688,
  ep_Q2_002_partial_21_0689,
  ep_Q2_002_partial_21_0690,
  ep_Q2_002_partial_21_0691
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0600_0691 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 1)],
  term ((-2139782730770747845440 : Rat) / 253528477699481291099) [(7, 2), (10, 1), (12, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (10, 2)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(7, 2), (12, 1)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)],
  term ((88171245013 : Rat) / 44407903470) [(7, 2), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 2), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(7, 3), (10, 2), (15, 1), (16, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(7, 3), (15, 1), (16, 1)],
  term ((-267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((57294872608 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-28647436304 : Rat) / 7401317245) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-354630478538229236252271315235296 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-506320424 : Rat) / 157474835) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((199919135910599644147634063041920 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((51538607193724645868226464504826368652192 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((6993659964 : Rat) / 1480263449) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2)],
  term ((68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((1454323121337348192491791243038884655867168 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((183363382464 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((48641717828 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1558075531692941369107252669266688787968872 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-35181283574 : Rat) / 7401317245) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-226792501812103786475719551646464 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (13, 2)],
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-15416323498044264672995899942992264755832 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((506320424 : Rat) / 157474835) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((129746512635982167776207353938144 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (13, 2)],
  term ((177315239269114618126135657617648 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((253160212 : Rat) / 157474835) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-82735243723347589216357245602802 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)],
  term ((-25769303596862322934113232252413184326096 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)],
  term ((-34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)],
  term ((-727161560668674096245895621519442327933584 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(8, 1), (12, 1), (13, 2)],
  term ((-652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-119579192948890114929184902060637056620682 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (13, 1), (15, 1)],
  term ((2328275361 : Rat) / 1480263449) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((80959622747056351293807937338696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)],
  term ((267587190987422940009248898457152 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((4175542257014706131695357274290949475388224 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-57294872608 : Rat) / 7401317245) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-503916792164646688898782995273984 : Rat) / 1273790490336191187829975377157) [(8, 2), (10, 1), (13, 2)],
  term ((-133793595493711470004624449228576 : Rat) / 1273790490336191187829975377157) [(8, 2), (11, 1), (13, 1)],
  term ((-2087771128507353065847678637145474737694112 : Rat) / 1346818217520322526586147269553926167495) [(8, 2), (13, 1), (15, 1)],
  term ((28647436304 : Rat) / 7401317245) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((251958396082323344449391497636992 : Rat) / 1273790490336191187829975377157) [(8, 2), (13, 2)],
  term ((-135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((255949133123239495528746788094240 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((70420814176 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-183363382464 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1)],
  term ((-79488998553552697866679776923328 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1)],
  term ((-51538607193724645868226464504826368652192 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (10, 2), (15, 1)],
  term ((-6993659964 : Rat) / 1480263449) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10552455369654949027646359999596 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)],
  term ((67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)],
  term ((-112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)],
  term ((-127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)],
  term ((287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)],
  term ((-35210407088 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)],
  term ((707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)],
  term ((91681691232 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((19872249638388174466669944230832 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)],
  term ((12884651798431161467056616126206592163048 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (15, 1)],
  term ((1748414991 : Rat) / 1480263449) [(9, 1), (15, 1), (16, 1)],
  term ((448951490888226031848303325458 : Rat) / 1273790490336191187829975377157) [(10, 1)],
  term ((-441749134366582433102740745374896 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-164320952911 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-28778504044 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 2), (12, 1)],
  term ((3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 2), (12, 2)],
  term ((1690919466594078240286521712272 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1)],
  term ((187112988398311809040267724072752252337232 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2651888224 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42590312568614831006752372756800 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1), (13, 2)],
  term ((-323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (15, 2)],
  term ((-57035734191 : Rat) / 7401317245) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(10, 1), (12, 2), (15, 2)],
  term ((-23239758316 : Rat) / 1480263449) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(10, 2)],
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1)],
  term ((6113634791028228077484647044892401133328 : Rat) / 122438019774574775144195206323084197045) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((28778504044 : Rat) / 7401317245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 2), (12, 1), (13, 2)],
  term ((1052762696583868432439612859662869135376172 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (13, 1), (15, 1)],
  term ((164320952911 : Rat) / 7401317245) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((464365213609657773824054534935296 : Rat) / 1273790490336191187829975377157) [(10, 2), (13, 2)],
  term ((231263123784283833415009197375672 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)],
  term ((486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)],
  term ((164320952911 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 2), (13, 1)],
  term ((-35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)],
  term ((14389252022 : Rat) / 7401317245) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((53976637431010072561900911418296 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)],
  term ((-107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)],
  term ((-1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 2)],
  term ((-845459733297039120143260856136 : Rat) / 1273790490336191187829975377157) [(12, 1)],
  term ((-110368989874483531733216641409830229285268 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)],
  term ((-5868681899 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1731558720928092564893149269792 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)],
  term ((161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)],
  term ((57035734191 : Rat) / 14802634490) [(12, 1), (15, 2), (16, 1)],
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 1), (15, 1)],
  term ((112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 2), (15, 2)],
  term ((11619879158 : Rat) / 1480263449) [(12, 2), (15, 2), (16, 1)],
  term ((-263190674145967108109903214915717283844043 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)],
  term ((-164320952911 : Rat) / 29605268980) [(13, 1), (15, 1), (16, 1)],
  term ((-116091303402414443456013633733824 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 600 through 691. -/
theorem ep_Q2_002_block_21_0600_0691_valid :
    checkProductSumEq ep_Q2_002_partials_21_0600_0691
      ep_Q2_002_block_21_0600_0691 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
