/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0800 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 800 for generator 21. -/
def ep_Q2_024_partial_21_0800 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 21. -/
theorem ep_Q2_024_partial_21_0800_valid :
    mulPoly ep_Q2_024_coefficient_21_0800
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0801 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 801 for generator 21. -/
def ep_Q2_024_partial_21_0801 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 21. -/
theorem ep_Q2_024_partial_21_0801_valid :
    mulPoly ep_Q2_024_coefficient_21_0801
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0802 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 802 for generator 21. -/
def ep_Q2_024_partial_21_0802 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 21. -/
theorem ep_Q2_024_partial_21_0802_valid :
    mulPoly ep_Q2_024_coefficient_21_0802
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0803 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 803 for generator 21. -/
def ep_Q2_024_partial_21_0803 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 21. -/
theorem ep_Q2_024_partial_21_0803_valid :
    mulPoly ep_Q2_024_coefficient_21_0803
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0804 : Poly :=
[
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)]
]

/-- Partial product 804 for generator 21. -/
def ep_Q2_024_partial_21_0804 : Poly :=
[
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 21. -/
theorem ep_Q2_024_partial_21_0804_valid :
    mulPoly ep_Q2_024_coefficient_21_0804
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0805 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 805 for generator 21. -/
def ep_Q2_024_partial_21_0805 : Poly :=
[
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 21. -/
theorem ep_Q2_024_partial_21_0805_valid :
    mulPoly ep_Q2_024_coefficient_21_0805
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0806 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 806 for generator 21. -/
def ep_Q2_024_partial_21_0806 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 21. -/
theorem ep_Q2_024_partial_21_0806_valid :
    mulPoly ep_Q2_024_coefficient_21_0806
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0807 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 807 for generator 21. -/
def ep_Q2_024_partial_21_0807 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 21. -/
theorem ep_Q2_024_partial_21_0807_valid :
    mulPoly ep_Q2_024_coefficient_21_0807
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0808 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 808 for generator 21. -/
def ep_Q2_024_partial_21_0808 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 21. -/
theorem ep_Q2_024_partial_21_0808_valid :
    mulPoly ep_Q2_024_coefficient_21_0808
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0809 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 809 for generator 21. -/
def ep_Q2_024_partial_21_0809 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 21. -/
theorem ep_Q2_024_partial_21_0809_valid :
    mulPoly ep_Q2_024_coefficient_21_0809
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0810 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 810 for generator 21. -/
def ep_Q2_024_partial_21_0810 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 21. -/
theorem ep_Q2_024_partial_21_0810_valid :
    mulPoly ep_Q2_024_coefficient_21_0810
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0811 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 21. -/
def ep_Q2_024_partial_21_0811 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 21. -/
theorem ep_Q2_024_partial_21_0811_valid :
    mulPoly ep_Q2_024_coefficient_21_0811
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0812 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 812 for generator 21. -/
def ep_Q2_024_partial_21_0812 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 21. -/
theorem ep_Q2_024_partial_21_0812_valid :
    mulPoly ep_Q2_024_coefficient_21_0812
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0813 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 813 for generator 21. -/
def ep_Q2_024_partial_21_0813 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 21. -/
theorem ep_Q2_024_partial_21_0813_valid :
    mulPoly ep_Q2_024_coefficient_21_0813
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0814 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 814 for generator 21. -/
def ep_Q2_024_partial_21_0814 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 21. -/
theorem ep_Q2_024_partial_21_0814_valid :
    mulPoly ep_Q2_024_coefficient_21_0814
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0815 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 815 for generator 21. -/
def ep_Q2_024_partial_21_0815 : Poly :=
[
  term ((2096958610707350 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 21. -/
theorem ep_Q2_024_partial_21_0815_valid :
    mulPoly ep_Q2_024_coefficient_21_0815
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0816 : Poly :=
[
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 816 for generator 21. -/
def ep_Q2_024_partial_21_0816 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 21. -/
theorem ep_Q2_024_partial_21_0816_valid :
    mulPoly ep_Q2_024_coefficient_21_0816
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0817 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 817 for generator 21. -/
def ep_Q2_024_partial_21_0817 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 21. -/
theorem ep_Q2_024_partial_21_0817_valid :
    mulPoly ep_Q2_024_coefficient_21_0817
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0818 : Poly :=
[
  term ((-448228140819559 : Rat) / 2325560442306386) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 818 for generator 21. -/
def ep_Q2_024_partial_21_0818 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 2325560442306386) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 21. -/
theorem ep_Q2_024_partial_21_0818_valid :
    mulPoly ep_Q2_024_coefficient_21_0818
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0819 : Poly :=
[
  term ((94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 819 for generator 21. -/
def ep_Q2_024_partial_21_0819 : Poly :=
[
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 21. -/
theorem ep_Q2_024_partial_21_0819_valid :
    mulPoly ep_Q2_024_coefficient_21_0819
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0820 : Poly :=
[
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 820 for generator 21. -/
def ep_Q2_024_partial_21_0820 : Poly :=
[
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 21. -/
theorem ep_Q2_024_partial_21_0820_valid :
    mulPoly ep_Q2_024_coefficient_21_0820
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0821 : Poly :=
[
  term ((13092500098671601 : Rat) / 4651120884612772) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 821 for generator 21. -/
def ep_Q2_024_partial_21_0821 : Poly :=
[
  term ((13092500098671601 : Rat) / 2325560442306386) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13092500098671601 : Rat) / 4651120884612772) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 21. -/
theorem ep_Q2_024_partial_21_0821_valid :
    mulPoly ep_Q2_024_coefficient_21_0821
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0822 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)]
]

/-- Partial product 822 for generator 21. -/
def ep_Q2_024_partial_21_0822 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (10, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 21. -/
theorem ep_Q2_024_partial_21_0822_valid :
    mulPoly ep_Q2_024_coefficient_21_0822
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0823 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(3, 1), (9, 1)]
]

/-- Partial product 823 for generator 21. -/
def ep_Q2_024_partial_21_0823 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(3, 1), (9, 1)],
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 21. -/
theorem ep_Q2_024_partial_21_0823_valid :
    mulPoly ep_Q2_024_coefficient_21_0823
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0824 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 824 for generator 21. -/
def ep_Q2_024_partial_21_0824 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1)],
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 21. -/
theorem ep_Q2_024_partial_21_0824_valid :
    mulPoly ep_Q2_024_coefficient_21_0824
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0825 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 825 for generator 21. -/
def ep_Q2_024_partial_21_0825 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 21. -/
theorem ep_Q2_024_partial_21_0825_valid :
    mulPoly ep_Q2_024_coefficient_21_0825
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0826 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 826 for generator 21. -/
def ep_Q2_024_partial_21_0826 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 21. -/
theorem ep_Q2_024_partial_21_0826_valid :
    mulPoly ep_Q2_024_coefficient_21_0826
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0827 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 827 for generator 21. -/
def ep_Q2_024_partial_21_0827 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 21. -/
theorem ep_Q2_024_partial_21_0827_valid :
    mulPoly ep_Q2_024_coefficient_21_0827
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0828 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 828 for generator 21. -/
def ep_Q2_024_partial_21_0828 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 21. -/
theorem ep_Q2_024_partial_21_0828_valid :
    mulPoly ep_Q2_024_coefficient_21_0828
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0829 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 829 for generator 21. -/
def ep_Q2_024_partial_21_0829 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 21. -/
theorem ep_Q2_024_partial_21_0829_valid :
    mulPoly ep_Q2_024_coefficient_21_0829
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0830 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 830 for generator 21. -/
def ep_Q2_024_partial_21_0830 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 21. -/
theorem ep_Q2_024_partial_21_0830_valid :
    mulPoly ep_Q2_024_coefficient_21_0830
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0831 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 831 for generator 21. -/
def ep_Q2_024_partial_21_0831 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 21. -/
theorem ep_Q2_024_partial_21_0831_valid :
    mulPoly ep_Q2_024_coefficient_21_0831
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0832 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 832 for generator 21. -/
def ep_Q2_024_partial_21_0832 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 21. -/
theorem ep_Q2_024_partial_21_0832_valid :
    mulPoly ep_Q2_024_coefficient_21_0832
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0833 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 833 for generator 21. -/
def ep_Q2_024_partial_21_0833 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (9, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 21. -/
theorem ep_Q2_024_partial_21_0833_valid :
    mulPoly ep_Q2_024_coefficient_21_0833
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0834 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 834 for generator 21. -/
def ep_Q2_024_partial_21_0834 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 21. -/
theorem ep_Q2_024_partial_21_0834_valid :
    mulPoly ep_Q2_024_coefficient_21_0834
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0835 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 835 for generator 21. -/
def ep_Q2_024_partial_21_0835 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 21. -/
theorem ep_Q2_024_partial_21_0835_valid :
    mulPoly ep_Q2_024_coefficient_21_0835
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0836 : Poly :=
[
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 836 for generator 21. -/
def ep_Q2_024_partial_21_0836 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 21. -/
theorem ep_Q2_024_partial_21_0836_valid :
    mulPoly ep_Q2_024_coefficient_21_0836
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0837 : Poly :=
[
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 837 for generator 21. -/
def ep_Q2_024_partial_21_0837 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 21. -/
theorem ep_Q2_024_partial_21_0837_valid :
    mulPoly ep_Q2_024_coefficient_21_0837
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0838 : Poly :=
[
  term ((790816150911648 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 838 for generator 21. -/
def ep_Q2_024_partial_21_0838 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 21. -/
theorem ep_Q2_024_partial_21_0838_valid :
    mulPoly ep_Q2_024_coefficient_21_0838
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0839 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 839 for generator 21. -/
def ep_Q2_024_partial_21_0839 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 21. -/
theorem ep_Q2_024_partial_21_0839_valid :
    mulPoly ep_Q2_024_coefficient_21_0839
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0840 : Poly :=
[
  term ((106291408585995 : Rat) / 2325560442306386) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 840 for generator 21. -/
def ep_Q2_024_partial_21_0840 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106291408585995 : Rat) / 2325560442306386) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 21. -/
theorem ep_Q2_024_partial_21_0840_valid :
    mulPoly ep_Q2_024_coefficient_21_0840
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0841 : Poly :=
[
  term ((-8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 841 for generator 21. -/
def ep_Q2_024_partial_21_0841 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 21. -/
theorem ep_Q2_024_partial_21_0841_valid :
    mulPoly ep_Q2_024_coefficient_21_0841
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0842 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 842 for generator 21. -/
def ep_Q2_024_partial_21_0842 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 21. -/
theorem ep_Q2_024_partial_21_0842_valid :
    mulPoly ep_Q2_024_coefficient_21_0842
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0843 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 843 for generator 21. -/
def ep_Q2_024_partial_21_0843 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 21. -/
theorem ep_Q2_024_partial_21_0843_valid :
    mulPoly ep_Q2_024_coefficient_21_0843
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0844 : Poly :=
[
  term ((-1048479305353675 : Rat) / 2325560442306386) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 844 for generator 21. -/
def ep_Q2_024_partial_21_0844 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 2325560442306386) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 21. -/
theorem ep_Q2_024_partial_21_0844_valid :
    mulPoly ep_Q2_024_coefficient_21_0844
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0845 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (10, 1), (13, 1)]
]

/-- Partial product 845 for generator 21. -/
def ep_Q2_024_partial_21_0845 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 21. -/
theorem ep_Q2_024_partial_21_0845_valid :
    mulPoly ep_Q2_024_coefficient_21_0845
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0846 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (9, 2), (10, 1), (15, 1)]
]

/-- Partial product 846 for generator 21. -/
def ep_Q2_024_partial_21_0846 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 21. -/
theorem ep_Q2_024_partial_21_0846_valid :
    mulPoly ep_Q2_024_coefficient_21_0846
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0847 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 847 for generator 21. -/
def ep_Q2_024_partial_21_0847 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 21. -/
theorem ep_Q2_024_partial_21_0847_valid :
    mulPoly ep_Q2_024_coefficient_21_0847
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0848 : Poly :=
[
  term ((58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 848 for generator 21. -/
def ep_Q2_024_partial_21_0848 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term ((-58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 21. -/
theorem ep_Q2_024_partial_21_0848_valid :
    mulPoly ep_Q2_024_coefficient_21_0848
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0849 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 849 for generator 21. -/
def ep_Q2_024_partial_21_0849 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 21. -/
theorem ep_Q2_024_partial_21_0849_valid :
    mulPoly ep_Q2_024_coefficient_21_0849
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0850 : Poly :=
[
  term ((560680668579351 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 850 for generator 21. -/
def ep_Q2_024_partial_21_0850 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-560680668579351 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 21. -/
theorem ep_Q2_024_partial_21_0850_valid :
    mulPoly ep_Q2_024_coefficient_21_0850
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0851 : Poly :=
[
  term ((47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)]
]

/-- Partial product 851 for generator 21. -/
def ep_Q2_024_partial_21_0851 : Poly :=
[
  term ((-47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 21. -/
theorem ep_Q2_024_partial_21_0851_valid :
    mulPoly ep_Q2_024_coefficient_21_0851
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0852 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (10, 1)]
]

/-- Partial product 852 for generator 21. -/
def ep_Q2_024_partial_21_0852 : Poly :=
[
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (10, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 21. -/
theorem ep_Q2_024_partial_21_0852_valid :
    mulPoly ep_Q2_024_coefficient_21_0852
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0853 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 853 for generator 21. -/
def ep_Q2_024_partial_21_0853 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 21. -/
theorem ep_Q2_024_partial_21_0853_valid :
    mulPoly ep_Q2_024_coefficient_21_0853
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0854 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 854 for generator 21. -/
def ep_Q2_024_partial_21_0854 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 21. -/
theorem ep_Q2_024_partial_21_0854_valid :
    mulPoly ep_Q2_024_coefficient_21_0854
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0855 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 855 for generator 21. -/
def ep_Q2_024_partial_21_0855 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 21. -/
theorem ep_Q2_024_partial_21_0855_valid :
    mulPoly ep_Q2_024_coefficient_21_0855
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0856 : Poly :=
[
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 856 for generator 21. -/
def ep_Q2_024_partial_21_0856 : Poly :=
[
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 21. -/
theorem ep_Q2_024_partial_21_0856_valid :
    mulPoly ep_Q2_024_coefficient_21_0856
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0857 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 857 for generator 21. -/
def ep_Q2_024_partial_21_0857 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 21. -/
theorem ep_Q2_024_partial_21_0857_valid :
    mulPoly ep_Q2_024_coefficient_21_0857
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0858 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 858 for generator 21. -/
def ep_Q2_024_partial_21_0858 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 21. -/
theorem ep_Q2_024_partial_21_0858_valid :
    mulPoly ep_Q2_024_coefficient_21_0858
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0859 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 859 for generator 21. -/
def ep_Q2_024_partial_21_0859 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 21. -/
theorem ep_Q2_024_partial_21_0859_valid :
    mulPoly ep_Q2_024_coefficient_21_0859
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0860 : Poly :=
[
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 860 for generator 21. -/
def ep_Q2_024_partial_21_0860 : Poly :=
[
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 21. -/
theorem ep_Q2_024_partial_21_0860_valid :
    mulPoly ep_Q2_024_coefficient_21_0860
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0861 : Poly :=
[
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 861 for generator 21. -/
def ep_Q2_024_partial_21_0861 : Poly :=
[
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 21. -/
theorem ep_Q2_024_partial_21_0861_valid :
    mulPoly ep_Q2_024_coefficient_21_0861
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0862 : Poly :=
[
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 862 for generator 21. -/
def ep_Q2_024_partial_21_0862 : Poly :=
[
  term ((-720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 21. -/
theorem ep_Q2_024_partial_21_0862_valid :
    mulPoly ep_Q2_024_coefficient_21_0862
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0863 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 863 for generator 21. -/
def ep_Q2_024_partial_21_0863 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 21. -/
theorem ep_Q2_024_partial_21_0863_valid :
    mulPoly ep_Q2_024_coefficient_21_0863
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0864 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 864 for generator 21. -/
def ep_Q2_024_partial_21_0864 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 21. -/
theorem ep_Q2_024_partial_21_0864_valid :
    mulPoly ep_Q2_024_coefficient_21_0864
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0865 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 865 for generator 21. -/
def ep_Q2_024_partial_21_0865 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 21. -/
theorem ep_Q2_024_partial_21_0865_valid :
    mulPoly ep_Q2_024_coefficient_21_0865
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0866 : Poly :=
[
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 866 for generator 21. -/
def ep_Q2_024_partial_21_0866 : Poly :=
[
  term ((22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 21. -/
theorem ep_Q2_024_partial_21_0866_valid :
    mulPoly ep_Q2_024_coefficient_21_0866
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0867 : Poly :=
[
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 867 for generator 21. -/
def ep_Q2_024_partial_21_0867 : Poly :=
[
  term ((-3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 21. -/
theorem ep_Q2_024_partial_21_0867_valid :
    mulPoly ep_Q2_024_coefficient_21_0867
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0868 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 868 for generator 21. -/
def ep_Q2_024_partial_21_0868 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 21. -/
theorem ep_Q2_024_partial_21_0868_valid :
    mulPoly ep_Q2_024_coefficient_21_0868
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0869 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 869 for generator 21. -/
def ep_Q2_024_partial_21_0869 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 21. -/
theorem ep_Q2_024_partial_21_0869_valid :
    mulPoly ep_Q2_024_coefficient_21_0869
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0870 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 870 for generator 21. -/
def ep_Q2_024_partial_21_0870 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 21. -/
theorem ep_Q2_024_partial_21_0870_valid :
    mulPoly ep_Q2_024_coefficient_21_0870
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0871 : Poly :=
[
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 871 for generator 21. -/
def ep_Q2_024_partial_21_0871 : Poly :=
[
  term ((157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 21. -/
theorem ep_Q2_024_partial_21_0871_valid :
    mulPoly ep_Q2_024_coefficient_21_0871
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0872 : Poly :=
[
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 872 for generator 21. -/
def ep_Q2_024_partial_21_0872 : Poly :=
[
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 21. -/
theorem ep_Q2_024_partial_21_0872_valid :
    mulPoly ep_Q2_024_coefficient_21_0872
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0873 : Poly :=
[
  term ((-184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 873 for generator 21. -/
def ep_Q2_024_partial_21_0873 : Poly :=
[
  term ((-368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 21. -/
theorem ep_Q2_024_partial_21_0873_valid :
    mulPoly ep_Q2_024_coefficient_21_0873
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0874 : Poly :=
[
  term ((15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 874 for generator 21. -/
def ep_Q2_024_partial_21_0874 : Poly :=
[
  term ((30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 21. -/
theorem ep_Q2_024_partial_21_0874_valid :
    mulPoly ep_Q2_024_coefficient_21_0874
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0875 : Poly :=
[
  term ((-4325483377037680 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 875 for generator 21. -/
def ep_Q2_024_partial_21_0875 : Poly :=
[
  term ((-8650966754075360 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 21. -/
theorem ep_Q2_024_partial_21_0875_valid :
    mulPoly ep_Q2_024_coefficient_21_0875
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0876 : Poly :=
[
  term ((128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 876 for generator 21. -/
def ep_Q2_024_partial_21_0876 : Poly :=
[
  term ((257779384582880257255052045319597206608 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 21. -/
theorem ep_Q2_024_partial_21_0876_valid :
    mulPoly ep_Q2_024_coefficient_21_0876
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0877 : Poly :=
[
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 877 for generator 21. -/
def ep_Q2_024_partial_21_0877 : Poly :=
[
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 21. -/
theorem ep_Q2_024_partial_21_0877_valid :
    mulPoly ep_Q2_024_coefficient_21_0877
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0878 : Poly :=
[
  term ((3707783785825266 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 878 for generator 21. -/
def ep_Q2_024_partial_21_0878 : Poly :=
[
  term ((7415567571650532 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3707783785825266 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 21. -/
theorem ep_Q2_024_partial_21_0878_valid :
    mulPoly ep_Q2_024_coefficient_21_0878
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0879 : Poly :=
[
  term ((9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 879 for generator 21. -/
def ep_Q2_024_partial_21_0879 : Poly :=
[
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 21. -/
theorem ep_Q2_024_partial_21_0879_valid :
    mulPoly ep_Q2_024_coefficient_21_0879
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0880 : Poly :=
[
  term ((-1443865203915856 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 21. -/
def ep_Q2_024_partial_21_0880 : Poly :=
[
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 21. -/
theorem ep_Q2_024_partial_21_0880_valid :
    mulPoly ep_Q2_024_coefficient_21_0880
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0881 : Poly :=
[
  term ((-7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 881 for generator 21. -/
def ep_Q2_024_partial_21_0881 : Poly :=
[
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 21. -/
theorem ep_Q2_024_partial_21_0881_valid :
    mulPoly ep_Q2_024_coefficient_21_0881
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0882 : Poly :=
[
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 882 for generator 21. -/
def ep_Q2_024_partial_21_0882 : Poly :=
[
  term ((-184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 21. -/
theorem ep_Q2_024_partial_21_0882_valid :
    mulPoly ep_Q2_024_coefficient_21_0882
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0883 : Poly :=
[
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 883 for generator 21. -/
def ep_Q2_024_partial_21_0883 : Poly :=
[
  term ((15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 21. -/
theorem ep_Q2_024_partial_21_0883_valid :
    mulPoly ep_Q2_024_coefficient_21_0883
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0884 : Poly :=
[
  term ((4325483377037680 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 884 for generator 21. -/
def ep_Q2_024_partial_21_0884 : Poly :=
[
  term ((-4325483377037680 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8650966754075360 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 21. -/
theorem ep_Q2_024_partial_21_0884_valid :
    mulPoly ep_Q2_024_coefficient_21_0884
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0885 : Poly :=
[
  term ((-128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 885 for generator 21. -/
def ep_Q2_024_partial_21_0885 : Poly :=
[
  term ((128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-257779384582880257255052045319597206608 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 21. -/
theorem ep_Q2_024_partial_21_0885_valid :
    mulPoly ep_Q2_024_coefficient_21_0885
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0886 : Poly :=
[
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 886 for generator 21. -/
def ep_Q2_024_partial_21_0886 : Poly :=
[
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 21. -/
theorem ep_Q2_024_partial_21_0886_valid :
    mulPoly ep_Q2_024_coefficient_21_0886
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0887 : Poly :=
[
  term ((-3707783785825266 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 887 for generator 21. -/
def ep_Q2_024_partial_21_0887 : Poly :=
[
  term ((3707783785825266 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7415567571650532 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 21. -/
theorem ep_Q2_024_partial_21_0887_valid :
    mulPoly ep_Q2_024_coefficient_21_0887
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0888 : Poly :=
[
  term ((99283574517138876497841334724397057744 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 888 for generator 21. -/
def ep_Q2_024_partial_21_0888 : Poly :=
[
  term ((198567149034277752995682669448794115488 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-99283574517138876497841334724397057744 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 21. -/
theorem ep_Q2_024_partial_21_0888_valid :
    mulPoly ep_Q2_024_coefficient_21_0888
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0889 : Poly :=
[
  term ((-5756547698493852131318962554092649297132953975858077682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 889 for generator 21. -/
def ep_Q2_024_partial_21_0889 : Poly :=
[
  term ((-11513095396987704262637925108185298594265907951716155364 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5756547698493852131318962554092649297132953975858077682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 21. -/
theorem ep_Q2_024_partial_21_0889_valid :
    mulPoly ep_Q2_024_coefficient_21_0889
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0890 : Poly :=
[
  term ((3606606892434696 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 890 for generator 21. -/
def ep_Q2_024_partial_21_0890 : Poly :=
[
  term ((7213213784869392 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3606606892434696 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 21. -/
theorem ep_Q2_024_partial_21_0890_valid :
    mulPoly ep_Q2_024_coefficient_21_0890
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0891 : Poly :=
[
  term ((-64444846145720064313763011329899301652 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 891 for generator 21. -/
def ep_Q2_024_partial_21_0891 : Poly :=
[
  term ((-128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((64444846145720064313763011329899301652 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 21. -/
theorem ep_Q2_024_partial_21_0891_valid :
    mulPoly ep_Q2_024_coefficient_21_0891
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0892 : Poly :=
[
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 892 for generator 21. -/
def ep_Q2_024_partial_21_0892 : Poly :=
[
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 21. -/
theorem ep_Q2_024_partial_21_0892_valid :
    mulPoly ep_Q2_024_coefficient_21_0892
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0893 : Poly :=
[
  term ((-1853891892912633 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 893 for generator 21. -/
def ep_Q2_024_partial_21_0893 : Poly :=
[
  term ((-3707783785825266 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1853891892912633 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 21. -/
theorem ep_Q2_024_partial_21_0893_valid :
    mulPoly ep_Q2_024_coefficient_21_0893
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0894 : Poly :=
[
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2)]
]

/-- Partial product 894 for generator 21. -/
def ep_Q2_024_partial_21_0894 : Poly :=
[
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 21. -/
theorem ep_Q2_024_partial_21_0894_valid :
    mulPoly ep_Q2_024_coefficient_21_0894
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0895 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (10, 1)]
]

/-- Partial product 895 for generator 21. -/
def ep_Q2_024_partial_21_0895 : Poly :=
[
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (10, 1)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 21. -/
theorem ep_Q2_024_partial_21_0895_valid :
    mulPoly ep_Q2_024_coefficient_21_0895
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0896 : Poly :=
[
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)]
]

/-- Partial product 896 for generator 21. -/
def ep_Q2_024_partial_21_0896 : Poly :=
[
  term ((-42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 21. -/
theorem ep_Q2_024_partial_21_0896_valid :
    mulPoly ep_Q2_024_coefficient_21_0896
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0897 : Poly :=
[
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 897 for generator 21. -/
def ep_Q2_024_partial_21_0897 : Poly :=
[
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 21. -/
theorem ep_Q2_024_partial_21_0897_valid :
    mulPoly ep_Q2_024_coefficient_21_0897
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0898 : Poly :=
[
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 898 for generator 21. -/
def ep_Q2_024_partial_21_0898 : Poly :=
[
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 21. -/
theorem ep_Q2_024_partial_21_0898_valid :
    mulPoly ep_Q2_024_coefficient_21_0898
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0899 : Poly :=
[
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 899 for generator 21. -/
def ep_Q2_024_partial_21_0899 : Poly :=
[
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (13, 2)],
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 21. -/
theorem ep_Q2_024_partial_21_0899_valid :
    mulPoly ep_Q2_024_coefficient_21_0899
        ep_Q2_024_generator_21_0800_0899 =
      ep_Q2_024_partial_21_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0800_0899 : List Poly :=
[
  ep_Q2_024_partial_21_0800,
  ep_Q2_024_partial_21_0801,
  ep_Q2_024_partial_21_0802,
  ep_Q2_024_partial_21_0803,
  ep_Q2_024_partial_21_0804,
  ep_Q2_024_partial_21_0805,
  ep_Q2_024_partial_21_0806,
  ep_Q2_024_partial_21_0807,
  ep_Q2_024_partial_21_0808,
  ep_Q2_024_partial_21_0809,
  ep_Q2_024_partial_21_0810,
  ep_Q2_024_partial_21_0811,
  ep_Q2_024_partial_21_0812,
  ep_Q2_024_partial_21_0813,
  ep_Q2_024_partial_21_0814,
  ep_Q2_024_partial_21_0815,
  ep_Q2_024_partial_21_0816,
  ep_Q2_024_partial_21_0817,
  ep_Q2_024_partial_21_0818,
  ep_Q2_024_partial_21_0819,
  ep_Q2_024_partial_21_0820,
  ep_Q2_024_partial_21_0821,
  ep_Q2_024_partial_21_0822,
  ep_Q2_024_partial_21_0823,
  ep_Q2_024_partial_21_0824,
  ep_Q2_024_partial_21_0825,
  ep_Q2_024_partial_21_0826,
  ep_Q2_024_partial_21_0827,
  ep_Q2_024_partial_21_0828,
  ep_Q2_024_partial_21_0829,
  ep_Q2_024_partial_21_0830,
  ep_Q2_024_partial_21_0831,
  ep_Q2_024_partial_21_0832,
  ep_Q2_024_partial_21_0833,
  ep_Q2_024_partial_21_0834,
  ep_Q2_024_partial_21_0835,
  ep_Q2_024_partial_21_0836,
  ep_Q2_024_partial_21_0837,
  ep_Q2_024_partial_21_0838,
  ep_Q2_024_partial_21_0839,
  ep_Q2_024_partial_21_0840,
  ep_Q2_024_partial_21_0841,
  ep_Q2_024_partial_21_0842,
  ep_Q2_024_partial_21_0843,
  ep_Q2_024_partial_21_0844,
  ep_Q2_024_partial_21_0845,
  ep_Q2_024_partial_21_0846,
  ep_Q2_024_partial_21_0847,
  ep_Q2_024_partial_21_0848,
  ep_Q2_024_partial_21_0849,
  ep_Q2_024_partial_21_0850,
  ep_Q2_024_partial_21_0851,
  ep_Q2_024_partial_21_0852,
  ep_Q2_024_partial_21_0853,
  ep_Q2_024_partial_21_0854,
  ep_Q2_024_partial_21_0855,
  ep_Q2_024_partial_21_0856,
  ep_Q2_024_partial_21_0857,
  ep_Q2_024_partial_21_0858,
  ep_Q2_024_partial_21_0859,
  ep_Q2_024_partial_21_0860,
  ep_Q2_024_partial_21_0861,
  ep_Q2_024_partial_21_0862,
  ep_Q2_024_partial_21_0863,
  ep_Q2_024_partial_21_0864,
  ep_Q2_024_partial_21_0865,
  ep_Q2_024_partial_21_0866,
  ep_Q2_024_partial_21_0867,
  ep_Q2_024_partial_21_0868,
  ep_Q2_024_partial_21_0869,
  ep_Q2_024_partial_21_0870,
  ep_Q2_024_partial_21_0871,
  ep_Q2_024_partial_21_0872,
  ep_Q2_024_partial_21_0873,
  ep_Q2_024_partial_21_0874,
  ep_Q2_024_partial_21_0875,
  ep_Q2_024_partial_21_0876,
  ep_Q2_024_partial_21_0877,
  ep_Q2_024_partial_21_0878,
  ep_Q2_024_partial_21_0879,
  ep_Q2_024_partial_21_0880,
  ep_Q2_024_partial_21_0881,
  ep_Q2_024_partial_21_0882,
  ep_Q2_024_partial_21_0883,
  ep_Q2_024_partial_21_0884,
  ep_Q2_024_partial_21_0885,
  ep_Q2_024_partial_21_0886,
  ep_Q2_024_partial_21_0887,
  ep_Q2_024_partial_21_0888,
  ep_Q2_024_partial_21_0889,
  ep_Q2_024_partial_21_0890,
  ep_Q2_024_partial_21_0891,
  ep_Q2_024_partial_21_0892,
  ep_Q2_024_partial_21_0893,
  ep_Q2_024_partial_21_0894,
  ep_Q2_024_partial_21_0895,
  ep_Q2_024_partial_21_0896,
  ep_Q2_024_partial_21_0897,
  ep_Q2_024_partial_21_0898,
  ep_Q2_024_partial_21_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0800_0899 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (10, 1), (11, 1)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)],
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((2096958610707350 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((13092500098671601 : Rat) / 2325560442306386) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 2325560442306386) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)],
  term ((-13092500098671601 : Rat) / 4651120884612772) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (10, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)],
  term ((-161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(3, 1), (9, 1)],
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 2), (13, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (9, 1), (10, 2), (15, 2)],
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-106291408585995 : Rat) / 2325560442306386) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)],
  term ((608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(3, 1), (9, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(3, 1), (9, 1), (15, 2)],
  term ((1048479305353675 : Rat) / 2325560442306386) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (10, 2), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (10, 2), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (9, 2), (15, 1)],
  term ((-560680668579351 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (10, 2)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8650966754075360 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((257779384582880257255052045319597206608 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((7415567571650532 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128889692291440128627526022659798603304 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3707783785825266 : Rat) / 1162780221153193) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (8, 1), (13, 2)],
  term ((14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2887730407831712 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((8650966754075360 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-257779384582880257255052045319597206608 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((123600350932898919736777402414074002791789101285219282761 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((-7415567571650532 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-99283574517138876497841334724397057744 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((5756547698493852131318962554092649297132953975858077682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3606606892434696 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64444846145720064313763011329899301652 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1)],
  term ((-123600350932898919736777402414074002791789101285219282761 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(4, 1), (9, 1), (15, 1)],
  term ((1853891892912633 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2)],
  term ((-42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (10, 2)],
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 1)],
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (13, 2)],
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 800 through 899. -/
theorem ep_Q2_024_block_21_0800_0899_valid :
    checkProductSumEq ep_Q2_024_partials_21_0800_0899
      ep_Q2_024_block_21_0800_0899 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
