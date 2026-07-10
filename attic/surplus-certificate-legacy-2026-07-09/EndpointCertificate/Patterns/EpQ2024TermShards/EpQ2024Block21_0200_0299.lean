/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0200 : Poly :=
[
  term ((214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 200 for generator 21. -/
def ep_Q2_024_partial_21_0200 : Poly :=
[
  term ((428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((-214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 21. -/
theorem ep_Q2_024_partial_21_0200_valid :
    mulPoly ep_Q2_024_coefficient_21_0200
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0201 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 201 for generator 21. -/
def ep_Q2_024_partial_21_0201 : Poly :=
[
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 21. -/
theorem ep_Q2_024_partial_21_0201_valid :
    mulPoly ep_Q2_024_coefficient_21_0201
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0202 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 202 for generator 21. -/
def ep_Q2_024_partial_21_0202 : Poly :=
[
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 21. -/
theorem ep_Q2_024_partial_21_0202_valid :
    mulPoly ep_Q2_024_coefficient_21_0202
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0203 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 21. -/
def ep_Q2_024_partial_21_0203 : Poly :=
[
  term ((1709530353079456 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 21. -/
theorem ep_Q2_024_partial_21_0203_valid :
    mulPoly ep_Q2_024_coefficient_21_0203
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0204 : Poly :=
[
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 204 for generator 21. -/
def ep_Q2_024_partial_21_0204 : Poly :=
[
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 21. -/
theorem ep_Q2_024_partial_21_0204_valid :
    mulPoly ep_Q2_024_coefficient_21_0204
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0205 : Poly :=
[
  term ((-1958137860542752 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 21. -/
def ep_Q2_024_partial_21_0205 : Poly :=
[
  term ((-3916275721085504 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 21. -/
theorem ep_Q2_024_partial_21_0205_valid :
    mulPoly ep_Q2_024_coefficient_21_0205
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0206 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (13, 1)]
]

/-- Partial product 206 for generator 21. -/
def ep_Q2_024_partial_21_0206 : Poly :=
[
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 21. -/
theorem ep_Q2_024_partial_21_0206_valid :
    mulPoly ep_Q2_024_coefficient_21_0206
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0207 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

/-- Partial product 207 for generator 21. -/
def ep_Q2_024_partial_21_0207 : Poly :=
[
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 21. -/
theorem ep_Q2_024_partial_21_0207_valid :
    mulPoly ep_Q2_024_coefficient_21_0207
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0208 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 21. -/
def ep_Q2_024_partial_21_0208 : Poly :=
[
  term ((5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 21. -/
theorem ep_Q2_024_partial_21_0208_valid :
    mulPoly ep_Q2_024_coefficient_21_0208
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0209 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2)]
]

/-- Partial product 209 for generator 21. -/
def ep_Q2_024_partial_21_0209 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 21. -/
theorem ep_Q2_024_partial_21_0209_valid :
    mulPoly ep_Q2_024_coefficient_21_0209
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0210 : Poly :=
[
  term ((767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 210 for generator 21. -/
def ep_Q2_024_partial_21_0210 : Poly :=
[
  term ((-767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((1534008445791796036608246128407301870656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 21. -/
theorem ep_Q2_024_partial_21_0210_valid :
    mulPoly ep_Q2_024_coefficient_21_0210
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0211 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 211 for generator 21. -/
def ep_Q2_024_partial_21_0211 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 21. -/
theorem ep_Q2_024_partial_21_0211_valid :
    mulPoly ep_Q2_024_coefficient_21_0211
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0212 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 212 for generator 21. -/
def ep_Q2_024_partial_21_0212 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 21. -/
theorem ep_Q2_024_partial_21_0212_valid :
    mulPoly ep_Q2_024_coefficient_21_0212
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0213 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 21. -/
def ep_Q2_024_partial_21_0213 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 21. -/
theorem ep_Q2_024_partial_21_0213_valid :
    mulPoly ep_Q2_024_coefficient_21_0213
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0214 : Poly :=
[
  term ((-53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 214 for generator 21. -/
def ep_Q2_024_partial_21_0214 : Poly :=
[
  term ((-106700758173789835700115152363006676908 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 21. -/
theorem ep_Q2_024_partial_21_0214_valid :
    mulPoly ep_Q2_024_coefficient_21_0214
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0215 : Poly :=
[
  term ((-48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 215 for generator 21. -/
def ep_Q2_024_partial_21_0215 : Poly :=
[
  term ((-48108759476133175575601932414548705499224482451183624741 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 21. -/
theorem ep_Q2_024_partial_21_0215_valid :
    mulPoly ep_Q2_024_coefficient_21_0215
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0216 : Poly :=
[
  term ((-3743407177002399 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 21. -/
def ep_Q2_024_partial_21_0216 : Poly :=
[
  term ((-7486814354004798 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3743407177002399 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 21. -/
theorem ep_Q2_024_partial_21_0216_valid :
    mulPoly ep_Q2_024_coefficient_21_0216
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0217 : Poly :=
[
  term ((1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 217 for generator 21. -/
def ep_Q2_024_partial_21_0217 : Poly :=
[
  term ((-1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)],
  term ((2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 21. -/
theorem ep_Q2_024_partial_21_0217_valid :
    mulPoly ep_Q2_024_coefficient_21_0217
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0218 : Poly :=
[
  term ((-533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 218 for generator 21. -/
def ep_Q2_024_partial_21_0218 : Poly :=
[
  term ((-1067631723467823848853269806495054145596 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 21. -/
theorem ep_Q2_024_partial_21_0218_valid :
    mulPoly ep_Q2_024_coefficient_21_0218
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0219 : Poly :=
[
  term ((-2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 219 for generator 21. -/
def ep_Q2_024_partial_21_0219 : Poly :=
[
  term ((-5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 21. -/
theorem ep_Q2_024_partial_21_0219_valid :
    mulPoly ep_Q2_024_coefficient_21_0219
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0220 : Poly :=
[
  term ((-56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 220 for generator 21. -/
def ep_Q2_024_partial_21_0220 : Poly :=
[
  term ((-112244728157627882810419007567542061860 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 21. -/
theorem ep_Q2_024_partial_21_0220_valid :
    mulPoly ep_Q2_024_coefficient_21_0220
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0221 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 221 for generator 21. -/
def ep_Q2_024_partial_21_0221 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 21. -/
theorem ep_Q2_024_partial_21_0221_valid :
    mulPoly ep_Q2_024_coefficient_21_0221
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0222 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 222 for generator 21. -/
def ep_Q2_024_partial_21_0222 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 21. -/
theorem ep_Q2_024_partial_21_0222_valid :
    mulPoly ep_Q2_024_coefficient_21_0222
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0223 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 21. -/
def ep_Q2_024_partial_21_0223 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 21. -/
theorem ep_Q2_024_partial_21_0223_valid :
    mulPoly ep_Q2_024_coefficient_21_0223
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0224 : Poly :=
[
  term ((114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 224 for generator 21. -/
def ep_Q2_024_partial_21_0224 : Poly :=
[
  term ((114695310985533139865253928542252323661837342530380210877 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 21. -/
theorem ep_Q2_024_partial_21_0224_valid :
    mulPoly ep_Q2_024_coefficient_21_0224
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0225 : Poly :=
[
  term ((4574440624287119 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 21. -/
def ep_Q2_024_partial_21_0225 : Poly :=
[
  term ((9148881248574238 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4574440624287119 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 21. -/
theorem ep_Q2_024_partial_21_0225_valid :
    mulPoly ep_Q2_024_coefficient_21_0225
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0226 : Poly :=
[
  term ((287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 226 for generator 21. -/
def ep_Q2_024_partial_21_0226 : Poly :=
[
  term ((575113921206687855692008827758918115176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 21. -/
theorem ep_Q2_024_partial_21_0226_valid :
    mulPoly ep_Q2_024_coefficient_21_0226
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0227 : Poly :=
[
  term ((-10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 227 for generator 21. -/
def ep_Q2_024_partial_21_0227 : Poly :=
[
  term ((-10276061187348409351974839366611065398110474709965459109 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 21. -/
theorem ep_Q2_024_partial_21_0227_valid :
    mulPoly ep_Q2_024_coefficient_21_0227
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0228 : Poly :=
[
  term ((1741462857409837 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 21. -/
def ep_Q2_024_partial_21_0228 : Poly :=
[
  term ((3482925714819674 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1741462857409837 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 21. -/
theorem ep_Q2_024_partial_21_0228_valid :
    mulPoly ep_Q2_024_coefficient_21_0228
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0229 : Poly :=
[
  term ((13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 229 for generator 21. -/
def ep_Q2_024_partial_21_0229 : Poly :=
[
  term ((27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 21. -/
theorem ep_Q2_024_partial_21_0229_valid :
    mulPoly ep_Q2_024_coefficient_21_0229
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0230 : Poly :=
[
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 230 for generator 21. -/
def ep_Q2_024_partial_21_0230 : Poly :=
[
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 21. -/
theorem ep_Q2_024_partial_21_0230_valid :
    mulPoly ep_Q2_024_coefficient_21_0230
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0231 : Poly :=
[
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 21. -/
def ep_Q2_024_partial_21_0231 : Poly :=
[
  term ((2694765326577600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 21. -/
theorem ep_Q2_024_partial_21_0231_valid :
    mulPoly ep_Q2_024_coefficient_21_0231
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0232 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 232 for generator 21. -/
def ep_Q2_024_partial_21_0232 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 21. -/
theorem ep_Q2_024_partial_21_0232_valid :
    mulPoly ep_Q2_024_coefficient_21_0232
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0233 : Poly :=
[
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 233 for generator 21. -/
def ep_Q2_024_partial_21_0233 : Poly :=
[
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 21. -/
theorem ep_Q2_024_partial_21_0233_valid :
    mulPoly ep_Q2_024_coefficient_21_0233
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0234 : Poly :=
[
  term ((-1731142516245691 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 21. -/
def ep_Q2_024_partial_21_0234 : Poly :=
[
  term ((-3462285032491382 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 21. -/
theorem ep_Q2_024_partial_21_0234_valid :
    mulPoly ep_Q2_024_coefficient_21_0234
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0235 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 3)]
]

/-- Partial product 235 for generator 21. -/
def ep_Q2_024_partial_21_0235 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (15, 3)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 21. -/
theorem ep_Q2_024_partial_21_0235_valid :
    mulPoly ep_Q2_024_coefficient_21_0235
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0236 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 236 for generator 21. -/
def ep_Q2_024_partial_21_0236 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 21. -/
theorem ep_Q2_024_partial_21_0236_valid :
    mulPoly ep_Q2_024_coefficient_21_0236
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0237 : Poly :=
[
  term ((-2418840224840882816647542243123189001 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1)]
]

/-- Partial product 237 for generator 21. -/
def ep_Q2_024_partial_21_0237 : Poly :=
[
  term ((2418840224840882816647542243123189001 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1)],
  term ((-4837680449681765633295084486246378002 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 21. -/
theorem ep_Q2_024_partial_21_0237_valid :
    mulPoly ep_Q2_024_coefficient_21_0237
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0238 : Poly :=
[
  term ((670282944097889149255656598953839153972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 238 for generator 21. -/
def ep_Q2_024_partial_21_0238 : Poly :=
[
  term ((1340565888195778298511313197907678307944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-670282944097889149255656598953839153972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 21. -/
theorem ep_Q2_024_partial_21_0238_valid :
    mulPoly ep_Q2_024_coefficient_21_0238
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0239 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 21. -/
def ep_Q2_024_partial_21_0239 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 21. -/
theorem ep_Q2_024_partial_21_0239_valid :
    mulPoly ep_Q2_024_coefficient_21_0239
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0240 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 21. -/
def ep_Q2_024_partial_21_0240 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 21. -/
theorem ep_Q2_024_partial_21_0240_valid :
    mulPoly ep_Q2_024_coefficient_21_0240
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0241 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 21. -/
def ep_Q2_024_partial_21_0241 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 21. -/
theorem ep_Q2_024_partial_21_0241_valid :
    mulPoly ep_Q2_024_coefficient_21_0241
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0242 : Poly :=
[
  term ((-7986396552063609137068028543635155914564 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 242 for generator 21. -/
def ep_Q2_024_partial_21_0242 : Poly :=
[
  term ((-15972793104127218274136057087270311829128 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((7986396552063609137068028543635155914564 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 21. -/
theorem ep_Q2_024_partial_21_0242_valid :
    mulPoly ep_Q2_024_coefficient_21_0242
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0243 : Poly :=
[
  term ((-23094378749958612223360244810171175643808520789019481806 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 243 for generator 21. -/
def ep_Q2_024_partial_21_0243 : Poly :=
[
  term ((-46188757499917224446720489620342351287617041578038963612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((23094378749958612223360244810171175643808520789019481806 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 21. -/
theorem ep_Q2_024_partial_21_0243_valid :
    mulPoly ep_Q2_024_coefficient_21_0243
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0244 : Poly :=
[
  term ((6440580797235068 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 21. -/
def ep_Q2_024_partial_21_0244 : Poly :=
[
  term ((12881161594470136 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6440580797235068 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 21. -/
theorem ep_Q2_024_partial_21_0244_valid :
    mulPoly ep_Q2_024_coefficient_21_0244
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0245 : Poly :=
[
  term ((-11753134164667893527851020999703053178036 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2)]
]

/-- Partial product 245 for generator 21. -/
def ep_Q2_024_partial_21_0245 : Poly :=
[
  term ((11753134164667893527851020999703053178036 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2)],
  term ((-23506268329335787055702041999406106356072 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 21. -/
theorem ep_Q2_024_partial_21_0245_valid :
    mulPoly ep_Q2_024_coefficient_21_0245
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0246 : Poly :=
[
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 246 for generator 21. -/
def ep_Q2_024_partial_21_0246 : Poly :=
[
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 21. -/
theorem ep_Q2_024_partial_21_0246_valid :
    mulPoly ep_Q2_024_coefficient_21_0246
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0247 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 21. -/
def ep_Q2_024_partial_21_0247 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 21. -/
theorem ep_Q2_024_partial_21_0247_valid :
    mulPoly ep_Q2_024_coefficient_21_0247
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0248 : Poly :=
[
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 21. -/
def ep_Q2_024_partial_21_0248 : Poly :=
[
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 21. -/
theorem ep_Q2_024_partial_21_0248_valid :
    mulPoly ep_Q2_024_coefficient_21_0248
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0249 : Poly :=
[
  term ((249685765514403164832559516832559311822 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 249 for generator 21. -/
def ep_Q2_024_partial_21_0249 : Poly :=
[
  term ((499371531028806329665119033665118623644 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-249685765514403164832559516832559311822 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 21. -/
theorem ep_Q2_024_partial_21_0249_valid :
    mulPoly ep_Q2_024_coefficient_21_0249
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0250 : Poly :=
[
  term ((-47220637336471814092576491583286948232119452583662667929 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 250 for generator 21. -/
def ep_Q2_024_partial_21_0250 : Poly :=
[
  term ((-47220637336471814092576491583286948232119452583662667929 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((47220637336471814092576491583286948232119452583662667929 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 21. -/
theorem ep_Q2_024_partial_21_0250_valid :
    mulPoly ep_Q2_024_coefficient_21_0250
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0251 : Poly :=
[
  term ((5986047890453984 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 21. -/
def ep_Q2_024_partial_21_0251 : Poly :=
[
  term ((11972095780907968 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5986047890453984 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 21. -/
theorem ep_Q2_024_partial_21_0251_valid :
    mulPoly ep_Q2_024_coefficient_21_0251
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0252 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 252 for generator 21. -/
def ep_Q2_024_partial_21_0252 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 21. -/
theorem ep_Q2_024_partial_21_0252_valid :
    mulPoly ep_Q2_024_coefficient_21_0252
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0253 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 21. -/
def ep_Q2_024_partial_21_0253 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 21. -/
theorem ep_Q2_024_partial_21_0253_valid :
    mulPoly ep_Q2_024_coefficient_21_0253
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0254 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 254 for generator 21. -/
def ep_Q2_024_partial_21_0254 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 21. -/
theorem ep_Q2_024_partial_21_0254_valid :
    mulPoly ep_Q2_024_coefficient_21_0254
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0255 : Poly :=
[
  term ((-102657163173203140915768124927335037227675661285593272469 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 255 for generator 21. -/
def ep_Q2_024_partial_21_0255 : Poly :=
[
  term ((-102657163173203140915768124927335037227675661285593272469 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((102657163173203140915768124927335037227675661285593272469 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 21. -/
theorem ep_Q2_024_partial_21_0255_valid :
    mulPoly ep_Q2_024_coefficient_21_0255
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0256 : Poly :=
[
  term ((5168953138364639 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 21. -/
def ep_Q2_024_partial_21_0256 : Poly :=
[
  term ((5168953138364639 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5168953138364639 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 21. -/
theorem ep_Q2_024_partial_21_0256_valid :
    mulPoly ep_Q2_024_coefficient_21_0256
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0257 : Poly :=
[
  term ((-171340795868841391813779882855208146236 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (13, 2)]
]

/-- Partial product 257 for generator 21. -/
def ep_Q2_024_partial_21_0257 : Poly :=
[
  term ((-342681591737682783627559765710416292472 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((171340795868841391813779882855208146236 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 21. -/
theorem ep_Q2_024_partial_21_0257_valid :
    mulPoly ep_Q2_024_coefficient_21_0257
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0258 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (14, 1)]
]

/-- Partial product 258 for generator 21. -/
def ep_Q2_024_partial_21_0258 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 21. -/
theorem ep_Q2_024_partial_21_0258_valid :
    mulPoly ep_Q2_024_coefficient_21_0258
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0259 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 259 for generator 21. -/
def ep_Q2_024_partial_21_0259 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 21. -/
theorem ep_Q2_024_partial_21_0259_valid :
    mulPoly ep_Q2_024_coefficient_21_0259
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0260 : Poly :=
[
  term ((2047511920165755 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 21. -/
def ep_Q2_024_partial_21_0260 : Poly :=
[
  term ((4095023840331510 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2047511920165755 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 21. -/
theorem ep_Q2_024_partial_21_0260_valid :
    mulPoly ep_Q2_024_coefficient_21_0260
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0261 : Poly :=
[
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 261 for generator 21. -/
def ep_Q2_024_partial_21_0261 : Poly :=
[
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 21. -/
theorem ep_Q2_024_partial_21_0261_valid :
    mulPoly ep_Q2_024_coefficient_21_0261
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0262 : Poly :=
[
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 262 for generator 21. -/
def ep_Q2_024_partial_21_0262 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 21. -/
theorem ep_Q2_024_partial_21_0262_valid :
    mulPoly ep_Q2_024_coefficient_21_0262
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0263 : Poly :=
[
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 21. -/
def ep_Q2_024_partial_21_0263 : Poly :=
[
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3023265557210550 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 21. -/
theorem ep_Q2_024_partial_21_0263_valid :
    mulPoly ep_Q2_024_coefficient_21_0263
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0264 : Poly :=
[
  term ((116095376321139968432874045368360354458 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 264 for generator 21. -/
def ep_Q2_024_partial_21_0264 : Poly :=
[
  term ((-116095376321139968432874045368360354458 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((232190752642279936865748090736720708916 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 21. -/
theorem ep_Q2_024_partial_21_0264_valid :
    mulPoly ep_Q2_024_coefficient_21_0264
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0265 : Poly :=
[
  term ((47220637336471814092576491583286948232119452583662667929 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 265 for generator 21. -/
def ep_Q2_024_partial_21_0265 : Poly :=
[
  term ((-47220637336471814092576491583286948232119452583662667929 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((47220637336471814092576491583286948232119452583662667929 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 21. -/
theorem ep_Q2_024_partial_21_0265_valid :
    mulPoly ep_Q2_024_coefficient_21_0265
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0266 : Poly :=
[
  term ((-5986047890453984 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 21. -/
def ep_Q2_024_partial_21_0266 : Poly :=
[
  term ((5986047890453984 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11972095780907968 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 21. -/
theorem ep_Q2_024_partial_21_0266_valid :
    mulPoly ep_Q2_024_coefficient_21_0266
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0267 : Poly :=
[
  term ((-2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 267 for generator 21. -/
def ep_Q2_024_partial_21_0267 : Poly :=
[
  term ((-4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 21. -/
theorem ep_Q2_024_partial_21_0267_valid :
    mulPoly ep_Q2_024_coefficient_21_0267
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0268 : Poly :=
[
  term ((-683015307702220384891497075800230537738 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 268 for generator 21. -/
def ep_Q2_024_partial_21_0268 : Poly :=
[
  term ((-1366030615404440769782994151600461075476 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((683015307702220384891497075800230537738 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 21. -/
theorem ep_Q2_024_partial_21_0268_valid :
    mulPoly ep_Q2_024_coefficient_21_0268
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0269 : Poly :=
[
  term ((-9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 269 for generator 21. -/
def ep_Q2_024_partial_21_0269 : Poly :=
[
  term ((-19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 21. -/
theorem ep_Q2_024_partial_21_0269_valid :
    mulPoly ep_Q2_024_coefficient_21_0269
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0270 : Poly :=
[
  term ((-596913039183748 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 21. -/
def ep_Q2_024_partial_21_0270 : Poly :=
[
  term ((-1193826078367496 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 21. -/
theorem ep_Q2_024_partial_21_0270_valid :
    mulPoly ep_Q2_024_coefficient_21_0270
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0271 : Poly :=
[
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 271 for generator 21. -/
def ep_Q2_024_partial_21_0271 : Poly :=
[
  term ((-307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 21. -/
theorem ep_Q2_024_partial_21_0271_valid :
    mulPoly ep_Q2_024_coefficient_21_0271
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0272 : Poly :=
[
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 272 for generator 21. -/
def ep_Q2_024_partial_21_0272 : Poly :=
[
  term ((2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 21. -/
theorem ep_Q2_024_partial_21_0272_valid :
    mulPoly ep_Q2_024_coefficient_21_0272
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0273 : Poly :=
[
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 273 for generator 21. -/
def ep_Q2_024_partial_21_0273 : Poly :=
[
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 21. -/
theorem ep_Q2_024_partial_21_0273_valid :
    mulPoly ep_Q2_024_coefficient_21_0273
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0274 : Poly :=
[
  term ((-4095023840331510 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 21. -/
def ep_Q2_024_partial_21_0274 : Poly :=
[
  term ((-8190047680663020 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4095023840331510 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 21. -/
theorem ep_Q2_024_partial_21_0274_valid :
    mulPoly ep_Q2_024_coefficient_21_0274
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0275 : Poly :=
[
  term ((-7987101967163626686723934175799780709106 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 275 for generator 21. -/
def ep_Q2_024_partial_21_0275 : Poly :=
[
  term ((-15974203934327253373447868351599561418212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((7987101967163626686723934175799780709106 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 21. -/
theorem ep_Q2_024_partial_21_0275_valid :
    mulPoly ep_Q2_024_coefficient_21_0275
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0276 : Poly :=
[
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 276 for generator 21. -/
def ep_Q2_024_partial_21_0276 : Poly :=
[
  term ((344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 21. -/
theorem ep_Q2_024_partial_21_0276_valid :
    mulPoly ep_Q2_024_coefficient_21_0276
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0277 : Poly :=
[
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 277 for generator 21. -/
def ep_Q2_024_partial_21_0277 : Poly :=
[
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 21. -/
theorem ep_Q2_024_partial_21_0277_valid :
    mulPoly ep_Q2_024_coefficient_21_0277
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0278 : Poly :=
[
  term ((277384937357655 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 21. -/
def ep_Q2_024_partial_21_0278 : Poly :=
[
  term ((277384937357655 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-277384937357655 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 21. -/
theorem ep_Q2_024_partial_21_0278_valid :
    mulPoly ep_Q2_024_coefficient_21_0278
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0279 : Poly :=
[
  term ((290825688243877684410836060491720847134527200806442675767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 279 for generator 21. -/
def ep_Q2_024_partial_21_0279 : Poly :=
[
  term ((290825688243877684410836060491720847134527200806442675767 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-290825688243877684410836060491720847134527200806442675767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 21. -/
theorem ep_Q2_024_partial_21_0279_valid :
    mulPoly ep_Q2_024_coefficient_21_0279
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0280 : Poly :=
[
  term ((-160239363716452879 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 21. -/
def ep_Q2_024_partial_21_0280 : Poly :=
[
  term ((-160239363716452879 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((160239363716452879 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 21. -/
theorem ep_Q2_024_partial_21_0280_valid :
    mulPoly ep_Q2_024_coefficient_21_0280
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0281 : Poly :=
[
  term ((324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 281 for generator 21. -/
def ep_Q2_024_partial_21_0281 : Poly :=
[
  term ((649804947108889713076394218725261563444 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 21. -/
theorem ep_Q2_024_partial_21_0281_valid :
    mulPoly ep_Q2_024_coefficient_21_0281
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0282 : Poly :=
[
  term ((-394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 282 for generator 21. -/
def ep_Q2_024_partial_21_0282 : Poly :=
[
  term ((-394990610532188891949922922601421792279854302077327847 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 21. -/
theorem ep_Q2_024_partial_21_0282_valid :
    mulPoly ep_Q2_024_coefficient_21_0282
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0283 : Poly :=
[
  term ((4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 21. -/
def ep_Q2_024_partial_21_0283 : Poly :=
[
  term ((4134618235609157 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 21. -/
theorem ep_Q2_024_partial_21_0283_valid :
    mulPoly ep_Q2_024_coefficient_21_0283
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0284 : Poly :=
[
  term ((113139596322889522165034348124887108762 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 284 for generator 21. -/
def ep_Q2_024_partial_21_0284 : Poly :=
[
  term ((226279192645779044330068696249774217524 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-113139596322889522165034348124887108762 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 21. -/
theorem ep_Q2_024_partial_21_0284_valid :
    mulPoly ep_Q2_024_coefficient_21_0284
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0285 : Poly :=
[
  term ((1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 285 for generator 21. -/
def ep_Q2_024_partial_21_0285 : Poly :=
[
  term ((2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 21. -/
theorem ep_Q2_024_partial_21_0285_valid :
    mulPoly ep_Q2_024_coefficient_21_0285
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0286 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 286 for generator 21. -/
def ep_Q2_024_partial_21_0286 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 21. -/
theorem ep_Q2_024_partial_21_0286_valid :
    mulPoly ep_Q2_024_coefficient_21_0286
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0287 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 287 for generator 21. -/
def ep_Q2_024_partial_21_0287 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 21. -/
theorem ep_Q2_024_partial_21_0287_valid :
    mulPoly ep_Q2_024_coefficient_21_0287
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0288 : Poly :=
[
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 288 for generator 21. -/
def ep_Q2_024_partial_21_0288 : Poly :=
[
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 21. -/
theorem ep_Q2_024_partial_21_0288_valid :
    mulPoly ep_Q2_024_coefficient_21_0288
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0289 : Poly :=
[
  term ((-60129224652876851 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 21. -/
def ep_Q2_024_partial_21_0289 : Poly :=
[
  term ((-60129224652876851 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((60129224652876851 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 21. -/
theorem ep_Q2_024_partial_21_0289_valid :
    mulPoly ep_Q2_024_coefficient_21_0289
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0290 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 290 for generator 21. -/
def ep_Q2_024_partial_21_0290 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 21. -/
theorem ep_Q2_024_partial_21_0290_valid :
    mulPoly ep_Q2_024_coefficient_21_0290
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0291 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 21. -/
def ep_Q2_024_partial_21_0291 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 21. -/
theorem ep_Q2_024_partial_21_0291_valid :
    mulPoly ep_Q2_024_coefficient_21_0291
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0292 : Poly :=
[
  term ((-35399060763198597133797727693081291140353891220762215509 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 292 for generator 21. -/
def ep_Q2_024_partial_21_0292 : Poly :=
[
  term ((-35399060763198597133797727693081291140353891220762215509 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((35399060763198597133797727693081291140353891220762215509 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 21. -/
theorem ep_Q2_024_partial_21_0292_valid :
    mulPoly ep_Q2_024_coefficient_21_0292
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0293 : Poly :=
[
  term ((4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 21. -/
def ep_Q2_024_partial_21_0293 : Poly :=
[
  term ((8586007643902278 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 21. -/
theorem ep_Q2_024_partial_21_0293_valid :
    mulPoly ep_Q2_024_coefficient_21_0293
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0294 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)]
]

/-- Partial product 294 for generator 21. -/
def ep_Q2_024_partial_21_0294 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 21. -/
theorem ep_Q2_024_partial_21_0294_valid :
    mulPoly ep_Q2_024_coefficient_21_0294
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0295 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 295 for generator 21. -/
def ep_Q2_024_partial_21_0295 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 21. -/
theorem ep_Q2_024_partial_21_0295_valid :
    mulPoly ep_Q2_024_coefficient_21_0295
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0296 : Poly :=
[
  term ((10821836840338629243085794054282077392177 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2)]
]

/-- Partial product 296 for generator 21. -/
def ep_Q2_024_partial_21_0296 : Poly :=
[
  term ((-10821836840338629243085794054282077392177 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2)],
  term ((21643673680677258486171588108564154784354 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 21. -/
theorem ep_Q2_024_partial_21_0296_valid :
    mulPoly ep_Q2_024_coefficient_21_0296
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0297 : Poly :=
[
  term ((-670282944097889149255656598953839153972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1)]
]

/-- Partial product 297 for generator 21. -/
def ep_Q2_024_partial_21_0297 : Poly :=
[
  term ((670282944097889149255656598953839153972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1)],
  term ((-1340565888195778298511313197907678307944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 21. -/
theorem ep_Q2_024_partial_21_0297_valid :
    mulPoly ep_Q2_024_coefficient_21_0297
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0298 : Poly :=
[
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 298 for generator 21. -/
def ep_Q2_024_partial_21_0298 : Poly :=
[
  term ((186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 21. -/
theorem ep_Q2_024_partial_21_0298_valid :
    mulPoly ep_Q2_024_coefficient_21_0298
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0299 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 299 for generator 21. -/
def ep_Q2_024_partial_21_0299 : Poly :=
[
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 21. -/
theorem ep_Q2_024_partial_21_0299_valid :
    mulPoly ep_Q2_024_coefficient_21_0299
        ep_Q2_024_generator_21_0200_0299 =
      ep_Q2_024_partial_21_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_21_0200,
  ep_Q2_024_partial_21_0201,
  ep_Q2_024_partial_21_0202,
  ep_Q2_024_partial_21_0203,
  ep_Q2_024_partial_21_0204,
  ep_Q2_024_partial_21_0205,
  ep_Q2_024_partial_21_0206,
  ep_Q2_024_partial_21_0207,
  ep_Q2_024_partial_21_0208,
  ep_Q2_024_partial_21_0209,
  ep_Q2_024_partial_21_0210,
  ep_Q2_024_partial_21_0211,
  ep_Q2_024_partial_21_0212,
  ep_Q2_024_partial_21_0213,
  ep_Q2_024_partial_21_0214,
  ep_Q2_024_partial_21_0215,
  ep_Q2_024_partial_21_0216,
  ep_Q2_024_partial_21_0217,
  ep_Q2_024_partial_21_0218,
  ep_Q2_024_partial_21_0219,
  ep_Q2_024_partial_21_0220,
  ep_Q2_024_partial_21_0221,
  ep_Q2_024_partial_21_0222,
  ep_Q2_024_partial_21_0223,
  ep_Q2_024_partial_21_0224,
  ep_Q2_024_partial_21_0225,
  ep_Q2_024_partial_21_0226,
  ep_Q2_024_partial_21_0227,
  ep_Q2_024_partial_21_0228,
  ep_Q2_024_partial_21_0229,
  ep_Q2_024_partial_21_0230,
  ep_Q2_024_partial_21_0231,
  ep_Q2_024_partial_21_0232,
  ep_Q2_024_partial_21_0233,
  ep_Q2_024_partial_21_0234,
  ep_Q2_024_partial_21_0235,
  ep_Q2_024_partial_21_0236,
  ep_Q2_024_partial_21_0237,
  ep_Q2_024_partial_21_0238,
  ep_Q2_024_partial_21_0239,
  ep_Q2_024_partial_21_0240,
  ep_Q2_024_partial_21_0241,
  ep_Q2_024_partial_21_0242,
  ep_Q2_024_partial_21_0243,
  ep_Q2_024_partial_21_0244,
  ep_Q2_024_partial_21_0245,
  ep_Q2_024_partial_21_0246,
  ep_Q2_024_partial_21_0247,
  ep_Q2_024_partial_21_0248,
  ep_Q2_024_partial_21_0249,
  ep_Q2_024_partial_21_0250,
  ep_Q2_024_partial_21_0251,
  ep_Q2_024_partial_21_0252,
  ep_Q2_024_partial_21_0253,
  ep_Q2_024_partial_21_0254,
  ep_Q2_024_partial_21_0255,
  ep_Q2_024_partial_21_0256,
  ep_Q2_024_partial_21_0257,
  ep_Q2_024_partial_21_0258,
  ep_Q2_024_partial_21_0259,
  ep_Q2_024_partial_21_0260,
  ep_Q2_024_partial_21_0261,
  ep_Q2_024_partial_21_0262,
  ep_Q2_024_partial_21_0263,
  ep_Q2_024_partial_21_0264,
  ep_Q2_024_partial_21_0265,
  ep_Q2_024_partial_21_0266,
  ep_Q2_024_partial_21_0267,
  ep_Q2_024_partial_21_0268,
  ep_Q2_024_partial_21_0269,
  ep_Q2_024_partial_21_0270,
  ep_Q2_024_partial_21_0271,
  ep_Q2_024_partial_21_0272,
  ep_Q2_024_partial_21_0273,
  ep_Q2_024_partial_21_0274,
  ep_Q2_024_partial_21_0275,
  ep_Q2_024_partial_21_0276,
  ep_Q2_024_partial_21_0277,
  ep_Q2_024_partial_21_0278,
  ep_Q2_024_partial_21_0279,
  ep_Q2_024_partial_21_0280,
  ep_Q2_024_partial_21_0281,
  ep_Q2_024_partial_21_0282,
  ep_Q2_024_partial_21_0283,
  ep_Q2_024_partial_21_0284,
  ep_Q2_024_partial_21_0285,
  ep_Q2_024_partial_21_0286,
  ep_Q2_024_partial_21_0287,
  ep_Q2_024_partial_21_0288,
  ep_Q2_024_partial_21_0289,
  ep_Q2_024_partial_21_0290,
  ep_Q2_024_partial_21_0291,
  ep_Q2_024_partial_21_0292,
  ep_Q2_024_partial_21_0293,
  ep_Q2_024_partial_21_0294,
  ep_Q2_024_partial_21_0295,
  ep_Q2_024_partial_21_0296,
  ep_Q2_024_partial_21_0297,
  ep_Q2_024_partial_21_0298,
  ep_Q2_024_partial_21_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0200_0299 : Poly :=
[
  term ((428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-3916275721085504 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (15, 1)],
  term ((1958137860542752 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2), (10, 1)],
  term ((-767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((1534008445791796036608246128407301870656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106700758173789835700115152363006676908 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-48108759476133175575601932414548705499224482451183624741 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-7486814354004798 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((3743407177002399 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)],
  term ((2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-1067631723467823848853269806495054145596 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-112244728157627882810419007567542061860 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114695310985533139865253928542252323661837342530380210877 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((9148881248574238 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((575113921206687855692008827758918115176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-10276061187348409351974839366611065398110474709965459109 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((3482925714819674 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((2694765326577600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-3462285032491382 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)],
  term ((56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4574440624287119 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1741462857409837 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (13, 1)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (7, 1), (15, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 3)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((2418840224840882816647542243123189001 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1)],
  term ((1340565888195778298511313197907678307944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15972793104127218274136057087270311829128 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-46188757499917224446720489620342351287617041578038963612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((12881161594470136 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-670282944097889149255656598953839153972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7986396552063609137068028543635155914564 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((23094378749958612223360244810171175643808520789019481806 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-6440580797235068 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((11753134164667893527851020999703053178036 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2)],
  term ((-23506268329335787055702041999406106356072 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((-4837680449681765633295084486246378002 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((499371531028806329665119033665118623644 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-47220637336471814092576491583286948232119452583662667929 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((11972095780907968 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-102657163173203140915768124927335037227675661285593272469 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((5168953138364639 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-342681591737682783627559765710416292472 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((4095023840331510 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249685765514403164832559516832559311822 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((47220637336471814092576491583286948232119452583662667929 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5986047890453984 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((102657163173203140915768124927335037227675661285593272469 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-5168953138364639 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((171340795868841391813779882855208146236 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (14, 1)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)],
  term ((-2047511920165755 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1366030615404440769782994151600461075476 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1193826078367496 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8190047680663020 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3104574756143472669378285205843474052768 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((277384937357655 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((257064970846762800828917752627644118688412318929939490661 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-151169567044821229 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((649804947108889713076394218725261563444 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-394990610532188891949922922601421792279854302077327847 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((4134618235609157 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((98360696331637290825835861907520880282 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-60129224652876851 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39339586287623002786723982323149843504275745008395699649 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((14572055534356262 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3023265557210550 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((232190752642279936865748090736720708916 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((47220637336471814092576491583286948232119452583662667929 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-11972095780907968 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)],
  term ((683015307702220384891497075800230537738 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((4095023840331510 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((7987101967163626686723934175799780709106 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-277384937357655 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-290825688243877684410836060491720847134527200806442675767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((160239363716452879 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-113139596322889522165034348124887108762 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 1)],
  term ((-1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((60129224652876851 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((35399060763198597133797727693081291140353891220762215509 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (15, 1)],
  term ((-4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-10821836840338629243085794054282077392177 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2)],
  term ((39741313171320265516074316280317811941598 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2), (10, 1)],
  term ((186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1340565888195778298511313197907678307944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 2)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 200 through 299. -/
theorem ep_Q2_024_block_21_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_21_0200_0299
      ep_Q2_024_block_21_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
