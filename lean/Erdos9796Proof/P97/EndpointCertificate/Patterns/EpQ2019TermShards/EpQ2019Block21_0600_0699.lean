/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0600 : Poly :=
[
  term ((-1921633101121180615871907887393981103788 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 600 for generator 21. -/
def ep_Q2_019_partial_21_0600 : Poly :=
[
  term ((-3843266202242361231743815774787962207576 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1921633101121180615871907887393981103788 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 21. -/
theorem ep_Q2_019_partial_21_0600_valid :
    mulPoly ep_Q2_019_coefficient_21_0600
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0601 : Poly :=
[
  term ((-833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 601 for generator 21. -/
def ep_Q2_019_partial_21_0601 : Poly :=
[
  term ((-1666339767029020588102505942804464304684 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 21. -/
theorem ep_Q2_019_partial_21_0601_valid :
    mulPoly ep_Q2_019_coefficient_21_0601
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0602 : Poly :=
[
  term ((-8021652017368310092985898828855897486157 : Rat) / 113926384795468691259580901979875534413) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 21. -/
def ep_Q2_019_partial_21_0602 : Poly :=
[
  term ((-16043304034736620185971797657711794972314 : Rat) / 113926384795468691259580901979875534413) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8021652017368310092985898828855897486157 : Rat) / 113926384795468691259580901979875534413) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 21. -/
theorem ep_Q2_019_partial_21_0602_valid :
    mulPoly ep_Q2_019_coefficient_21_0602
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0603 : Poly :=
[
  term ((-2145567917086144238976561170734330142762483 : Rat) / 20506749263184364426724562356377596194340) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 21. -/
def ep_Q2_019_partial_21_0603 : Poly :=
[
  term ((-2145567917086144238976561170734330142762483 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2145567917086144238976561170734330142762483 : Rat) / 20506749263184364426724562356377596194340) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 21. -/
theorem ep_Q2_019_partial_21_0603_valid :
    mulPoly ep_Q2_019_coefficient_21_0603
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0604 : Poly :=
[
  term ((43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 604 for generator 21. -/
def ep_Q2_019_partial_21_0604 : Poly :=
[
  term ((43778105505486422954612456938561477240801 : Rat) / 1577442251014181878978812488952122784180) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 21. -/
theorem ep_Q2_019_partial_21_0604_valid :
    mulPoly ep_Q2_019_coefficient_21_0604
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0605 : Poly :=
[
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 605 for generator 21. -/
def ep_Q2_019_partial_21_0605 : Poly :=
[
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 21. -/
theorem ep_Q2_019_partial_21_0605_valid :
    mulPoly ep_Q2_019_coefficient_21_0605
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0606 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 21. -/
def ep_Q2_019_partial_21_0606 : Poly :=
[
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 21. -/
theorem ep_Q2_019_partial_21_0606_valid :
    mulPoly ep_Q2_019_coefficient_21_0606
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0607 : Poly :=
[
  term ((7657503369864242557667909085452917388 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 607 for generator 21. -/
def ep_Q2_019_partial_21_0607 : Poly :=
[
  term ((15315006739728485115335818170905834776 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7657503369864242557667909085452917388 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 21. -/
theorem ep_Q2_019_partial_21_0607_valid :
    mulPoly ep_Q2_019_coefficient_21_0607
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0608 : Poly :=
[
  term ((105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 608 for generator 21. -/
def ep_Q2_019_partial_21_0608 : Poly :=
[
  term ((210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 21. -/
theorem ep_Q2_019_partial_21_0608_valid :
    mulPoly ep_Q2_019_coefficient_21_0608
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0609 : Poly :=
[
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 609 for generator 21. -/
def ep_Q2_019_partial_21_0609 : Poly :=
[
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 21. -/
theorem ep_Q2_019_partial_21_0609_valid :
    mulPoly ep_Q2_019_coefficient_21_0609
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0610 : Poly :=
[
  term ((59871086121789219834340165264582412894466 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 21. -/
def ep_Q2_019_partial_21_0610 : Poly :=
[
  term ((119742172243578439668680330529164825788932 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59871086121789219834340165264582412894466 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 21. -/
theorem ep_Q2_019_partial_21_0610_valid :
    mulPoly ep_Q2_019_coefficient_21_0610
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0611 : Poly :=
[
  term ((-1102217580540427106442639131787005581681 : Rat) / 1139263847954686912595809019798755344130) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 21. -/
def ep_Q2_019_partial_21_0611 : Poly :=
[
  term ((-1102217580540427106442639131787005581681 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1102217580540427106442639131787005581681 : Rat) / 1139263847954686912595809019798755344130) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 21. -/
theorem ep_Q2_019_partial_21_0611_valid :
    mulPoly ep_Q2_019_coefficient_21_0611
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0612 : Poly :=
[
  term ((166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 612 for generator 21. -/
def ep_Q2_019_partial_21_0612 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 21. -/
theorem ep_Q2_019_partial_21_0612_valid :
    mulPoly ep_Q2_019_coefficient_21_0612
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0613 : Poly :=
[
  term ((124922780819816323417538121011844176156864 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 613 for generator 21. -/
def ep_Q2_019_partial_21_0613 : Poly :=
[
  term ((249845561639632646835076242023688352313728 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124922780819816323417538121011844176156864 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 21. -/
theorem ep_Q2_019_partial_21_0613_valid :
    mulPoly ep_Q2_019_coefficient_21_0613
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0614 : Poly :=
[
  term ((-3390858764359228136705336518786218506729 : Rat) / 210325633468557583863841665193616371224) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 614 for generator 21. -/
def ep_Q2_019_partial_21_0614 : Poly :=
[
  term ((-3390858764359228136705336518786218506729 : Rat) / 105162816734278791931920832596808185612) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((3390858764359228136705336518786218506729 : Rat) / 210325633468557583863841665193616371224) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 21. -/
theorem ep_Q2_019_partial_21_0614_valid :
    mulPoly ep_Q2_019_coefficient_21_0614
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0615 : Poly :=
[
  term ((-2975475413308052636599776770610013155587 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (14, 2), (16, 1)]
]

/-- Partial product 615 for generator 21. -/
def ep_Q2_019_partial_21_0615 : Poly :=
[
  term ((-2975475413308052636599776770610013155587 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((2975475413308052636599776770610013155587 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 21. -/
theorem ep_Q2_019_partial_21_0615_valid :
    mulPoly ep_Q2_019_coefficient_21_0615
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0616 : Poly :=
[
  term ((-275202488826364697637403082588448357649331 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 616 for generator 21. -/
def ep_Q2_019_partial_21_0616 : Poly :=
[
  term ((-275202488826364697637403082588448357649331 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((275202488826364697637403082588448357649331 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 21. -/
theorem ep_Q2_019_partial_21_0616_valid :
    mulPoly ep_Q2_019_coefficient_21_0616
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0617 : Poly :=
[
  term ((16571774977110555344605289045678518680101 : Rat) / 2523907601622691006366099982323396454688) [(8, 1), (16, 1)]
]

/-- Partial product 617 for generator 21. -/
def ep_Q2_019_partial_21_0617 : Poly :=
[
  term ((16571774977110555344605289045678518680101 : Rat) / 1261953800811345503183049991161698227344) [(8, 1), (10, 1), (16, 1)],
  term ((-16571774977110555344605289045678518680101 : Rat) / 2523907601622691006366099982323396454688) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 21. -/
theorem ep_Q2_019_partial_21_0617_valid :
    mulPoly ep_Q2_019_coefficient_21_0617
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0618 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 1), (16, 1)]
]

/-- Partial product 618 for generator 21. -/
def ep_Q2_019_partial_21_0618 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 21. -/
theorem ep_Q2_019_partial_21_0618_valid :
    mulPoly ep_Q2_019_coefficient_21_0618
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0619 : Poly :=
[
  term ((-43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 619 for generator 21. -/
def ep_Q2_019_partial_21_0619 : Poly :=
[
  term ((43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43778105505486422954612456938561477240801 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 21. -/
theorem ep_Q2_019_partial_21_0619_valid :
    mulPoly ep_Q2_019_coefficient_21_0619
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0620 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 620 for generator 21. -/
def ep_Q2_019_partial_21_0620 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 21. -/
theorem ep_Q2_019_partial_21_0620_valid :
    mulPoly ep_Q2_019_coefficient_21_0620
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0621 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 21. -/
def ep_Q2_019_partial_21_0621 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 21. -/
theorem ep_Q2_019_partial_21_0621_valid :
    mulPoly ep_Q2_019_coefficient_21_0621
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0622 : Poly :=
[
  term ((3214838214724729540125606258396919181289 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 21. -/
def ep_Q2_019_partial_21_0622 : Poly :=
[
  term ((-3214838214724729540125606258396919181289 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6429676429449459080251212516793838362578 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 21. -/
theorem ep_Q2_019_partial_21_0622_valid :
    mulPoly ep_Q2_019_coefficient_21_0622
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0623 : Poly :=
[
  term ((1921633101121180615871907887393981103788 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 623 for generator 21. -/
def ep_Q2_019_partial_21_0623 : Poly :=
[
  term ((-1921633101121180615871907887393981103788 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3843266202242361231743815774787962207576 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 21. -/
theorem ep_Q2_019_partial_21_0623_valid :
    mulPoly ep_Q2_019_coefficient_21_0623
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0624 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 624 for generator 21. -/
def ep_Q2_019_partial_21_0624 : Poly :=
[
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 21. -/
theorem ep_Q2_019_partial_21_0624_valid :
    mulPoly ep_Q2_019_coefficient_21_0624
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0625 : Poly :=
[
  term ((833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 625 for generator 21. -/
def ep_Q2_019_partial_21_0625 : Poly :=
[
  term ((-833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1666339767029020588102505942804464304684 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 21. -/
theorem ep_Q2_019_partial_21_0625_valid :
    mulPoly ep_Q2_019_coefficient_21_0625
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0626 : Poly :=
[
  term ((82679305528206779318167886851524137049338 : Rat) / 1025337463159218221336228117818879809717) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 21. -/
def ep_Q2_019_partial_21_0626 : Poly :=
[
  term ((-82679305528206779318167886851524137049338 : Rat) / 1025337463159218221336228117818879809717) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((165358611056413558636335773703048274098676 : Rat) / 1025337463159218221336228117818879809717) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 21. -/
theorem ep_Q2_019_partial_21_0626_valid :
    mulPoly ep_Q2_019_coefficient_21_0626
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0627 : Poly :=
[
  term ((177703809239339019670530653119965287315591 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 21. -/
def ep_Q2_019_partial_21_0627 : Poly :=
[
  term ((-177703809239339019670530653119965287315591 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((177703809239339019670530653119965287315591 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 21. -/
theorem ep_Q2_019_partial_21_0627_valid :
    mulPoly ep_Q2_019_coefficient_21_0627
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0628 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 628 for generator 21. -/
def ep_Q2_019_partial_21_0628 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 21. -/
theorem ep_Q2_019_partial_21_0628_valid :
    mulPoly ep_Q2_019_coefficient_21_0628
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0629 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 629 for generator 21. -/
def ep_Q2_019_partial_21_0629 : Poly :=
[
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 21. -/
theorem ep_Q2_019_partial_21_0629_valid :
    mulPoly ep_Q2_019_coefficient_21_0629
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0630 : Poly :=
[
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 21. -/
def ep_Q2_019_partial_21_0630 : Poly :=
[
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 21. -/
theorem ep_Q2_019_partial_21_0630_valid :
    mulPoly ep_Q2_019_coefficient_21_0630
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0631 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 21. -/
def ep_Q2_019_partial_21_0631 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 21. -/
theorem ep_Q2_019_partial_21_0631_valid :
    mulPoly ep_Q2_019_coefficient_21_0631
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0632 : Poly :=
[
  term ((137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 632 for generator 21. -/
def ep_Q2_019_partial_21_0632 : Poly :=
[
  term ((137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 21. -/
theorem ep_Q2_019_partial_21_0632_valid :
    mulPoly ep_Q2_019_coefficient_21_0632
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0633 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 633 for generator 21. -/
def ep_Q2_019_partial_21_0633 : Poly :=
[
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 21. -/
theorem ep_Q2_019_partial_21_0633_valid :
    mulPoly ep_Q2_019_coefficient_21_0633
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0634 : Poly :=
[
  term ((-43778105505486422954612456938561477240801 : Rat) / 6309769004056727515915249955808491136720) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 634 for generator 21. -/
def ep_Q2_019_partial_21_0634 : Poly :=
[
  term ((-43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43778105505486422954612456938561477240801 : Rat) / 6309769004056727515915249955808491136720) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 21. -/
theorem ep_Q2_019_partial_21_0634_valid :
    mulPoly ep_Q2_019_coefficient_21_0634
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0635 : Poly :=
[
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 635 for generator 21. -/
def ep_Q2_019_partial_21_0635 : Poly :=
[
  term ((1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 21. -/
theorem ep_Q2_019_partial_21_0635_valid :
    mulPoly ep_Q2_019_coefficient_21_0635
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0636 : Poly :=
[
  term ((-166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 636 for generator 21. -/
def ep_Q2_019_partial_21_0636 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 21. -/
theorem ep_Q2_019_partial_21_0636_valid :
    mulPoly ep_Q2_019_coefficient_21_0636
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0637 : Poly :=
[
  term ((-20990430033657871646160716497378063531474 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 21. -/
def ep_Q2_019_partial_21_0637 : Poly :=
[
  term ((-41980860067315743292321432994756127062948 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20990430033657871646160716497378063531474 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 21. -/
theorem ep_Q2_019_partial_21_0637_valid :
    mulPoly ep_Q2_019_coefficient_21_0637
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0638 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 21. -/
def ep_Q2_019_partial_21_0638 : Poly :=
[
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 21. -/
theorem ep_Q2_019_partial_21_0638_valid :
    mulPoly ep_Q2_019_coefficient_21_0638
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0639 : Poly :=
[
  term ((3214838214724729540125606258396919181289 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 21. -/
def ep_Q2_019_partial_21_0639 : Poly :=
[
  term ((3214838214724729540125606258396919181289 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3214838214724729540125606258396919181289 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 21. -/
theorem ep_Q2_019_partial_21_0639_valid :
    mulPoly ep_Q2_019_coefficient_21_0639
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0640 : Poly :=
[
  term ((-795219564557628628052346438109991881244 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 640 for generator 21. -/
def ep_Q2_019_partial_21_0640 : Poly :=
[
  term ((-1590439129115257256104692876219983762488 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((795219564557628628052346438109991881244 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 21. -/
theorem ep_Q2_019_partial_21_0640_valid :
    mulPoly ep_Q2_019_coefficient_21_0640
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0641 : Poly :=
[
  term ((-4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 641 for generator 21. -/
def ep_Q2_019_partial_21_0641 : Poly :=
[
  term ((-9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 21. -/
theorem ep_Q2_019_partial_21_0641_valid :
    mulPoly ep_Q2_019_coefficient_21_0641
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0642 : Poly :=
[
  term ((-44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 642 for generator 21. -/
def ep_Q2_019_partial_21_0642 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 21. -/
theorem ep_Q2_019_partial_21_0642_valid :
    mulPoly ep_Q2_019_coefficient_21_0642
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0643 : Poly :=
[
  term ((416584941757255147025626485701116076171 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 643 for generator 21. -/
def ep_Q2_019_partial_21_0643 : Poly :=
[
  term ((833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-416584941757255147025626485701116076171 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 21. -/
theorem ep_Q2_019_partial_21_0643_valid :
    mulPoly ep_Q2_019_coefficient_21_0643
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0644 : Poly :=
[
  term ((16036685360522121159926353341633487382363 : Rat) / 262907041835696979829802081492020464030) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 21. -/
def ep_Q2_019_partial_21_0644 : Poly :=
[
  term ((16036685360522121159926353341633487382363 : Rat) / 131453520917848489914901040746010232015) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16036685360522121159926353341633487382363 : Rat) / 262907041835696979829802081492020464030) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 21. -/
theorem ep_Q2_019_partial_21_0644_valid :
    mulPoly ep_Q2_019_coefficient_21_0644
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0645 : Poly :=
[
  term ((-161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 21. -/
def ep_Q2_019_partial_21_0645 : Poly :=
[
  term ((-322375976386737492120493026692332923786208 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 21. -/
theorem ep_Q2_019_partial_21_0645_valid :
    mulPoly ep_Q2_019_coefficient_21_0645
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0646 : Poly :=
[
  term ((177703809239339019670530653119965287315591 : Rat) / 20506749263184364426724562356377596194340) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 646 for generator 21. -/
def ep_Q2_019_partial_21_0646 : Poly :=
[
  term ((177703809239339019670530653119965287315591 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-177703809239339019670530653119965287315591 : Rat) / 20506749263184364426724562356377596194340) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 21. -/
theorem ep_Q2_019_partial_21_0646_valid :
    mulPoly ep_Q2_019_coefficient_21_0646
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0647 : Poly :=
[
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 647 for generator 21. -/
def ep_Q2_019_partial_21_0647 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 21. -/
theorem ep_Q2_019_partial_21_0647_valid :
    mulPoly ep_Q2_019_coefficient_21_0647
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0648 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 648 for generator 21. -/
def ep_Q2_019_partial_21_0648 : Poly :=
[
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 21. -/
theorem ep_Q2_019_partial_21_0648_valid :
    mulPoly ep_Q2_019_coefficient_21_0648
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0649 : Poly :=
[
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 21. -/
def ep_Q2_019_partial_21_0649 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 21. -/
theorem ep_Q2_019_partial_21_0649_valid :
    mulPoly ep_Q2_019_coefficient_21_0649
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0650 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 650 for generator 21. -/
def ep_Q2_019_partial_21_0650 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 21. -/
theorem ep_Q2_019_partial_21_0650_valid :
    mulPoly ep_Q2_019_coefficient_21_0650
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0651 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 651 for generator 21. -/
def ep_Q2_019_partial_21_0651 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 21. -/
theorem ep_Q2_019_partial_21_0651_valid :
    mulPoly ep_Q2_019_coefficient_21_0651
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0652 : Poly :=
[
  term ((699778170861739781406513600475475385869 : Rat) / 32192699000289426101608418141880056820) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 652 for generator 21. -/
def ep_Q2_019_partial_21_0652 : Poly :=
[
  term ((-699778170861739781406513600475475385869 : Rat) / 32192699000289426101608418141880056820) [(9, 2), (10, 1), (16, 1)],
  term ((699778170861739781406513600475475385869 : Rat) / 16096349500144713050804209070940028410) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 21. -/
theorem ep_Q2_019_partial_21_0652_valid :
    mulPoly ep_Q2_019_coefficient_21_0652
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0653 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 653 for generator 21. -/
def ep_Q2_019_partial_21_0653 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 21. -/
theorem ep_Q2_019_partial_21_0653_valid :
    mulPoly ep_Q2_019_coefficient_21_0653
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0654 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 21. -/
def ep_Q2_019_partial_21_0654 : Poly :=
[
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 21. -/
theorem ep_Q2_019_partial_21_0654_valid :
    mulPoly ep_Q2_019_coefficient_21_0654
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0655 : Poly :=
[
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 655 for generator 21. -/
def ep_Q2_019_partial_21_0655 : Poly :=
[
  term ((146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 21. -/
theorem ep_Q2_019_partial_21_0655_valid :
    mulPoly ep_Q2_019_coefficient_21_0655
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0656 : Poly :=
[
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 656 for generator 21. -/
def ep_Q2_019_partial_21_0656 : Poly :=
[
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 21. -/
theorem ep_Q2_019_partial_21_0656_valid :
    mulPoly ep_Q2_019_coefficient_21_0656
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0657 : Poly :=
[
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 21. -/
def ep_Q2_019_partial_21_0657 : Poly :=
[
  term ((-352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 21. -/
theorem ep_Q2_019_partial_21_0657_valid :
    mulPoly ep_Q2_019_coefficient_21_0657
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0658 : Poly :=
[
  term ((44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 21. -/
def ep_Q2_019_partial_21_0658 : Poly :=
[
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 21. -/
theorem ep_Q2_019_partial_21_0658_valid :
    mulPoly ep_Q2_019_coefficient_21_0658
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0659 : Poly :=
[
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 659 for generator 21. -/
def ep_Q2_019_partial_21_0659 : Poly :=
[
  term ((-91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 21. -/
theorem ep_Q2_019_partial_21_0659_valid :
    mulPoly ep_Q2_019_coefficient_21_0659
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0660 : Poly :=
[
  term ((22683117298693548917998966684835369168071 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 660 for generator 21. -/
def ep_Q2_019_partial_21_0660 : Poly :=
[
  term ((45366234597387097835997933369670738336142 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-22683117298693548917998966684835369168071 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 21. -/
theorem ep_Q2_019_partial_21_0660_valid :
    mulPoly ep_Q2_019_coefficient_21_0660
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0661 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 2), (16, 1)]
]

/-- Partial product 661 for generator 21. -/
def ep_Q2_019_partial_21_0661 : Poly :=
[
  term ((11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 21. -/
theorem ep_Q2_019_partial_21_0661_valid :
    mulPoly ep_Q2_019_coefficient_21_0661
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0662 : Poly :=
[
  term ((11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 662 for generator 21. -/
def ep_Q2_019_partial_21_0662 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 21. -/
theorem ep_Q2_019_partial_21_0662_valid :
    mulPoly ep_Q2_019_coefficient_21_0662
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0663 : Poly :=
[
  term ((699778170861739781406513600475475385869 : Rat) / 64385398000578852203216836283760113640) [(9, 2), (16, 1)]
]

/-- Partial product 663 for generator 21. -/
def ep_Q2_019_partial_21_0663 : Poly :=
[
  term ((699778170861739781406513600475475385869 : Rat) / 32192699000289426101608418141880056820) [(9, 2), (10, 1), (16, 1)],
  term ((-699778170861739781406513600475475385869 : Rat) / 64385398000578852203216836283760113640) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 21. -/
theorem ep_Q2_019_partial_21_0663_valid :
    mulPoly ep_Q2_019_coefficient_21_0663
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0664 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 664 for generator 21. -/
def ep_Q2_019_partial_21_0664 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 21. -/
theorem ep_Q2_019_partial_21_0664_valid :
    mulPoly ep_Q2_019_coefficient_21_0664
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0665 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 21. -/
def ep_Q2_019_partial_21_0665 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 21. -/
theorem ep_Q2_019_partial_21_0665_valid :
    mulPoly ep_Q2_019_coefficient_21_0665
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0666 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (13, 1), (16, 1)]
]

/-- Partial product 666 for generator 21. -/
def ep_Q2_019_partial_21_0666 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 21. -/
theorem ep_Q2_019_partial_21_0666_valid :
    mulPoly ep_Q2_019_coefficient_21_0666
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0667 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 21. -/
def ep_Q2_019_partial_21_0667 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 21. -/
theorem ep_Q2_019_partial_21_0667_valid :
    mulPoly ep_Q2_019_coefficient_21_0667
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0668 : Poly :=
[
  term ((8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 21. -/
def ep_Q2_019_partial_21_0668 : Poly :=
[
  term ((-8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 21. -/
theorem ep_Q2_019_partial_21_0668_valid :
    mulPoly ep_Q2_019_coefficient_21_0668
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0669 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 21. -/
def ep_Q2_019_partial_21_0669 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 21. -/
theorem ep_Q2_019_partial_21_0669_valid :
    mulPoly ep_Q2_019_coefficient_21_0669
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0670 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 670 for generator 21. -/
def ep_Q2_019_partial_21_0670 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 21. -/
theorem ep_Q2_019_partial_21_0670_valid :
    mulPoly ep_Q2_019_coefficient_21_0670
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0671 : Poly :=
[
  term ((-35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 21. -/
def ep_Q2_019_partial_21_0671 : Poly :=
[
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 21. -/
theorem ep_Q2_019_partial_21_0671_valid :
    mulPoly ep_Q2_019_coefficient_21_0671
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0672 : Poly :=
[
  term ((-250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 21. -/
def ep_Q2_019_partial_21_0672 : Poly :=
[
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 21. -/
theorem ep_Q2_019_partial_21_0672_valid :
    mulPoly ep_Q2_019_coefficient_21_0672
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0673 : Poly :=
[
  term ((-371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 21. -/
def ep_Q2_019_partial_21_0673 : Poly :=
[
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 21. -/
theorem ep_Q2_019_partial_21_0673_valid :
    mulPoly ep_Q2_019_coefficient_21_0673
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0674 : Poly :=
[
  term ((-4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 674 for generator 21. -/
def ep_Q2_019_partial_21_0674 : Poly :=
[
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 21. -/
theorem ep_Q2_019_partial_21_0674_valid :
    mulPoly ep_Q2_019_coefficient_21_0674
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0675 : Poly :=
[
  term ((-1883142468995873613243315895349296302661 : Rat) / 901395572008103930845035707972641590960) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 675 for generator 21. -/
def ep_Q2_019_partial_21_0675 : Poly :=
[
  term ((1883142468995873613243315895349296302661 : Rat) / 901395572008103930845035707972641590960) [(10, 1), (14, 1), (16, 1)],
  term ((-1883142468995873613243315895349296302661 : Rat) / 450697786004051965422517853986320795480) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 21. -/
theorem ep_Q2_019_partial_21_0675_valid :
    mulPoly ep_Q2_019_coefficient_21_0675
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0676 : Poly :=
[
  term ((13507965364286577591816821700734438559232 : Rat) / 1025337463159218221336228117818879809717) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 676 for generator 21. -/
def ep_Q2_019_partial_21_0676 : Poly :=
[
  term ((-13507965364286577591816821700734438559232 : Rat) / 1025337463159218221336228117818879809717) [(10, 1), (15, 2), (16, 1)],
  term ((27015930728573155183633643401468877118464 : Rat) / 1025337463159218221336228117818879809717) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 21. -/
theorem ep_Q2_019_partial_21_0676_valid :
    mulPoly ep_Q2_019_coefficient_21_0676
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0677 : Poly :=
[
  term ((-1197495599996687778454842843677840508625 : Rat) / 841302533874230335455366660774465484896) [(10, 1), (16, 1)]
]

/-- Partial product 677 for generator 21. -/
def ep_Q2_019_partial_21_0677 : Poly :=
[
  term ((1197495599996687778454842843677840508625 : Rat) / 841302533874230335455366660774465484896) [(10, 1), (16, 1)],
  term ((-1197495599996687778454842843677840508625 : Rat) / 420651266937115167727683330387232742448) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 21. -/
theorem ep_Q2_019_partial_21_0677_valid :
    mulPoly ep_Q2_019_coefficient_21_0677
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0678 : Poly :=
[
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 678 for generator 21. -/
def ep_Q2_019_partial_21_0678 : Poly :=
[
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 21. -/
theorem ep_Q2_019_partial_21_0678_valid :
    mulPoly ep_Q2_019_coefficient_21_0678
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0679 : Poly :=
[
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 679 for generator 21. -/
def ep_Q2_019_partial_21_0679 : Poly :=
[
  term ((71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 21. -/
theorem ep_Q2_019_partial_21_0679_valid :
    mulPoly ep_Q2_019_coefficient_21_0679
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0680 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 21. -/
def ep_Q2_019_partial_21_0680 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 21. -/
theorem ep_Q2_019_partial_21_0680_valid :
    mulPoly ep_Q2_019_coefficient_21_0680
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0681 : Poly :=
[
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 21. -/
def ep_Q2_019_partial_21_0681 : Poly :=
[
  term ((743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 21. -/
theorem ep_Q2_019_partial_21_0681_valid :
    mulPoly ep_Q2_019_coefficient_21_0681
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0682 : Poly :=
[
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 682 for generator 21. -/
def ep_Q2_019_partial_21_0682 : Poly :=
[
  term ((500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 21. -/
theorem ep_Q2_019_partial_21_0682_valid :
    mulPoly ep_Q2_019_coefficient_21_0682
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0683 : Poly :=
[
  term ((-64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 21. -/
def ep_Q2_019_partial_21_0683 : Poly :=
[
  term ((-129306830550698339752120840731524005777696 : Rat) / 5126687315796091106681140589094399048585) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 21. -/
theorem ep_Q2_019_partial_21_0683_valid :
    mulPoly ep_Q2_019_coefficient_21_0683
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0684 : Poly :=
[
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 21. -/
def ep_Q2_019_partial_21_0684 : Poly :=
[
  term ((9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 21. -/
theorem ep_Q2_019_partial_21_0684_valid :
    mulPoly ep_Q2_019_coefficient_21_0684
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0685 : Poly :=
[
  term ((8283816416500533411716906462210063468753 : Rat) / 6309769004056727515915249955808491136720) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 21. -/
def ep_Q2_019_partial_21_0685 : Poly :=
[
  term ((8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 6309769004056727515915249955808491136720) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 21. -/
theorem ep_Q2_019_partial_21_0685_valid :
    mulPoly ep_Q2_019_coefficient_21_0685
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0686 : Poly :=
[
  term ((-8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 686 for generator 21. -/
def ep_Q2_019_partial_21_0686 : Poly :=
[
  term ((-8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 21. -/
theorem ep_Q2_019_partial_21_0686_valid :
    mulPoly ep_Q2_019_coefficient_21_0686
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0687 : Poly :=
[
  term ((166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 21. -/
def ep_Q2_019_partial_21_0687 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 21. -/
theorem ep_Q2_019_partial_21_0687_valid :
    mulPoly ep_Q2_019_coefficient_21_0687
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0688 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 688 for generator 21. -/
def ep_Q2_019_partial_21_0688 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 21. -/
theorem ep_Q2_019_partial_21_0688_valid :
    mulPoly ep_Q2_019_coefficient_21_0688
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0689 : Poly :=
[
  term ((19092587031952834226707572951905206234 : Rat) / 8763568061189899327660069383067348801) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 689 for generator 21. -/
def ep_Q2_019_partial_21_0689 : Poly :=
[
  term ((38185174063905668453415145903810412468 : Rat) / 8763568061189899327660069383067348801) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19092587031952834226707572951905206234 : Rat) / 8763568061189899327660069383067348801) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 21. -/
theorem ep_Q2_019_partial_21_0689_valid :
    mulPoly ep_Q2_019_coefficient_21_0689
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0690 : Poly :=
[
  term ((421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 690 for generator 21. -/
def ep_Q2_019_partial_21_0690 : Poly :=
[
  term ((842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 21. -/
theorem ep_Q2_019_partial_21_0690_valid :
    mulPoly ep_Q2_019_coefficient_21_0690
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0691 : Poly :=
[
  term ((-35996885810842694343876762194055870396571 : Rat) / 3417791543864060737787427059396266032390) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 691 for generator 21. -/
def ep_Q2_019_partial_21_0691 : Poly :=
[
  term ((-35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 3417791543864060737787427059396266032390) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 21. -/
theorem ep_Q2_019_partial_21_0691_valid :
    mulPoly ep_Q2_019_coefficient_21_0691
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0692 : Poly :=
[
  term ((-214269046915559915849358425319644926 : Rat) / 368217145428147030573952495086863395) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 692 for generator 21. -/
def ep_Q2_019_partial_21_0692 : Poly :=
[
  term ((-428538093831119831698716850639289852 : Rat) / 368217145428147030573952495086863395) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((214269046915559915849358425319644926 : Rat) / 368217145428147030573952495086863395) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 21. -/
theorem ep_Q2_019_partial_21_0692_valid :
    mulPoly ep_Q2_019_coefficient_21_0692
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0693 : Poly :=
[
  term ((167290046564821184197678552226581605183017 : Rat) / 3417791543864060737787427059396266032390) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 693 for generator 21. -/
def ep_Q2_019_partial_21_0693 : Poly :=
[
  term ((167290046564821184197678552226581605183017 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-167290046564821184197678552226581605183017 : Rat) / 3417791543864060737787427059396266032390) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 21. -/
theorem ep_Q2_019_partial_21_0693_valid :
    mulPoly ep_Q2_019_coefficient_21_0693
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0694 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 21. -/
def ep_Q2_019_partial_21_0694 : Poly :=
[
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 21. -/
theorem ep_Q2_019_partial_21_0694_valid :
    mulPoly ep_Q2_019_coefficient_21_0694
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0695 : Poly :=
[
  term ((-185819923947349368491098000404868538551 : Rat) / 43817840305949496638300346915336744005) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 695 for generator 21. -/
def ep_Q2_019_partial_21_0695 : Poly :=
[
  term ((-371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((185819923947349368491098000404868538551 : Rat) / 43817840305949496638300346915336744005) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 21. -/
theorem ep_Q2_019_partial_21_0695_valid :
    mulPoly ep_Q2_019_coefficient_21_0695
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0696 : Poly :=
[
  term ((-961898828736242468894582782338780126 : Rat) / 1251938294455699903951438483295335543) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 696 for generator 21. -/
def ep_Q2_019_partial_21_0696 : Poly :=
[
  term ((-1923797657472484937789165564677560252 : Rat) / 1251938294455699903951438483295335543) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((961898828736242468894582782338780126 : Rat) / 1251938294455699903951438483295335543) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 21. -/
theorem ep_Q2_019_partial_21_0696_valid :
    mulPoly ep_Q2_019_coefficient_21_0696
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0697 : Poly :=
[
  term ((-37177759431927436881534463807622887043563 : Rat) / 569631923977343456297904509899377672065) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 697 for generator 21. -/
def ep_Q2_019_partial_21_0697 : Poly :=
[
  term ((-74355518863854873763068927615245774087126 : Rat) / 569631923977343456297904509899377672065) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((37177759431927436881534463807622887043563 : Rat) / 569631923977343456297904509899377672065) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 21. -/
theorem ep_Q2_019_partial_21_0697_valid :
    mulPoly ep_Q2_019_coefficient_21_0697
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0698 : Poly :=
[
  term ((7876178966349900582525734630199662202335 : Rat) / 180279114401620786169007141594528318192) [(14, 1), (16, 1)]
]

/-- Partial product 698 for generator 21. -/
def ep_Q2_019_partial_21_0698 : Poly :=
[
  term ((7876178966349900582525734630199662202335 : Rat) / 90139557200810393084503570797264159096) [(10, 1), (14, 1), (16, 1)],
  term ((-7876178966349900582525734630199662202335 : Rat) / 180279114401620786169007141594528318192) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 21. -/
theorem ep_Q2_019_partial_21_0698_valid :
    mulPoly ep_Q2_019_coefficient_21_0698
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0699 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 21. -/
def ep_Q2_019_partial_21_0699 : Poly :=
[
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 21. -/
theorem ep_Q2_019_partial_21_0699_valid :
    mulPoly ep_Q2_019_coefficient_21_0699
        ep_Q2_019_generator_21_0600_0699 =
      ep_Q2_019_partial_21_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0600_0699 : List Poly :=
[
  ep_Q2_019_partial_21_0600,
  ep_Q2_019_partial_21_0601,
  ep_Q2_019_partial_21_0602,
  ep_Q2_019_partial_21_0603,
  ep_Q2_019_partial_21_0604,
  ep_Q2_019_partial_21_0605,
  ep_Q2_019_partial_21_0606,
  ep_Q2_019_partial_21_0607,
  ep_Q2_019_partial_21_0608,
  ep_Q2_019_partial_21_0609,
  ep_Q2_019_partial_21_0610,
  ep_Q2_019_partial_21_0611,
  ep_Q2_019_partial_21_0612,
  ep_Q2_019_partial_21_0613,
  ep_Q2_019_partial_21_0614,
  ep_Q2_019_partial_21_0615,
  ep_Q2_019_partial_21_0616,
  ep_Q2_019_partial_21_0617,
  ep_Q2_019_partial_21_0618,
  ep_Q2_019_partial_21_0619,
  ep_Q2_019_partial_21_0620,
  ep_Q2_019_partial_21_0621,
  ep_Q2_019_partial_21_0622,
  ep_Q2_019_partial_21_0623,
  ep_Q2_019_partial_21_0624,
  ep_Q2_019_partial_21_0625,
  ep_Q2_019_partial_21_0626,
  ep_Q2_019_partial_21_0627,
  ep_Q2_019_partial_21_0628,
  ep_Q2_019_partial_21_0629,
  ep_Q2_019_partial_21_0630,
  ep_Q2_019_partial_21_0631,
  ep_Q2_019_partial_21_0632,
  ep_Q2_019_partial_21_0633,
  ep_Q2_019_partial_21_0634,
  ep_Q2_019_partial_21_0635,
  ep_Q2_019_partial_21_0636,
  ep_Q2_019_partial_21_0637,
  ep_Q2_019_partial_21_0638,
  ep_Q2_019_partial_21_0639,
  ep_Q2_019_partial_21_0640,
  ep_Q2_019_partial_21_0641,
  ep_Q2_019_partial_21_0642,
  ep_Q2_019_partial_21_0643,
  ep_Q2_019_partial_21_0644,
  ep_Q2_019_partial_21_0645,
  ep_Q2_019_partial_21_0646,
  ep_Q2_019_partial_21_0647,
  ep_Q2_019_partial_21_0648,
  ep_Q2_019_partial_21_0649,
  ep_Q2_019_partial_21_0650,
  ep_Q2_019_partial_21_0651,
  ep_Q2_019_partial_21_0652,
  ep_Q2_019_partial_21_0653,
  ep_Q2_019_partial_21_0654,
  ep_Q2_019_partial_21_0655,
  ep_Q2_019_partial_21_0656,
  ep_Q2_019_partial_21_0657,
  ep_Q2_019_partial_21_0658,
  ep_Q2_019_partial_21_0659,
  ep_Q2_019_partial_21_0660,
  ep_Q2_019_partial_21_0661,
  ep_Q2_019_partial_21_0662,
  ep_Q2_019_partial_21_0663,
  ep_Q2_019_partial_21_0664,
  ep_Q2_019_partial_21_0665,
  ep_Q2_019_partial_21_0666,
  ep_Q2_019_partial_21_0667,
  ep_Q2_019_partial_21_0668,
  ep_Q2_019_partial_21_0669,
  ep_Q2_019_partial_21_0670,
  ep_Q2_019_partial_21_0671,
  ep_Q2_019_partial_21_0672,
  ep_Q2_019_partial_21_0673,
  ep_Q2_019_partial_21_0674,
  ep_Q2_019_partial_21_0675,
  ep_Q2_019_partial_21_0676,
  ep_Q2_019_partial_21_0677,
  ep_Q2_019_partial_21_0678,
  ep_Q2_019_partial_21_0679,
  ep_Q2_019_partial_21_0680,
  ep_Q2_019_partial_21_0681,
  ep_Q2_019_partial_21_0682,
  ep_Q2_019_partial_21_0683,
  ep_Q2_019_partial_21_0684,
  ep_Q2_019_partial_21_0685,
  ep_Q2_019_partial_21_0686,
  ep_Q2_019_partial_21_0687,
  ep_Q2_019_partial_21_0688,
  ep_Q2_019_partial_21_0689,
  ep_Q2_019_partial_21_0690,
  ep_Q2_019_partial_21_0691,
  ep_Q2_019_partial_21_0692,
  ep_Q2_019_partial_21_0693,
  ep_Q2_019_partial_21_0694,
  ep_Q2_019_partial_21_0695,
  ep_Q2_019_partial_21_0696,
  ep_Q2_019_partial_21_0697,
  ep_Q2_019_partial_21_0698,
  ep_Q2_019_partial_21_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0600_0699 : Poly :=
[
  term ((-3843266202242361231743815774787962207576 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1666339767029020588102505942804464304684 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16043304034736620185971797657711794972314 : Rat) / 113926384795468691259580901979875534413) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2145567917086144238976561170734330142762483 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((43778105505486422954612456938561477240801 : Rat) / 1577442251014181878978812488952122784180) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((15315006739728485115335818170905834776 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((119742172243578439668680330529164825788932 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1102217580540427106442639131787005581681 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((249845561639632646835076242023688352313728 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3390858764359228136705336518786218506729 : Rat) / 105162816734278791931920832596808185612) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2975475413308052636599776770610013155587 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-275202488826364697637403082588448357649331 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((16571774977110555344605289045678518680101 : Rat) / 1261953800811345503183049991161698227344) [(8, 1), (10, 1), (16, 1)],
  term ((1921633101121180615871907887393981103788 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((833169883514510294051252971402232152342 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((8021652017368310092985898828855897486157 : Rat) / 113926384795468691259580901979875534413) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2145567917086144238976561170734330142762483 : Rat) / 20506749263184364426724562356377596194340) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43778105505486422954612456938561477240801 : Rat) / 3154884502028363757957624977904245568360) [(8, 1), (11, 2), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7657503369864242557667909085452917388 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (12, 1), (16, 1)],
  term ((-59871086121789219834340165264582412894466 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1102217580540427106442639131787005581681 : Rat) / 1139263847954686912595809019798755344130) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(8, 1), (13, 2), (16, 1)],
  term ((-124922780819816323417538121011844176156864 : Rat) / 1708895771932030368893713529698133016195) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3390858764359228136705336518786218506729 : Rat) / 210325633468557583863841665193616371224) [(8, 1), (14, 1), (16, 1)],
  term ((2975475413308052636599776770610013155587 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (14, 2), (16, 1)],
  term ((275202488826364697637403082588448357649331 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (15, 2), (16, 1)],
  term ((-16571774977110555344605289045678518680101 : Rat) / 2523907601622691006366099982323396454688) [(8, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3512072230236437871976600763613964866276 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((212034201419328828646288346066085322665467 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-322375976386737492120493026692332923786208 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43778105505486422954612456938561477240801 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6429676429449459080251212516793838362578 : Rat) / 569631923977343456297904509899377672065) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3843266202242361231743815774787962207576 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((1666339767029020588102505942804464304684 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((165358611056413558636335773703048274098676 : Rat) / 1025337463159218221336228117818879809717) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((177703809239339019670530653119965287315591 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((43778105505486422954612456938561477240801 : Rat) / 6309769004056727515915249955808491136720) [(9, 1), (11, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((20990430033657871646160716497378063531474 : Rat) / 341779154386406073778742705939626603239) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3214838214724729540125606258396919181289 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((795219564557628628052346438109991881244 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-416584941757255147025626485701116076171 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)],
  term ((-16036685360522121159926353341633487382363 : Rat) / 262907041835696979829802081492020464030) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-177703809239339019670530653119965287315591 : Rat) / 20506749263184364426724562356377596194340) [(9, 1), (15, 1), (16, 1)],
  term ((11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 1), (15, 3), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((459293372740949506682799627534350745811 : Rat) / 3755814883367099711854315449886006629) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((699778170861739781406513600475475385869 : Rat) / 16096349500144713050804209070940028410) [(9, 2), (10, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44109339066677019896802530539643728 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-22683117298693548917998966684835369168071 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 2), (16, 1)],
  term ((-11497161852685388952087201937965440 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)],
  term ((-699778170861739781406513600475475385869 : Rat) / 64385398000578852203216836283760113640) [(9, 2), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 2), (13, 1), (16, 1)],
  term ((-370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 3), (15, 1), (16, 1)],
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-129306830550698339752120840731524005777696 : Rat) / 5126687315796091106681140589094399048585) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((4185489245730274472538357073366851009608 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((38185174063905668453415145903810412468 : Rat) / 8763568061189899327660069383067348801) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-428538093831119831698716850639289852 : Rat) / 368217145428147030573952495086863395) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((235673588415403933982956278471932188090253 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1923797657472484937789165564677560252 : Rat) / 1251938294455699903951438483295335543) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-49446554449917139659764037989178646404746 : Rat) / 569631923977343456297904509899377672065) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((26881644044164959812833554065781972775337 : Rat) / 300465190669367976948345235990880530320) [(10, 1), (14, 1), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13507965364286577591816821700734438559232 : Rat) / 1025337463159218221336228117818879809717) [(10, 1), (15, 2), (16, 1)],
  term ((1197495599996687778454842843677840508625 : Rat) / 841302533874230335455366660774465484896) [(10, 1), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1883142468995873613243315895349296302661 : Rat) / 450697786004051965422517853986320795480) [(10, 2), (14, 1), (16, 1)],
  term ((27015930728573155183633643401468877118464 : Rat) / 1025337463159218221336228117818879809717) [(10, 2), (15, 2), (16, 1)],
  term ((-1197495599996687778454842843677840508625 : Rat) / 420651266937115167727683330387232742448) [(10, 2), (16, 1)],
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 6309769004056727515915249955808491136720) [(11, 1), (15, 1), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (14, 1), (16, 1)],
  term ((-166702906588099110719117240179990984 : Rat) / 894241638896928502822456059496668245) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19092587031952834226707572951905206234 : Rat) / 8763568061189899327660069383067348801) [(12, 1), (14, 1), (16, 1)],
  term ((-421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 2), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 3417791543864060737787427059396266032390) [(12, 1), (15, 2), (16, 1)],
  term ((214269046915559915849358425319644926 : Rat) / 368217145428147030573952495086863395) [(12, 2), (14, 1), (16, 1)],
  term ((-167290046564821184197678552226581605183017 : Rat) / 3417791543864060737787427059396266032390) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((185819923947349368491098000404868538551 : Rat) / 43817840305949496638300346915336744005) [(13, 1), (15, 1), (16, 1)],
  term ((961898828736242468894582782338780126 : Rat) / 1251938294455699903951438483295335543) [(13, 2), (14, 1), (16, 1)],
  term ((37177759431927436881534463807622887043563 : Rat) / 569631923977343456297904509899377672065) [(14, 1), (15, 2), (16, 1)],
  term ((-7876178966349900582525734630199662202335 : Rat) / 180279114401620786169007141594528318192) [(14, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 600 through 699. -/
theorem ep_Q2_019_block_21_0600_0699_valid :
    checkProductSumEq ep_Q2_019_partials_21_0600_0699
      ep_Q2_019_block_21_0600_0699 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
