/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0600 : Poly :=
[
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 600 for generator 18. -/
def ep_Q2_041_partial_18_0600 : Poly :=
[
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 18. -/
theorem ep_Q2_041_partial_18_0600_valid :
    mulPoly ep_Q2_041_coefficient_18_0600
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0601 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 601 for generator 18. -/
def ep_Q2_041_partial_18_0601 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 18. -/
theorem ep_Q2_041_partial_18_0601_valid :
    mulPoly ep_Q2_041_coefficient_18_0601
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0602 : Poly :=
[
  term ((1934237970 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 602 for generator 18. -/
def ep_Q2_041_partial_18_0602 : Poly :=
[
  term ((-1934237970 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((3868475940 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 18. -/
theorem ep_Q2_041_partial_18_0602_valid :
    mulPoly ep_Q2_041_coefficient_18_0602
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0603 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 603 for generator 18. -/
def ep_Q2_041_partial_18_0603 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 18. -/
theorem ep_Q2_041_partial_18_0603_valid :
    mulPoly ep_Q2_041_coefficient_18_0603
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0604 : Poly :=
[
  term ((26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 604 for generator 18. -/
def ep_Q2_041_partial_18_0604 : Poly :=
[
  term ((52554450453876556887761871140891853034237176489453982938257520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 18. -/
theorem ep_Q2_041_partial_18_0604_valid :
    mulPoly ep_Q2_041_coefficient_18_0604
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0605 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 605 for generator 18. -/
def ep_Q2_041_partial_18_0605 : Poly :=
[
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 18. -/
theorem ep_Q2_041_partial_18_0605_valid :
    mulPoly ep_Q2_041_coefficient_18_0605
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0606 : Poly :=
[
  term ((394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 606 for generator 18. -/
def ep_Q2_041_partial_18_0606 : Poly :=
[
  term ((789999482365950699317285696710472791816957613799937750786830960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 18. -/
theorem ep_Q2_041_partial_18_0606_valid :
    mulPoly ep_Q2_041_coefficient_18_0606
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0607 : Poly :=
[
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 607 for generator 18. -/
def ep_Q2_041_partial_18_0607 : Poly :=
[
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 18. -/
theorem ep_Q2_041_partial_18_0607_valid :
    mulPoly ep_Q2_041_coefficient_18_0607
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0608 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 18. -/
def ep_Q2_041_partial_18_0608 : Poly :=
[
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 18. -/
theorem ep_Q2_041_partial_18_0608_valid :
    mulPoly ep_Q2_041_coefficient_18_0608
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0609 : Poly :=
[
  term ((-1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 609 for generator 18. -/
def ep_Q2_041_partial_18_0609 : Poly :=
[
  term ((-2093843430221202573249316767439689764126069204284181828042011889618740458 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 18. -/
theorem ep_Q2_041_partial_18_0609_valid :
    mulPoly ep_Q2_041_coefficient_18_0609
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0610 : Poly :=
[
  term ((-12414691965060 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 18. -/
def ep_Q2_041_partial_18_0610 : Poly :=
[
  term ((-24829383930120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 18. -/
theorem ep_Q2_041_partial_18_0610_valid :
    mulPoly ep_Q2_041_coefficient_18_0610
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0611 : Poly :=
[
  term ((47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

/-- Partial product 611 for generator 18. -/
def ep_Q2_041_partial_18_0611 : Poly :=
[
  term ((95376880672991320908 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1)],
  term ((-47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 18. -/
theorem ep_Q2_041_partial_18_0611_valid :
    mulPoly ep_Q2_041_coefficient_18_0611
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0612 : Poly :=
[
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 612 for generator 18. -/
def ep_Q2_041_partial_18_0612 : Poly :=
[
  term ((-3219639366976911549039395954935662511998433319388286106079840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 18. -/
theorem ep_Q2_041_partial_18_0612_valid :
    mulPoly ep_Q2_041_coefficient_18_0612
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0613 : Poly :=
[
  term ((-287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 613 for generator 18. -/
def ep_Q2_041_partial_18_0613 : Poly :=
[
  term ((-574380516838204532094337659259597462731288828085441454055180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 18. -/
theorem ep_Q2_041_partial_18_0613_valid :
    mulPoly ep_Q2_041_coefficient_18_0613
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0614 : Poly :=
[
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 614 for generator 18. -/
def ep_Q2_041_partial_18_0614 : Poly :=
[
  term ((2009870599815060013758066178841924550068360861596036244429280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 18. -/
theorem ep_Q2_041_partial_18_0614_valid :
    mulPoly ep_Q2_041_coefficient_18_0614
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0615 : Poly :=
[
  term ((-176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 615 for generator 18. -/
def ep_Q2_041_partial_18_0615 : Poly :=
[
  term ((-352482600559478045835153002033211196108045435903824887967300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 18. -/
theorem ep_Q2_041_partial_18_0615_valid :
    mulPoly ep_Q2_041_coefficient_18_0615
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0616 : Poly :=
[
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)]
]

/-- Partial product 616 for generator 18. -/
def ep_Q2_041_partial_18_0616 : Poly :=
[
  term ((-510573750845447572800 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 18. -/
theorem ep_Q2_041_partial_18_0616_valid :
    mulPoly ep_Q2_041_coefficient_18_0616
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0617 : Poly :=
[
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 617 for generator 18. -/
def ep_Q2_041_partial_18_0617 : Poly :=
[
  term ((-59858838048 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 18. -/
theorem ep_Q2_041_partial_18_0617_valid :
    mulPoly ep_Q2_041_coefficient_18_0617
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0618 : Poly :=
[
  term ((7355056194 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 618 for generator 18. -/
def ep_Q2_041_partial_18_0618 : Poly :=
[
  term ((14710112388 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-7355056194 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 18. -/
theorem ep_Q2_041_partial_18_0618_valid :
    mulPoly ep_Q2_041_coefficient_18_0618
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0619 : Poly :=
[
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 2)]
]

/-- Partial product 619 for generator 18. -/
def ep_Q2_041_partial_18_0619 : Poly :=
[
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 18. -/
theorem ep_Q2_041_partial_18_0619_valid :
    mulPoly ep_Q2_041_coefficient_18_0619
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0620 : Poly :=
[
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 620 for generator 18. -/
def ep_Q2_041_partial_18_0620 : Poly :=
[
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 18. -/
theorem ep_Q2_041_partial_18_0620_valid :
    mulPoly ep_Q2_041_coefficient_18_0620
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0621 : Poly :=
[
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 621 for generator 18. -/
def ep_Q2_041_partial_18_0621 : Poly :=
[
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 18. -/
theorem ep_Q2_041_partial_18_0621_valid :
    mulPoly ep_Q2_041_coefficient_18_0621
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0622 : Poly :=
[
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)]
]

/-- Partial product 622 for generator 18. -/
def ep_Q2_041_partial_18_0622 : Poly :=
[
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 18. -/
theorem ep_Q2_041_partial_18_0622_valid :
    mulPoly ep_Q2_041_coefficient_18_0622
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0623 : Poly :=
[
  term ((-698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 623 for generator 18. -/
def ep_Q2_041_partial_18_0623 : Poly :=
[
  term ((-1397044601831294023458502317031741999106574861298310373047418720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 18. -/
theorem ep_Q2_041_partial_18_0623_valid :
    mulPoly ep_Q2_041_coefficient_18_0623
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0624 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 624 for generator 18. -/
def ep_Q2_041_partial_18_0624 : Poly :=
[
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 18. -/
theorem ep_Q2_041_partial_18_0624_valid :
    mulPoly ep_Q2_041_coefficient_18_0624
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0625 : Poly :=
[
  term ((579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 625 for generator 18. -/
def ep_Q2_041_partial_18_0625 : Poly :=
[
  term ((1159873965184714317381039908324214327047775485970491002207392000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 18. -/
theorem ep_Q2_041_partial_18_0625_valid :
    mulPoly ep_Q2_041_coefficient_18_0625
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0626 : Poly :=
[
  term ((1995378661808575109317482738980194451457880286288353460002724739874040268 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 626 for generator 18. -/
def ep_Q2_041_partial_18_0626 : Poly :=
[
  term ((3990757323617150218634965477960388902915760572576706920005449479748080536 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1995378661808575109317482738980194451457880286288353460002724739874040268 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 18. -/
theorem ep_Q2_041_partial_18_0626_valid :
    mulPoly ep_Q2_041_coefficient_18_0626
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0627 : Poly :=
[
  term ((8672370383880 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 18. -/
def ep_Q2_041_partial_18_0627 : Poly :=
[
  term ((17344740767760 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8672370383880 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 18. -/
theorem ep_Q2_041_partial_18_0627_valid :
    mulPoly ep_Q2_041_coefficient_18_0627
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0628 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 3)]
]

/-- Partial product 628 for generator 18. -/
def ep_Q2_041_partial_18_0628 : Poly :=
[
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 18. -/
theorem ep_Q2_041_partial_18_0628_valid :
    mulPoly ep_Q2_041_coefficient_18_0628
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0629 : Poly :=
[
  term ((237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 2), (15, 2)]
]

/-- Partial product 629 for generator 18. -/
def ep_Q2_041_partial_18_0629 : Poly :=
[
  term ((474828081684604044914996211880323457455413390006337535227180960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((-237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 18. -/
theorem ep_Q2_041_partial_18_0629_valid :
    mulPoly ep_Q2_041_coefficient_18_0629
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0630 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 630 for generator 18. -/
def ep_Q2_041_partial_18_0630 : Poly :=
[
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 18. -/
theorem ep_Q2_041_partial_18_0630_valid :
    mulPoly ep_Q2_041_coefficient_18_0630
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0631 : Poly :=
[
  term ((182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 631 for generator 18. -/
def ep_Q2_041_partial_18_0631 : Poly :=
[
  term ((365908725801214750352138152778407169054680732603130257052486400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 18. -/
theorem ep_Q2_041_partial_18_0631_valid :
    mulPoly ep_Q2_041_coefficient_18_0631
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0632 : Poly :=
[
  term ((125616912488441250859879136177620284379272553849752265276830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 632 for generator 18. -/
def ep_Q2_041_partial_18_0632 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-125616912488441250859879136177620284379272553849752265276830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 18. -/
theorem ep_Q2_041_partial_18_0632_valid :
    mulPoly ep_Q2_041_coefficient_18_0632
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0633 : Poly :=
[
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 3)]
]

/-- Partial product 633 for generator 18. -/
def ep_Q2_041_partial_18_0633 : Poly :=
[
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 18. -/
theorem ep_Q2_041_partial_18_0633_valid :
    mulPoly ep_Q2_041_coefficient_18_0633
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0634 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 634 for generator 18. -/
def ep_Q2_041_partial_18_0634 : Poly :=
[
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 18. -/
theorem ep_Q2_041_partial_18_0634_valid :
    mulPoly ep_Q2_041_coefficient_18_0634
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0635 : Poly :=
[
  term ((-85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 635 for generator 18. -/
def ep_Q2_041_partial_18_0635 : Poly :=
[
  term ((-171901297033952989265781667873736133013950739891770312541595889719482800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 18. -/
theorem ep_Q2_041_partial_18_0635_valid :
    mulPoly ep_Q2_041_coefficient_18_0635
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0636 : Poly :=
[
  term ((-32314027092480 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 636 for generator 18. -/
def ep_Q2_041_partial_18_0636 : Poly :=
[
  term ((-64628054184960 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 18. -/
theorem ep_Q2_041_partial_18_0636_valid :
    mulPoly ep_Q2_041_coefficient_18_0636
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0637 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 637 for generator 18. -/
def ep_Q2_041_partial_18_0637 : Poly :=
[
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 18. -/
theorem ep_Q2_041_partial_18_0637_valid :
    mulPoly ep_Q2_041_coefficient_18_0637
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0638 : Poly :=
[
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 638 for generator 18. -/
def ep_Q2_041_partial_18_0638 : Poly :=
[
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 18. -/
theorem ep_Q2_041_partial_18_0638_valid :
    mulPoly ep_Q2_041_coefficient_18_0638
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0639 : Poly :=
[
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 18. -/
def ep_Q2_041_partial_18_0639 : Poly :=
[
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 18. -/
theorem ep_Q2_041_partial_18_0639_valid :
    mulPoly ep_Q2_041_coefficient_18_0639
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0640 : Poly :=
[
  term ((-3741177378 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 640 for generator 18. -/
def ep_Q2_041_partial_18_0640 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((3741177378 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 18. -/
theorem ep_Q2_041_partial_18_0640_valid :
    mulPoly ep_Q2_041_coefficient_18_0640
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0641 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 641 for generator 18. -/
def ep_Q2_041_partial_18_0641 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 18. -/
theorem ep_Q2_041_partial_18_0641_valid :
    mulPoly ep_Q2_041_coefficient_18_0641
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0642 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 642 for generator 18. -/
def ep_Q2_041_partial_18_0642 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 18. -/
theorem ep_Q2_041_partial_18_0642_valid :
    mulPoly ep_Q2_041_coefficient_18_0642
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0643 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 643 for generator 18. -/
def ep_Q2_041_partial_18_0643 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 18. -/
theorem ep_Q2_041_partial_18_0643_valid :
    mulPoly ep_Q2_041_coefficient_18_0643
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0644 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 644 for generator 18. -/
def ep_Q2_041_partial_18_0644 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 18. -/
theorem ep_Q2_041_partial_18_0644_valid :
    mulPoly ep_Q2_041_coefficient_18_0644
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0645 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 645 for generator 18. -/
def ep_Q2_041_partial_18_0645 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 18. -/
theorem ep_Q2_041_partial_18_0645_valid :
    mulPoly ep_Q2_041_coefficient_18_0645
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0646 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 646 for generator 18. -/
def ep_Q2_041_partial_18_0646 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 18. -/
theorem ep_Q2_041_partial_18_0646_valid :
    mulPoly ep_Q2_041_coefficient_18_0646
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0647 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 647 for generator 18. -/
def ep_Q2_041_partial_18_0647 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 18. -/
theorem ep_Q2_041_partial_18_0647_valid :
    mulPoly ep_Q2_041_coefficient_18_0647
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0648 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 18. -/
def ep_Q2_041_partial_18_0648 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 18. -/
theorem ep_Q2_041_partial_18_0648_valid :
    mulPoly ep_Q2_041_coefficient_18_0648
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0649 : Poly :=
[
  term ((-10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 649 for generator 18. -/
def ep_Q2_041_partial_18_0649 : Poly :=
[
  term ((10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-20670372002450705928 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 18. -/
theorem ep_Q2_041_partial_18_0649_valid :
    mulPoly ep_Q2_041_coefficient_18_0649
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0650 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 650 for generator 18. -/
def ep_Q2_041_partial_18_0650 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 18. -/
theorem ep_Q2_041_partial_18_0650_valid :
    mulPoly ep_Q2_041_coefficient_18_0650
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0651 : Poly :=
[
  term ((7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 651 for generator 18. -/
def ep_Q2_041_partial_18_0651 : Poly :=
[
  term ((-7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((14284290418503519771844146921644756324670931380493730775240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 18. -/
theorem ep_Q2_041_partial_18_0651_valid :
    mulPoly ep_Q2_041_coefficient_18_0651
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0652 : Poly :=
[
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 652 for generator 18. -/
def ep_Q2_041_partial_18_0652 : Poly :=
[
  term ((-121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 18. -/
theorem ep_Q2_041_partial_18_0652_valid :
    mulPoly ep_Q2_041_coefficient_18_0652
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0653 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 653 for generator 18. -/
def ep_Q2_041_partial_18_0653 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 18. -/
theorem ep_Q2_041_partial_18_0653_valid :
    mulPoly ep_Q2_041_coefficient_18_0653
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0654 : Poly :=
[
  term ((-13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 654 for generator 18. -/
def ep_Q2_041_partial_18_0654 : Poly :=
[
  term ((13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 18. -/
theorem ep_Q2_041_partial_18_0654_valid :
    mulPoly ep_Q2_041_coefficient_18_0654
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0655 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 655 for generator 18. -/
def ep_Q2_041_partial_18_0655 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 18. -/
theorem ep_Q2_041_partial_18_0655_valid :
    mulPoly ep_Q2_041_coefficient_18_0655
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0656 : Poly :=
[
  term ((25167313704049863304862867251080359952003134617795158605521873026875170 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 656 for generator 18. -/
def ep_Q2_041_partial_18_0656 : Poly :=
[
  term ((-25167313704049863304862867251080359952003134617795158605521873026875170 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((50334627408099726609725734502160719904006269235590317211043746053750340 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 18. -/
theorem ep_Q2_041_partial_18_0656_valid :
    mulPoly ep_Q2_041_coefficient_18_0656
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0657 : Poly :=
[
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 657 for generator 18. -/
def ep_Q2_041_partial_18_0657 : Poly :=
[
  term ((21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 18. -/
theorem ep_Q2_041_partial_18_0657_valid :
    mulPoly ep_Q2_041_coefficient_18_0657
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0658 : Poly :=
[
  term ((-36246061412022322418157497135131697720242983936577843818981000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 4)]
]

/-- Partial product 658 for generator 18. -/
def ep_Q2_041_partial_18_0658 : Poly :=
[
  term ((36246061412022322418157497135131697720242983936577843818981000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 4)],
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 18. -/
theorem ep_Q2_041_partial_18_0658_valid :
    mulPoly ep_Q2_041_coefficient_18_0658
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0659 : Poly :=
[
  term ((-84865708 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 659 for generator 18. -/
def ep_Q2_041_partial_18_0659 : Poly :=
[
  term ((84865708 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-169731416 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 18. -/
theorem ep_Q2_041_partial_18_0659_valid :
    mulPoly ep_Q2_041_coefficient_18_0659
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0660 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 660 for generator 18. -/
def ep_Q2_041_partial_18_0660 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 18. -/
theorem ep_Q2_041_partial_18_0660_valid :
    mulPoly ep_Q2_041_coefficient_18_0660
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0661 : Poly :=
[
  term ((-515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 661 for generator 18. -/
def ep_Q2_041_partial_18_0661 : Poly :=
[
  term ((515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1031071750817190147487383686278265424122714953062043308698200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 18. -/
theorem ep_Q2_041_partial_18_0661_valid :
    mulPoly ep_Q2_041_coefficient_18_0661
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0662 : Poly :=
[
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 3)]
]

/-- Partial product 662 for generator 18. -/
def ep_Q2_041_partial_18_0662 : Poly :=
[
  term ((-386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 3)],
  term ((773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 18. -/
theorem ep_Q2_041_partial_18_0662_valid :
    mulPoly ep_Q2_041_coefficient_18_0662
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0663 : Poly :=
[
  term ((3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 663 for generator 18. -/
def ep_Q2_041_partial_18_0663 : Poly :=
[
  term ((-3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 18. -/
theorem ep_Q2_041_partial_18_0663_valid :
    mulPoly ep_Q2_041_coefficient_18_0663
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0664 : Poly :=
[
  term ((-11526623855561492457229379234849028715092655052873953369930 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 664 for generator 18. -/
def ep_Q2_041_partial_18_0664 : Poly :=
[
  term ((11526623855561492457229379234849028715092655052873953369930 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-23053247711122984914458758469698057430185310105747906739860 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 18. -/
theorem ep_Q2_041_partial_18_0664_valid :
    mulPoly ep_Q2_041_coefficient_18_0664
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0665 : Poly :=
[
  term ((-11434647681287960948504317274325224032958772893847820532890200 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 4)]
]

/-- Partial product 665 for generator 18. -/
def ep_Q2_041_partial_18_0665 : Poly :=
[
  term ((11434647681287960948504317274325224032958772893847820532890200 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 4)],
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 18. -/
theorem ep_Q2_041_partial_18_0665_valid :
    mulPoly ep_Q2_041_coefficient_18_0665
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0666 : Poly :=
[
  term ((-12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 666 for generator 18. -/
def ep_Q2_041_partial_18_0666 : Poly :=
[
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 18. -/
theorem ep_Q2_041_partial_18_0666_valid :
    mulPoly ep_Q2_041_coefficient_18_0666
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0667 : Poly :=
[
  term ((-318060878 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 18. -/
def ep_Q2_041_partial_18_0667 : Poly :=
[
  term ((318060878 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 18. -/
theorem ep_Q2_041_partial_18_0667_valid :
    mulPoly ep_Q2_041_coefficient_18_0667
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0668 : Poly :=
[
  term ((59911754019890750207 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 668 for generator 18. -/
def ep_Q2_041_partial_18_0668 : Poly :=
[
  term ((-59911754019890750207 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((119823508039781500414 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 18. -/
theorem ep_Q2_041_partial_18_0668_valid :
    mulPoly ep_Q2_041_coefficient_18_0668
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0669 : Poly :=
[
  term ((2055147672 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 18. -/
def ep_Q2_041_partial_18_0669 : Poly :=
[
  term ((-2055147672 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4110295344 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 18. -/
theorem ep_Q2_041_partial_18_0669_valid :
    mulPoly ep_Q2_041_coefficient_18_0669
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0670 : Poly :=
[
  term ((52418317500462328466848686971945687497563559223786813040158611725471345 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (15, 3)]
]

/-- Partial product 670 for generator 18. -/
def ep_Q2_041_partial_18_0670 : Poly :=
[
  term ((-52418317500462328466848686971945687497563559223786813040158611725471345 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((52418317500462328466848686971945687497563559223786813040158611725471345 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 18. -/
theorem ep_Q2_041_partial_18_0670_valid :
    mulPoly ep_Q2_041_coefficient_18_0670
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0671 : Poly :=
[
  term ((14137386852960 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 671 for generator 18. -/
def ep_Q2_041_partial_18_0671 : Poly :=
[
  term ((-14137386852960 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((28274773705920 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 18. -/
theorem ep_Q2_041_partial_18_0671_valid :
    mulPoly ep_Q2_041_coefficient_18_0671
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0672 : Poly :=
[
  term ((-4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 672 for generator 18. -/
def ep_Q2_041_partial_18_0672 : Poly :=
[
  term ((-8737428460113931174 : Rat) / 111000833623628979) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 18. -/
theorem ep_Q2_041_partial_18_0672_valid :
    mulPoly ep_Q2_041_coefficient_18_0672
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0673 : Poly :=
[
  term ((10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1)]
]

/-- Partial product 673 for generator 18. -/
def ep_Q2_041_partial_18_0673 : Poly :=
[
  term ((20670372002450705928 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1)],
  term ((-10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 18. -/
theorem ep_Q2_041_partial_18_0673_valid :
    mulPoly ep_Q2_041_coefficient_18_0673
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0674 : Poly :=
[
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 674 for generator 18. -/
def ep_Q2_041_partial_18_0674 : Poly :=
[
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 18. -/
theorem ep_Q2_041_partial_18_0674_valid :
    mulPoly ep_Q2_041_coefficient_18_0674
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0675 : Poly :=
[
  term ((515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 675 for generator 18. -/
def ep_Q2_041_partial_18_0675 : Poly :=
[
  term ((1031071750817190147487383686278265424122714953062043308698200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 18. -/
theorem ep_Q2_041_partial_18_0675_valid :
    mulPoly ep_Q2_041_coefficient_18_0675
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0676 : Poly :=
[
  term ((-386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 676 for generator 18. -/
def ep_Q2_041_partial_18_0676 : Poly :=
[
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 18. -/
theorem ep_Q2_041_partial_18_0676_valid :
    mulPoly ep_Q2_041_coefficient_18_0676
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0677 : Poly :=
[
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 677 for generator 18. -/
def ep_Q2_041_partial_18_0677 : Poly :=
[
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 18. -/
theorem ep_Q2_041_partial_18_0677_valid :
    mulPoly ep_Q2_041_coefficient_18_0677
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0678 : Poly :=
[
  term ((-7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 678 for generator 18. -/
def ep_Q2_041_partial_18_0678 : Poly :=
[
  term ((-14284290418503519771844146921644756324670931380493730775240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 18. -/
theorem ep_Q2_041_partial_18_0678_valid :
    mulPoly ep_Q2_041_coefficient_18_0678
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0679 : Poly :=
[
  term ((-121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 679 for generator 18. -/
def ep_Q2_041_partial_18_0679 : Poly :=
[
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 18. -/
theorem ep_Q2_041_partial_18_0679_valid :
    mulPoly ep_Q2_041_coefficient_18_0679
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0680 : Poly :=
[
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 680 for generator 18. -/
def ep_Q2_041_partial_18_0680 : Poly :=
[
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 18. -/
theorem ep_Q2_041_partial_18_0680_valid :
    mulPoly ep_Q2_041_coefficient_18_0680
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0681 : Poly :=
[
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 18. -/
def ep_Q2_041_partial_18_0681 : Poly :=
[
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 18. -/
theorem ep_Q2_041_partial_18_0681_valid :
    mulPoly ep_Q2_041_coefficient_18_0681
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0682 : Poly :=
[
  term ((57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 682 for generator 18. -/
def ep_Q2_041_partial_18_0682 : Poly :=
[
  term ((114600864689301992843854445249157422009300493261180208361063926479655200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 18. -/
theorem ep_Q2_041_partial_18_0682_valid :
    mulPoly ep_Q2_041_coefficient_18_0682
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0683 : Poly :=
[
  term ((21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 683 for generator 18. -/
def ep_Q2_041_partial_18_0683 : Poly :=
[
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 18. -/
theorem ep_Q2_041_partial_18_0683_valid :
    mulPoly ep_Q2_041_coefficient_18_0683
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0684 : Poly :=
[
  term ((84865708 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 684 for generator 18. -/
def ep_Q2_041_partial_18_0684 : Poly :=
[
  term ((169731416 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-84865708 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 18. -/
theorem ep_Q2_041_partial_18_0684_valid :
    mulPoly ep_Q2_041_coefficient_18_0684
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0685 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 2)]
]

/-- Partial product 685 for generator 18. -/
def ep_Q2_041_partial_18_0685 : Poly :=
[
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2)],
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 18. -/
theorem ep_Q2_041_partial_18_0685_valid :
    mulPoly ep_Q2_041_coefficient_18_0685
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0686 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 686 for generator 18. -/
def ep_Q2_041_partial_18_0686 : Poly :=
[
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 18. -/
theorem ep_Q2_041_partial_18_0686_valid :
    mulPoly ep_Q2_041_coefficient_18_0686
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0687 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 687 for generator 18. -/
def ep_Q2_041_partial_18_0687 : Poly :=
[
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 18. -/
theorem ep_Q2_041_partial_18_0687_valid :
    mulPoly ep_Q2_041_coefficient_18_0687
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0688 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 688 for generator 18. -/
def ep_Q2_041_partial_18_0688 : Poly :=
[
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 18. -/
theorem ep_Q2_041_partial_18_0688_valid :
    mulPoly ep_Q2_041_coefficient_18_0688
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0689 : Poly :=
[
  term ((-361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 689 for generator 18. -/
def ep_Q2_041_partial_18_0689 : Poly :=
[
  term ((-722998376806282060577367318800123917026023379244313296765613280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 18. -/
theorem ep_Q2_041_partial_18_0689_valid :
    mulPoly ep_Q2_041_coefficient_18_0689
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0690 : Poly :=
[
  term ((-548095941916057630326212883253574950161625127645289903229000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 690 for generator 18. -/
def ep_Q2_041_partial_18_0690 : Poly :=
[
  term ((-1096191883832115260652425766507149900323250255290579806458000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((548095941916057630326212883253574950161625127645289903229000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 18. -/
theorem ep_Q2_041_partial_18_0690_valid :
    mulPoly ep_Q2_041_coefficient_18_0690
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0691 : Poly :=
[
  term ((265804450354830364399821645657632449948448548868237521339194000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 691 for generator 18. -/
def ep_Q2_041_partial_18_0691 : Poly :=
[
  term ((531608900709660728799643291315264899896897097736475042678388000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((-265804450354830364399821645657632449948448548868237521339194000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 18. -/
theorem ep_Q2_041_partial_18_0691_valid :
    mulPoly ep_Q2_041_coefficient_18_0691
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0692 : Poly :=
[
  term ((26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 692 for generator 18. -/
def ep_Q2_041_partial_18_0692 : Poly :=
[
  term ((53148074950107082856329222656555806620754172840212937570480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 18. -/
theorem ep_Q2_041_partial_18_0692_valid :
    mulPoly ep_Q2_041_coefficient_18_0692
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0693 : Poly :=
[
  term ((1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 693 for generator 18. -/
def ep_Q2_041_partial_18_0693 : Poly :=
[
  term ((2838691853729970475805910560415329544683633667892355053576242813248277264 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 18. -/
theorem ep_Q2_041_partial_18_0693_valid :
    mulPoly ep_Q2_041_coefficient_18_0693
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0694 : Poly :=
[
  term ((-12619462949520 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 18. -/
def ep_Q2_041_partial_18_0694 : Poly :=
[
  term ((-25238925899040 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12619462949520 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 18. -/
theorem ep_Q2_041_partial_18_0694_valid :
    mulPoly ep_Q2_041_coefficient_18_0694
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0695 : Poly :=
[
  term ((83937080301121194565864554227913550161632931196760625985680 : Rat) / 3879209967736060286510202301727378136308368692185759632933) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 695 for generator 18. -/
def ep_Q2_041_partial_18_0695 : Poly :=
[
  term ((167874160602242389131729108455827100323265862393521251971360 : Rat) / 3879209967736060286510202301727378136308368692185759632933) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 3)],
  term ((-83937080301121194565864554227913550161632931196760625985680 : Rat) / 3879209967736060286510202301727378136308368692185759632933) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 18. -/
theorem ep_Q2_041_partial_18_0695_valid :
    mulPoly ep_Q2_041_coefficient_18_0695
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0696 : Poly :=
[
  term ((488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 2), (15, 2)]
]

/-- Partial product 696 for generator 18. -/
def ep_Q2_041_partial_18_0696 : Poly :=
[
  term ((977035840186587238451978533493726574539147745070754621963996640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 2)],
  term ((-488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 18. -/
theorem ep_Q2_041_partial_18_0696_valid :
    mulPoly ep_Q2_041_coefficient_18_0696
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0697 : Poly :=
[
  term ((-12232965346788213490588411231214620988799135452202013046840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 697 for generator 18. -/
def ep_Q2_041_partial_18_0697 : Poly :=
[
  term ((-24465930693576426981176822462429241977598270904404026093680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((12232965346788213490588411231214620988799135452202013046840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 18. -/
theorem ep_Q2_041_partial_18_0697_valid :
    mulPoly ep_Q2_041_coefficient_18_0697
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0698 : Poly :=
[
  term ((83854082996111713622364993345051642908364334554884017241194800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 698 for generator 18. -/
def ep_Q2_041_partial_18_0698 : Poly :=
[
  term ((167708165992223427244729986690103285816728669109768034482389600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-83854082996111713622364993345051642908364334554884017241194800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 18. -/
theorem ep_Q2_041_partial_18_0698_valid :
    mulPoly ep_Q2_041_coefficient_18_0698
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0699 : Poly :=
[
  term ((-6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 699 for generator 18. -/
def ep_Q2_041_partial_18_0699 : Poly :=
[
  term ((-12958053108890840573183943955421761019113525880917146054640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 18. -/
theorem ep_Q2_041_partial_18_0699_valid :
    mulPoly ep_Q2_041_coefficient_18_0699
        ep_Q2_041_generator_18_0600_0699 =
      ep_Q2_041_partial_18_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0600_0699 : List Poly :=
[
  ep_Q2_041_partial_18_0600,
  ep_Q2_041_partial_18_0601,
  ep_Q2_041_partial_18_0602,
  ep_Q2_041_partial_18_0603,
  ep_Q2_041_partial_18_0604,
  ep_Q2_041_partial_18_0605,
  ep_Q2_041_partial_18_0606,
  ep_Q2_041_partial_18_0607,
  ep_Q2_041_partial_18_0608,
  ep_Q2_041_partial_18_0609,
  ep_Q2_041_partial_18_0610,
  ep_Q2_041_partial_18_0611,
  ep_Q2_041_partial_18_0612,
  ep_Q2_041_partial_18_0613,
  ep_Q2_041_partial_18_0614,
  ep_Q2_041_partial_18_0615,
  ep_Q2_041_partial_18_0616,
  ep_Q2_041_partial_18_0617,
  ep_Q2_041_partial_18_0618,
  ep_Q2_041_partial_18_0619,
  ep_Q2_041_partial_18_0620,
  ep_Q2_041_partial_18_0621,
  ep_Q2_041_partial_18_0622,
  ep_Q2_041_partial_18_0623,
  ep_Q2_041_partial_18_0624,
  ep_Q2_041_partial_18_0625,
  ep_Q2_041_partial_18_0626,
  ep_Q2_041_partial_18_0627,
  ep_Q2_041_partial_18_0628,
  ep_Q2_041_partial_18_0629,
  ep_Q2_041_partial_18_0630,
  ep_Q2_041_partial_18_0631,
  ep_Q2_041_partial_18_0632,
  ep_Q2_041_partial_18_0633,
  ep_Q2_041_partial_18_0634,
  ep_Q2_041_partial_18_0635,
  ep_Q2_041_partial_18_0636,
  ep_Q2_041_partial_18_0637,
  ep_Q2_041_partial_18_0638,
  ep_Q2_041_partial_18_0639,
  ep_Q2_041_partial_18_0640,
  ep_Q2_041_partial_18_0641,
  ep_Q2_041_partial_18_0642,
  ep_Q2_041_partial_18_0643,
  ep_Q2_041_partial_18_0644,
  ep_Q2_041_partial_18_0645,
  ep_Q2_041_partial_18_0646,
  ep_Q2_041_partial_18_0647,
  ep_Q2_041_partial_18_0648,
  ep_Q2_041_partial_18_0649,
  ep_Q2_041_partial_18_0650,
  ep_Q2_041_partial_18_0651,
  ep_Q2_041_partial_18_0652,
  ep_Q2_041_partial_18_0653,
  ep_Q2_041_partial_18_0654,
  ep_Q2_041_partial_18_0655,
  ep_Q2_041_partial_18_0656,
  ep_Q2_041_partial_18_0657,
  ep_Q2_041_partial_18_0658,
  ep_Q2_041_partial_18_0659,
  ep_Q2_041_partial_18_0660,
  ep_Q2_041_partial_18_0661,
  ep_Q2_041_partial_18_0662,
  ep_Q2_041_partial_18_0663,
  ep_Q2_041_partial_18_0664,
  ep_Q2_041_partial_18_0665,
  ep_Q2_041_partial_18_0666,
  ep_Q2_041_partial_18_0667,
  ep_Q2_041_partial_18_0668,
  ep_Q2_041_partial_18_0669,
  ep_Q2_041_partial_18_0670,
  ep_Q2_041_partial_18_0671,
  ep_Q2_041_partial_18_0672,
  ep_Q2_041_partial_18_0673,
  ep_Q2_041_partial_18_0674,
  ep_Q2_041_partial_18_0675,
  ep_Q2_041_partial_18_0676,
  ep_Q2_041_partial_18_0677,
  ep_Q2_041_partial_18_0678,
  ep_Q2_041_partial_18_0679,
  ep_Q2_041_partial_18_0680,
  ep_Q2_041_partial_18_0681,
  ep_Q2_041_partial_18_0682,
  ep_Q2_041_partial_18_0683,
  ep_Q2_041_partial_18_0684,
  ep_Q2_041_partial_18_0685,
  ep_Q2_041_partial_18_0686,
  ep_Q2_041_partial_18_0687,
  ep_Q2_041_partial_18_0688,
  ep_Q2_041_partial_18_0689,
  ep_Q2_041_partial_18_0690,
  ep_Q2_041_partial_18_0691,
  ep_Q2_041_partial_18_0692,
  ep_Q2_041_partial_18_0693,
  ep_Q2_041_partial_18_0694,
  ep_Q2_041_partial_18_0695,
  ep_Q2_041_partial_18_0696,
  ep_Q2_041_partial_18_0697,
  ep_Q2_041_partial_18_0698,
  ep_Q2_041_partial_18_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0600_0699 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((52554450453876556887761871140891853034237176489453982938257520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((789999482365950699317285696710472791816957613799937750786830960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2093843430221202573249316767439689764126069204284181828042011889618740458 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-24829383930120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((95376880672991320908 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1)],
  term ((-3219639366976911549039395954935662511998433319388286106079840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-574380516838204532094337659259597462731288828085441454055180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2009870599815060013758066178841924550068360861596036244429280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-352482600559478045835153002033211196108045435903824887967300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-510573750845447572800 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-59858838048 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((14710112388 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2)],
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-1397044601831294023458502317031741999106574861298310373047418720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1159873965184714317381039908324214327047775485970491002207392000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((3990757323617150218634965477960388902915760572576706920005449479748080536 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((17344740767760 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((474828081684604044914996211880323457455413390006337535227180960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((365908725801214750352138152778407169054680732603130257052486400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((-171901297033952989265781667873736133013950739891770312541595889719482800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-64628054184960 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((64462986387732370974668125452651049880231527459413867203098458644806050 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((24235520319360 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9416592726 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (8, 2), (15, 2)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((3868475940 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1046921715110601286624658383719844882063034602142090914021005944809370229 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7355056194 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (10, 2)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term ((698522300915647011729251158515870999553287430649155186523709360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 3)],
  term ((-1995378661808575109317482738980194451457880286288353460002724739874040268 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-8672370383880 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 3)],
  term ((-237414040842302022457498105940161728727706695003168767613590480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (11, 2), (15, 2)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 3)],
  term ((-125616912488441250859879136177620284379272553849752265276830 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 3)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2)],
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((3741177378 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-8737428460113931174 : Rat) / 111000833623628979) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((20670372002450705928 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1)],
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1031071750817190147487383686278265424122714953062043308698200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14284290418503519771844146921644756324670931380493730775240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((114600864689301992843854445249157422009300493261180208361063926479655200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((169731416 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-722998376806282060577367318800123917026023379244313296765613280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1096191883832115260652425766507149900323250255290579806458000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((531608900709660728799643291315264899896897097736475042678388000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((53148074950107082856329222656555806620754172840212937570480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2838691853729970475805910560415329544683633667892355053576242813248277264 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25238925899040 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((167874160602242389131729108455827100323265862393521251971360 : Rat) / 3879209967736060286510202301727378136308368692185759632933) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 3)],
  term ((977035840186587238451978533493726574539147745070754621963996640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 2)],
  term ((-24465930693576426981176822462429241977598270904404026093680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((167708165992223427244729986690103285816728669109768034482389600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-12958053108890840573183943955421761019113525880917146054640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25167313704049863304862867251080359952003134617795158605521873026875170 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((36246061412022322418157497135131697720242983936577843818981000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 4)],
  term ((84865708 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((-386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 3)],
  term ((-3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((11526623855561492457229379234849028715092655052873953369930 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((11434647681287960948504317274325224032958772893847820532890200 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 4)],
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((318060878 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59911754019890750207 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-2055147672 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-52418317500462328466848686971945687497563559223786813040158611725471345 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-14137386852960 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (15, 2)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (11, 2), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (10, 1), (13, 1), (15, 2)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (10, 1), (15, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-20670372002450705928 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (11, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((14284290418503519771844146921644756324670931380493730775240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 3)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((50334627408099726609725734502160719904006269235590317211043746053750340 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 2)],
  term ((-43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 2), (11, 1), (15, 4)],
  term ((-169731416 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 2), (14, 1), (15, 1)],
  term ((-1031071750817190147487383686278265424122714953062043308698200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 2), (11, 2), (15, 1)],
  term ((773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 2), (11, 2), (15, 3)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-23053247711122984914458758469698057430185310105747906739860 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 2)],
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 4)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((119823508039781500414 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 2), (15, 1)],
  term ((4110295344 : Rat) / 151763803) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((52418317500462328466848686971945687497563559223786813040158611725471345 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 2), (15, 3)],
  term ((28274773705920 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 2), (15, 3), (16, 1)],
  term ((4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (6, 1), (9, 1)],
  term ((-10335186001225352964 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-515535875408595073743691843139132712061357476531021654349100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((7142145209251759885922073460822378162335465690246865387620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-84865708 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (9, 1), (10, 2)],
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((548095941916057630326212883253574950161625127645289903229000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-265804450354830364399821645657632449948448548868237521339194000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((12619462949520 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83937080301121194565864554227913550161632931196760625985680 : Rat) / 3879209967736060286510202301727378136308368692185759632933) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 3)],
  term ((-488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (9, 1), (11, 2), (15, 2)],
  term ((12232965346788213490588411231214620988799135452202013046840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-83854082996111713622364993345051642908364334554884017241194800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 600 through 699. -/
theorem ep_Q2_041_block_18_0600_0699_valid :
    checkProductSumEq ep_Q2_041_partials_18_0600_0699
      ep_Q2_041_block_18_0600_0699 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
