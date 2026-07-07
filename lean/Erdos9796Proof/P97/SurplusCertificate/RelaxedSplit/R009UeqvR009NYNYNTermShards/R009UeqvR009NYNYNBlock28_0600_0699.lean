/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0600 : Poly :=
[
  term ((-99497380142514907060 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0600 : Poly :=
[
  term ((-198994760285029814120 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((99497380142514907060 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0600_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0600
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0601 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 3), (15, 1)]
]

/-- Partial product 601 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0601 : Poly :=
[
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0601_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0601
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0602 : Poly :=
[
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0602 : Poly :=
[
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0602_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0602
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0603 : Poly :=
[
  term ((910820827860368451459574259412504610478142093474516122674652150700333115099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 603 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0603 : Poly :=
[
  term ((-910820827860368451459574259412504610478142093474516122674652150700333115099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (10, 1), (13, 1)],
  term ((910820827860368451459574259412504610478142093474516122674652150700333115099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0603_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0603
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0604 : Poly :=
[
  term ((-4995082490070398876916814951750258746964332148948 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 604 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0604 : Poly :=
[
  term ((4995082490070398876916814951750258746964332148948 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9990164980140797753833629903500517493928664297896 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0604_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0604
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0605 : Poly :=
[
  term ((-66766694258317132522 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 605 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0605 : Poly :=
[
  term ((66766694258317132522 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-133533388516634265044 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0605_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0605
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0606 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 606 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0606 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0606_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0606
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0607 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 607 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0607 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0607_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0607
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0608 : Poly :=
[
  term ((38597311913597618531636644 : Rat) / 3788172465045908734368315) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 608 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0608 : Poly :=
[
  term ((77194623827195237063273288 : Rat) / 3788172465045908734368315) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38597311913597618531636644 : Rat) / 3788172465045908734368315) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0608_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0608
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0609 : Poly :=
[
  term ((76776996159676100791107935606827817816229941963152 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 609 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0609 : Poly :=
[
  term ((153553992319352201582215871213655635632459883926304 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-76776996159676100791107935606827817816229941963152 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0609_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0609
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0610 : Poly :=
[
  term ((-1517102797393782449 : Rat) / 2987441146063613302) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0610 : Poly :=
[
  term ((-1517102797393782449 : Rat) / 1493720573031806651) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1517102797393782449 : Rat) / 2987441146063613302) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0610_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0610
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0611 : Poly :=
[
  term ((776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (10, 2), (11, 1)]
]

/-- Partial product 611 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0611 : Poly :=
[
  term ((-776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (10, 2), (11, 1)],
  term ((1553946391650306570753754468762634312755055436312512550828674416 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0611_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0611
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0612 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 612 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0612 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0612_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0612
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0613 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 613 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0613 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0613_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0613
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0614 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0614 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0614_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0614
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0615 : Poly :=
[
  term ((16616486445062582105254268478434456403959134742712415771921816588 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 615 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0615 : Poly :=
[
  term ((-16616486445062582105254268478434456403959134742712415771921816588 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 2), (13, 1)],
  term ((33232972890125164210508536956868912807918269485424831543843633176 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0615_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0615
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0616 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 616 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0616 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0616_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0616
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0617 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 617 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0617 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0617_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0617
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0618 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 618 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0618 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0618_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0618
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0619 : Poly :=
[
  term ((50706415452564220126091433463590448014284715523754089550871811694 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 619 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0619 : Poly :=
[
  term ((101412830905128440252182866927180896028569431047508179101743623388 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-50706415452564220126091433463590448014284715523754089550871811694 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0619_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0619
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0620 : Poly :=
[
  term ((-720119821182908442064 : Rat) / 867851652931479664231) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0620 : Poly :=
[
  term ((-1440239642365816884128 : Rat) / 867851652931479664231) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((720119821182908442064 : Rat) / 867851652931479664231) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0620_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0620
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0621 : Poly :=
[
  term ((12696123411757092088055023388739123539834984001092182650569826378958093392516343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(1, 1), (11, 1)]
]

/-- Partial product 621 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0621 : Poly :=
[
  term ((-12696123411757092088055023388739123539834984001092182650569826378958093392516343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(1, 1), (11, 1)],
  term ((12696123411757092088055023388739123539834984001092182650569826378958093392516343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0621_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0621
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0622 : Poly :=
[
  term ((-938875609755017860807743288700485444287509708985456355683819529709676857099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 622 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0622 : Poly :=
[
  term ((938875609755017860807743288700485444287509708985456355683819529709676857099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (11, 1), (12, 1)],
  term ((-938875609755017860807743288700485444287509708985456355683819529709676857099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0622_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0622
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0623 : Poly :=
[
  term ((-102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 623 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0623 : Poly :=
[
  term ((-205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0623_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0623
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0624 : Poly :=
[
  term ((41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0624 : Poly :=
[
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0624_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0624
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0625 : Poly :=
[
  term ((11577015753036778004590353625719072322324347437588 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 625 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0625 : Poly :=
[
  term ((-11577015753036778004590353625719072322324347437588 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0625_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0625
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0626 : Poly :=
[
  term ((-33974409432824418241026484 : Rat) / 3788172465045908734368315) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 626 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0626 : Poly :=
[
  term ((-67948818865648836482052968 : Rat) / 3788172465045908734368315) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((33974409432824418241026484 : Rat) / 3788172465045908734368315) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0626_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0626
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0627 : Poly :=
[
  term ((-235374182321813739964981218903926543684661524374838 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 627 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0627 : Poly :=
[
  term ((235374182321813739964981218903926543684661524374838 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 2)],
  term ((-470748364643627479929962437807853087369323048749676 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0627_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0627
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0628 : Poly :=
[
  term ((-117221581116944706891 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 628 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0628 : Poly :=
[
  term ((-234443162233889413782 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((117221581116944706891 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0628_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0628
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0629 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 629 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0629 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0629_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0629
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0630 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0630 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0630_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0630
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0631 : Poly :=
[
  term ((100327059550915825316127808636952637225007161663115 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 631 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0631 : Poly :=
[
  term ((200654119101831650632255617273905274450014323326230 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-100327059550915825316127808636952637225007161663115 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0631_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0631
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0632 : Poly :=
[
  term ((-151047383758368610846 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0632 : Poly :=
[
  term ((-302094767516737221692 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((151047383758368610846 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0632_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0632
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0633 : Poly :=
[
  term ((51269849077492895006044794048672249415023712616584 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 633 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0633 : Poly :=
[
  term ((-51269849077492895006044794048672249415023712616584 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2)],
  term ((102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0633_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0633
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0634 : Poly :=
[
  term ((102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 634 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0634 : Poly :=
[
  term ((-102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0634_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0634
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0635 : Poly :=
[
  term ((-41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 635 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0635 : Poly :=
[
  term ((41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0635_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0635
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0636 : Poly :=
[
  term ((-20763130293547599651 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 636 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0636 : Poly :=
[
  term ((-41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((20763130293547599651 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0636_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0636
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0637 : Poly :=
[
  term ((12780720223603944587298577849632077672309003492059374815713655960459492042496343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 637 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0637 : Poly :=
[
  term ((-12780720223603944587298577849632077672309003492059374815713655960459492042496343 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 1), (11, 1), (14, 1)],
  term ((12780720223603944587298577849632077672309003492059374815713655960459492042496343 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(1, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0637_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0637
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0638 : Poly :=
[
  term ((505106897149551187458356671213 : Rat) / 39889456056933418972898356950) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 638 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0638 : Poly :=
[
  term ((-505106897149551187458356671213 : Rat) / 39889456056933418972898356950) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((505106897149551187458356671213 : Rat) / 19944728028466709486449178475) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0638_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0638
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0639 : Poly :=
[
  term ((542493211787739276972552444913 : Rat) / 79778912113866837945796713900) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 639 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0639 : Poly :=
[
  term ((542493211787739276972552444913 : Rat) / 39889456056933418972898356950) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-542493211787739276972552444913 : Rat) / 79778912113866837945796713900) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0639_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0639
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0640 : Poly :=
[
  term ((-16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 640 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0640 : Poly :=
[
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0640_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0640
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0641 : Poly :=
[
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 641 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0641 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0641_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0641
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0642 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 642 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0642 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0642_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0642
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0643 : Poly :=
[
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 643 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0643 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0643_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0643
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0644 : Poly :=
[
  term ((-3935767114789585734010821180679109196124038416092 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 644 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0644 : Poly :=
[
  term ((3935767114789585734010821180679109196124038416092 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1)],
  term ((-7871534229579171468021642361358218392248076832184 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0644_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0644
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0645 : Poly :=
[
  term ((-61225409472650918124660134212521588783474079231804 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 645 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0645 : Poly :=
[
  term ((61225409472650918124660134212521588783474079231804 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-122450818945301836249320268425043177566948158463608 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0645_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0645
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0646 : Poly :=
[
  term ((93407712193453720115 : Rat) / 78302404775772601284) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 646 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0646 : Poly :=
[
  term ((-93407712193453720115 : Rat) / 78302404775772601284) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((93407712193453720115 : Rat) / 39151202387886300642) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0646_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0646
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0647 : Poly :=
[
  term ((-76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 647 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0647 : Poly :=
[
  term ((-152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0647_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0647
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0648 : Poly :=
[
  term ((-13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 648 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0648 : Poly :=
[
  term ((-13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0648_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0648
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0649 : Poly :=
[
  term ((503474221301147298935 : Rat) / 495915230246559808132) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 649 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0649 : Poly :=
[
  term ((503474221301147298935 : Rat) / 247957615123279904066) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-503474221301147298935 : Rat) / 495915230246559808132) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0649_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0649
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0650 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 650 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0650 : Poly :=
[
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0650_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0650
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0651 : Poly :=
[
  term ((-331143148875896548261733338681696400717638744154327 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 651 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0651 : Poly :=
[
  term ((-662286297751793096523466677363392801435277488308654 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((331143148875896548261733338681696400717638744154327 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0651_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0651
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0652 : Poly :=
[
  term ((-722606218405968585541 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0652 : Poly :=
[
  term ((-1445212436811937171082 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((722606218405968585541 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0652_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0652
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0653 : Poly :=
[
  term ((300187060797733890748289847054946496129207023950128 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 653 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0653 : Poly :=
[
  term ((-300187060797733890748289847054946496129207023950128 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 2), (13, 1)],
  term ((600374121595467781496579694109892992258414047900256 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0653_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0653
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0654 : Poly :=
[
  term ((11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 654 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0654 : Poly :=
[
  term ((-11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0654_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0654
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0655 : Poly :=
[
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 655 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0655 : Poly :=
[
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0655_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0655
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0656 : Poly :=
[
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 656 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0656 : Poly :=
[
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0656_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0656
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0657 : Poly :=
[
  term ((176134123057519342178709358959372027245197881488632 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 657 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0657 : Poly :=
[
  term ((352268246115038684357418717918744054490395762977264 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-176134123057519342178709358959372027245197881488632 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0657_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0657
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0658 : Poly :=
[
  term ((-453591692373866522615 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0658 : Poly :=
[
  term ((-907183384747733045230 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((453591692373866522615 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0658_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0658
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0659 : Poly :=
[
  term ((-11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 3), (15, 1)]
]

/-- Partial product 659 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0659 : Poly :=
[
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 3), (14, 1), (15, 1)],
  term ((11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0659_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0659
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0660 : Poly :=
[
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0660 : Poly :=
[
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0660_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0660
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0661 : Poly :=
[
  term ((-209880423688254791498791145810650590657796697134234161939524433107280843161735809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(1, 1), (13, 1)]
]

/-- Partial product 661 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0661 : Poly :=
[
  term ((209880423688254791498791145810650590657796697134234161939524433107280843161735809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(1, 1), (13, 1)],
  term ((-209880423688254791498791145810650590657796697134234161939524433107280843161735809 : Rat) / 76889591550026824393240133792640648623886785490745532553174012447947775540000) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0661_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0661
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0662 : Poly :=
[
  term ((256985568034386684876939789833368517141929717895706890433226836272630751107260669 : Rat) / 230668774650080473179720401377921945871660356472236597659522037343843326620000) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 662 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0662 : Poly :=
[
  term ((-256985568034386684876939789833368517141929717895706890433226836272630751107260669 : Rat) / 230668774650080473179720401377921945871660356472236597659522037343843326620000) [(1, 1), (13, 1), (14, 1)],
  term ((256985568034386684876939789833368517141929717895706890433226836272630751107260669 : Rat) / 115334387325040236589860200688960972935830178236118298829761018671921663310000) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0662_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0662
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0663 : Poly :=
[
  term ((800988999223416915538045816961 : Rat) / 39889456056933418972898356950) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 663 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0663 : Poly :=
[
  term ((-800988999223416915538045816961 : Rat) / 39889456056933418972898356950) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((800988999223416915538045816961 : Rat) / 19944728028466709486449178475) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0663_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0663
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0664 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 664 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0664 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0664_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0664
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0665 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 665 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0665 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0665_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0665
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0666 : Poly :=
[
  term ((-158167895372054571775577449499 : Rat) / 6648242676155569828816392825) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 666 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0666 : Poly :=
[
  term ((-316335790744109143551154898998 : Rat) / 6648242676155569828816392825) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((158167895372054571775577449499 : Rat) / 6648242676155569828816392825) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0666_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0666
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0667 : Poly :=
[
  term ((76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 667 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0667 : Poly :=
[
  term ((-76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0667_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0667
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0668 : Poly :=
[
  term ((13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0668 : Poly :=
[
  term ((-13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0668_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0668
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0669 : Poly :=
[
  term ((38029000642683071200232281759993364450871354758017 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 669 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0669 : Poly :=
[
  term ((76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-38029000642683071200232281759993364450871354758017 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0669_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0669
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0670 : Poly :=
[
  term ((13206745939948469425 : Rat) / 495915230246559808132) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0670 : Poly :=
[
  term ((13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13206745939948469425 : Rat) / 495915230246559808132) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0670_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0670
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0671 : Poly :=
[
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3)]
]

/-- Partial product 671 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0671 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0671_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0671
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0672 : Poly :=
[
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3), (14, 1)]
]

/-- Partial product 672 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0672 : Poly :=
[
  term ((-45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3), (14, 1)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0672_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0672
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0673 : Poly :=
[
  term ((43055482375987747739536813785296377764354448420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (15, 1)]
]

/-- Partial product 673 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0673 : Poly :=
[
  term ((86110964751975495479073627570592755528708896840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (14, 1), (15, 1)],
  term ((-43055482375987747739536813785296377764354448420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0673_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0673
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0674 : Poly :=
[
  term ((1078458543375555964567 : Rat) / 743872845369839712198) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0674 : Poly :=
[
  term ((1078458543375555964567 : Rat) / 371936422684919856099) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1078458543375555964567 : Rat) / 743872845369839712198) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0674_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0674
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0675 : Poly :=
[
  term ((222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(1, 2)]
]

/-- Partial product 675 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0675 : Poly :=
[
  term ((-222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(1, 2)],
  term ((222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 467325152820675855761383529224026734276234973542992790446641671098637952000) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0675_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0675
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0676 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1)]
]

/-- Partial product 676 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0676 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0676_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0676
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0677 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 677 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0677 : Poly :=
[
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0677_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0677
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0678 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2)]
]

/-- Partial product 678 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0678 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0678_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0678
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0679 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (16, 1)]
]

/-- Partial product 679 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0679 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (14, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0679_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0679
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0680 : Poly :=
[
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 947921202476015934607268821955429481290537471689640548573309677684864000) [(1, 2), (14, 1)]
]

/-- Partial product 680 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0680 : Poly :=
[
  term ((-338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 947921202476015934607268821955429481290537471689640548573309677684864000) [(1, 2), (14, 1)],
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 473960601238007967303634410977714740645268735844820274286654838842432000) [(1, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0680_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0680
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0681 : Poly :=
[
  term ((24477888681118632329 : Rat) / 3561011951638910965) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0681 : Poly :=
[
  term ((-24477888681118632329 : Rat) / 3561011951638910965) [(1, 2), (14, 1), (16, 1)],
  term ((48955777362237264658 : Rat) / 3561011951638910965) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0681_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0681
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0682 : Poly :=
[
  term ((20066491802407213389 : Rat) / 7122023903277821930) [(1, 2), (16, 1)]
]

/-- Partial product 682 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0682 : Poly :=
[
  term ((20066491802407213389 : Rat) / 3561011951638910965) [(1, 2), (14, 1), (16, 1)],
  term ((-20066491802407213389 : Rat) / 7122023903277821930) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0682_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0682
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0683 : Poly :=
[
  term ((-145442453260646277599359979251080596737139484105394368212734944021448227553399709 : Rat) / 49746285655360107421456663029235172367037584122454089693258835845928480768000) [(2, 1)]
]

/-- Partial product 683 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0683 : Poly :=
[
  term ((145442453260646277599359979251080596737139484105394368212734944021448227553399709 : Rat) / 49746285655360107421456663029235172367037584122454089693258835845928480768000) [(2, 1)],
  term ((-145442453260646277599359979251080596737139484105394368212734944021448227553399709 : Rat) / 24873142827680053710728331514617586183518792061227044846629417922964240384000) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0683_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0683
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0684 : Poly :=
[
  term ((39439576508760397022323909028534700129875216135285862400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1)]
]

/-- Partial product 684 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0684 : Poly :=
[
  term ((-39439576508760397022323909028534700129875216135285862400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1)],
  term ((78879153017520794044647818057069400259750432270571724800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0684_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0684
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0685 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1)]
]

/-- Partial product 685 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0685 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0685_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0685
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0686 : Poly :=
[
  term ((-34335624921456056249826830161318096074793805096052326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1)]
]

/-- Partial product 686 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0686 : Poly :=
[
  term ((34335624921456056249826830161318096074793805096052326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-68671249842912112499653660322636192149587610192104652800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0686_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0686
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0687 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 687 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0687 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0687_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0687
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0688 : Poly :=
[
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2)]
]

/-- Partial product 688 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0688 : Poly :=
[
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2)],
  term ((45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0688_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0688
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0689 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)]
]

/-- Partial product 689 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0689 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0689_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0689
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0690 : Poly :=
[
  term ((6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 690 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0690 : Poly :=
[
  term ((-6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((12875859345546021093685061310494286028047676911019622400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0690_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0690
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0691 : Poly :=
[
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 691 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0691 : Poly :=
[
  term ((-6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0691_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0691
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0692 : Poly :=
[
  term ((143716821582666035192379386241299149302734256857486643200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (12, 1)]
]

/-- Partial product 692 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0692 : Poly :=
[
  term ((-143716821582666035192379386241299149302734256857486643200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((287433643165332070384758772482598298605468513714973286400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0692_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0692
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0693 : Poly :=
[
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 693 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0693 : Poly :=
[
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0693_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0693
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0694 : Poly :=
[
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 2)]
]

/-- Partial product 694 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0694 : Poly :=
[
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((-36342199934724380283596278252794865234691377816825856000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0694_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0694
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0695 : Poly :=
[
  term ((-3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 695 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0695 : Poly :=
[
  term ((-6907362044746042565883131848858913858796410009557401600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0695_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0695
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0696 : Poly :=
[
  term ((2546717188625521424725721852446397683173420181854412800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (14, 1)]
]

/-- Partial product 696 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0696 : Poly :=
[
  term ((-2546717188625521424725721852446397683173420181854412800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((5093434377251042849451443704892795366346840363708825600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0696_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0696
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0697 : Poly :=
[
  term ((1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (15, 2)]
]

/-- Partial product 697 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0697 : Poly :=
[
  term ((3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0697_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0697
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0698 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 698 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0698 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0698_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0698
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0699 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (12, 1)]
]

/-- Partial product 699 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0699 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0699_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0699
        rs_R009_ueqv_R009NYNYN_generator_28_0600_0699 =
      rs_R009_ueqv_R009NYNYN_partial_28_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0600_0699 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0600,
  rs_R009_ueqv_R009NYNYN_partial_28_0601,
  rs_R009_ueqv_R009NYNYN_partial_28_0602,
  rs_R009_ueqv_R009NYNYN_partial_28_0603,
  rs_R009_ueqv_R009NYNYN_partial_28_0604,
  rs_R009_ueqv_R009NYNYN_partial_28_0605,
  rs_R009_ueqv_R009NYNYN_partial_28_0606,
  rs_R009_ueqv_R009NYNYN_partial_28_0607,
  rs_R009_ueqv_R009NYNYN_partial_28_0608,
  rs_R009_ueqv_R009NYNYN_partial_28_0609,
  rs_R009_ueqv_R009NYNYN_partial_28_0610,
  rs_R009_ueqv_R009NYNYN_partial_28_0611,
  rs_R009_ueqv_R009NYNYN_partial_28_0612,
  rs_R009_ueqv_R009NYNYN_partial_28_0613,
  rs_R009_ueqv_R009NYNYN_partial_28_0614,
  rs_R009_ueqv_R009NYNYN_partial_28_0615,
  rs_R009_ueqv_R009NYNYN_partial_28_0616,
  rs_R009_ueqv_R009NYNYN_partial_28_0617,
  rs_R009_ueqv_R009NYNYN_partial_28_0618,
  rs_R009_ueqv_R009NYNYN_partial_28_0619,
  rs_R009_ueqv_R009NYNYN_partial_28_0620,
  rs_R009_ueqv_R009NYNYN_partial_28_0621,
  rs_R009_ueqv_R009NYNYN_partial_28_0622,
  rs_R009_ueqv_R009NYNYN_partial_28_0623,
  rs_R009_ueqv_R009NYNYN_partial_28_0624,
  rs_R009_ueqv_R009NYNYN_partial_28_0625,
  rs_R009_ueqv_R009NYNYN_partial_28_0626,
  rs_R009_ueqv_R009NYNYN_partial_28_0627,
  rs_R009_ueqv_R009NYNYN_partial_28_0628,
  rs_R009_ueqv_R009NYNYN_partial_28_0629,
  rs_R009_ueqv_R009NYNYN_partial_28_0630,
  rs_R009_ueqv_R009NYNYN_partial_28_0631,
  rs_R009_ueqv_R009NYNYN_partial_28_0632,
  rs_R009_ueqv_R009NYNYN_partial_28_0633,
  rs_R009_ueqv_R009NYNYN_partial_28_0634,
  rs_R009_ueqv_R009NYNYN_partial_28_0635,
  rs_R009_ueqv_R009NYNYN_partial_28_0636,
  rs_R009_ueqv_R009NYNYN_partial_28_0637,
  rs_R009_ueqv_R009NYNYN_partial_28_0638,
  rs_R009_ueqv_R009NYNYN_partial_28_0639,
  rs_R009_ueqv_R009NYNYN_partial_28_0640,
  rs_R009_ueqv_R009NYNYN_partial_28_0641,
  rs_R009_ueqv_R009NYNYN_partial_28_0642,
  rs_R009_ueqv_R009NYNYN_partial_28_0643,
  rs_R009_ueqv_R009NYNYN_partial_28_0644,
  rs_R009_ueqv_R009NYNYN_partial_28_0645,
  rs_R009_ueqv_R009NYNYN_partial_28_0646,
  rs_R009_ueqv_R009NYNYN_partial_28_0647,
  rs_R009_ueqv_R009NYNYN_partial_28_0648,
  rs_R009_ueqv_R009NYNYN_partial_28_0649,
  rs_R009_ueqv_R009NYNYN_partial_28_0650,
  rs_R009_ueqv_R009NYNYN_partial_28_0651,
  rs_R009_ueqv_R009NYNYN_partial_28_0652,
  rs_R009_ueqv_R009NYNYN_partial_28_0653,
  rs_R009_ueqv_R009NYNYN_partial_28_0654,
  rs_R009_ueqv_R009NYNYN_partial_28_0655,
  rs_R009_ueqv_R009NYNYN_partial_28_0656,
  rs_R009_ueqv_R009NYNYN_partial_28_0657,
  rs_R009_ueqv_R009NYNYN_partial_28_0658,
  rs_R009_ueqv_R009NYNYN_partial_28_0659,
  rs_R009_ueqv_R009NYNYN_partial_28_0660,
  rs_R009_ueqv_R009NYNYN_partial_28_0661,
  rs_R009_ueqv_R009NYNYN_partial_28_0662,
  rs_R009_ueqv_R009NYNYN_partial_28_0663,
  rs_R009_ueqv_R009NYNYN_partial_28_0664,
  rs_R009_ueqv_R009NYNYN_partial_28_0665,
  rs_R009_ueqv_R009NYNYN_partial_28_0666,
  rs_R009_ueqv_R009NYNYN_partial_28_0667,
  rs_R009_ueqv_R009NYNYN_partial_28_0668,
  rs_R009_ueqv_R009NYNYN_partial_28_0669,
  rs_R009_ueqv_R009NYNYN_partial_28_0670,
  rs_R009_ueqv_R009NYNYN_partial_28_0671,
  rs_R009_ueqv_R009NYNYN_partial_28_0672,
  rs_R009_ueqv_R009NYNYN_partial_28_0673,
  rs_R009_ueqv_R009NYNYN_partial_28_0674,
  rs_R009_ueqv_R009NYNYN_partial_28_0675,
  rs_R009_ueqv_R009NYNYN_partial_28_0676,
  rs_R009_ueqv_R009NYNYN_partial_28_0677,
  rs_R009_ueqv_R009NYNYN_partial_28_0678,
  rs_R009_ueqv_R009NYNYN_partial_28_0679,
  rs_R009_ueqv_R009NYNYN_partial_28_0680,
  rs_R009_ueqv_R009NYNYN_partial_28_0681,
  rs_R009_ueqv_R009NYNYN_partial_28_0682,
  rs_R009_ueqv_R009NYNYN_partial_28_0683,
  rs_R009_ueqv_R009NYNYN_partial_28_0684,
  rs_R009_ueqv_R009NYNYN_partial_28_0685,
  rs_R009_ueqv_R009NYNYN_partial_28_0686,
  rs_R009_ueqv_R009NYNYN_partial_28_0687,
  rs_R009_ueqv_R009NYNYN_partial_28_0688,
  rs_R009_ueqv_R009NYNYN_partial_28_0689,
  rs_R009_ueqv_R009NYNYN_partial_28_0690,
  rs_R009_ueqv_R009NYNYN_partial_28_0691,
  rs_R009_ueqv_R009NYNYN_partial_28_0692,
  rs_R009_ueqv_R009NYNYN_partial_28_0693,
  rs_R009_ueqv_R009NYNYN_partial_28_0694,
  rs_R009_ueqv_R009NYNYN_partial_28_0695,
  rs_R009_ueqv_R009NYNYN_partial_28_0696,
  rs_R009_ueqv_R009NYNYN_partial_28_0697,
  rs_R009_ueqv_R009NYNYN_partial_28_0698,
  rs_R009_ueqv_R009NYNYN_partial_28_0699
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0600_0699 : Poly :=
[
  term ((-198994760285029814120 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((99497380142514907060 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-910820827860368451459574259412504610478142093474516122674652150700333115099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (10, 1), (13, 1)],
  term ((911782524601321678800065591834885182072793819790746151414399130380306517099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((79234680170258117047482998 : Rat) / 3788172465045908734368315) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9990164980140797753833629903500517493928664297896 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((-133533388516634265044 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38597311913597618531636644 : Rat) / 3788172465045908734368315) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((153553992319352201582215871213655635632459883926304 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1517102797393782449 : Rat) / 1493720573031806651) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76776996159676100791107935606827817816229941963152 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (10, 1), (15, 1)],
  term ((1517102797393782449 : Rat) / 2987441146063613302) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-776973195825153285376877234381317156377527718156256275414337208 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (10, 2), (11, 1)],
  term ((1553946391650306570753754468762634312755055436312512550828674416 : Rat) / 10644643356949783177100111177510746083176326745968813617033375) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16616486445062582105254268478434456403959134742712415771921816588 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 1), (10, 2), (13, 1)],
  term ((4728069258190028924122715095769376513290470827477384298877052968 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((1790698463491145018032 : Rat) / 685146041788010261235) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (13, 1), (14, 2)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((101412830905128440252182866927180896028569431047508179101743623388 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1440239642365816884128 : Rat) / 867851652931479664231) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50706415452564220126091433463590448014284715523754089550871811694 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 1), (10, 2), (15, 1)],
  term ((720119821182908442064 : Rat) / 867851652931479664231) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-12696123411757092088055023388739123539834984001092182650569826378958093392516343 : Rat) / 32952682092868639025674343053988849410237193781748085379931719620549046660000) [(1, 1), (11, 1)],
  term ((938875609755017860807743288700485444287509708985456355683819529709676857099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(1, 1), (11, 1), (12, 1)],
  term ((-205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((102539698154985790012089588097344498830047425233168 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-41526260587095199302 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-945562333152554422714490759706870304160282783698950576811967431157975143099 : Rat) / 782352376373899312100530461870580470328518370886706680435226011883880500) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-67948818865648836482052968 : Rat) / 3788172465045908734368315) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((23154031506073556009180707251438144644648694875176 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((33974409432824418241026484 : Rat) / 3788172465045908734368315) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((235374182321813739964981218903926543684661524374838 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 2)],
  term ((-470748364643627479929962437807853087369323048749676 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-234443162233889413782 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((117221581116944706891 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-100327059550915825316127808636952637225007161663115 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((151047383758368610846 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51269849077492895006044794048672249415023712616584 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2)],
  term ((205079396309971580024179176194688997660094850466336 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-83052521174190398604 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((20763130293547599651 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-62592371236014660559522954806205713656149116037226 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (11, 1), (14, 1)],
  term ((116198894799448846278 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((12780720223603944587298577849632077672309003492059374815713655960459492042496343 : Rat) / 8238170523217159756418585763497212352559298445437021344982929905137261665000) [(1, 1), (11, 1), (14, 2)],
  term ((505106897149551187458356671213 : Rat) / 19944728028466709486449178475) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-542493211787739276972552444913 : Rat) / 79778912113866837945796713900) [(1, 1), (11, 1), (16, 1)],
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((3935767114789585734010821180679109196124038416092 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1)],
  term ((7621982177581678093805498835880481484460857485660 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1246098796131263111425 : Rat) / 1487745690739679424396) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-122450818945301836249320268425043177566948158463608 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((93407712193453720115 : Rat) / 39151202387886300642) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((76058001285366142400464563519986728901742709516034 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((13206745939948469425 : Rat) / 247957615123279904066) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-503474221301147298935 : Rat) / 495915230246559808132) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((45639778637860165710574340000145583786376775717376 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-662286297751793096523466677363392801435277488308654 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1445212436811937171082 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((331143148875896548261733338681696400717638744154327 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 1), (15, 1)],
  term ((722606218405968585541 : Rat) / 371936422684919856099) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-300187060797733890748289847054946496129207023950128 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 2), (13, 1)],
  term ((280219657643670068249913573304882803222667184573776 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((352268246115038684357418717918744054490395762977264 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-907183384747733045230 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-176134123057519342178709358959372027245197881488632 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (12, 2), (15, 1)],
  term ((453591692373866522615 : Rat) / 371936422684919856099) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23715145477910941721975268207778532521166434320480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 3), (14, 1), (15, 1)],
  term ((287614977869790440788 : Rat) / 371936422684919856099) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((11857572738955470860987634103889266260583217160240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (12, 3), (15, 1)],
  term ((-143807488934895220394 : Rat) / 371936422684919856099) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((209880423688254791498791145810650590657796697134234161939524433107280843161735809 : Rat) / 153779183100053648786480267585281297247773570981491065106348024895895551080000) [(1, 1), (13, 1)],
  term ((-27707088721848470605416038352041259034853744040575293007868754237327290018514628 : Rat) / 7208399207815014786866262543060060808489386139757393676860063666995103956875) [(1, 1), (13, 1), (14, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-385571963384010253834996458707 : Rat) / 5698493722419059853271193850) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((256985568034386684876939789833368517141929717895706890433226836272630751107260669 : Rat) / 115334387325040236589860200688960972935830178236118298829761018671921663310000) [(1, 1), (13, 1), (14, 2)],
  term ((800988999223416915538045816961 : Rat) / 19944728028466709486449178475) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (13, 1), (15, 2)],
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((158167895372054571775577449499 : Rat) / 6648242676155569828816392825) [(1, 1), (13, 1), (16, 1)],
  term ((152116002570732284800929127039973457803485419032068 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((13206745939948469425 : Rat) / 123978807561639952033) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-38029000642683071200232281759993364450871354758017 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (13, 2), (15, 1)],
  term ((-13206745939948469425 : Rat) / 495915230246559808132) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3)],
  term ((91279557275720331421148680000291167572753551434752 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 1), (13, 3), (14, 2)],
  term ((86110964751975495479073627570592755528708896840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (14, 1), (15, 1)],
  term ((1078458543375555964567 : Rat) / 371936422684919856099) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43055482375987747739536813785296377764354448420 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (15, 1)],
  term ((-1078458543375555964567 : Rat) / 743872845369839712198) [(1, 1), (15, 1), (16, 1)],
  term ((-222029721224023876032391610485308360431042250867061377500121353422839803449853 : Rat) / 934650305641351711522767058448053468552469947085985580893283342197275904000) [(1, 2)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 2), (14, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (14, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 2), (10, 2), (16, 1)],
  term ((131441795599175998766920933966543377561033142710737558202844032258693405551 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(1, 2), (14, 1)],
  term ((-882279375742283788 : Rat) / 712202390327782193) [(1, 2), (14, 1), (16, 1)],
  term ((338385734426713907809908353386126048388252192552843008225003772564277024581 : Rat) / 473960601238007967303634410977714740645268735844820274286654838842432000) [(1, 2), (14, 2)],
  term ((48955777362237264658 : Rat) / 3561011951638910965) [(1, 2), (14, 2), (16, 1)],
  term ((-20066491802407213389 : Rat) / 7122023903277821930) [(1, 2), (16, 1)],
  term ((145442453260646277599359979251080596737139484105394368212734944021448227553399709 : Rat) / 49746285655360107421456663029235172367037584122454089693258835845928480768000) [(2, 1)],
  term ((-39439576508760397022323909028534700129875216135285862400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((34335624921456056249826830161318096074793805096052326400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1)],
  term ((-57226041535760093749711383602196826791323008493420544000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 2)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2)],
  term ((45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1)],
  term ((-8583906230364014062456707540329524018698451274013081600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 2)],
  term ((-6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((12875859345546021093685061310494286028047676911019622400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6437929672773010546842530655247143014023838455509811200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-143716821582666035192379386241299149302734256857486643200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((223834793279564404888465285540207284444758602535528038400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 2)],
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((-36342199934724380283596278252794865234691377816825856000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-6907362044746042565883131848858913858796410009557401600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((71239001451644229770470652499730207210230171725008486400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((3453681022373021282941565924429456929398205004778700800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((5093434377251042849451443704892795366346840363708825600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (3, 1), (5, 1), (14, 2)],
  term ((-1726840511186510641470782962214728464699102502389350400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-145442453260646277599359979251080596737139484105394368212734944021448227553399709 : Rat) / 24873142827680053710728331514617586183518792061227044846629417922964240384000) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 600 through 699. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0600_0699_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0600_0699
      rs_R009_ueqv_R009NYNYN_block_28_0600_0699 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
