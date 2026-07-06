/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 2:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_02_0200_0299 : Poly :=
[
  term (2 : Rat) [(0, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0200 : Poly :=
[
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 2. -/
def ep_Q2_024_partial_02_0200 : Poly :=
[
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 2. -/
theorem ep_Q2_024_partial_02_0200_valid :
    mulPoly ep_Q2_024_coefficient_02_0200
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0201 : Poly :=
[
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 2. -/
def ep_Q2_024_partial_02_0201 : Poly :=
[
  term ((-1502588816056224 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 2. -/
theorem ep_Q2_024_partial_02_0201_valid :
    mulPoly ep_Q2_024_coefficient_02_0201
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0202 : Poly :=
[
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 202 for generator 2. -/
def ep_Q2_024_partial_02_0202 : Poly :=
[
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1), (13, 2)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 2. -/
theorem ep_Q2_024_partial_02_0202_valid :
    mulPoly ep_Q2_024_coefficient_02_0202
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0203 : Poly :=
[
  term ((-115554909430377041827378915729190041132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 203 for generator 2. -/
def ep_Q2_024_partial_02_0203 : Poly :=
[
  term ((-231109818860754083654757831458380082264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-231109818860754083654757831458380082264 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((115554909430377041827378915729190041132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((115554909430377041827378915729190041132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 2. -/
theorem ep_Q2_024_partial_02_0203_valid :
    mulPoly ep_Q2_024_coefficient_02_0203
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0204 : Poly :=
[
  term ((2910378550154304701672274923262783603614099764057210228 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 204 for generator 2. -/
def ep_Q2_024_partial_02_0204 : Poly :=
[
  term ((5820757100308609403344549846525567207228199528114420456 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((5820757100308609403344549846525567207228199528114420456 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2910378550154304701672274923262783603614099764057210228 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2910378550154304701672274923262783603614099764057210228 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 2. -/
theorem ep_Q2_024_partial_02_0204_valid :
    mulPoly ep_Q2_024_coefficient_02_0204
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0205 : Poly :=
[
  term ((-1735359100248976 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 2. -/
def ep_Q2_024_partial_02_0205 : Poly :=
[
  term ((-3470718200497952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3470718200497952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1735359100248976 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1735359100248976 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 2. -/
theorem ep_Q2_024_partial_02_0205_valid :
    mulPoly ep_Q2_024_coefficient_02_0205
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0206 : Poly :=
[
  term ((-214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (13, 1)]
]

/-- Partial product 206 for generator 2. -/
def ep_Q2_024_partial_02_0206 : Poly :=
[
  term ((-428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((-428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (10, 2), (13, 1)],
  term ((214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 2. -/
theorem ep_Q2_024_partial_02_0206_valid :
    mulPoly ep_Q2_024_coefficient_02_0206
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0207 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 207 for generator 2. -/
def ep_Q2_024_partial_02_0207 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 2. -/
theorem ep_Q2_024_partial_02_0207_valid :
    mulPoly ep_Q2_024_coefficient_02_0207
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0208 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 2. -/
def ep_Q2_024_partial_02_0208 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 2. -/
theorem ep_Q2_024_partial_02_0208_valid :
    mulPoly ep_Q2_024_coefficient_02_0208
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0209 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 2. -/
def ep_Q2_024_partial_02_0209 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 2. -/
theorem ep_Q2_024_partial_02_0209_valid :
    mulPoly ep_Q2_024_coefficient_02_0209
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0210 : Poly :=
[
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (15, 1)]
]

/-- Partial product 210 for generator 2. -/
def ep_Q2_024_partial_02_0210 : Poly :=
[
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (10, 2), (15, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 2. -/
theorem ep_Q2_024_partial_02_0210_valid :
    mulPoly ep_Q2_024_coefficient_02_0210
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0211 : Poly :=
[
  term ((1958137860542752 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 2. -/
def ep_Q2_024_partial_02_0211 : Poly :=
[
  term ((3916275721085504 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 2. -/
theorem ep_Q2_024_partial_02_0211_valid :
    mulPoly ep_Q2_024_coefficient_02_0211
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0212 : Poly :=
[
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 212 for generator 2. -/
def ep_Q2_024_partial_02_0212 : Poly :=
[
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (10, 2), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 2. -/
theorem ep_Q2_024_partial_02_0212_valid :
    mulPoly ep_Q2_024_coefficient_02_0212
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0213 : Poly :=
[
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 213 for generator 2. -/
def ep_Q2_024_partial_02_0213 : Poly :=
[
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (9, 1), (10, 2), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 2. -/
theorem ep_Q2_024_partial_02_0213_valid :
    mulPoly ep_Q2_024_coefficient_02_0213
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0214 : Poly :=
[
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 2. -/
def ep_Q2_024_partial_02_0214 : Poly :=
[
  term ((-5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 2. -/
theorem ep_Q2_024_partial_02_0214_valid :
    mulPoly ep_Q2_024_coefficient_02_0214
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0215 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

/-- Partial product 215 for generator 2. -/
def ep_Q2_024_partial_02_0215 : Poly :=
[
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2), (10, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 2), (11, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (10, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 2. -/
theorem ep_Q2_024_partial_02_0215_valid :
    mulPoly ep_Q2_024_coefficient_02_0215
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0216 : Poly :=
[
  term ((-1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1)]
]

/-- Partial product 216 for generator 2. -/
def ep_Q2_024_partial_02_0216 : Poly :=
[
  term ((-2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2)],
  term ((1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 2. -/
theorem ep_Q2_024_partial_02_0216_valid :
    mulPoly ep_Q2_024_coefficient_02_0216
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0217 : Poly :=
[
  term ((890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 217 for generator 2. -/
def ep_Q2_024_partial_02_0217 : Poly :=
[
  term ((1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 2. -/
theorem ep_Q2_024_partial_02_0217_valid :
    mulPoly ep_Q2_024_coefficient_02_0217
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0218 : Poly :=
[
  term ((2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1)]
]

/-- Partial product 218 for generator 2. -/
def ep_Q2_024_partial_02_0218 : Poly :=
[
  term ((5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 2)],
  term ((-2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 2), (11, 1)],
  term ((-2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 2. -/
theorem ep_Q2_024_partial_02_0218_valid :
    mulPoly ep_Q2_024_coefficient_02_0218
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0219 : Poly :=
[
  term ((404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 219 for generator 2. -/
def ep_Q2_024_partial_02_0219 : Poly :=
[
  term ((809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 2. -/
theorem ep_Q2_024_partial_02_0219_valid :
    mulPoly ep_Q2_024_coefficient_02_0219
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0220 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 220 for generator 2. -/
def ep_Q2_024_partial_02_0220 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 2. -/
theorem ep_Q2_024_partial_02_0220_valid :
    mulPoly ep_Q2_024_coefficient_02_0220
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0221 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 221 for generator 2. -/
def ep_Q2_024_partial_02_0221 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 2. -/
theorem ep_Q2_024_partial_02_0221_valid :
    mulPoly ep_Q2_024_coefficient_02_0221
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0222 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 2. -/
def ep_Q2_024_partial_02_0222 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 2. -/
theorem ep_Q2_024_partial_02_0222_valid :
    mulPoly ep_Q2_024_coefficient_02_0222
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0223 : Poly :=
[
  term ((-3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 223 for generator 2. -/
def ep_Q2_024_partial_02_0223 : Poly :=
[
  term ((-7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 2. -/
theorem ep_Q2_024_partial_02_0223_valid :
    mulPoly ep_Q2_024_coefficient_02_0223
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0224 : Poly :=
[
  term ((-1258416035554584 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 2. -/
def ep_Q2_024_partial_02_0224 : Poly :=
[
  term ((-2516832071109168 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2516832071109168 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1258416035554584 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1258416035554584 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 2. -/
theorem ep_Q2_024_partial_02_0224_valid :
    mulPoly ep_Q2_024_coefficient_02_0224
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0225 : Poly :=
[
  term ((-312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 225 for generator 2. -/
def ep_Q2_024_partial_02_0225 : Poly :=
[
  term ((-624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 2), (13, 1)],
  term ((312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 2. -/
theorem ep_Q2_024_partial_02_0225_valid :
    mulPoly ep_Q2_024_coefficient_02_0225
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0226 : Poly :=
[
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 226 for generator 2. -/
def ep_Q2_024_partial_02_0226 : Poly :=
[
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (10, 2), (12, 2), (15, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 2. -/
theorem ep_Q2_024_partial_02_0226_valid :
    mulPoly ep_Q2_024_coefficient_02_0226
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0227 : Poly :=
[
  term ((-1958693697672998 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 2. -/
def ep_Q2_024_partial_02_0227 : Poly :=
[
  term ((-3917387395345996 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3917387395345996 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1958693697672998 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((1958693697672998 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 2. -/
theorem ep_Q2_024_partial_02_0227_valid :
    mulPoly ep_Q2_024_coefficient_02_0227
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0228 : Poly :=
[
  term ((-13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1)]
]

/-- Partial product 228 for generator 2. -/
def ep_Q2_024_partial_02_0228 : Poly :=
[
  term ((-27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (10, 2), (13, 1)],
  term ((13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 2. -/
theorem ep_Q2_024_partial_02_0228_valid :
    mulPoly ep_Q2_024_coefficient_02_0228
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0229 : Poly :=
[
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 229 for generator 2. -/
def ep_Q2_024_partial_02_0229 : Poly :=
[
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 2. -/
theorem ep_Q2_024_partial_02_0229_valid :
    mulPoly ep_Q2_024_coefficient_02_0229
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0230 : Poly :=
[
  term ((-1347382663288800 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 2. -/
def ep_Q2_024_partial_02_0230 : Poly :=
[
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 2. -/
theorem ep_Q2_024_partial_02_0230_valid :
    mulPoly ep_Q2_024_coefficient_02_0230
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0231 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 231 for generator 2. -/
def ep_Q2_024_partial_02_0231 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 2. -/
theorem ep_Q2_024_partial_02_0231_valid :
    mulPoly ep_Q2_024_coefficient_02_0231
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0232 : Poly :=
[
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (15, 1)]
]

/-- Partial product 232 for generator 2. -/
def ep_Q2_024_partial_02_0232 : Poly :=
[
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 2), (15, 1)],
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 2. -/
theorem ep_Q2_024_partial_02_0232_valid :
    mulPoly ep_Q2_024_coefficient_02_0232
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0233 : Poly :=
[
  term ((1731142516245691 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 2. -/
def ep_Q2_024_partial_02_0233 : Poly :=
[
  term ((3462285032491382 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3462285032491382 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 2. -/
theorem ep_Q2_024_partial_02_0233_valid :
    mulPoly ep_Q2_024_coefficient_02_0233
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0234 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)]
]

/-- Partial product 234 for generator 2. -/
def ep_Q2_024_partial_02_0234 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (15, 3)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 2. -/
theorem ep_Q2_024_partial_02_0234_valid :
    mulPoly ep_Q2_024_coefficient_02_0234
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0235 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 235 for generator 2. -/
def ep_Q2_024_partial_02_0235 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 2. -/
theorem ep_Q2_024_partial_02_0235_valid :
    mulPoly ep_Q2_024_coefficient_02_0235
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0236 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 236 for generator 2. -/
def ep_Q2_024_partial_02_0236 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 2. -/
theorem ep_Q2_024_partial_02_0236_valid :
    mulPoly ep_Q2_024_coefficient_02_0236
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0237 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 237 for generator 2. -/
def ep_Q2_024_partial_02_0237 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 2. -/
theorem ep_Q2_024_partial_02_0237_valid :
    mulPoly ep_Q2_024_coefficient_02_0237
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0238 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 2. -/
def ep_Q2_024_partial_02_0238 : Poly :=
[
  term ((2172308402631610 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 2. -/
theorem ep_Q2_024_partial_02_0238_valid :
    mulPoly ep_Q2_024_coefficient_02_0238
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0239 : Poly :=
[
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 239 for generator 2. -/
def ep_Q2_024_partial_02_0239 : Poly :=
[
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 2. -/
theorem ep_Q2_024_partial_02_0239_valid :
    mulPoly ep_Q2_024_coefficient_02_0239
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0240 : Poly :=
[
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 240 for generator 2. -/
def ep_Q2_024_partial_02_0240 : Poly :=
[
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 2. -/
theorem ep_Q2_024_partial_02_0240_valid :
    mulPoly ep_Q2_024_coefficient_02_0240
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0241 : Poly :=
[
  term ((-8683303471552472 : Rat) / 3488340663459579) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 2. -/
def ep_Q2_024_partial_02_0241 : Poly :=
[
  term ((-17366606943104944 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 2. -/
theorem ep_Q2_024_partial_02_0241_valid :
    mulPoly ep_Q2_024_coefficient_02_0241
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0242 : Poly :=
[
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2)]
]

/-- Partial product 242 for generator 2. -/
def ep_Q2_024_partial_02_0242 : Poly :=
[
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (10, 2)],
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 2. -/
theorem ep_Q2_024_partial_02_0242_valid :
    mulPoly ep_Q2_024_coefficient_02_0242
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0243 : Poly :=
[
  term ((2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1)]
]

/-- Partial product 243 for generator 2. -/
def ep_Q2_024_partial_02_0243 : Poly :=
[
  term ((4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2)],
  term ((-2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (11, 1)],
  term ((-2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 2. -/
theorem ep_Q2_024_partial_02_0243_valid :
    mulPoly ep_Q2_024_coefficient_02_0243
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0244 : Poly :=
[
  term ((5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 244 for generator 2. -/
def ep_Q2_024_partial_02_0244 : Poly :=
[
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 2. -/
theorem ep_Q2_024_partial_02_0244_valid :
    mulPoly ep_Q2_024_coefficient_02_0244
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0245 : Poly :=
[
  term ((9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 245 for generator 2. -/
def ep_Q2_024_partial_02_0245 : Poly :=
[
  term ((19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 2. -/
theorem ep_Q2_024_partial_02_0245_valid :
    mulPoly ep_Q2_024_coefficient_02_0245
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0246 : Poly :=
[
  term ((596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 2. -/
def ep_Q2_024_partial_02_0246 : Poly :=
[
  term ((1193826078367496 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1193826078367496 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 2. -/
theorem ep_Q2_024_partial_02_0246_valid :
    mulPoly ep_Q2_024_coefficient_02_0246
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0247 : Poly :=
[
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 247 for generator 2. -/
def ep_Q2_024_partial_02_0247 : Poly :=
[
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 2. -/
theorem ep_Q2_024_partial_02_0247_valid :
    mulPoly ep_Q2_024_coefficient_02_0247
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0248 : Poly :=
[
  term ((-1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 248 for generator 2. -/
def ep_Q2_024_partial_02_0248 : Poly :=
[
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 2. -/
theorem ep_Q2_024_partial_02_0248_valid :
    mulPoly ep_Q2_024_coefficient_02_0248
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0249 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 249 for generator 2. -/
def ep_Q2_024_partial_02_0249 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 2. -/
theorem ep_Q2_024_partial_02_0249_valid :
    mulPoly ep_Q2_024_coefficient_02_0249
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0250 : Poly :=
[
  term ((4095023840331510 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 250 for generator 2. -/
def ep_Q2_024_partial_02_0250 : Poly :=
[
  term ((8190047680663020 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((8190047680663020 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4095023840331510 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4095023840331510 : Rat) / 1162780221153193) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 2. -/
theorem ep_Q2_024_partial_02_0250_valid :
    mulPoly ep_Q2_024_coefficient_02_0250
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0251 : Poly :=
[
  term ((9534321875731799251589500987900123959596 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 251 for generator 2. -/
def ep_Q2_024_partial_02_0251 : Poly :=
[
  term ((19068643751463598503179001975800247919192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((19068643751463598503179001975800247919192 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9534321875731799251589500987900123959596 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-9534321875731799251589500987900123959596 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 2. -/
theorem ep_Q2_024_partial_02_0251_valid :
    mulPoly ep_Q2_024_coefficient_02_0251
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0252 : Poly :=
[
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 252 for generator 2. -/
def ep_Q2_024_partial_02_0252 : Poly :=
[
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 2. -/
theorem ep_Q2_024_partial_02_0252_valid :
    mulPoly ep_Q2_024_coefficient_02_0252
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0253 : Poly :=
[
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 253 for generator 2. -/
def ep_Q2_024_partial_02_0253 : Poly :=
[
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 2. -/
theorem ep_Q2_024_partial_02_0253_valid :
    mulPoly ep_Q2_024_coefficient_02_0253
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0254 : Poly :=
[
  term ((-277384937357655 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 2. -/
def ep_Q2_024_partial_02_0254 : Poly :=
[
  term ((-277384937357655 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-277384937357655 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 2. -/
theorem ep_Q2_024_partial_02_0254_valid :
    mulPoly ep_Q2_024_coefficient_02_0254
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0255 : Poly :=
[
  term ((94284982234116866535180536248349123686268411690766251 : Rat) / 37830465849438094312058580237407426337654769759218768) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 255 for generator 2. -/
def ep_Q2_024_partial_02_0255 : Poly :=
[
  term ((94284982234116866535180536248349123686268411690766251 : Rat) / 18915232924719047156029290118703713168827384879609384) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((94284982234116866535180536248349123686268411690766251 : Rat) / 18915232924719047156029290118703713168827384879609384) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-94284982234116866535180536248349123686268411690766251 : Rat) / 37830465849438094312058580237407426337654769759218768) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-94284982234116866535180536248349123686268411690766251 : Rat) / 37830465849438094312058580237407426337654769759218768) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 2. -/
theorem ep_Q2_024_partial_02_0255_valid :
    mulPoly ep_Q2_024_coefficient_02_0255
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0256 : Poly :=
[
  term ((123737326449735883 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 2. -/
def ep_Q2_024_partial_02_0256 : Poly :=
[
  term ((123737326449735883 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((123737326449735883 : Rat) / 6976681326919158) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-123737326449735883 : Rat) / 13953362653838316) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-123737326449735883 : Rat) / 13953362653838316) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 2. -/
theorem ep_Q2_024_partial_02_0256_valid :
    mulPoly ep_Q2_024_coefficient_02_0256
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0257 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 257 for generator 2. -/
def ep_Q2_024_partial_02_0257 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 2), (13, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 2. -/
theorem ep_Q2_024_partial_02_0257_valid :
    mulPoly ep_Q2_024_coefficient_02_0257
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0258 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 258 for generator 2. -/
def ep_Q2_024_partial_02_0258 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 2. -/
theorem ep_Q2_024_partial_02_0258_valid :
    mulPoly ep_Q2_024_coefficient_02_0258
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0259 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 2. -/
def ep_Q2_024_partial_02_0259 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 2. -/
theorem ep_Q2_024_partial_02_0259_valid :
    mulPoly ep_Q2_024_coefficient_02_0259
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0260 : Poly :=
[
  term ((-49180348165818645412917930953760440141 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1)]
]

/-- Partial product 260 for generator 2. -/
def ep_Q2_024_partial_02_0260 : Poly :=
[
  term ((-98360696331637290825835861907520880282 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-98360696331637290825835861907520880282 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((49180348165818645412917930953760440141 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1)],
  term ((49180348165818645412917930953760440141 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 2. -/
theorem ep_Q2_024_partial_02_0260_valid :
    mulPoly ep_Q2_024_coefficient_02_0260
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0261 : Poly :=
[
  term ((-1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 261 for generator 2. -/
def ep_Q2_024_partial_02_0261 : Poly :=
[
  term ((-2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 2. -/
theorem ep_Q2_024_partial_02_0261_valid :
    mulPoly ep_Q2_024_coefficient_02_0261
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0262 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 262 for generator 2. -/
def ep_Q2_024_partial_02_0262 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 2. -/
theorem ep_Q2_024_partial_02_0262_valid :
    mulPoly ep_Q2_024_coefficient_02_0262
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0263 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 263 for generator 2. -/
def ep_Q2_024_partial_02_0263 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 2. -/
theorem ep_Q2_024_partial_02_0263_valid :
    mulPoly ep_Q2_024_coefficient_02_0263
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0264 : Poly :=
[
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 264 for generator 2. -/
def ep_Q2_024_partial_02_0264 : Poly :=
[
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 2. -/
theorem ep_Q2_024_partial_02_0264_valid :
    mulPoly ep_Q2_024_coefficient_02_0264
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0265 : Poly :=
[
  term ((60129224652876851 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 2. -/
def ep_Q2_024_partial_02_0265 : Poly :=
[
  term ((60129224652876851 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((60129224652876851 : Rat) / 6976681326919158) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 2. -/
theorem ep_Q2_024_partial_02_0265_valid :
    mulPoly ep_Q2_024_coefficient_02_0265
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0266 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 266 for generator 2. -/
def ep_Q2_024_partial_02_0266 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 2. -/
theorem ep_Q2_024_partial_02_0266_valid :
    mulPoly ep_Q2_024_coefficient_02_0266
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0267 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 2. -/
def ep_Q2_024_partial_02_0267 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 2. -/
theorem ep_Q2_024_partial_02_0267_valid :
    mulPoly ep_Q2_024_coefficient_02_0267
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0268 : Poly :=
[
  term ((39339586287623002786723982323149843504275745008395699649 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (15, 1)]
]

/-- Partial product 268 for generator 2. -/
def ep_Q2_024_partial_02_0268 : Poly :=
[
  term ((39339586287623002786723982323149843504275745008395699649 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((39339586287623002786723982323149843504275745008395699649 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-39339586287623002786723982323149843504275745008395699649 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 2), (15, 1)],
  term ((-39339586287623002786723982323149843504275745008395699649 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 2. -/
theorem ep_Q2_024_partial_02_0268_valid :
    mulPoly ep_Q2_024_coefficient_02_0268
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0269 : Poly :=
[
  term ((-7286027767178131 : Rat) / 1162780221153193) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 2. -/
def ep_Q2_024_partial_02_0269 : Poly :=
[
  term ((-14572055534356262 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14572055534356262 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7286027767178131 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((7286027767178131 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 2. -/
theorem ep_Q2_024_partial_02_0269_valid :
    mulPoly ep_Q2_024_coefficient_02_0269
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0270 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 3)]
]

/-- Partial product 270 for generator 2. -/
def ep_Q2_024_partial_02_0270 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 2. -/
theorem ep_Q2_024_partial_02_0270_valid :
    mulPoly ep_Q2_024_coefficient_02_0270
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0271 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 271 for generator 2. -/
def ep_Q2_024_partial_02_0271 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 2. -/
theorem ep_Q2_024_partial_02_0271_valid :
    mulPoly ep_Q2_024_coefficient_02_0271
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0272 : Poly :=
[
  term ((-19870656585660132758037158140158905970799 : Rat) / 5398692558311147834550120876132926705955) [(9, 2)]
]

/-- Partial product 272 for generator 2. -/
def ep_Q2_024_partial_02_0272 : Poly :=
[
  term ((-39741313171320265516074316280317811941598 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2), (10, 1)],
  term ((-39741313171320265516074316280317811941598 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 2), (11, 1)],
  term ((19870656585660132758037158140158905970799 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (10, 2)],
  term ((19870656585660132758037158140158905970799 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 2. -/
theorem ep_Q2_024_partial_02_0272_valid :
    mulPoly ep_Q2_024_coefficient_02_0272
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0273 : Poly :=
[
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 273 for generator 2. -/
def ep_Q2_024_partial_02_0273 : Poly :=
[
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 2. -/
theorem ep_Q2_024_partial_02_0273_valid :
    mulPoly ep_Q2_024_coefficient_02_0273
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0274 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 274 for generator 2. -/
def ep_Q2_024_partial_02_0274 : Poly :=
[
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 2. -/
theorem ep_Q2_024_partial_02_0274_valid :
    mulPoly ep_Q2_024_coefficient_02_0274
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0275 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 2. -/
def ep_Q2_024_partial_02_0275 : Poly :=
[
  term ((-2990296899089872 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 2. -/
theorem ep_Q2_024_partial_02_0275_valid :
    mulPoly ep_Q2_024_coefficient_02_0275
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0276 : Poly :=
[
  term ((-1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)]
]

/-- Partial product 276 for generator 2. -/
def ep_Q2_024_partial_02_0276 : Poly :=
[
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 2. -/
theorem ep_Q2_024_partial_02_0276_valid :
    mulPoly ep_Q2_024_coefficient_02_0276
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0277 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 277 for generator 2. -/
def ep_Q2_024_partial_02_0277 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 2. -/
theorem ep_Q2_024_partial_02_0277_valid :
    mulPoly ep_Q2_024_coefficient_02_0277
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0278 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 278 for generator 2. -/
def ep_Q2_024_partial_02_0278 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 2), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 2. -/
theorem ep_Q2_024_partial_02_0278_valid :
    mulPoly ep_Q2_024_coefficient_02_0278
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0279 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 279 for generator 2. -/
def ep_Q2_024_partial_02_0279 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 2. -/
theorem ep_Q2_024_partial_02_0279_valid :
    mulPoly ep_Q2_024_coefficient_02_0279
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0280 : Poly :=
[
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 280 for generator 2. -/
def ep_Q2_024_partial_02_0280 : Poly :=
[
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 2. -/
theorem ep_Q2_024_partial_02_0280_valid :
    mulPoly ep_Q2_024_coefficient_02_0280
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0281 : Poly :=
[
  term ((5546629823834425 : Rat) / 3488340663459579) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 2. -/
def ep_Q2_024_partial_02_0281 : Poly :=
[
  term ((11093259647668850 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11093259647668850 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 2. -/
theorem ep_Q2_024_partial_02_0281_valid :
    mulPoly ep_Q2_024_coefficient_02_0281
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0282 : Poly :=
[
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (13, 2)]
]

/-- Partial product 282 for generator 2. -/
def ep_Q2_024_partial_02_0282 : Poly :=
[
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (13, 2)],
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (13, 2)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 2. -/
theorem ep_Q2_024_partial_02_0282_valid :
    mulPoly ep_Q2_024_coefficient_02_0282
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0283 : Poly :=
[
  term ((11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (14, 1)]
]

/-- Partial product 283 for generator 2. -/
def ep_Q2_024_partial_02_0283 : Poly :=
[
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (14, 1)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 2. -/
theorem ep_Q2_024_partial_02_0283_valid :
    mulPoly ep_Q2_024_coefficient_02_0283
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0284 : Poly :=
[
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (15, 2)]
]

/-- Partial product 284 for generator 2. -/
def ep_Q2_024_partial_02_0284 : Poly :=
[
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (10, 2), (15, 2)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 2. -/
theorem ep_Q2_024_partial_02_0284_valid :
    mulPoly ep_Q2_024_coefficient_02_0284
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0285 : Poly :=
[
  term ((-5481382992466540 : Rat) / 3488340663459579) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 285 for generator 2. -/
def ep_Q2_024_partial_02_0285 : Poly :=
[
  term ((-10962765984933080 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10962765984933080 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 2. -/
theorem ep_Q2_024_partial_02_0285_valid :
    mulPoly ep_Q2_024_coefficient_02_0285
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0286 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 286 for generator 2. -/
def ep_Q2_024_partial_02_0286 : Poly :=
[
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (10, 1), (11, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (11, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (11, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 2. -/
theorem ep_Q2_024_partial_02_0286_valid :
    mulPoly ep_Q2_024_coefficient_02_0286
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0287 : Poly :=
[
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (13, 1)]
]

/-- Partial product 287 for generator 2. -/
def ep_Q2_024_partial_02_0287 : Poly :=
[
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (10, 1), (13, 1)],
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 1), (13, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (10, 2), (13, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 2. -/
theorem ep_Q2_024_partial_02_0287_valid :
    mulPoly ep_Q2_024_coefficient_02_0287
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0288 : Poly :=
[
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(9, 3), (15, 1)]
]

/-- Partial product 288 for generator 2. -/
def ep_Q2_024_partial_02_0288 : Poly :=
[
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 3), (10, 1), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (11, 1), (15, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(9, 3), (10, 2), (15, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 2. -/
theorem ep_Q2_024_partial_02_0288_valid :
    mulPoly ep_Q2_024_coefficient_02_0288
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0289 : Poly :=
[
  term ((4111658236248574 : Rat) / 3488340663459579) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 2. -/
def ep_Q2_024_partial_02_0289 : Poly :=
[
  term ((8223316472497148 : Rat) / 3488340663459579) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((8223316472497148 : Rat) / 3488340663459579) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 2. -/
theorem ep_Q2_024_partial_02_0289_valid :
    mulPoly ep_Q2_024_coefficient_02_0289
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0290 : Poly :=
[
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(9, 4)]
]

/-- Partial product 290 for generator 2. -/
def ep_Q2_024_partial_02_0290 : Poly :=
[
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4), (10, 1)],
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (11, 1)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (10, 2)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 2. -/
theorem ep_Q2_024_partial_02_0290_valid :
    mulPoly ep_Q2_024_coefficient_02_0290
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0291 : Poly :=
[
  term ((743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 291 for generator 2. -/
def ep_Q2_024_partial_02_0291 : Poly :=
[
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 2. -/
theorem ep_Q2_024_partial_02_0291_valid :
    mulPoly ep_Q2_024_coefficient_02_0291
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0292 : Poly :=
[
  term ((-296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 292 for generator 2. -/
def ep_Q2_024_partial_02_0292 : Poly :=
[
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 2. -/
theorem ep_Q2_024_partial_02_0292_valid :
    mulPoly ep_Q2_024_coefficient_02_0292
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0293 : Poly :=
[
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 293 for generator 2. -/
def ep_Q2_024_partial_02_0293 : Poly :=
[
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 2. -/
theorem ep_Q2_024_partial_02_0293_valid :
    mulPoly ep_Q2_024_coefficient_02_0293
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0294 : Poly :=
[
  term ((-2189297816169598 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 2. -/
def ep_Q2_024_partial_02_0294 : Poly :=
[
  term ((-4378595632339196 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4378595632339196 : Rat) / 1162780221153193) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2189297816169598 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2189297816169598 : Rat) / 1162780221153193) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 2. -/
theorem ep_Q2_024_partial_02_0294_valid :
    mulPoly ep_Q2_024_coefficient_02_0294
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0295 : Poly :=
[
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 295 for generator 2. -/
def ep_Q2_024_partial_02_0295 : Poly :=
[
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 2. -/
theorem ep_Q2_024_partial_02_0295_valid :
    mulPoly ep_Q2_024_coefficient_02_0295
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0296 : Poly :=
[
  term ((13803265389892245 : Rat) / 4651120884612772) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 2. -/
def ep_Q2_024_partial_02_0296 : Poly :=
[
  term ((13803265389892245 : Rat) / 2325560442306386) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13803265389892245 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13803265389892245 : Rat) / 4651120884612772) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13803265389892245 : Rat) / 4651120884612772) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 2. -/
theorem ep_Q2_024_partial_02_0296_valid :
    mulPoly ep_Q2_024_coefficient_02_0296
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0297 : Poly :=
[
  term ((10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 297 for generator 2. -/
def ep_Q2_024_partial_02_0297 : Poly :=
[
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (11, 2), (12, 2), (13, 1)],
  term ((-10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (11, 1), (12, 2), (13, 1)],
  term ((-10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(11, 3), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 2. -/
theorem ep_Q2_024_partial_02_0297_valid :
    mulPoly ep_Q2_024_coefficient_02_0297
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0298 : Poly :=
[
  term ((-114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 298 for generator 2. -/
def ep_Q2_024_partial_02_0298 : Poly :=
[
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 2), (11, 1), (12, 2), (15, 1)],
  term ((114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 2. -/
theorem ep_Q2_024_partial_02_0298_valid :
    mulPoly ep_Q2_024_coefficient_02_0298
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0299 : Poly :=
[
  term ((1503525091682300 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 2. -/
def ep_Q2_024_partial_02_0299 : Poly :=
[
  term ((3007050183364600 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3007050183364600 : Rat) / 1162780221153193) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1503525091682300 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1503525091682300 : Rat) / 1162780221153193) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 2. -/
theorem ep_Q2_024_partial_02_0299_valid :
    mulPoly ep_Q2_024_coefficient_02_0299
        ep_Q2_024_generator_02_0200_0299 =
      ep_Q2_024_partial_02_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_02_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_02_0200,
  ep_Q2_024_partial_02_0201,
  ep_Q2_024_partial_02_0202,
  ep_Q2_024_partial_02_0203,
  ep_Q2_024_partial_02_0204,
  ep_Q2_024_partial_02_0205,
  ep_Q2_024_partial_02_0206,
  ep_Q2_024_partial_02_0207,
  ep_Q2_024_partial_02_0208,
  ep_Q2_024_partial_02_0209,
  ep_Q2_024_partial_02_0210,
  ep_Q2_024_partial_02_0211,
  ep_Q2_024_partial_02_0212,
  ep_Q2_024_partial_02_0213,
  ep_Q2_024_partial_02_0214,
  ep_Q2_024_partial_02_0215,
  ep_Q2_024_partial_02_0216,
  ep_Q2_024_partial_02_0217,
  ep_Q2_024_partial_02_0218,
  ep_Q2_024_partial_02_0219,
  ep_Q2_024_partial_02_0220,
  ep_Q2_024_partial_02_0221,
  ep_Q2_024_partial_02_0222,
  ep_Q2_024_partial_02_0223,
  ep_Q2_024_partial_02_0224,
  ep_Q2_024_partial_02_0225,
  ep_Q2_024_partial_02_0226,
  ep_Q2_024_partial_02_0227,
  ep_Q2_024_partial_02_0228,
  ep_Q2_024_partial_02_0229,
  ep_Q2_024_partial_02_0230,
  ep_Q2_024_partial_02_0231,
  ep_Q2_024_partial_02_0232,
  ep_Q2_024_partial_02_0233,
  ep_Q2_024_partial_02_0234,
  ep_Q2_024_partial_02_0235,
  ep_Q2_024_partial_02_0236,
  ep_Q2_024_partial_02_0237,
  ep_Q2_024_partial_02_0238,
  ep_Q2_024_partial_02_0239,
  ep_Q2_024_partial_02_0240,
  ep_Q2_024_partial_02_0241,
  ep_Q2_024_partial_02_0242,
  ep_Q2_024_partial_02_0243,
  ep_Q2_024_partial_02_0244,
  ep_Q2_024_partial_02_0245,
  ep_Q2_024_partial_02_0246,
  ep_Q2_024_partial_02_0247,
  ep_Q2_024_partial_02_0248,
  ep_Q2_024_partial_02_0249,
  ep_Q2_024_partial_02_0250,
  ep_Q2_024_partial_02_0251,
  ep_Q2_024_partial_02_0252,
  ep_Q2_024_partial_02_0253,
  ep_Q2_024_partial_02_0254,
  ep_Q2_024_partial_02_0255,
  ep_Q2_024_partial_02_0256,
  ep_Q2_024_partial_02_0257,
  ep_Q2_024_partial_02_0258,
  ep_Q2_024_partial_02_0259,
  ep_Q2_024_partial_02_0260,
  ep_Q2_024_partial_02_0261,
  ep_Q2_024_partial_02_0262,
  ep_Q2_024_partial_02_0263,
  ep_Q2_024_partial_02_0264,
  ep_Q2_024_partial_02_0265,
  ep_Q2_024_partial_02_0266,
  ep_Q2_024_partial_02_0267,
  ep_Q2_024_partial_02_0268,
  ep_Q2_024_partial_02_0269,
  ep_Q2_024_partial_02_0270,
  ep_Q2_024_partial_02_0271,
  ep_Q2_024_partial_02_0272,
  ep_Q2_024_partial_02_0273,
  ep_Q2_024_partial_02_0274,
  ep_Q2_024_partial_02_0275,
  ep_Q2_024_partial_02_0276,
  ep_Q2_024_partial_02_0277,
  ep_Q2_024_partial_02_0278,
  ep_Q2_024_partial_02_0279,
  ep_Q2_024_partial_02_0280,
  ep_Q2_024_partial_02_0281,
  ep_Q2_024_partial_02_0282,
  ep_Q2_024_partial_02_0283,
  ep_Q2_024_partial_02_0284,
  ep_Q2_024_partial_02_0285,
  ep_Q2_024_partial_02_0286,
  ep_Q2_024_partial_02_0287,
  ep_Q2_024_partial_02_0288,
  ep_Q2_024_partial_02_0289,
  ep_Q2_024_partial_02_0290,
  ep_Q2_024_partial_02_0291,
  ep_Q2_024_partial_02_0292,
  ep_Q2_024_partial_02_0293,
  ep_Q2_024_partial_02_0294,
  ep_Q2_024_partial_02_0295,
  ep_Q2_024_partial_02_0296,
  ep_Q2_024_partial_02_0297,
  ep_Q2_024_partial_02_0298,
  ep_Q2_024_partial_02_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_02_0200_0299 : Poly :=
[
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)],
  term ((-231109818860754083654757831458380082264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((5820757100308609403344549846525567207228199528114420456 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3470718200497952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 2), (10, 1)],
  term ((-2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2516832071109168 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-3917387395345996 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((3462285032491382 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1193826078367496 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((8190047680663020 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((19068643751463598503179001975800247919192 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-277384937357655 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((94284982234116866535180536248349123686268411690766251 : Rat) / 18915232924719047156029290118703713168827384879609384) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((123737326449735883 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-98360696331637290825835861907520880282 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((60129224652876851 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((39339586287623002786723982323149843504275745008395699649 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-14572055534356262 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-39741313171320265516074316280317811941598 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (9, 2), (10, 1)],
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((11093259647668850 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (13, 2)],
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((-10962765984933080 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (10, 1), (11, 1)],
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (10, 1), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 3), (10, 1), (15, 1)],
  term ((8223316472497148 : Rat) / 3488340663459579) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4), (10, 1)],
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4378595632339196 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((13803265389892245 : Rat) / 2325560442306386) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((3007050183364600 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-231109818860754083654757831458380082264 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((5820757100308609403344549846525567207228199528114420456 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3470718200497952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-428400922598569314887826891032374701148 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 2), (11, 1)],
  term ((-2325063032578165385704863095975211441866 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2516832071109168 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3917387395345996 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-27496775323030507871965305567828935510 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((179015682797667221988005811797502733213916222843084787907 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((3462285032491382 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((5969623438679918079643152544751630641666 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 2), (11, 1)],
  term ((19068643751463598503179001975800247919192 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-277384937357655 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((94284982234116866535180536248349123686268411690766251 : Rat) / 18915232924719047156029290118703713168827384879609384) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((123737326449735883 : Rat) / 6976681326919158) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-98360696331637290825835861907520880282 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2255828479408258948855669467882577112152 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-88449296187459810695623820559101301602916309312675145817 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((60129224652876851 : Rat) / 6976681326919158) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39339586287623002786723982323149843504275745008395699649 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-14572055534356262 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((4282363504556017422849193641201709928428 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2)],
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((19891178564855248656314940241559258930127544451882247442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1193826078367496 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((8190047680663020 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-39741313171320265516074316280317811941598 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 2), (11, 1)],
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((11093259647668850 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-10962765984933080 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 1), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 3), (11, 1), (15, 1)],
  term ((8223316472497148 : Rat) / 3488340663459579) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (11, 2)],
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 4), (11, 1)],
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4378595632339196 : Rat) / 1162780221153193) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((13803265389892245 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (11, 2), (12, 2), (13, 1)],
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((3007050183364600 : Rat) / 1162780221153193) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (11, 1), (13, 2)],
  term ((115554909430377041827378915729190041132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-2910378550154304701672274923262783603614099764057210228 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((1735359100248976 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (10, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (10, 2), (15, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((115554909430377041827378915729190041132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-2910378550154304701672274923262783603614099764057210228 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((1735359100248976 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((214200461299284657443913445516187350574 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (11, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (11, 2), (15, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 3), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 3), (13, 2)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (10, 2), (13, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (9, 1), (10, 2), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (10, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 2)],
  term ((1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2)],
  term ((-890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((1162531516289082692852431547987605720933 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2)],
  term ((-890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 2), (11, 1)],
  term ((-404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((1258416035554584 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 2), (13, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (10, 2), (12, 2), (15, 1)],
  term ((1958693697672998 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (10, 2), (13, 1)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 2), (15, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (15, 3)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1258416035554584 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 2), (13, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((1958693697672998 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((13748387661515253935982652783914467755 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (11, 2), (13, 1)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-179015682797667221988005811797502733213916222843084787907 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (11, 2), (15, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (15, 3)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-2984811719339959039821576272375815320833 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 3)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (10, 2)],
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (11, 2)],
  term ((-2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (11, 1)],
  term ((-5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-4095023840331510 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9534321875731799251589500987900123959596 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94284982234116866535180536248349123686268411690766251 : Rat) / 37830465849438094312058580237407426337654769759218768) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-123737326449735883 : Rat) / 13953362653838316) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((49180348165818645412917930953760440141 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1)],
  term ((1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-39339586287623002786723982323149843504275745008395699649 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 2), (15, 1)],
  term ((7286027767178131 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-9534321875731799251589500987900123959596 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94284982234116866535180536248349123686268411690766251 : Rat) / 37830465849438094312058580237407426337654769759218768) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-123737326449735883 : Rat) / 13953362653838316) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((49180348165818645412917930953760440141 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1)],
  term ((1127914239704129474427834733941288556076 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((88449296187459810695623820559101301602916309312675145817 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-39339586287623002786723982323149843504275745008395699649 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 2), (15, 1)],
  term ((7286027767178131 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-2141181752278008711424596820600854964214 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 3)],
  term ((-5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(9, 1), (11, 3), (12, 1)],
  term ((-9945589282427624328157470120779629465063772225941123721 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3), (13, 2)],
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 3), (14, 1)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 3), (15, 2)],
  term ((-4095023840331510 : Rat) / 1162780221153193) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((19870656585660132758037158140158905970799 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (10, 2)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (13, 2)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (14, 1)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (10, 2), (15, 2)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((19870656585660132758037158140158905970799 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (11, 2)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (13, 2)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (14, 1)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (11, 2), (15, 2)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 3), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 3), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (11, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (10, 2), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(9, 3), (10, 2), (15, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 2), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(9, 3), (11, 2), (15, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 3)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (10, 2)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (11, 2)],
  term ((-743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2189297816169598 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-13803265389892245 : Rat) / 4651120884612772) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (11, 1), (12, 2), (13, 1)],
  term ((114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(10, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1503525091682300 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(11, 3), (12, 1), (13, 1)],
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 1), (13, 1), (14, 1)],
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((2189297816169598 : Rat) / 1162780221153193) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 3), (12, 1), (15, 1)],
  term ((-13803265389892245 : Rat) / 4651120884612772) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(11, 3), (12, 2), (13, 1)],
  term ((114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 3), (12, 2), (15, 1)],
  term ((-1503525091682300 : Rat) / 1162780221153193) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 200 through 299. -/
theorem ep_Q2_024_block_02_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_02_0200_0299
      ep_Q2_024_block_02_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
