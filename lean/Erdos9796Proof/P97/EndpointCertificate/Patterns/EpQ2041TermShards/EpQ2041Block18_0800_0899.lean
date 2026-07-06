/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0800 : Poly :=
[
  term ((176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 800 for generator 18. -/
def ep_Q2_041_partial_18_0800 : Poly :=
[
  term ((352482600559478045835153002033211196108045435903824887967300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 18. -/
theorem ep_Q2_041_partial_18_0800_valid :
    mulPoly ep_Q2_041_coefficient_18_0800
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0801 : Poly :=
[
  term ((255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1), (14, 1)]
]

/-- Partial product 801 for generator 18. -/
def ep_Q2_041_partial_18_0801 : Poly :=
[
  term ((510573750845447572800 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1)],
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 18. -/
theorem ep_Q2_041_partial_18_0801_valid :
    mulPoly ep_Q2_041_coefficient_18_0801
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0802 : Poly :=
[
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 802 for generator 18. -/
def ep_Q2_041_partial_18_0802 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 18. -/
theorem ep_Q2_041_partial_18_0802_valid :
    mulPoly ep_Q2_041_coefficient_18_0802
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0803 : Poly :=
[
  term ((29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 803 for generator 18. -/
def ep_Q2_041_partial_18_0803 : Poly :=
[
  term ((59858838048 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 18. -/
theorem ep_Q2_041_partial_18_0803_valid :
    mulPoly ep_Q2_041_coefficient_18_0803
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0804 : Poly :=
[
  term ((-13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 2)]
]

/-- Partial product 804 for generator 18. -/
def ep_Q2_041_partial_18_0804 : Poly :=
[
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 2)],
  term ((13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 18. -/
theorem ep_Q2_041_partial_18_0804_valid :
    mulPoly ep_Q2_041_coefficient_18_0804
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0805 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 4)]
]

/-- Partial product 805 for generator 18. -/
def ep_Q2_041_partial_18_0805 : Poly :=
[
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 4)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 18. -/
theorem ep_Q2_041_partial_18_0805_valid :
    mulPoly ep_Q2_041_coefficient_18_0805
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0806 : Poly :=
[
  term ((-7355056194 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (16, 1)]
]

/-- Partial product 806 for generator 18. -/
def ep_Q2_041_partial_18_0806 : Poly :=
[
  term ((-14710112388 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((7355056194 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 18. -/
theorem ep_Q2_041_partial_18_0806_valid :
    mulPoly ep_Q2_041_coefficient_18_0806
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0807 : Poly :=
[
  term ((1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 807 for generator 18. -/
def ep_Q2_041_partial_18_0807 : Poly :=
[
  term ((3219639366976911549039395954935662511998433319388286106079840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 18. -/
theorem ep_Q2_041_partial_18_0807_valid :
    mulPoly ep_Q2_041_coefficient_18_0807
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0808 : Poly :=
[
  term ((287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (15, 1)]
]

/-- Partial product 808 for generator 18. -/
def ep_Q2_041_partial_18_0808 : Poly :=
[
  term ((574380516838204532094337659259597462731288828085441454055180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (15, 1)],
  term ((-287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 18. -/
theorem ep_Q2_041_partial_18_0808_valid :
    mulPoly ep_Q2_041_coefficient_18_0808
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0809 : Poly :=
[
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 809 for generator 18. -/
def ep_Q2_041_partial_18_0809 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 18. -/
theorem ep_Q2_041_partial_18_0809_valid :
    mulPoly ep_Q2_041_coefficient_18_0809
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0810 : Poly :=
[
  term ((-197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 2)]
]

/-- Partial product 810 for generator 18. -/
def ep_Q2_041_partial_18_0810 : Poly :=
[
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 2)],
  term ((197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 18. -/
theorem ep_Q2_041_partial_18_0810_valid :
    mulPoly ep_Q2_041_coefficient_18_0810
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0811 : Poly :=
[
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 4)]
]

/-- Partial product 811 for generator 18. -/
def ep_Q2_041_partial_18_0811 : Poly :=
[
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 4)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 18. -/
theorem ep_Q2_041_partial_18_0811_valid :
    mulPoly ep_Q2_041_coefficient_18_0811
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0812 : Poly :=
[
  term ((10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (14, 1), (15, 1)]
]

/-- Partial product 812 for generator 18. -/
def ep_Q2_041_partial_18_0812 : Poly :=
[
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (14, 1), (15, 1)],
  term ((-10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 18. -/
theorem ep_Q2_041_partial_18_0812_valid :
    mulPoly ep_Q2_041_coefficient_18_0812
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0813 : Poly :=
[
  term ((4039253386560 : Rat) / 275754830051) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 813 for generator 18. -/
def ep_Q2_041_partial_18_0813 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4039253386560 : Rat) / 275754830051) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 18. -/
theorem ep_Q2_041_partial_18_0813_valid :
    mulPoly ep_Q2_041_coefficient_18_0813
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0814 : Poly :=
[
  term ((5067808574268728054971720978525682628678051918859868683796770659335847321 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 2), (15, 1)]
]

/-- Partial product 814 for generator 18. -/
def ep_Q2_041_partial_18_0814 : Poly :=
[
  term ((5067808574268728054971720978525682628678051918859868683796770659335847321 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-5067808574268728054971720978525682628678051918859868683796770659335847321 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 18. -/
theorem ep_Q2_041_partial_18_0814_valid :
    mulPoly ep_Q2_041_coefficient_18_0814
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0815 : Poly :=
[
  term ((6207345982530 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 815 for generator 18. -/
def ep_Q2_041_partial_18_0815 : Poly :=
[
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-6207345982530 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 18. -/
theorem ep_Q2_041_partial_18_0815_valid :
    mulPoly ep_Q2_041_coefficient_18_0815
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0816 : Poly :=
[
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (15, 3)]
]

/-- Partial product 816 for generator 18. -/
def ep_Q2_041_partial_18_0816 : Poly :=
[
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (15, 3)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 18. -/
theorem ep_Q2_041_partial_18_0816_valid :
    mulPoly ep_Q2_041_coefficient_18_0816
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0817 : Poly :=
[
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 3), (16, 1)]
]

/-- Partial product 817 for generator 18. -/
def ep_Q2_041_partial_18_0817 : Poly :=
[
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (15, 3), (16, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 18. -/
theorem ep_Q2_041_partial_18_0817_valid :
    mulPoly ep_Q2_041_coefficient_18_0817
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0818 : Poly :=
[
  term ((4368714230056965587 : Rat) / 222001667247257958) [(1, 1), (7, 1)]
]

/-- Partial product 818 for generator 18. -/
def ep_Q2_041_partial_18_0818 : Poly :=
[
  term ((-4368714230056965587 : Rat) / 222001667247257958) [(1, 1), (7, 1)],
  term ((4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 18. -/
theorem ep_Q2_041_partial_18_0818_valid :
    mulPoly ep_Q2_041_coefficient_18_0818
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0819 : Poly :=
[
  term ((4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 819 for generator 18. -/
def ep_Q2_041_partial_18_0819 : Poly :=
[
  term ((-4368714230056965587 : Rat) / 111000833623628979) [(1, 1), (7, 1), (8, 1)],
  term ((8737428460113931174 : Rat) / 111000833623628979) [(1, 1), (7, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 18. -/
theorem ep_Q2_041_partial_18_0819_valid :
    mulPoly ep_Q2_041_coefficient_18_0819
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0820 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 820 for generator 18. -/
def ep_Q2_041_partial_18_0820 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 18. -/
theorem ep_Q2_041_partial_18_0820_valid :
    mulPoly ep_Q2_041_coefficient_18_0820
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0821 : Poly :=
[
  term ((361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 821 for generator 18. -/
def ep_Q2_041_partial_18_0821 : Poly :=
[
  term ((-361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((722998376806282060577367318800123917026023379244313296765613280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 18. -/
theorem ep_Q2_041_partial_18_0821_valid :
    mulPoly ep_Q2_041_coefficient_18_0821
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0822 : Poly :=
[
  term ((90160019395248503089959235920594209990100193293884125357184781082911580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 822 for generator 18. -/
def ep_Q2_041_partial_18_0822 : Poly :=
[
  term ((-90160019395248503089959235920594209990100193293884125357184781082911580 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((180320038790497006179918471841188419980200386587768250714369562165823160 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 18. -/
theorem ep_Q2_041_partial_18_0822_valid :
    mulPoly ep_Q2_041_coefficient_18_0822
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0823 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 823 for generator 18. -/
def ep_Q2_041_partial_18_0823 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 18. -/
theorem ep_Q2_041_partial_18_0823_valid :
    mulPoly ep_Q2_041_coefficient_18_0823
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0824 : Poly :=
[
  term ((-12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 824 for generator 18. -/
def ep_Q2_041_partial_18_0824 : Poly :=
[
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 18. -/
theorem ep_Q2_041_partial_18_0824_valid :
    mulPoly ep_Q2_041_coefficient_18_0824
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0825 : Poly :=
[
  term ((-13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 825 for generator 18. -/
def ep_Q2_041_partial_18_0825 : Poly :=
[
  term ((13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 18. -/
theorem ep_Q2_041_partial_18_0825_valid :
    mulPoly ep_Q2_041_coefficient_18_0825
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0826 : Poly :=
[
  term ((-1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 826 for generator 18. -/
def ep_Q2_041_partial_18_0826 : Poly :=
[
  term ((1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-2838691853729970475805910560415329544683633667892355053576242813248277264 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 18. -/
theorem ep_Q2_041_partial_18_0826_valid :
    mulPoly ep_Q2_041_coefficient_18_0826
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0827 : Poly :=
[
  term ((12619462949520 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 18. -/
def ep_Q2_041_partial_18_0827 : Poly :=
[
  term ((-12619462949520 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((25238925899040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 18. -/
theorem ep_Q2_041_partial_18_0827_valid :
    mulPoly ep_Q2_041_coefficient_18_0827
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0828 : Poly :=
[
  term ((24164040941348214945438331423421131813495322624385229212654000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 828 for generator 18. -/
def ep_Q2_041_partial_18_0828 : Poly :=
[
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((48328081882696429890876662846842263626990645248770458425308000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 18. -/
theorem ep_Q2_041_partial_18_0828_valid :
    mulPoly ep_Q2_041_coefficient_18_0828
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0829 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 829 for generator 18. -/
def ep_Q2_041_partial_18_0829 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 18. -/
theorem ep_Q2_041_partial_18_0829_valid :
    mulPoly ep_Q2_041_coefficient_18_0829
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0830 : Poly :=
[
  term ((-488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (15, 2)]
]

/-- Partial product 830 for generator 18. -/
def ep_Q2_041_partial_18_0830 : Poly :=
[
  term ((488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((-977035840186587238451978533493726574539147745070754621963996640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 18. -/
theorem ep_Q2_041_partial_18_0830_valid :
    mulPoly ep_Q2_041_coefficient_18_0830
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0831 : Poly :=
[
  term ((92919332335718660691194065875157821994447720822319686636350 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 831 for generator 18. -/
def ep_Q2_041_partial_18_0831 : Poly :=
[
  term ((-92919332335718660691194065875157821994447720822319686636350 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((185838664671437321382388131750315643988895441644639373272700 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 18. -/
theorem ep_Q2_041_partial_18_0831_valid :
    mulPoly ep_Q2_041_coefficient_18_0831
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0832 : Poly :=
[
  term ((-3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 832 for generator 18. -/
def ep_Q2_041_partial_18_0832 : Poly :=
[
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 18. -/
theorem ep_Q2_041_partial_18_0832_valid :
    mulPoly ep_Q2_041_coefficient_18_0832
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0833 : Poly :=
[
  term ((3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 833 for generator 18. -/
def ep_Q2_041_partial_18_0833 : Poly :=
[
  term ((-3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 18. -/
theorem ep_Q2_041_partial_18_0833_valid :
    mulPoly ep_Q2_041_coefficient_18_0833
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0834 : Poly :=
[
  term ((-190971591319545843174783575756528894271560476719212375874100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 834 for generator 18. -/
def ep_Q2_041_partial_18_0834 : Poly :=
[
  term ((190971591319545843174783575756528894271560476719212375874100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-381943182639091686349567151513057788543120953438424751748200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 18. -/
theorem ep_Q2_041_partial_18_0834_valid :
    mulPoly ep_Q2_041_coefficient_18_0834
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0835 : Poly :=
[
  term ((7623098454191973965669544849550149355305848595898547021926800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 3)]
]

/-- Partial product 835 for generator 18. -/
def ep_Q2_041_partial_18_0835 : Poly :=
[
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((15246196908383947931339089699100298710611697191797094043853600 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 18. -/
theorem ep_Q2_041_partial_18_0835_valid :
    mulPoly ep_Q2_041_coefficient_18_0835
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0836 : Poly :=
[
  term ((-3576885922033166399 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 836 for generator 18. -/
def ep_Q2_041_partial_18_0836 : Poly :=
[
  term ((3576885922033166399 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((-7153771844066332798 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 18. -/
theorem ep_Q2_041_partial_18_0836_valid :
    mulPoly ep_Q2_041_coefficient_18_0836
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0837 : Poly :=
[
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 837 for generator 18. -/
def ep_Q2_041_partial_18_0837 : Poly :=
[
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 18. -/
theorem ep_Q2_041_partial_18_0837_valid :
    mulPoly ep_Q2_041_coefficient_18_0837
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0838 : Poly :=
[
  term ((673208897760 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 838 for generator 18. -/
def ep_Q2_041_partial_18_0838 : Poly :=
[
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 18. -/
theorem ep_Q2_041_partial_18_0838_valid :
    mulPoly ep_Q2_041_coefficient_18_0838
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0839 : Poly :=
[
  term ((-3811029992 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 839 for generator 18. -/
def ep_Q2_041_partial_18_0839 : Poly :=
[
  term ((3811029992 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-7622059984 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 18. -/
theorem ep_Q2_041_partial_18_0839_valid :
    mulPoly ep_Q2_041_coefficient_18_0839
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0840 : Poly :=
[
  term ((-12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 2)]
]

/-- Partial product 840 for generator 18. -/
def ep_Q2_041_partial_18_0840 : Poly :=
[
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 18. -/
theorem ep_Q2_041_partial_18_0840_valid :
    mulPoly ep_Q2_041_coefficient_18_0840
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0841 : Poly :=
[
  term ((-318060878 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 2), (16, 1)]
]

/-- Partial product 841 for generator 18. -/
def ep_Q2_041_partial_18_0841 : Poly :=
[
  term ((318060878 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 18. -/
theorem ep_Q2_041_partial_18_0841_valid :
    mulPoly ep_Q2_041_coefficient_18_0841
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0842 : Poly :=
[
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 842 for generator 18. -/
def ep_Q2_041_partial_18_0842 : Poly :=
[
  term ((16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (7, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 18. -/
theorem ep_Q2_041_partial_18_0842_valid :
    mulPoly ep_Q2_041_coefficient_18_0842
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0843 : Poly :=
[
  term ((-9424924568640 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 843 for generator 18. -/
def ep_Q2_041_partial_18_0843 : Poly :=
[
  term ((9424924568640 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-18849849137280 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 18. -/
theorem ep_Q2_041_partial_18_0843_valid :
    mulPoly ep_Q2_041_coefficient_18_0843
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0844 : Poly :=
[
  term ((1522687150 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 844 for generator 18. -/
def ep_Q2_041_partial_18_0844 : Poly :=
[
  term ((-1522687150 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((3045374300 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 18. -/
theorem ep_Q2_041_partial_18_0844_valid :
    mulPoly ep_Q2_041_coefficient_18_0844
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0845 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 845 for generator 18. -/
def ep_Q2_041_partial_18_0845 : Poly :=
[
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 18. -/
theorem ep_Q2_041_partial_18_0845_valid :
    mulPoly ep_Q2_041_coefficient_18_0845
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0846 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 846 for generator 18. -/
def ep_Q2_041_partial_18_0846 : Poly :=
[
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 18. -/
theorem ep_Q2_041_partial_18_0846_valid :
    mulPoly ep_Q2_041_coefficient_18_0846
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0847 : Poly :=
[
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 847 for generator 18. -/
def ep_Q2_041_partial_18_0847 : Poly :=
[
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 18. -/
theorem ep_Q2_041_partial_18_0847_valid :
    mulPoly ep_Q2_041_coefficient_18_0847
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0848 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 848 for generator 18. -/
def ep_Q2_041_partial_18_0848 : Poly :=
[
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 18. -/
theorem ep_Q2_041_partial_18_0848_valid :
    mulPoly ep_Q2_041_coefficient_18_0848
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0849 : Poly :=
[
  term ((-207507532287049890534668421246104415118333507927616210564033760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 849 for generator 18. -/
def ep_Q2_041_partial_18_0849 : Poly :=
[
  term ((-415015064574099781069336842492208830236667015855232421128067520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((207507532287049890534668421246104415118333507927616210564033760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 18. -/
theorem ep_Q2_041_partial_18_0849_valid :
    mulPoly ep_Q2_041_coefficient_18_0849
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0850 : Poly :=
[
  term ((-524436975954405476638398829238019674852043132486666643022260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 850 for generator 18. -/
def ep_Q2_041_partial_18_0850 : Poly :=
[
  term ((-1048873951908810953276797658476039349704086264973333286044520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((524436975954405476638398829238019674852043132486666643022260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 18. -/
theorem ep_Q2_041_partial_18_0850_valid :
    mulPoly ep_Q2_041_coefficient_18_0850
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0851 : Poly :=
[
  term ((-19659694764757180626137584118559239829272724842139477306863760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 851 for generator 18. -/
def ep_Q2_041_partial_18_0851 : Poly :=
[
  term ((-39319389529514361252275168237118479658545449684278954613727520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((19659694764757180626137584118559239829272724842139477306863760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 18. -/
theorem ep_Q2_041_partial_18_0851_valid :
    mulPoly ep_Q2_041_coefficient_18_0851
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0852 : Poly :=
[
  term ((105947593212949904081095833848904664183746420679927170654410808164171711 : Rat) / 538093422807966473716704920243083342919282317895353999604745657517886) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 852 for generator 18. -/
def ep_Q2_041_partial_18_0852 : Poly :=
[
  term ((105947593212949904081095833848904664183746420679927170654410808164171711 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(1, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-105947593212949904081095833848904664183746420679927170654410808164171711 : Rat) / 538093422807966473716704920243083342919282317895353999604745657517886) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 18. -/
theorem ep_Q2_041_partial_18_0852_valid :
    mulPoly ep_Q2_041_coefficient_18_0852
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0853 : Poly :=
[
  term ((978818497020 : Rat) / 11989340437) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 853 for generator 18. -/
def ep_Q2_041_partial_18_0853 : Poly :=
[
  term ((1957636994040 : Rat) / 11989340437) [(1, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-978818497020 : Rat) / 11989340437) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 18. -/
theorem ep_Q2_041_partial_18_0853_valid :
    mulPoly ep_Q2_041_coefficient_18_0853
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0854 : Poly :=
[
  term ((-26279772032911843818 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 854 for generator 18. -/
def ep_Q2_041_partial_18_0854 : Poly :=
[
  term ((-52559544065823687636 : Rat) / 259001945121800951) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((26279772032911843818 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 18. -/
theorem ep_Q2_041_partial_18_0854_valid :
    mulPoly ep_Q2_041_coefficient_18_0854
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0855 : Poly :=
[
  term ((-152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 855 for generator 18. -/
def ep_Q2_041_partial_18_0855 : Poly :=
[
  term ((-304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 18. -/
theorem ep_Q2_041_partial_18_0855_valid :
    mulPoly ep_Q2_041_coefficient_18_0855
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0856 : Poly :=
[
  term ((-176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 856 for generator 18. -/
def ep_Q2_041_partial_18_0856 : Poly :=
[
  term ((-353876089948949056323014114550511809157705841026258101360879840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 18. -/
theorem ep_Q2_041_partial_18_0856_valid :
    mulPoly ep_Q2_041_coefficient_18_0856
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0857 : Poly :=
[
  term ((105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 857 for generator 18. -/
def ep_Q2_041_partial_18_0857 : Poly :=
[
  term ((210566529270579068165399500770334206903005268479078848058638232290836400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 18. -/
theorem ep_Q2_041_partial_18_0857_valid :
    mulPoly ep_Q2_041_coefficient_18_0857
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0858 : Poly :=
[
  term ((26928355910400 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 858 for generator 18. -/
def ep_Q2_041_partial_18_0858 : Poly :=
[
  term ((53856711820800 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26928355910400 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 18. -/
theorem ep_Q2_041_partial_18_0858_valid :
    mulPoly ep_Q2_041_coefficient_18_0858
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0859 : Poly :=
[
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 859 for generator 18. -/
def ep_Q2_041_partial_18_0859 : Poly :=
[
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 18. -/
theorem ep_Q2_041_partial_18_0859_valid :
    mulPoly ep_Q2_041_coefficient_18_0859
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0860 : Poly :=
[
  term ((903962234234722457553303928440428406433044867320978201826805298707072331 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 860 for generator 18. -/
def ep_Q2_041_partial_18_0860 : Poly :=
[
  term ((1807924468469444915106607856880856812866089734641956403653610597414144662 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-903962234234722457553303928440428406433044867320978201826805298707072331 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 18. -/
theorem ep_Q2_041_partial_18_0860_valid :
    mulPoly ep_Q2_041_coefficient_18_0860
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0861 : Poly :=
[
  term ((-6982940372520 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 861 for generator 18. -/
def ep_Q2_041_partial_18_0861 : Poly :=
[
  term ((-13965880745040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6982940372520 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 18. -/
theorem ep_Q2_041_partial_18_0861_valid :
    mulPoly ep_Q2_041_coefficient_18_0861
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0862 : Poly :=
[
  term ((-483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 862 for generator 18. -/
def ep_Q2_041_partial_18_0862 : Poly :=
[
  term ((-966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 18. -/
theorem ep_Q2_041_partial_18_0862_valid :
    mulPoly ep_Q2_041_coefficient_18_0862
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0863 : Poly :=
[
  term ((256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 863 for generator 18. -/
def ep_Q2_041_partial_18_0863 : Poly :=
[
  term ((512681961034641834171427598170284419083069195159762540194652320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 18. -/
theorem ep_Q2_041_partial_18_0863_valid :
    mulPoly ep_Q2_041_coefficient_18_0863
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0864 : Poly :=
[
  term ((-452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 864 for generator 18. -/
def ep_Q2_041_partial_18_0864 : Poly :=
[
  term ((-904945266978005368476124060969448980761483911134562006787960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 18. -/
theorem ep_Q2_041_partial_18_0864_valid :
    mulPoly ep_Q2_041_coefficient_18_0864
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0865 : Poly :=
[
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 865 for generator 18. -/
def ep_Q2_041_partial_18_0865 : Poly :=
[
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 18. -/
theorem ep_Q2_041_partial_18_0865_valid :
    mulPoly ep_Q2_041_coefficient_18_0865
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0866 : Poly :=
[
  term ((100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 866 for generator 18. -/
def ep_Q2_041_partial_18_0866 : Poly :=
[
  term ((201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 18. -/
theorem ep_Q2_041_partial_18_0866_valid :
    mulPoly ep_Q2_041_coefficient_18_0866
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0867 : Poly :=
[
  term ((16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (7, 1), (10, 1), (14, 1)]
]

/-- Partial product 867 for generator 18. -/
def ep_Q2_041_partial_18_0867 : Poly :=
[
  term ((33876928784237443896 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 18. -/
theorem ep_Q2_041_partial_18_0867_valid :
    mulPoly ep_Q2_041_coefficient_18_0867
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0868 : Poly :=
[
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 868 for generator 18. -/
def ep_Q2_041_partial_18_0868 : Poly :=
[
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 18. -/
theorem ep_Q2_041_partial_18_0868_valid :
    mulPoly ep_Q2_041_coefficient_18_0868
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0869 : Poly :=
[
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 869 for generator 18. -/
def ep_Q2_041_partial_18_0869 : Poly :=
[
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 18. -/
theorem ep_Q2_041_partial_18_0869_valid :
    mulPoly ep_Q2_041_coefficient_18_0869
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0870 : Poly :=
[
  term ((14879843804 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 870 for generator 18. -/
def ep_Q2_041_partial_18_0870 : Poly :=
[
  term ((29759687608 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14879843804 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 18. -/
theorem ep_Q2_041_partial_18_0870_valid :
    mulPoly ep_Q2_041_coefficient_18_0870
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0871 : Poly :=
[
  term ((640740221980876210022796802594079019860072614276021773729115 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(1, 1), (7, 1), (10, 1), (15, 2)]
]

/-- Partial product 871 for generator 18. -/
def ep_Q2_041_partial_18_0871 : Poly :=
[
  term ((640740221980876210022796802594079019860072614276021773729115 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((-640740221980876210022796802594079019860072614276021773729115 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(1, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 18. -/
theorem ep_Q2_041_partial_18_0871_valid :
    mulPoly ep_Q2_041_coefficient_18_0871
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0872 : Poly :=
[
  term ((-3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 872 for generator 18. -/
def ep_Q2_041_partial_18_0872 : Poly :=
[
  term ((-7397489048 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 18. -/
theorem ep_Q2_041_partial_18_0872_valid :
    mulPoly ep_Q2_041_coefficient_18_0872
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0873 : Poly :=
[
  term ((-27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 2)]
]

/-- Partial product 873 for generator 18. -/
def ep_Q2_041_partial_18_0873 : Poly :=
[
  term ((-54747531889150107036 : Rat) / 259001945121800951) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 18. -/
theorem ep_Q2_041_partial_18_0873_valid :
    mulPoly ep_Q2_041_coefficient_18_0873
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0874 : Poly :=
[
  term ((140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 874 for generator 18. -/
def ep_Q2_041_partial_18_0874 : Poly :=
[
  term ((280398222179833931990656230196059943514728583268037873561280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 18. -/
theorem ep_Q2_041_partial_18_0874_valid :
    mulPoly ep_Q2_041_coefficient_18_0874
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0875 : Poly :=
[
  term ((100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 875 for generator 18. -/
def ep_Q2_041_partial_18_0875 : Poly :=
[
  term ((201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 18. -/
theorem ep_Q2_041_partial_18_0875_valid :
    mulPoly ep_Q2_041_coefficient_18_0875
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0876 : Poly :=
[
  term ((-3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

/-- Partial product 876 for generator 18. -/
def ep_Q2_041_partial_18_0876 : Poly :=
[
  term ((-7397489048 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 18. -/
theorem ep_Q2_041_partial_18_0876_valid :
    mulPoly ep_Q2_041_coefficient_18_0876
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0877 : Poly :=
[
  term ((38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 877 for generator 18. -/
def ep_Q2_041_partial_18_0877 : Poly :=
[
  term ((76230984541919739656695448495501493553058485958985470219268000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 18. -/
theorem ep_Q2_041_partial_18_0877_valid :
    mulPoly ep_Q2_041_coefficient_18_0877
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0878 : Poly :=
[
  term ((243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 878 for generator 18. -/
def ep_Q2_041_partial_18_0878 : Poly :=
[
  term ((487878301068286333802850870371209558739574310137507009403315200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 18. -/
theorem ep_Q2_041_partial_18_0878_valid :
    mulPoly ep_Q2_041_coefficient_18_0878
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0879 : Poly :=
[
  term ((180749594201570515144341829700030979256505844811078324191403320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 879 for generator 18. -/
def ep_Q2_041_partial_18_0879 : Poly :=
[
  term ((361499188403141030288683659400061958513011689622156648382806640 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-180749594201570515144341829700030979256505844811078324191403320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 18. -/
theorem ep_Q2_041_partial_18_0879_valid :
    mulPoly ep_Q2_041_coefficient_18_0879
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0880 : Poly :=
[
  term ((251290382755427877007125895007774775528498556957327704415846015785580850 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 880 for generator 18. -/
def ep_Q2_041_partial_18_0880 : Poly :=
[
  term ((502580765510855754014251790015549551056997113914655408831692031571161700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-251290382755427877007125895007774775528498556957327704415846015785580850 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 18. -/
theorem ep_Q2_041_partial_18_0880_valid :
    mulPoly ep_Q2_041_coefficient_18_0880
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0881 : Poly :=
[
  term ((-6732088977600 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 881 for generator 18. -/
def ep_Q2_041_partial_18_0881 : Poly :=
[
  term ((-13464177955200 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6732088977600 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 18. -/
theorem ep_Q2_041_partial_18_0881_valid :
    mulPoly ep_Q2_041_coefficient_18_0881
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0882 : Poly :=
[
  term ((-193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 882 for generator 18. -/
def ep_Q2_041_partial_18_0882 : Poly :=
[
  term ((-386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 18. -/
theorem ep_Q2_041_partial_18_0882_valid :
    mulPoly ep_Q2_041_coefficient_18_0882
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0883 : Poly :=
[
  term ((-401207036948561954521178284992853242776001600464803060282345497059350020 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 883 for generator 18. -/
def ep_Q2_041_partial_18_0883 : Poly :=
[
  term ((-802414073897123909042356569985706485552003200929606120564690994118700040 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((401207036948561954521178284992853242776001600464803060282345497059350020 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 18. -/
theorem ep_Q2_041_partial_18_0883_valid :
    mulPoly ep_Q2_041_coefficient_18_0883
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0884 : Poly :=
[
  term ((-43085369456640 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 884 for generator 18. -/
def ep_Q2_041_partial_18_0884 : Poly :=
[
  term ((-86170738913280 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 18. -/
theorem ep_Q2_041_partial_18_0884_valid :
    mulPoly ep_Q2_041_coefficient_18_0884
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0885 : Poly :=
[
  term ((24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 3)]
]

/-- Partial product 885 for generator 18. -/
def ep_Q2_041_partial_18_0885 : Poly :=
[
  term ((48328081882696429890876662846842263626990645248770458425308000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 3)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 18. -/
theorem ep_Q2_041_partial_18_0885_valid :
    mulPoly ep_Q2_041_coefficient_18_0885
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0886 : Poly :=
[
  term ((26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (11, 1), (14, 3), (15, 1)]
]

/-- Partial product 886 for generator 18. -/
def ep_Q2_041_partial_18_0886 : Poly :=
[
  term ((53148074950107082856329222656555806620754172840212937570480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 3), (15, 1)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 18. -/
theorem ep_Q2_041_partial_18_0886_valid :
    mulPoly ep_Q2_041_coefficient_18_0886
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0887 : Poly :=
[
  term ((-709672963432492618951477640103832386170908416973088763394060703312069316 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 887 for generator 18. -/
def ep_Q2_041_partial_18_0887 : Poly :=
[
  term ((-1419345926864985237902955280207664772341816833946177526788121406624138632 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((709672963432492618951477640103832386170908416973088763394060703312069316 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 18. -/
theorem ep_Q2_041_partial_18_0887_valid :
    mulPoly ep_Q2_041_coefficient_18_0887
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0888 : Poly :=
[
  term ((6309731474760 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 888 for generator 18. -/
def ep_Q2_041_partial_18_0888 : Poly :=
[
  term ((12619462949520 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6309731474760 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 18. -/
theorem ep_Q2_041_partial_18_0888_valid :
    mulPoly ep_Q2_041_coefficient_18_0888
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0889 : Poly :=
[
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (11, 1), (15, 3)]
]

/-- Partial product 889 for generator 18. -/
def ep_Q2_041_partial_18_0889 : Poly :=
[
  term ((24164040941348214945438331423421131813495322624385229212654000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((-12082020470674107472719165711710565906747661312192614606327000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 18. -/
theorem ep_Q2_041_partial_18_0889_valid :
    mulPoly ep_Q2_041_coefficient_18_0889
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0890 : Poly :=
[
  term ((120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 890 for generator 18. -/
def ep_Q2_041_partial_18_0890 : Poly :=
[
  term ((241640409413482149454383314234211318134953226243852292126540000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 18. -/
theorem ep_Q2_041_partial_18_0890_valid :
    mulPoly ep_Q2_041_coefficient_18_0890
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0891 : Poly :=
[
  term ((773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 2), (15, 2)]
]

/-- Partial product 891 for generator 18. -/
def ep_Q2_041_partial_18_0891 : Poly :=
[
  term ((1546498620246285756508053211098952436063700647960654669609856000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 2), (15, 2)],
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 18. -/
theorem ep_Q2_041_partial_18_0891_valid :
    mulPoly ep_Q2_041_coefficient_18_0891
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0892 : Poly :=
[
  term ((-244258960046646809612994633373431643634786936267688655490999160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (15, 2)]
]

/-- Partial product 892 for generator 18. -/
def ep_Q2_041_partial_18_0892 : Poly :=
[
  term ((-488517920093293619225989266746863287269573872535377310981998320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (15, 2)],
  term ((244258960046646809612994633373431643634786936267688655490999160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 18. -/
theorem ep_Q2_041_partial_18_0892_valid :
    mulPoly ep_Q2_041_coefficient_18_0892
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0893 : Poly :=
[
  term ((-9583902900 : Rat) / 1706612117) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 893 for generator 18. -/
def ep_Q2_041_partial_18_0893 : Poly :=
[
  term ((-19167805800 : Rat) / 1706612117) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((9583902900 : Rat) / 1706612117) [(1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 18. -/
theorem ep_Q2_041_partial_18_0893_valid :
    mulPoly ep_Q2_041_coefficient_18_0893
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0894 : Poly :=
[
  term ((290862000 : Rat) / 243801731) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 894 for generator 18. -/
def ep_Q2_041_partial_18_0894 : Poly :=
[
  term ((581724000 : Rat) / 243801731) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-290862000 : Rat) / 243801731) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 18. -/
theorem ep_Q2_041_partial_18_0894_valid :
    mulPoly ep_Q2_041_coefficient_18_0894
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0895 : Poly :=
[
  term ((-117030320253038018650279980455791493988113766615525937721460 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 895 for generator 18. -/
def ep_Q2_041_partial_18_0895 : Poly :=
[
  term ((-234060640506076037300559960911582987976227533231051875442920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((117030320253038018650279980455791493988113766615525937721460 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 18. -/
theorem ep_Q2_041_partial_18_0895_valid :
    mulPoly ep_Q2_041_coefficient_18_0895
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0896 : Poly :=
[
  term ((108347450384917940054858402542443471270328127582531276095660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 896 for generator 18. -/
def ep_Q2_041_partial_18_0896 : Poly :=
[
  term ((216694900769835880109716805084886942540656255165062552191320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-108347450384917940054858402542443471270328127582531276095660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 18. -/
theorem ep_Q2_041_partial_18_0896_valid :
    mulPoly ep_Q2_041_coefficient_18_0896
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0897 : Poly :=
[
  term ((-60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 897 for generator 18. -/
def ep_Q2_041_partial_18_0897 : Poly :=
[
  term ((-121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 18. -/
theorem ep_Q2_041_partial_18_0897_valid :
    mulPoly ep_Q2_041_coefficient_18_0897
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0898 : Poly :=
[
  term ((33434906197597454943676817919375875847299157266224058641140 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 898 for generator 18. -/
def ep_Q2_041_partial_18_0898 : Poly :=
[
  term ((66869812395194909887353635838751751694598314532448117282280 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-33434906197597454943676817919375875847299157266224058641140 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 18. -/
theorem ep_Q2_041_partial_18_0898_valid :
    mulPoly ep_Q2_041_coefficient_18_0898
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0899 : Poly :=
[
  term ((7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 3)]
]

/-- Partial product 899 for generator 18. -/
def ep_Q2_041_partial_18_0899 : Poly :=
[
  term ((15246196908383947931339089699100298710611697191797094043853600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 3)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 18. -/
theorem ep_Q2_041_partial_18_0899_valid :
    mulPoly ep_Q2_041_coefficient_18_0899
        ep_Q2_041_generator_18_0800_0899 =
      ep_Q2_041_partial_18_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0800_0899 : List Poly :=
[
  ep_Q2_041_partial_18_0800,
  ep_Q2_041_partial_18_0801,
  ep_Q2_041_partial_18_0802,
  ep_Q2_041_partial_18_0803,
  ep_Q2_041_partial_18_0804,
  ep_Q2_041_partial_18_0805,
  ep_Q2_041_partial_18_0806,
  ep_Q2_041_partial_18_0807,
  ep_Q2_041_partial_18_0808,
  ep_Q2_041_partial_18_0809,
  ep_Q2_041_partial_18_0810,
  ep_Q2_041_partial_18_0811,
  ep_Q2_041_partial_18_0812,
  ep_Q2_041_partial_18_0813,
  ep_Q2_041_partial_18_0814,
  ep_Q2_041_partial_18_0815,
  ep_Q2_041_partial_18_0816,
  ep_Q2_041_partial_18_0817,
  ep_Q2_041_partial_18_0818,
  ep_Q2_041_partial_18_0819,
  ep_Q2_041_partial_18_0820,
  ep_Q2_041_partial_18_0821,
  ep_Q2_041_partial_18_0822,
  ep_Q2_041_partial_18_0823,
  ep_Q2_041_partial_18_0824,
  ep_Q2_041_partial_18_0825,
  ep_Q2_041_partial_18_0826,
  ep_Q2_041_partial_18_0827,
  ep_Q2_041_partial_18_0828,
  ep_Q2_041_partial_18_0829,
  ep_Q2_041_partial_18_0830,
  ep_Q2_041_partial_18_0831,
  ep_Q2_041_partial_18_0832,
  ep_Q2_041_partial_18_0833,
  ep_Q2_041_partial_18_0834,
  ep_Q2_041_partial_18_0835,
  ep_Q2_041_partial_18_0836,
  ep_Q2_041_partial_18_0837,
  ep_Q2_041_partial_18_0838,
  ep_Q2_041_partial_18_0839,
  ep_Q2_041_partial_18_0840,
  ep_Q2_041_partial_18_0841,
  ep_Q2_041_partial_18_0842,
  ep_Q2_041_partial_18_0843,
  ep_Q2_041_partial_18_0844,
  ep_Q2_041_partial_18_0845,
  ep_Q2_041_partial_18_0846,
  ep_Q2_041_partial_18_0847,
  ep_Q2_041_partial_18_0848,
  ep_Q2_041_partial_18_0849,
  ep_Q2_041_partial_18_0850,
  ep_Q2_041_partial_18_0851,
  ep_Q2_041_partial_18_0852,
  ep_Q2_041_partial_18_0853,
  ep_Q2_041_partial_18_0854,
  ep_Q2_041_partial_18_0855,
  ep_Q2_041_partial_18_0856,
  ep_Q2_041_partial_18_0857,
  ep_Q2_041_partial_18_0858,
  ep_Q2_041_partial_18_0859,
  ep_Q2_041_partial_18_0860,
  ep_Q2_041_partial_18_0861,
  ep_Q2_041_partial_18_0862,
  ep_Q2_041_partial_18_0863,
  ep_Q2_041_partial_18_0864,
  ep_Q2_041_partial_18_0865,
  ep_Q2_041_partial_18_0866,
  ep_Q2_041_partial_18_0867,
  ep_Q2_041_partial_18_0868,
  ep_Q2_041_partial_18_0869,
  ep_Q2_041_partial_18_0870,
  ep_Q2_041_partial_18_0871,
  ep_Q2_041_partial_18_0872,
  ep_Q2_041_partial_18_0873,
  ep_Q2_041_partial_18_0874,
  ep_Q2_041_partial_18_0875,
  ep_Q2_041_partial_18_0876,
  ep_Q2_041_partial_18_0877,
  ep_Q2_041_partial_18_0878,
  ep_Q2_041_partial_18_0879,
  ep_Q2_041_partial_18_0880,
  ep_Q2_041_partial_18_0881,
  ep_Q2_041_partial_18_0882,
  ep_Q2_041_partial_18_0883,
  ep_Q2_041_partial_18_0884,
  ep_Q2_041_partial_18_0885,
  ep_Q2_041_partial_18_0886,
  ep_Q2_041_partial_18_0887,
  ep_Q2_041_partial_18_0888,
  ep_Q2_041_partial_18_0889,
  ep_Q2_041_partial_18_0890,
  ep_Q2_041_partial_18_0891,
  ep_Q2_041_partial_18_0892,
  ep_Q2_041_partial_18_0893,
  ep_Q2_041_partial_18_0894,
  ep_Q2_041_partial_18_0895,
  ep_Q2_041_partial_18_0896,
  ep_Q2_041_partial_18_0897,
  ep_Q2_041_partial_18_0898,
  ep_Q2_041_partial_18_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0800_0899 : Poly :=
[
  term ((352482600559478045835153002033211196108045435903824887967300 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((510573750845447572800 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((59858838048 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26277225226938278443880935570445926517118588244726991469128760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 2)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 4)],
  term ((-14710112388 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((3219639366976911549039395954935662511998433319388286106079840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((574380516838204532094337659259597462731288828085441454055180 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (15, 1)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-394999741182975349658642848355236395908478806899968875393415480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 2)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 4)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (14, 1), (15, 1)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5067808574268728054971720978525682628678051918859868683796770659335847321 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((12414691965060 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (15, 3)],
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (15, 3), (16, 1)],
  term ((-176241300279739022917576501016605598054022717951912443983650 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (14, 1), (15, 2)],
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((13138612613469139221940467785222963258559294122363495734564380 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 2)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (11, 1), (15, 4)],
  term ((7355056194 : Rat) / 151763803) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((-287190258419102266047168829629798731365644414042720727027590 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 2), (15, 1)],
  term ((22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (14, 1), (15, 2)],
  term ((197499870591487674829321424177618197954239403449984437696707740 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (13, 1), (15, 4)],
  term ((-10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((-4039253386560 : Rat) / 275754830051) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5067808574268728054971720978525682628678051918859868683796770659335847321 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 2), (15, 1)],
  term ((-6207345982530 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (15, 3)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-4368714230056965587 : Rat) / 222001667247257958) [(1, 1), (7, 1)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-415015064574099781069336842492208830236667015855232421128067520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1048873951908810953276797658476039349704086264973333286044520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-39319389529514361252275168237118479658545449684278954613727520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((105947593212949904081095833848904664183746420679927170654410808164171711 : Rat) / 269046711403983236858352460121541671459641158947676999802372828758943) [(1, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1957636994040 : Rat) / 11989340437) [(1, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52559544065823687636 : Rat) / 259001945121800951) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-353876089948949056323014114550511809157705841026258101360879840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((210566529270579068165399500770334206903005268479078848058638232290836400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((53856711820800 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((1807924468469444915106607856880856812866089734641956403653610597414144662 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-13965880745040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((512681961034641834171427598170284419083069195159762540194652320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-904945266978005368476124060969448980761483911134562006787960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((33876928784237443896 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((32314027092480 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((29759687608 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((640740221980876210022796802594079019860072614276021773729115 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((-7397489048 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-54747531889150107036 : Rat) / 259001945121800951) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((280398222179833931990656230196059943514728583268037873561280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-7397489048 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((487878301068286333802850870371209558739574310137507009403315200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((412420746115607250924292554094955341066896920620771283474507250488250120 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-374542634590897331654294137063027543109177500677971052796137000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-776766356740165878402084299209820386459522447732852623052492419958334700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-86170738913280 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((48328081882696429890876662846842263626990645248770458425308000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 3)],
  term ((53148074950107082856329222656555806620754172840212937570480 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (11, 1), (14, 3), (15, 1)],
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((1546498620246285756508053211098952436063700647960654669609856000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 1), (11, 2), (14, 2), (15, 2)],
  term ((-19167805800 : Rat) / 1706612117) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((581724000 : Rat) / 243801731) [(1, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-234060640506076037300559960911582987976227533231051875442920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((17682224062016745631217534172818445792315504906106123650710 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-118158026039975596467877945168027315007240653236427478839865400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((63630299117972199744057649849896311439819933062218830768620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((15246196908383947931339089699100298710611697191797094043853600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 3)],
  term ((190971591319545843174783575756528894271560476719212375874100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((3576885922033166399 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 1), (14, 1)],
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3811029992 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((318060878 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((9424924568640 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1522687150 : Rat) / 151763803) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((8737428460113931174 : Rat) / 111000833623628979) [(1, 1), (7, 1), (8, 2)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((722998376806282060577367318800123917026023379244313296765613280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2)],
  term ((180320038790497006179918471841188419980200386587768250714369562165823160 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 3)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-2838691853729970475805910560415329544683633667892355053576242813248277264 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((25238925899040 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((48328081882696429890876662846842263626990645248770458425308000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 3)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 2), (14, 1), (15, 2)],
  term ((-977035840186587238451978533493726574539147745070754621963996640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (8, 2), (11, 2), (15, 2)],
  term ((185838664671437321382388131750315643988895441644639373272700 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 3)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (8, 2), (13, 1), (14, 2), (15, 1)],
  term ((-381943182639091686349567151513057788543120953438424751748200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((15246196908383947931339089699100298710611697191797094043853600 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (7, 1), (8, 2), (13, 1), (15, 3)],
  term ((-7153771844066332798 : Rat) / 37000277874542993) [(1, 1), (7, 1), (8, 2), (14, 1)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (8, 2), (14, 1), (15, 2)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7622059984 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (14, 1), (16, 1)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (7, 1), (8, 2), (14, 2)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (14, 2), (16, 1)],
  term ((-16252243794807783781470894235171777965279876604942415666981374919572175 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (7, 1), (8, 2), (15, 2)],
  term ((-18849849137280 : Rat) / 275754830051) [(1, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((3045374300 : Rat) / 151763803) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((207507532287049890534668421246104415118333507927616210564033760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((524436975954405476638398829238019674852043132486666643022260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((19659694764757180626137584118559239829272724842139477306863760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-105947593212949904081095833848904664183746420679927170654410808164171711 : Rat) / 538093422807966473716704920243083342919282317895353999604745657517886) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-978818497020 : Rat) / 11989340437) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((26279772032911843818 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 1)],
  term ((152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-26928355910400 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-903962234234722457553303928440428406433044867320978201826805298707072331 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((6982940372520 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (10, 1), (11, 2), (15, 2)],
  term ((452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (7, 1), (10, 1), (14, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14879843804 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-640740221980876210022796802594079019860072614276021773729115 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (7, 1), (10, 2)],
  term ((-140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((3698744524 : Rat) / 151763803) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-180749594201570515144341829700030979256505844811078324191403320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-251290382755427877007125895007774775528498556957327704415846015785580850 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((6732088977600 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 3)],
  term ((401207036948561954521178284992853242776001600464803060282345497059350020 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 3)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (11, 1), (14, 3), (15, 1)],
  term ((709672963432492618951477640103832386170908416973088763394060703312069316 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6309731474760 : Rat) / 275754830051) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12082020470674107472719165711710565906747661312192614606327000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((-120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((244258960046646809612994633373431643634786936267688655490999160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (7, 1), (11, 2), (15, 2)],
  term ((9583902900 : Rat) / 1706612117) [(1, 1), (7, 1), (12, 1)],
  term ((-290862000 : Rat) / 243801731) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((117030320253038018650279980455791493988113766615525937721460 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-108347450384917940054858402542443471270328127582531276095660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 3)],
  term ((-33434906197597454943676817919375875847299157266224058641140 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 800 through 899. -/
theorem ep_Q2_041_block_18_0800_0899_valid :
    checkProductSumEq ep_Q2_041_partials_18_0800_0899
      ep_Q2_041_block_18_0800_0899 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
