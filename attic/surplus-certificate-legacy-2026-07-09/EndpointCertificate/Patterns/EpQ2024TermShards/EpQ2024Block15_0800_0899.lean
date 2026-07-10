/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0800 : Poly :=
[
  term ((-1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (7, 1), (9, 1)]
]

/-- Partial product 800 for generator 15. -/
def ep_Q2_024_partial_15_0800 : Poly :=
[
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 15. -/
theorem ep_Q2_024_partial_15_0800_valid :
    mulPoly ep_Q2_024_coefficient_15_0800
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0801 : Poly :=
[
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 801 for generator 15. -/
def ep_Q2_024_partial_15_0801 : Poly :=
[
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 15. -/
theorem ep_Q2_024_partial_15_0801_valid :
    mulPoly ep_Q2_024_coefficient_15_0801
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0802 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 802 for generator 15. -/
def ep_Q2_024_partial_15_0802 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 15. -/
theorem ep_Q2_024_partial_15_0802_valid :
    mulPoly ep_Q2_024_coefficient_15_0802
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0803 : Poly :=
[
  term ((69367473696382 : Rat) / 1162780221153193) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 803 for generator 15. -/
def ep_Q2_024_partial_15_0803 : Poly :=
[
  term ((138734947392764 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 15. -/
theorem ep_Q2_024_partial_15_0803_valid :
    mulPoly ep_Q2_024_coefficient_15_0803
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0804 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 1)]
]

/-- Partial product 804 for generator 15. -/
def ep_Q2_024_partial_15_0804 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (8, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 15. -/
theorem ep_Q2_024_partial_15_0804_valid :
    mulPoly ep_Q2_024_coefficient_15_0804
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0805 : Poly :=
[
  term ((121884141001566718963734554791836816264 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 805 for generator 15. -/
def ep_Q2_024_partial_15_0805 : Poly :=
[
  term ((243768282003133437927469109583673632528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-121884141001566718963734554791836816264 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 15. -/
theorem ep_Q2_024_partial_15_0805_valid :
    mulPoly ep_Q2_024_coefficient_15_0805
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0806 : Poly :=
[
  term ((4693433831329107276367288087926164304427312821418046011 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 806 for generator 15. -/
def ep_Q2_024_partial_15_0806 : Poly :=
[
  term ((4693433831329107276367288087926164304427312821418046011 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4693433831329107276367288087926164304427312821418046011 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 15. -/
theorem ep_Q2_024_partial_15_0806_valid :
    mulPoly ep_Q2_024_coefficient_15_0806
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0807 : Poly :=
[
  term ((71768591212414 : Rat) / 1162780221153193) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 15. -/
def ep_Q2_024_partial_15_0807 : Poly :=
[
  term ((143537182424828 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71768591212414 : Rat) / 1162780221153193) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 15. -/
theorem ep_Q2_024_partial_15_0807_valid :
    mulPoly ep_Q2_024_coefficient_15_0807
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0808 : Poly :=
[
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (4, 1), (9, 2)]
]

/-- Partial product 808 for generator 15. -/
def ep_Q2_024_partial_15_0808 : Poly :=
[
  term ((-364963913710038598414892315328730093496 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 15. -/
theorem ep_Q2_024_partial_15_0808_valid :
    mulPoly ep_Q2_024_coefficient_15_0808
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0809 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (12, 1)]
]

/-- Partial product 809 for generator 15. -/
def ep_Q2_024_partial_15_0809 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 15. -/
theorem ep_Q2_024_partial_15_0809_valid :
    mulPoly ep_Q2_024_coefficient_15_0809
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0810 : Poly :=
[
  term ((-284233514493236255412348277018777791924123681200053817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 810 for generator 15. -/
def ep_Q2_024_partial_15_0810 : Poly :=
[
  term ((-568467028986472510824696554037555583848247362400107634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((284233514493236255412348277018777791924123681200053817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 15. -/
theorem ep_Q2_024_partial_15_0810_valid :
    mulPoly ep_Q2_024_coefficient_15_0810
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0811 : Poly :=
[
  term ((-524477845721972 : Rat) / 1162780221153193) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 15. -/
def ep_Q2_024_partial_15_0811 : Poly :=
[
  term ((-1048955691443944 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((524477845721972 : Rat) / 1162780221153193) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 15. -/
theorem ep_Q2_024_partial_15_0811_valid :
    mulPoly ep_Q2_024_coefficient_15_0811
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0812 : Poly :=
[
  term ((115427765977659213376592589270910765168 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (13, 2)]
]

/-- Partial product 812 for generator 15. -/
def ep_Q2_024_partial_15_0812 : Poly :=
[
  term ((230855531955318426753185178541821530336 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-115427765977659213376592589270910765168 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 15. -/
theorem ep_Q2_024_partial_15_0812_valid :
    mulPoly ep_Q2_024_coefficient_15_0812
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0813 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (14, 1)]
]

/-- Partial product 813 for generator 15. -/
def ep_Q2_024_partial_15_0813 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 15. -/
theorem ep_Q2_024_partial_15_0813_valid :
    mulPoly ep_Q2_024_coefficient_15_0813
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0814 : Poly :=
[
  term ((3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (15, 2)]
]

/-- Partial product 814 for generator 15. -/
def ep_Q2_024_partial_15_0814 : Poly :=
[
  term ((7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 15. -/
theorem ep_Q2_024_partial_15_0814_valid :
    mulPoly ep_Q2_024_coefficient_15_0814
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0815 : Poly :=
[
  term ((-532555266735604 : Rat) / 1162780221153193) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 815 for generator 15. -/
def ep_Q2_024_partial_15_0815 : Poly :=
[
  term ((-1065110533471208 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((532555266735604 : Rat) / 1162780221153193) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 15. -/
theorem ep_Q2_024_partial_15_0815_valid :
    mulPoly ep_Q2_024_coefficient_15_0815
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0816 : Poly :=
[
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 816 for generator 15. -/
def ep_Q2_024_partial_15_0816 : Poly :=
[
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 15. -/
theorem ep_Q2_024_partial_15_0816_valid :
    mulPoly ep_Q2_024_coefficient_15_0816
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0817 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 817 for generator 15. -/
def ep_Q2_024_partial_15_0817 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 15. -/
theorem ep_Q2_024_partial_15_0817_valid :
    mulPoly ep_Q2_024_coefficient_15_0817
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0818 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 818 for generator 15. -/
def ep_Q2_024_partial_15_0818 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 15. -/
theorem ep_Q2_024_partial_15_0818_valid :
    mulPoly ep_Q2_024_coefficient_15_0818
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0819 : Poly :=
[
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 2)]
]

/-- Partial product 819 for generator 15. -/
def ep_Q2_024_partial_15_0819 : Poly :=
[
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 2)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 15. -/
theorem ep_Q2_024_partial_15_0819_valid :
    mulPoly ep_Q2_024_coefficient_15_0819
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0820 : Poly :=
[
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 820 for generator 15. -/
def ep_Q2_024_partial_15_0820 : Poly :=
[
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 15. -/
theorem ep_Q2_024_partial_15_0820_valid :
    mulPoly ep_Q2_024_coefficient_15_0820
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0821 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 821 for generator 15. -/
def ep_Q2_024_partial_15_0821 : Poly :=
[
  term ((-6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 15. -/
theorem ep_Q2_024_partial_15_0821_valid :
    mulPoly ep_Q2_024_coefficient_15_0821
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0822 : Poly :=
[
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (7, 1), (13, 2)]
]

/-- Partial product 822 for generator 15. -/
def ep_Q2_024_partial_15_0822 : Poly :=
[
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 15. -/
theorem ep_Q2_024_partial_15_0822_valid :
    mulPoly ep_Q2_024_coefficient_15_0822
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0823 : Poly :=
[
  term ((84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 823 for generator 15. -/
def ep_Q2_024_partial_15_0823 : Poly :=
[
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 15. -/
theorem ep_Q2_024_partial_15_0823_valid :
    mulPoly ep_Q2_024_coefficient_15_0823
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0824 : Poly :=
[
  term ((69639142918388545270440496889540932984 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 824 for generator 15. -/
def ep_Q2_024_partial_15_0824 : Poly :=
[
  term ((139278285836777090540880993779081865968 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-69639142918388545270440496889540932984 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 15. -/
theorem ep_Q2_024_partial_15_0824_valid :
    mulPoly ep_Q2_024_coefficient_15_0824
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0825 : Poly :=
[
  term ((-1179598144194433332727423675159090332557179231896216827 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 825 for generator 15. -/
def ep_Q2_024_partial_15_0825 : Poly :=
[
  term ((-1179598144194433332727423675159090332557179231896216827 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((1179598144194433332727423675159090332557179231896216827 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 15. -/
theorem ep_Q2_024_partial_15_0825_valid :
    mulPoly ep_Q2_024_coefficient_15_0825
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0826 : Poly :=
[
  term ((-1206404780053702 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 826 for generator 15. -/
def ep_Q2_024_partial_15_0826 : Poly :=
[
  term ((-2412809560107404 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1206404780053702 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 15. -/
theorem ep_Q2_024_partial_15_0826_valid :
    mulPoly ep_Q2_024_coefficient_15_0826
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0827 : Poly :=
[
  term ((4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 827 for generator 15. -/
def ep_Q2_024_partial_15_0827 : Poly :=
[
  term ((8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (6, 1), (9, 1)],
  term ((-4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 15. -/
theorem ep_Q2_024_partial_15_0827_valid :
    mulPoly ep_Q2_024_coefficient_15_0827
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0828 : Poly :=
[
  term ((-169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (12, 1)]
]

/-- Partial product 828 for generator 15. -/
def ep_Q2_024_partial_15_0828 : Poly :=
[
  term ((-339031506386646751182821311930920999056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 15. -/
theorem ep_Q2_024_partial_15_0828_valid :
    mulPoly ep_Q2_024_coefficient_15_0828
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0829 : Poly :=
[
  term ((3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 829 for generator 15. -/
def ep_Q2_024_partial_15_0829 : Poly :=
[
  term ((7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 15. -/
theorem ep_Q2_024_partial_15_0829_valid :
    mulPoly ep_Q2_024_coefficient_15_0829
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0830 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 830 for generator 15. -/
def ep_Q2_024_partial_15_0830 : Poly :=
[
  term ((-301322371177440 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 15. -/
theorem ep_Q2_024_partial_15_0830_valid :
    mulPoly ep_Q2_024_coefficient_15_0830
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0831 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 831 for generator 15. -/
def ep_Q2_024_partial_15_0831 : Poly :=
[
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 15. -/
theorem ep_Q2_024_partial_15_0831_valid :
    mulPoly ep_Q2_024_coefficient_15_0831
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0832 : Poly :=
[
  term ((94061566350324977994525567122572892840 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 832 for generator 15. -/
def ep_Q2_024_partial_15_0832 : Poly :=
[
  term ((188123132700649955989051134245145785680 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-94061566350324977994525567122572892840 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 15. -/
theorem ep_Q2_024_partial_15_0832_valid :
    mulPoly ep_Q2_024_coefficient_15_0832
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0833 : Poly :=
[
  term ((-2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 833 for generator 15. -/
def ep_Q2_024_partial_15_0833 : Poly :=
[
  term ((-4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 15. -/
theorem ep_Q2_024_partial_15_0833_valid :
    mulPoly ep_Q2_024_coefficient_15_0833
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0834 : Poly :=
[
  term ((333710849224016 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 834 for generator 15. -/
def ep_Q2_024_partial_15_0834 : Poly :=
[
  term ((667421698448032 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-333710849224016 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 15. -/
theorem ep_Q2_024_partial_15_0834_valid :
    mulPoly ep_Q2_024_coefficient_15_0834
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0835 : Poly :=
[
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 835 for generator 15. -/
def ep_Q2_024_partial_15_0835 : Poly :=
[
  term ((-872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 15. -/
theorem ep_Q2_024_partial_15_0835_valid :
    mulPoly ep_Q2_024_coefficient_15_0835
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0836 : Poly :=
[
  term ((4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (9, 2), (15, 1)]
]

/-- Partial product 836 for generator 15. -/
def ep_Q2_024_partial_15_0836 : Poly :=
[
  term ((8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 15. -/
theorem ep_Q2_024_partial_15_0836_valid :
    mulPoly ep_Q2_024_coefficient_15_0836
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0837 : Poly :=
[
  term ((-5884563396179416 : Rat) / 3488340663459579) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 837 for generator 15. -/
def ep_Q2_024_partial_15_0837 : Poly :=
[
  term ((-11769126792358832 : Rat) / 3488340663459579) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((5884563396179416 : Rat) / 3488340663459579) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 15. -/
theorem ep_Q2_024_partial_15_0837_valid :
    mulPoly ep_Q2_024_coefficient_15_0837
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0838 : Poly :=
[
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 3)]
]

/-- Partial product 838 for generator 15. -/
def ep_Q2_024_partial_15_0838 : Poly :=
[
  term ((-740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 3)],
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 15. -/
theorem ep_Q2_024_partial_15_0838_valid :
    mulPoly ep_Q2_024_coefficient_15_0838
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0839 : Poly :=
[
  term ((-162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 839 for generator 15. -/
def ep_Q2_024_partial_15_0839 : Poly :=
[
  term ((-325162578221750417795303693212385244384 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 15. -/
theorem ep_Q2_024_partial_15_0839_valid :
    mulPoly ep_Q2_024_coefficient_15_0839
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0840 : Poly :=
[
  term ((-841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 840 for generator 15. -/
def ep_Q2_024_partial_15_0840 : Poly :=
[
  term ((-1682740129586670585044858255203612183628883081175876154 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 15. -/
theorem ep_Q2_024_partial_15_0840_valid :
    mulPoly ep_Q2_024_coefficient_15_0840
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0841 : Poly :=
[
  term ((3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 15. -/
def ep_Q2_024_partial_15_0841 : Poly :=
[
  term ((7520384446792408 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 15. -/
theorem ep_Q2_024_partial_15_0841_valid :
    mulPoly ep_Q2_024_coefficient_15_0841
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0842 : Poly :=
[
  term ((234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 842 for generator 15. -/
def ep_Q2_024_partial_15_0842 : Poly :=
[
  term ((469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 15. -/
theorem ep_Q2_024_partial_15_0842_valid :
    mulPoly ep_Q2_024_coefficient_15_0842
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0843 : Poly :=
[
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 843 for generator 15. -/
def ep_Q2_024_partial_15_0843 : Poly :=
[
  term ((-80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 15. -/
theorem ep_Q2_024_partial_15_0843_valid :
    mulPoly ep_Q2_024_coefficient_15_0843
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0844 : Poly :=
[
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 844 for generator 15. -/
def ep_Q2_024_partial_15_0844 : Poly :=
[
  term ((855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 15. -/
theorem ep_Q2_024_partial_15_0844_valid :
    mulPoly ep_Q2_024_coefficient_15_0844
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0845 : Poly :=
[
  term ((141136064908796 : Rat) / 1162780221153193) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 845 for generator 15. -/
def ep_Q2_024_partial_15_0845 : Poly :=
[
  term ((282272129817592 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141136064908796 : Rat) / 1162780221153193) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 15. -/
theorem ep_Q2_024_partial_15_0845_valid :
    mulPoly ep_Q2_024_coefficient_15_0845
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0846 : Poly :=
[
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 846 for generator 15. -/
def ep_Q2_024_partial_15_0846 : Poly :=
[
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 15. -/
theorem ep_Q2_024_partial_15_0846_valid :
    mulPoly ep_Q2_024_coefficient_15_0846
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0847 : Poly :=
[
  term ((-1880096111698102 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 847 for generator 15. -/
def ep_Q2_024_partial_15_0847 : Poly :=
[
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 15. -/
theorem ep_Q2_024_partial_15_0847_valid :
    mulPoly ep_Q2_024_coefficient_15_0847
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0848 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 1), (13, 1)]
]

/-- Partial product 848 for generator 15. -/
def ep_Q2_024_partial_15_0848 : Poly :=
[
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 15. -/
theorem ep_Q2_024_partial_15_0848_valid :
    mulPoly ep_Q2_024_coefficient_15_0848
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0849 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (9, 1), (15, 1)]
]

/-- Partial product 849 for generator 15. -/
def ep_Q2_024_partial_15_0849 : Poly :=
[
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 15. -/
theorem ep_Q2_024_partial_15_0849_valid :
    mulPoly ep_Q2_024_coefficient_15_0849
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0850 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 850 for generator 15. -/
def ep_Q2_024_partial_15_0850 : Poly :=
[
  term ((-413883074046464 : Rat) / 1162780221153193) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 15. -/
theorem ep_Q2_024_partial_15_0850_valid :
    mulPoly ep_Q2_024_coefficient_15_0850
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0851 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 2)]
]

/-- Partial product 851 for generator 15. -/
def ep_Q2_024_partial_15_0851 : Poly :=
[
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 15. -/
theorem ep_Q2_024_partial_15_0851_valid :
    mulPoly ep_Q2_024_coefficient_15_0851
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0852 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 852 for generator 15. -/
def ep_Q2_024_partial_15_0852 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 15. -/
theorem ep_Q2_024_partial_15_0852_valid :
    mulPoly ep_Q2_024_coefficient_15_0852
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0853 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 853 for generator 15. -/
def ep_Q2_024_partial_15_0853 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 15. -/
theorem ep_Q2_024_partial_15_0853_valid :
    mulPoly ep_Q2_024_coefficient_15_0853
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0854 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 15. -/
def ep_Q2_024_partial_15_0854 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 15. -/
theorem ep_Q2_024_partial_15_0854_valid :
    mulPoly ep_Q2_024_coefficient_15_0854
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0855 : Poly :=
[
  term ((370026087929595206242150969987290070120 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 855 for generator 15. -/
def ep_Q2_024_partial_15_0855 : Poly :=
[
  term ((-370026087929595206242150969987290070120 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((740052175859190412484301939974580140240 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 15. -/
theorem ep_Q2_024_partial_15_0855_valid :
    mulPoly ep_Q2_024_coefficient_15_0855
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0856 : Poly :=
[
  term ((18397952715093612131181524355533874397832578418921958842 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 856 for generator 15. -/
def ep_Q2_024_partial_15_0856 : Poly :=
[
  term ((-18397952715093612131181524355533874397832578418921958842 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((36795905430187224262363048711067748795665156837843917684 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 15. -/
theorem ep_Q2_024_partial_15_0856_valid :
    mulPoly ep_Q2_024_coefficient_15_0856
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0857 : Poly :=
[
  term ((7038262316983652 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 857 for generator 15. -/
def ep_Q2_024_partial_15_0857 : Poly :=
[
  term ((-7038262316983652 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14076524633967304 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 15. -/
theorem ep_Q2_024_partial_15_0857_valid :
    mulPoly ep_Q2_024_coefficient_15_0857
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0858 : Poly :=
[
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2)]
]

/-- Partial product 858 for generator 15. -/
def ep_Q2_024_partial_15_0858 : Poly :=
[
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2)],
  term ((-3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 15. -/
theorem ep_Q2_024_partial_15_0858_valid :
    mulPoly ep_Q2_024_coefficient_15_0858
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0859 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 859 for generator 15. -/
def ep_Q2_024_partial_15_0859 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 15. -/
theorem ep_Q2_024_partial_15_0859_valid :
    mulPoly ep_Q2_024_coefficient_15_0859
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0860 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 860 for generator 15. -/
def ep_Q2_024_partial_15_0860 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 15. -/
theorem ep_Q2_024_partial_15_0860_valid :
    mulPoly ep_Q2_024_coefficient_15_0860
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0861 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (13, 2)]
]

/-- Partial product 861 for generator 15. -/
def ep_Q2_024_partial_15_0861 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 15. -/
theorem ep_Q2_024_partial_15_0861_valid :
    mulPoly ep_Q2_024_coefficient_15_0861
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0862 : Poly :=
[
  term ((-6163560842684798122109053924082888245029384115763673392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 862 for generator 15. -/
def ep_Q2_024_partial_15_0862 : Poly :=
[
  term ((6163560842684798122109053924082888245029384115763673392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-12327121685369596244218107848165776490058768231527346784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 15. -/
theorem ep_Q2_024_partial_15_0862_valid :
    mulPoly ep_Q2_024_coefficient_15_0862
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0863 : Poly :=
[
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 863 for generator 15. -/
def ep_Q2_024_partial_15_0863 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 15. -/
theorem ep_Q2_024_partial_15_0863_valid :
    mulPoly ep_Q2_024_coefficient_15_0863
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0864 : Poly :=
[
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (13, 2)]
]

/-- Partial product 864 for generator 15. -/
def ep_Q2_024_partial_15_0864 : Poly :=
[
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (13, 2)],
  term ((-104340258137532860613207572936842294120 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 15. -/
theorem ep_Q2_024_partial_15_0864_valid :
    mulPoly ep_Q2_024_coefficient_15_0864
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0865 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (6, 1), (15, 2)]
]

/-- Partial product 865 for generator 15. -/
def ep_Q2_024_partial_15_0865 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (6, 1), (15, 2)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 15. -/
theorem ep_Q2_024_partial_15_0865_valid :
    mulPoly ep_Q2_024_coefficient_15_0865
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0866 : Poly :=
[
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 866 for generator 15. -/
def ep_Q2_024_partial_15_0866 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 15. -/
theorem ep_Q2_024_partial_15_0866_valid :
    mulPoly ep_Q2_024_coefficient_15_0866
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0867 : Poly :=
[
  term ((2433104610909956794632851009651546157332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 867 for generator 15. -/
def ep_Q2_024_partial_15_0867 : Poly :=
[
  term ((4866209221819913589265702019303092314664 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-2433104610909956794632851009651546157332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 15. -/
theorem ep_Q2_024_partial_15_0867_valid :
    mulPoly ep_Q2_024_coefficient_15_0867
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0868 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 868 for generator 15. -/
def ep_Q2_024_partial_15_0868 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 15. -/
theorem ep_Q2_024_partial_15_0868_valid :
    mulPoly ep_Q2_024_coefficient_15_0868
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0869 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 869 for generator 15. -/
def ep_Q2_024_partial_15_0869 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 15. -/
theorem ep_Q2_024_partial_15_0869_valid :
    mulPoly ep_Q2_024_coefficient_15_0869
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0870 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 870 for generator 15. -/
def ep_Q2_024_partial_15_0870 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 15. -/
theorem ep_Q2_024_partial_15_0870_valid :
    mulPoly ep_Q2_024_coefficient_15_0870
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0871 : Poly :=
[
  term ((-1069720957038497888952977745158641142996 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 871 for generator 15. -/
def ep_Q2_024_partial_15_0871 : Poly :=
[
  term ((-2139441914076995777905955490317282285992 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((1069720957038497888952977745158641142996 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 15. -/
theorem ep_Q2_024_partial_15_0871_valid :
    mulPoly ep_Q2_024_coefficient_15_0871
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0872 : Poly :=
[
  term ((-1124174860338819774496910711133364898998842270869464346 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 872 for generator 15. -/
def ep_Q2_024_partial_15_0872 : Poly :=
[
  term ((-2248349720677639548993821422266729797997684541738928692 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((1124174860338819774496910711133364898998842270869464346 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 15. -/
theorem ep_Q2_024_partial_15_0872_valid :
    mulPoly ep_Q2_024_coefficient_15_0872
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0873 : Poly :=
[
  term ((-7038262316983652 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 873 for generator 15. -/
def ep_Q2_024_partial_15_0873 : Poly :=
[
  term ((-14076524633967304 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7038262316983652 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 15. -/
theorem ep_Q2_024_partial_15_0873_valid :
    mulPoly ep_Q2_024_coefficient_15_0873
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0874 : Poly :=
[
  term ((291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 874 for generator 15. -/
def ep_Q2_024_partial_15_0874 : Poly :=
[
  term ((582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 15. -/
theorem ep_Q2_024_partial_15_0874_valid :
    mulPoly ep_Q2_024_coefficient_15_0874
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0875 : Poly :=
[
  term ((-2943663351906092485724427387151965441362 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 875 for generator 15. -/
def ep_Q2_024_partial_15_0875 : Poly :=
[
  term ((-5887326703812184971448854774303930882724 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((2943663351906092485724427387151965441362 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 15. -/
theorem ep_Q2_024_partial_15_0875_valid :
    mulPoly ep_Q2_024_coefficient_15_0875
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0876 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 876 for generator 15. -/
def ep_Q2_024_partial_15_0876 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 15. -/
theorem ep_Q2_024_partial_15_0876_valid :
    mulPoly ep_Q2_024_coefficient_15_0876
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0877 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 877 for generator 15. -/
def ep_Q2_024_partial_15_0877 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 15. -/
theorem ep_Q2_024_partial_15_0877_valid :
    mulPoly ep_Q2_024_coefficient_15_0877
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0878 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 878 for generator 15. -/
def ep_Q2_024_partial_15_0878 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 15. -/
theorem ep_Q2_024_partial_15_0878_valid :
    mulPoly ep_Q2_024_coefficient_15_0878
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0879 : Poly :=
[
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 879 for generator 15. -/
def ep_Q2_024_partial_15_0879 : Poly :=
[
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 15. -/
theorem ep_Q2_024_partial_15_0879_valid :
    mulPoly ep_Q2_024_coefficient_15_0879
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0880 : Poly :=
[
  term ((1687313560550815 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 15. -/
def ep_Q2_024_partial_15_0880 : Poly :=
[
  term ((3374627121101630 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 15. -/
theorem ep_Q2_024_partial_15_0880_valid :
    mulPoly ep_Q2_024_coefficient_15_0880
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0881 : Poly :=
[
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (13, 2)]
]

/-- Partial product 881 for generator 15. -/
def ep_Q2_024_partial_15_0881 : Poly :=
[
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 15. -/
theorem ep_Q2_024_partial_15_0881_valid :
    mulPoly ep_Q2_024_coefficient_15_0881
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0882 : Poly :=
[
  term ((-617392832708908980622201203927429327571 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 882 for generator 15. -/
def ep_Q2_024_partial_15_0882 : Poly :=
[
  term ((-1234785665417817961244402407854858655142 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((617392832708908980622201203927429327571 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 15. -/
theorem ep_Q2_024_partial_15_0882_valid :
    mulPoly ep_Q2_024_coefficient_15_0882
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0883 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 883 for generator 15. -/
def ep_Q2_024_partial_15_0883 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 15. -/
theorem ep_Q2_024_partial_15_0883_valid :
    mulPoly ep_Q2_024_coefficient_15_0883
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0884 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 884 for generator 15. -/
def ep_Q2_024_partial_15_0884 : Poly :=
[
  term ((4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 15. -/
theorem ep_Q2_024_partial_15_0884_valid :
    mulPoly ep_Q2_024_coefficient_15_0884
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0885 : Poly :=
[
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 2), (13, 1)]
]

/-- Partial product 885 for generator 15. -/
def ep_Q2_024_partial_15_0885 : Poly :=
[
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 2), (13, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 15. -/
theorem ep_Q2_024_partial_15_0885_valid :
    mulPoly ep_Q2_024_coefficient_15_0885
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0886 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (9, 2), (15, 1)]
]

/-- Partial product 886 for generator 15. -/
def ep_Q2_024_partial_15_0886 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 15. -/
theorem ep_Q2_024_partial_15_0886_valid :
    mulPoly ep_Q2_024_coefficient_15_0886
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0887 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 887 for generator 15. -/
def ep_Q2_024_partial_15_0887 : Poly :=
[
  term ((-3737871123862340 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 15. -/
theorem ep_Q2_024_partial_15_0887_valid :
    mulPoly ep_Q2_024_coefficient_15_0887
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0888 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 3)]
]

/-- Partial product 888 for generator 15. -/
def ep_Q2_024_partial_15_0888 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 3)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 15. -/
theorem ep_Q2_024_partial_15_0888_valid :
    mulPoly ep_Q2_024_coefficient_15_0888
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0889 : Poly :=
[
  term ((301644566342456423489427398051050512538 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 889 for generator 15. -/
def ep_Q2_024_partial_15_0889 : Poly :=
[
  term ((603289132684912846978854796102101025076 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-301644566342456423489427398051050512538 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 15. -/
theorem ep_Q2_024_partial_15_0889_valid :
    mulPoly ep_Q2_024_coefficient_15_0889
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0890 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 890 for generator 15. -/
def ep_Q2_024_partial_15_0890 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 15. -/
theorem ep_Q2_024_partial_15_0890_valid :
    mulPoly ep_Q2_024_coefficient_15_0890
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0891 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 891 for generator 15. -/
def ep_Q2_024_partial_15_0891 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 15. -/
theorem ep_Q2_024_partial_15_0891_valid :
    mulPoly ep_Q2_024_coefficient_15_0891
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0892 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 892 for generator 15. -/
def ep_Q2_024_partial_15_0892 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 15. -/
theorem ep_Q2_024_partial_15_0892_valid :
    mulPoly ep_Q2_024_coefficient_15_0892
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0893 : Poly :=
[
  term ((15259124911152603794754292048358281017243216287872898521 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 893 for generator 15. -/
def ep_Q2_024_partial_15_0893 : Poly :=
[
  term ((15259124911152603794754292048358281017243216287872898521 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-15259124911152603794754292048358281017243216287872898521 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 15. -/
theorem ep_Q2_024_partial_15_0893_valid :
    mulPoly ep_Q2_024_coefficient_15_0893
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0894 : Poly :=
[
  term ((13837294982849226 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 894 for generator 15. -/
def ep_Q2_024_partial_15_0894 : Poly :=
[
  term ((27674589965698452 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13837294982849226 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 15. -/
theorem ep_Q2_024_partial_15_0894_valid :
    mulPoly ep_Q2_024_coefficient_15_0894
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0895 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 895 for generator 15. -/
def ep_Q2_024_partial_15_0895 : Poly :=
[
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 15. -/
theorem ep_Q2_024_partial_15_0895_valid :
    mulPoly ep_Q2_024_coefficient_15_0895
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0896 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 896 for generator 15. -/
def ep_Q2_024_partial_15_0896 : Poly :=
[
  term ((366976486226976789479436493368233993105393920350856634 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 15. -/
theorem ep_Q2_024_partial_15_0896_valid :
    mulPoly ep_Q2_024_coefficient_15_0896
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0897 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 897 for generator 15. -/
def ep_Q2_024_partial_15_0897 : Poly :=
[
  term ((-1737846722105288 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 15. -/
theorem ep_Q2_024_partial_15_0897_valid :
    mulPoly ep_Q2_024_coefficient_15_0897
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0898 : Poly :=
[
  term ((213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 898 for generator 15. -/
def ep_Q2_024_partial_15_0898 : Poly :=
[
  term ((426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 15. -/
theorem ep_Q2_024_partial_15_0898_valid :
    mulPoly ep_Q2_024_coefficient_15_0898
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0899 : Poly :=
[
  term ((-1809543430470687885176163551077537002961 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 899 for generator 15. -/
def ep_Q2_024_partial_15_0899 : Poly :=
[
  term ((-3619086860941375770352327102155074005922 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((1809543430470687885176163551077537002961 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 15. -/
theorem ep_Q2_024_partial_15_0899_valid :
    mulPoly ep_Q2_024_coefficient_15_0899
        ep_Q2_024_generator_15_0800_0899 =
      ep_Q2_024_partial_15_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0800_0899 : List Poly :=
[
  ep_Q2_024_partial_15_0800,
  ep_Q2_024_partial_15_0801,
  ep_Q2_024_partial_15_0802,
  ep_Q2_024_partial_15_0803,
  ep_Q2_024_partial_15_0804,
  ep_Q2_024_partial_15_0805,
  ep_Q2_024_partial_15_0806,
  ep_Q2_024_partial_15_0807,
  ep_Q2_024_partial_15_0808,
  ep_Q2_024_partial_15_0809,
  ep_Q2_024_partial_15_0810,
  ep_Q2_024_partial_15_0811,
  ep_Q2_024_partial_15_0812,
  ep_Q2_024_partial_15_0813,
  ep_Q2_024_partial_15_0814,
  ep_Q2_024_partial_15_0815,
  ep_Q2_024_partial_15_0816,
  ep_Q2_024_partial_15_0817,
  ep_Q2_024_partial_15_0818,
  ep_Q2_024_partial_15_0819,
  ep_Q2_024_partial_15_0820,
  ep_Q2_024_partial_15_0821,
  ep_Q2_024_partial_15_0822,
  ep_Q2_024_partial_15_0823,
  ep_Q2_024_partial_15_0824,
  ep_Q2_024_partial_15_0825,
  ep_Q2_024_partial_15_0826,
  ep_Q2_024_partial_15_0827,
  ep_Q2_024_partial_15_0828,
  ep_Q2_024_partial_15_0829,
  ep_Q2_024_partial_15_0830,
  ep_Q2_024_partial_15_0831,
  ep_Q2_024_partial_15_0832,
  ep_Q2_024_partial_15_0833,
  ep_Q2_024_partial_15_0834,
  ep_Q2_024_partial_15_0835,
  ep_Q2_024_partial_15_0836,
  ep_Q2_024_partial_15_0837,
  ep_Q2_024_partial_15_0838,
  ep_Q2_024_partial_15_0839,
  ep_Q2_024_partial_15_0840,
  ep_Q2_024_partial_15_0841,
  ep_Q2_024_partial_15_0842,
  ep_Q2_024_partial_15_0843,
  ep_Q2_024_partial_15_0844,
  ep_Q2_024_partial_15_0845,
  ep_Q2_024_partial_15_0846,
  ep_Q2_024_partial_15_0847,
  ep_Q2_024_partial_15_0848,
  ep_Q2_024_partial_15_0849,
  ep_Q2_024_partial_15_0850,
  ep_Q2_024_partial_15_0851,
  ep_Q2_024_partial_15_0852,
  ep_Q2_024_partial_15_0853,
  ep_Q2_024_partial_15_0854,
  ep_Q2_024_partial_15_0855,
  ep_Q2_024_partial_15_0856,
  ep_Q2_024_partial_15_0857,
  ep_Q2_024_partial_15_0858,
  ep_Q2_024_partial_15_0859,
  ep_Q2_024_partial_15_0860,
  ep_Q2_024_partial_15_0861,
  ep_Q2_024_partial_15_0862,
  ep_Q2_024_partial_15_0863,
  ep_Q2_024_partial_15_0864,
  ep_Q2_024_partial_15_0865,
  ep_Q2_024_partial_15_0866,
  ep_Q2_024_partial_15_0867,
  ep_Q2_024_partial_15_0868,
  ep_Q2_024_partial_15_0869,
  ep_Q2_024_partial_15_0870,
  ep_Q2_024_partial_15_0871,
  ep_Q2_024_partial_15_0872,
  ep_Q2_024_partial_15_0873,
  ep_Q2_024_partial_15_0874,
  ep_Q2_024_partial_15_0875,
  ep_Q2_024_partial_15_0876,
  ep_Q2_024_partial_15_0877,
  ep_Q2_024_partial_15_0878,
  ep_Q2_024_partial_15_0879,
  ep_Q2_024_partial_15_0880,
  ep_Q2_024_partial_15_0881,
  ep_Q2_024_partial_15_0882,
  ep_Q2_024_partial_15_0883,
  ep_Q2_024_partial_15_0884,
  ep_Q2_024_partial_15_0885,
  ep_Q2_024_partial_15_0886,
  ep_Q2_024_partial_15_0887,
  ep_Q2_024_partial_15_0888,
  ep_Q2_024_partial_15_0889,
  ep_Q2_024_partial_15_0890,
  ep_Q2_024_partial_15_0891,
  ep_Q2_024_partial_15_0892,
  ep_Q2_024_partial_15_0893,
  ep_Q2_024_partial_15_0894,
  ep_Q2_024_partial_15_0895,
  ep_Q2_024_partial_15_0896,
  ep_Q2_024_partial_15_0897,
  ep_Q2_024_partial_15_0898,
  ep_Q2_024_partial_15_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0800_0899 : Poly :=
[
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((138734947392764 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (8, 1)],
  term ((243768282003133437927469109583673632528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((4693433831329107276367288087926164304427312821418046011 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((143537182424828 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-364963913710038598414892315328730093496 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((-568467028986472510824696554037555583848247362400107634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1048955691443944 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((230855531955318426753185178541821530336 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-1065110533471208 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (7, 1), (9, 1)],
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (8, 1)],
  term ((-121884141001566718963734554791836816264 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-4693433831329107276367288087926164304427312821418046011 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-71768591212414 : Rat) / 1162780221153193) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (4, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (12, 1)],
  term ((284233514493236255412348277018777791924123681200053817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((524477845721972 : Rat) / 1162780221153193) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115427765977659213376592589270910765168 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (14, 1)],
  term ((-3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (15, 2)],
  term ((532555266735604 : Rat) / 1162780221153193) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 2)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((139278285836777090540880993779081865968 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1179598144194433332727423675159090332557179231896216827 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-2412809560107404 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (6, 1), (9, 1)],
  term ((-339031506386646751182821311930920999056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((188123132700649955989051134245145785680 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((667421698448032 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-11769126792358832 : Rat) / 3488340663459579) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 3)],
  term ((-325162578221750417795303693212385244384 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1682740129586670585044858255203612183628883081175876154 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((7520384446792408 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((282272129817592 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 2)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (7, 1), (13, 2)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (9, 1)],
  term ((-69639142918388545270440496889540932984 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((1179598144194433332727423675159090332557179231896216827 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((1206404780053702 : Rat) / 1162780221153193) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (9, 1)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 1), (13, 2)],
  term ((-94061566350324977994525567122572892840 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (9, 1), (14, 1)],
  term ((2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-333710849224016 : Rat) / 1162780221153193) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 2), (13, 1)],
  term ((-4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((5884563396179416 : Rat) / 3488340663459579) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (9, 3)],
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1)],
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-141136064908796 : Rat) / 1162780221153193) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (5, 1), (15, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 2)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (9, 2)],
  term ((4866209221819913589265702019303092314664 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2139441914076995777905955490317282285992 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-2248349720677639548993821422266729797997684541738928692 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-14076524633967304 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-5887326703812184971448854774303930882724 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((3374627121101630 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2)],
  term ((-1234785665417817961244402407854858655142 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 2), (13, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 3)],
  term ((603289132684912846978854796102101025076 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((15259124911152603794754292048358281017243216287872898521 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((27674589965698452 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((366976486226976789479436493368233993105393920350856634 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1737846722105288 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-3619086860941375770352327102155074005922 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-370026087929595206242150969987290070120 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-18397952715093612131181524355533874397832578418921958842 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-7038262316983652 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((6163560842684798122109053924082888245029384115763673392 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (13, 2)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (6, 1), (15, 2)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((740052175859190412484301939974580140240 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((36795905430187224262363048711067748795665156837843917684 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((14076524633967304 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 2)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (12, 1), (13, 2)],
  term ((-12327121685369596244218107848165776490058768231527346784 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-104340258137532860613207572936842294120 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 2), (13, 2)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (6, 2), (15, 2)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2433104610909956794632851009651546157332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (9, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1069720957038497888952977745158641142996 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((1124174860338819774496910711133364898998842270869464346 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((7038262316983652 : Rat) / 1162780221153193) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1)],
  term ((2943663351906092485724427387151965441362 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((617392832708908980622201203927429327571 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 2), (13, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (9, 3)],
  term ((-301644566342456423489427398051050512538 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15259124911152603794754292048358281017243216287872898521 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-13837294982849226 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)],
  term ((1809543430470687885176163551077537002961 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 800 through 899. -/
theorem ep_Q2_024_block_15_0800_0899_valid :
    checkProductSumEq ep_Q2_024_partials_15_0800_0899
      ep_Q2_024_block_15_0800_0899 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
