/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:2100-2129

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_2100_2129 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 2100 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2100 : Poly :=
[
  term ((-5965780475847958 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 2100 for generator 15. -/
def ep_Q2_024_partial_15_2100 : Poly :=
[
  term ((-11931560951695916 : Rat) / 1162780221153193) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((5965780475847958 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2100 for generator 15. -/
theorem ep_Q2_024_partial_15_2100_valid :
    mulPoly ep_Q2_024_coefficient_15_2100
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2100 := by
  native_decide

/-- Coefficient term 2101 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2101 : Poly :=
[
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 3), (13, 1), (15, 1)]
]

/-- Partial product 2101 for generator 15. -/
def ep_Q2_024_partial_15_2101 : Poly :=
[
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 3), (13, 1), (15, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2101 for generator 15. -/
theorem ep_Q2_024_partial_15_2101_valid :
    mulPoly ep_Q2_024_coefficient_15_2101
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2101 := by
  native_decide

/-- Coefficient term 2102 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2102 : Poly :=
[
  term ((-137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 3), (15, 2)]
]

/-- Partial product 2102 for generator 15. -/
def ep_Q2_024_partial_15_2102 : Poly :=
[
  term ((-275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (12, 3), (15, 2)],
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2102 for generator 15. -/
theorem ep_Q2_024_partial_15_2102_valid :
    mulPoly ep_Q2_024_coefficient_15_2102
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2102 := by
  native_decide

/-- Coefficient term 2103 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2103 : Poly :=
[
  term ((-1269203461259312 : Rat) / 1162780221153193) [(12, 3), (15, 2), (16, 1)]
]

/-- Partial product 2103 for generator 15. -/
def ep_Q2_024_partial_15_2103 : Poly :=
[
  term ((-2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2103 for generator 15. -/
theorem ep_Q2_024_partial_15_2103_valid :
    mulPoly ep_Q2_024_coefficient_15_2103
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2103 := by
  native_decide

/-- Coefficient term 2104 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2104 : Poly :=
[
  term ((5273374012275043427791414636642409883509365761326327533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2104 for generator 15. -/
def ep_Q2_024_partial_15_2104 : Poly :=
[
  term ((5273374012275043427791414636642409883509365761326327533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5273374012275043427791414636642409883509365761326327533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2104 for generator 15. -/
theorem ep_Q2_024_partial_15_2104_valid :
    mulPoly ep_Q2_024_coefficient_15_2104
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2104 := by
  native_decide

/-- Coefficient term 2105 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2105 : Poly :=
[
  term ((-210094471183847 : Rat) / 2325560442306386) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2105 for generator 15. -/
def ep_Q2_024_partial_15_2105 : Poly :=
[
  term ((-210094471183847 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((210094471183847 : Rat) / 2325560442306386) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2105 for generator 15. -/
theorem ep_Q2_024_partial_15_2105_valid :
    mulPoly ep_Q2_024_coefficient_15_2105
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2105 := by
  native_decide

/-- Coefficient term 2106 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2106 : Poly :=
[
  term ((8148117099555131382066078197438918863588109797236969058 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2106 for generator 15. -/
def ep_Q2_024_partial_15_2106 : Poly :=
[
  term ((16296234199110262764132156394877837727176219594473938116 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8148117099555131382066078197438918863588109797236969058 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2106 for generator 15. -/
theorem ep_Q2_024_partial_15_2106_valid :
    mulPoly ep_Q2_024_coefficient_15_2106
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2106 := by
  native_decide

/-- Coefficient term 2107 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2107 : Poly :=
[
  term ((-8321913124397264 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2107 for generator 15. -/
def ep_Q2_024_partial_15_2107 : Poly :=
[
  term ((-16643826248794528 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8321913124397264 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2107 for generator 15. -/
theorem ep_Q2_024_partial_15_2107_valid :
    mulPoly ep_Q2_024_coefficient_15_2107
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2107 := by
  native_decide

/-- Coefficient term 2108 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2108 : Poly :=
[
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 1), (15, 1)]
]

/-- Partial product 2108 for generator 15. -/
def ep_Q2_024_partial_15_2108 : Poly :=
[
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (13, 1), (15, 1)],
  term ((-57424265761789517429157274509892407275596422915453973627 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2108 for generator 15. -/
theorem ep_Q2_024_partial_15_2108_valid :
    mulPoly ep_Q2_024_coefficient_15_2108
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2108 := by
  native_decide

/-- Coefficient term 2109 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2109 : Poly :=
[
  term ((-318373975502121 : Rat) / 4651120884612772) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2109 for generator 15. -/
def ep_Q2_024_partial_15_2109 : Poly :=
[
  term ((-318373975502121 : Rat) / 2325560442306386) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((318373975502121 : Rat) / 4651120884612772) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2109 for generator 15. -/
theorem ep_Q2_024_partial_15_2109_valid :
    mulPoly ep_Q2_024_coefficient_15_2109
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2109 := by
  native_decide

/-- Coefficient term 2110 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2110 : Poly :=
[
  term ((-6426933012966323304250535122031470077652149965108493589 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (15, 3)]
]

/-- Partial product 2110 for generator 15. -/
def ep_Q2_024_partial_15_2110 : Poly :=
[
  term ((-6426933012966323304250535122031470077652149965108493589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (15, 3)],
  term ((6426933012966323304250535122031470077652149965108493589 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2110 for generator 15. -/
theorem ep_Q2_024_partial_15_2110_valid :
    mulPoly ep_Q2_024_coefficient_15_2110
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2110 := by
  native_decide

/-- Coefficient term 2111 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2111 : Poly :=
[
  term ((1406879386409686 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2111 for generator 15. -/
def ep_Q2_024_partial_15_2111 : Poly :=
[
  term ((2813758772819372 : Rat) / 1162780221153193) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1406879386409686 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2111 for generator 15. -/
theorem ep_Q2_024_partial_15_2111_valid :
    mulPoly ep_Q2_024_coefficient_15_2111
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2111 := by
  native_decide

/-- Coefficient term 2112 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2112 : Poly :=
[
  term ((76229521030096982064683581108480232074 : Rat) / 599854728701238648283346764014769633995) [(13, 2)]
]

/-- Partial product 2112 for generator 15. -/
def ep_Q2_024_partial_15_2112 : Poly :=
[
  term ((152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2)],
  term ((-76229521030096982064683581108480232074 : Rat) / 599854728701238648283346764014769633995) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2112 for generator 15. -/
theorem ep_Q2_024_partial_15_2112_valid :
    mulPoly ep_Q2_024_coefficient_15_2112
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2112 := by
  native_decide

/-- Coefficient term 2113 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2113 : Poly :=
[
  term ((-51384499434740401775405640573875021960 : Rat) / 39990315246749243218889784267651308933) [(13, 2), (14, 1)]
]

/-- Partial product 2113 for generator 15. -/
def ep_Q2_024_partial_15_2113 : Poly :=
[
  term ((-102768998869480803550811281147750043920 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (13, 2), (14, 1)],
  term ((51384499434740401775405640573875021960 : Rat) / 39990315246749243218889784267651308933) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2113 for generator 15. -/
theorem ep_Q2_024_partial_15_2113_valid :
    mulPoly ep_Q2_024_coefficient_15_2113
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2113 := by
  native_decide

/-- Coefficient term 2114 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2114 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 1), (15, 2)]
]

/-- Partial product 2114 for generator 15. -/
def ep_Q2_024_partial_15_2114 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2114 for generator 15. -/
theorem ep_Q2_024_partial_15_2114_valid :
    mulPoly ep_Q2_024_coefficient_15_2114
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2114 := by
  native_decide

/-- Coefficient term 2115 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2115 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2115 for generator 15. -/
def ep_Q2_024_partial_15_2115 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2115 for generator 15. -/
theorem ep_Q2_024_partial_15_2115_valid :
    mulPoly ep_Q2_024_coefficient_15_2115
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2115 := by
  native_decide

/-- Coefficient term 2116 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2116 : Poly :=
[
  term ((-444274459954343893240087286651593398508 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

/-- Partial product 2116 for generator 15. -/
def ep_Q2_024_partial_15_2116 : Poly :=
[
  term ((-888548919908687786480174573303186797016 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2), (14, 2)],
  term ((444274459954343893240087286651593398508 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2116 for generator 15. -/
theorem ep_Q2_024_partial_15_2116_valid :
    mulPoly ep_Q2_024_coefficient_15_2116
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2116 := by
  native_decide

/-- Coefficient term 2117 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2117 : Poly :=
[
  term ((-239192326667108849023557625208017257517467690869467817 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)]
]

/-- Partial product 2117 for generator 15. -/
def ep_Q2_024_partial_15_2117 : Poly :=
[
  term ((-478384653334217698047115250416034515034935381738935634 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 2), (15, 2)],
  term ((239192326667108849023557625208017257517467690869467817 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2117 for generator 15. -/
theorem ep_Q2_024_partial_15_2117_valid :
    mulPoly ep_Q2_024_coefficient_15_2117
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2117 := by
  native_decide

/-- Coefficient term 2118 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2118 : Poly :=
[
  term ((811452378110852 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 2118 for generator 15. -/
def ep_Q2_024_partial_15_2118 : Poly :=
[
  term ((1622904756221704 : Rat) / 1162780221153193) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-811452378110852 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2118 for generator 15. -/
theorem ep_Q2_024_partial_15_2118_valid :
    mulPoly ep_Q2_024_coefficient_15_2118
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2118 := by
  native_decide

/-- Coefficient term 2119 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2119 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (14, 1), (15, 1)]
]

/-- Partial product 2119 for generator 15. -/
def ep_Q2_024_partial_15_2119 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 3), (14, 1), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2119 for generator 15. -/
theorem ep_Q2_024_partial_15_2119_valid :
    mulPoly ep_Q2_024_coefficient_15_2119
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2119 := by
  native_decide

/-- Coefficient term 2120 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2120 : Poly :=
[
  term ((-19291891600703518526122557820054305544 : Rat) / 199951576233746216094448921338256544665) [(13, 3), (15, 1)]
]

/-- Partial product 2120 for generator 15. -/
def ep_Q2_024_partial_15_2120 : Poly :=
[
  term ((-38583783201407037052245115640108611088 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 3), (15, 1)],
  term ((19291891600703518526122557820054305544 : Rat) / 199951576233746216094448921338256544665) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2120 for generator 15. -/
theorem ep_Q2_024_partial_15_2120_valid :
    mulPoly ep_Q2_024_coefficient_15_2120
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2120 := by
  native_decide

/-- Coefficient term 2121 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2121 : Poly :=
[
  term ((-4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(14, 1)]
]

/-- Partial product 2121 for generator 15. -/
def ep_Q2_024_partial_15_2121 : Poly :=
[
  term ((-4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (14, 1)],
  term ((4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2121 for generator 15. -/
theorem ep_Q2_024_partial_15_2121_valid :
    mulPoly ep_Q2_024_coefficient_15_2121
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2121 := by
  native_decide

/-- Coefficient term 2122 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2122 : Poly :=
[
  term ((-17596536078793794374544315528513037071809294343879981731 : Rat) / 371999580852807927401909372334506358986938569298984552) [(14, 1), (15, 2)]
]

/-- Partial product 2122 for generator 15. -/
def ep_Q2_024_partial_15_2122 : Poly :=
[
  term ((-17596536078793794374544315528513037071809294343879981731 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 1), (14, 1), (15, 2)],
  term ((17596536078793794374544315528513037071809294343879981731 : Rat) / 371999580852807927401909372334506358986938569298984552) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2122 for generator 15. -/
theorem ep_Q2_024_partial_15_2122_valid :
    mulPoly ep_Q2_024_coefficient_15_2122
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2122 := by
  native_decide

/-- Coefficient term 2123 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2123 : Poly :=
[
  term ((770504313935679 : Rat) / 2325560442306386) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2123 for generator 15. -/
def ep_Q2_024_partial_15_2123 : Poly :=
[
  term ((770504313935679 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-770504313935679 : Rat) / 2325560442306386) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2123 for generator 15. -/
theorem ep_Q2_024_partial_15_2123_valid :
    mulPoly ep_Q2_024_coefficient_15_2123
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2123 := by
  native_decide

/-- Coefficient term 2124 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2124 : Poly :=
[
  term ((3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 2)]
]

/-- Partial product 2124 for generator 15. -/
def ep_Q2_024_partial_15_2124 : Poly :=
[
  term ((3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (14, 2)],
  term ((-3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2124 for generator 15. -/
theorem ep_Q2_024_partial_15_2124_valid :
    mulPoly ep_Q2_024_coefficient_15_2124
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2124 := by
  native_decide

/-- Coefficient term 2125 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2125 : Poly :=
[
  term ((7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 2), (15, 2)]
]

/-- Partial product 2125 for generator 15. -/
def ep_Q2_024_partial_15_2125 : Poly :=
[
  term ((15934554564032483476770112557315556323224742653918300264 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 2), (15, 2)],
  term ((-7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2125 for generator 15. -/
theorem ep_Q2_024_partial_15_2125_valid :
    mulPoly ep_Q2_024_coefficient_15_2125
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2125 := by
  native_decide

/-- Coefficient term 2126 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2126 : Poly :=
[
  term ((-1425956555474960 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 2126 for generator 15. -/
def ep_Q2_024_partial_15_2126 : Poly :=
[
  term ((-2851913110949920 : Rat) / 1162780221153193) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1425956555474960 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2126 for generator 15. -/
theorem ep_Q2_024_partial_15_2126_valid :
    mulPoly ep_Q2_024_coefficient_15_2126
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2126 := by
  native_decide

/-- Coefficient term 2127 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2127 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 3)]
]

/-- Partial product 2127 for generator 15. -/
def ep_Q2_024_partial_15_2127 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (14, 3)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2127 for generator 15. -/
theorem ep_Q2_024_partial_15_2127_valid :
    mulPoly ep_Q2_024_coefficient_15_2127
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2127 := by
  native_decide

/-- Coefficient term 2128 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2128 : Poly :=
[
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 2)]
]

/-- Partial product 2128 for generator 15. -/
def ep_Q2_024_partial_15_2128 : Poly :=
[
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (15, 2)],
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2128 for generator 15. -/
theorem ep_Q2_024_partial_15_2128_valid :
    mulPoly ep_Q2_024_coefficient_15_2128
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2128 := by
  native_decide

/-- Coefficient term 2129 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2129 : Poly :=
[
  term ((-3179655375125510 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 2129 for generator 15. -/
def ep_Q2_024_partial_15_2129 : Poly :=
[
  term ((-6359310750251020 : Rat) / 1162780221153193) [(6, 1), (15, 2), (16, 1)],
  term ((3179655375125510 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2129 for generator 15. -/
theorem ep_Q2_024_partial_15_2129_valid :
    mulPoly ep_Q2_024_coefficient_15_2129
        ep_Q2_024_generator_15_2100_2129 =
      ep_Q2_024_partial_15_2129 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_2100_2129 : List Poly :=
[
  ep_Q2_024_partial_15_2100,
  ep_Q2_024_partial_15_2101,
  ep_Q2_024_partial_15_2102,
  ep_Q2_024_partial_15_2103,
  ep_Q2_024_partial_15_2104,
  ep_Q2_024_partial_15_2105,
  ep_Q2_024_partial_15_2106,
  ep_Q2_024_partial_15_2107,
  ep_Q2_024_partial_15_2108,
  ep_Q2_024_partial_15_2109,
  ep_Q2_024_partial_15_2110,
  ep_Q2_024_partial_15_2111,
  ep_Q2_024_partial_15_2112,
  ep_Q2_024_partial_15_2113,
  ep_Q2_024_partial_15_2114,
  ep_Q2_024_partial_15_2115,
  ep_Q2_024_partial_15_2116,
  ep_Q2_024_partial_15_2117,
  ep_Q2_024_partial_15_2118,
  ep_Q2_024_partial_15_2119,
  ep_Q2_024_partial_15_2120,
  ep_Q2_024_partial_15_2121,
  ep_Q2_024_partial_15_2122,
  ep_Q2_024_partial_15_2123,
  ep_Q2_024_partial_15_2124,
  ep_Q2_024_partial_15_2125,
  ep_Q2_024_partial_15_2126,
  ep_Q2_024_partial_15_2127,
  ep_Q2_024_partial_15_2128,
  ep_Q2_024_partial_15_2129
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_2100_2129 : Poly :=
[
  term ((-11931560951695916 : Rat) / 1162780221153193) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 3), (13, 1), (15, 1)],
  term ((-275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (12, 3), (15, 2)],
  term ((-2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((5273374012275043427791414636642409883509365761326327533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-210094471183847 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16296234199110262764132156394877837727176219594473938116 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16643826248794528 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((57424265761789517429157274509892407275596422915453973627 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (13, 1), (15, 1)],
  term ((-318373975502121 : Rat) / 2325560442306386) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6426933012966323304250535122031470077652149965108493589 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (15, 3)],
  term ((2813758772819372 : Rat) / 1162780221153193) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2)],
  term ((-102768998869480803550811281147750043920 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (13, 2), (14, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-888548919908687786480174573303186797016 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 2), (14, 2)],
  term ((-478384653334217698047115250416034515034935381738935634 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 2), (15, 2)],
  term ((1622904756221704 : Rat) / 1162780221153193) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 3), (14, 1), (15, 1)],
  term ((-38583783201407037052245115640108611088 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 3), (15, 1)],
  term ((-4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (14, 1)],
  term ((-17596536078793794374544315528513037071809294343879981731 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 1), (14, 1), (15, 2)],
  term ((770504313935679 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (14, 2)],
  term ((15934554564032483476770112557315556323224742653918300264 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 2), (15, 2)],
  term ((-2851913110949920 : Rat) / 1162780221153193) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (14, 3)],
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (15, 2)],
  term ((-6359310750251020 : Rat) / 1162780221153193) [(6, 1), (15, 2), (16, 1)],
  term ((5965780475847958 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 3), (13, 1), (15, 1)],
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 3), (15, 2)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 3), (15, 2), (16, 1)],
  term ((-5273374012275043427791414636642409883509365761326327533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(13, 1), (14, 1), (15, 1)],
  term ((210094471183847 : Rat) / 2325560442306386) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8148117099555131382066078197438918863588109797236969058 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 1)],
  term ((8321913124397264 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57424265761789517429157274509892407275596422915453973627 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 1), (15, 1)],
  term ((318373975502121 : Rat) / 4651120884612772) [(13, 1), (15, 1), (16, 1)],
  term ((6426933012966323304250535122031470077652149965108493589 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (15, 3)],
  term ((-1406879386409686 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)],
  term ((-76229521030096982064683581108480232074 : Rat) / 599854728701238648283346764014769633995) [(13, 2)],
  term ((51384499434740401775405640573875021960 : Rat) / 39990315246749243218889784267651308933) [(13, 2), (14, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((444274459954343893240087286651593398508 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)],
  term ((239192326667108849023557625208017257517467690869467817 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 2), (15, 2)],
  term ((-811452378110852 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (14, 1), (15, 1)],
  term ((19291891600703518526122557820054305544 : Rat) / 199951576233746216094448921338256544665) [(13, 3), (15, 1)],
  term ((4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(14, 1)],
  term ((17596536078793794374544315528513037071809294343879981731 : Rat) / 371999580852807927401909372334506358986938569298984552) [(14, 1), (15, 2)],
  term ((-770504313935679 : Rat) / 2325560442306386) [(14, 1), (15, 2), (16, 1)],
  term ((-3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 2)],
  term ((-7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 2), (15, 2)],
  term ((1425956555474960 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 3)],
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 2)],
  term ((3179655375125510 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 2100 through 2129. -/
theorem ep_Q2_024_block_15_2100_2129_valid :
    checkProductSumEq ep_Q2_024_partials_15_2100_2129
      ep_Q2_024_block_15_2100_2129 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
