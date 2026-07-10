/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 17:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_17_0200_0299 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0200 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 17. -/
def ep_Q2_024_partial_17_0200 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 17. -/
theorem ep_Q2_024_partial_17_0200_valid :
    mulPoly ep_Q2_024_coefficient_17_0200
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0201 : Poly :=
[
  term ((-1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 201 for generator 17. -/
def ep_Q2_024_partial_17_0201 : Poly :=
[
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 2)],
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 17. -/
theorem ep_Q2_024_partial_17_0201_valid :
    mulPoly ep_Q2_024_coefficient_17_0201
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0202 : Poly :=
[
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 202 for generator 17. -/
def ep_Q2_024_partial_17_0202 : Poly :=
[
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 17. -/
theorem ep_Q2_024_partial_17_0202_valid :
    mulPoly ep_Q2_024_coefficient_17_0202
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0203 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 203 for generator 17. -/
def ep_Q2_024_partial_17_0203 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 3)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 17. -/
theorem ep_Q2_024_partial_17_0203_valid :
    mulPoly ep_Q2_024_coefficient_17_0203
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0204 : Poly :=
[
  term ((69367473696382 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 17. -/
def ep_Q2_024_partial_17_0204 : Poly :=
[
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 17. -/
theorem ep_Q2_024_partial_17_0204_valid :
    mulPoly ep_Q2_024_coefficient_17_0204
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0205 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1)]
]

/-- Partial product 205 for generator 17. -/
def ep_Q2_024_partial_17_0205 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (14, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (14, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 17. -/
theorem ep_Q2_024_partial_17_0205_valid :
    mulPoly ep_Q2_024_coefficient_17_0205
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0206 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 206 for generator 17. -/
def ep_Q2_024_partial_17_0206 : Poly :=
[
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 17. -/
theorem ep_Q2_024_partial_17_0206_valid :
    mulPoly ep_Q2_024_coefficient_17_0206
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0207 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 207 for generator 17. -/
def ep_Q2_024_partial_17_0207 : Poly :=
[
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 17. -/
theorem ep_Q2_024_partial_17_0207_valid :
    mulPoly ep_Q2_024_coefficient_17_0207
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0208 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 17. -/
def ep_Q2_024_partial_17_0208 : Poly :=
[
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 17. -/
theorem ep_Q2_024_partial_17_0208_valid :
    mulPoly ep_Q2_024_coefficient_17_0208
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0209 : Poly :=
[
  term ((14796111946810321172334914615737072864 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 209 for generator 17. -/
def ep_Q2_024_partial_17_0209 : Poly :=
[
  term ((29592223893620642344669829231474145728 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((29592223893620642344669829231474145728 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-14796111946810321172334914615737072864 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-14796111946810321172334914615737072864 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 17. -/
theorem ep_Q2_024_partial_17_0209_valid :
    mulPoly ep_Q2_024_coefficient_17_0209
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0210 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 210 for generator 17. -/
def ep_Q2_024_partial_17_0210 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 17. -/
theorem ep_Q2_024_partial_17_0210_valid :
    mulPoly ep_Q2_024_coefficient_17_0210
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0211 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 211 for generator 17. -/
def ep_Q2_024_partial_17_0211 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 17. -/
theorem ep_Q2_024_partial_17_0211_valid :
    mulPoly ep_Q2_024_coefficient_17_0211
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0212 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 17. -/
def ep_Q2_024_partial_17_0212 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 17. -/
theorem ep_Q2_024_partial_17_0212_valid :
    mulPoly ep_Q2_024_coefficient_17_0212
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0213 : Poly :=
[
  term ((24882332909070005223458874066821321452779693638559361358 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 213 for generator 17. -/
def ep_Q2_024_partial_17_0213 : Poly :=
[
  term ((49764665818140010446917748133642642905559387277118722716 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((49764665818140010446917748133642642905559387277118722716 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-24882332909070005223458874066821321452779693638559361358 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-24882332909070005223458874066821321452779693638559361358 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 17. -/
theorem ep_Q2_024_partial_17_0213_valid :
    mulPoly ep_Q2_024_coefficient_17_0213
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0214 : Poly :=
[
  term ((-3319047719608968 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 17. -/
def ep_Q2_024_partial_17_0214 : Poly :=
[
  term ((-6638095439217936 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6638095439217936 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3319047719608968 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3319047719608968 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 17. -/
theorem ep_Q2_024_partial_17_0214_valid :
    mulPoly ep_Q2_024_coefficient_17_0214
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0215 : Poly :=
[
  term ((-647484394046023896882748070114589697864 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2)]
]

/-- Partial product 215 for generator 17. -/
def ep_Q2_024_partial_17_0215 : Poly :=
[
  term ((-1294968788092047793765496140229179395728 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((-1294968788092047793765496140229179395728 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((647484394046023896882748070114589697864 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (14, 2)],
  term ((647484394046023896882748070114589697864 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 17. -/
theorem ep_Q2_024_partial_17_0215_valid :
    mulPoly ep_Q2_024_coefficient_17_0215
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0216 : Poly :=
[
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 216 for generator 17. -/
def ep_Q2_024_partial_17_0216 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 17. -/
theorem ep_Q2_024_partial_17_0216_valid :
    mulPoly ep_Q2_024_coefficient_17_0216
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0217 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 217 for generator 17. -/
def ep_Q2_024_partial_17_0217 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 17. -/
theorem ep_Q2_024_partial_17_0217_valid :
    mulPoly ep_Q2_024_coefficient_17_0217
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0218 : Poly :=
[
  term ((-28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 17. -/
def ep_Q2_024_partial_17_0218 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 17. -/
theorem ep_Q2_024_partial_17_0218_valid :
    mulPoly ep_Q2_024_coefficient_17_0218
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0219 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1)]
]

/-- Partial product 219 for generator 17. -/
def ep_Q2_024_partial_17_0219 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (14, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 17. -/
theorem ep_Q2_024_partial_17_0219_valid :
    mulPoly ep_Q2_024_coefficient_17_0219
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0220 : Poly :=
[
  term ((25079421012636288424922284230155009949386462660822310079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 220 for generator 17. -/
def ep_Q2_024_partial_17_0220 : Poly :=
[
  term ((25079421012636288424922284230155009949386462660822310079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((25079421012636288424922284230155009949386462660822310079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-25079421012636288424922284230155009949386462660822310079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-25079421012636288424922284230155009949386462660822310079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 17. -/
theorem ep_Q2_024_partial_17_0220_valid :
    mulPoly ep_Q2_024_coefficient_17_0220
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0221 : Poly :=
[
  term ((-3432805364188938 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 17. -/
def ep_Q2_024_partial_17_0221 : Poly :=
[
  term ((-6865610728377876 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6865610728377876 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3432805364188938 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3432805364188938 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 17. -/
theorem ep_Q2_024_partial_17_0221_valid :
    mulPoly ep_Q2_024_coefficient_17_0221
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0222 : Poly :=
[
  term ((123996725218156847433908923532346597584 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2)]
]

/-- Partial product 222 for generator 17. -/
def ep_Q2_024_partial_17_0222 : Poly :=
[
  term ((247993450436313694867817847064693195168 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((247993450436313694867817847064693195168 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-123996725218156847433908923532346597584 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (14, 2)],
  term ((-123996725218156847433908923532346597584 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 17. -/
theorem ep_Q2_024_partial_17_0222_valid :
    mulPoly ep_Q2_024_coefficient_17_0222
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0223 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1)]
]

/-- Partial product 223 for generator 17. -/
def ep_Q2_024_partial_17_0223 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (14, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1), (15, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 17. -/
theorem ep_Q2_024_partial_17_0223_valid :
    mulPoly ep_Q2_024_coefficient_17_0223
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0224 : Poly :=
[
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (15, 2)]
]

/-- Partial product 224 for generator 17. -/
def ep_Q2_024_partial_17_0224 : Poly :=
[
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 3)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (14, 2), (15, 2)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 17. -/
theorem ep_Q2_024_partial_17_0224_valid :
    mulPoly ep_Q2_024_coefficient_17_0224
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0225 : Poly :=
[
  term ((-1338454083518194 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 225 for generator 17. -/
def ep_Q2_024_partial_17_0225 : Poly :=
[
  term ((-2676908167036388 : Rat) / 1162780221153193) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2676908167036388 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 17. -/
theorem ep_Q2_024_partial_17_0225_valid :
    mulPoly ep_Q2_024_coefficient_17_0225
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0226 : Poly :=
[
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 226 for generator 17. -/
def ep_Q2_024_partial_17_0226 : Poly :=
[
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 17. -/
theorem ep_Q2_024_partial_17_0226_valid :
    mulPoly ep_Q2_024_coefficient_17_0226
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0227 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 227 for generator 17. -/
def ep_Q2_024_partial_17_0227 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 17. -/
theorem ep_Q2_024_partial_17_0227_valid :
    mulPoly ep_Q2_024_coefficient_17_0227
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0228 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 17. -/
def ep_Q2_024_partial_17_0228 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 17. -/
theorem ep_Q2_024_partial_17_0228_valid :
    mulPoly ep_Q2_024_coefficient_17_0228
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0229 : Poly :=
[
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2)]
]

/-- Partial product 229 for generator 17. -/
def ep_Q2_024_partial_17_0229 : Poly :=
[
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 2)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 17. -/
theorem ep_Q2_024_partial_17_0229_valid :
    mulPoly ep_Q2_024_coefficient_17_0229
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0230 : Poly :=
[
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 230 for generator 17. -/
def ep_Q2_024_partial_17_0230 : Poly :=
[
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 17. -/
theorem ep_Q2_024_partial_17_0230_valid :
    mulPoly ep_Q2_024_coefficient_17_0230
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0231 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 17. -/
def ep_Q2_024_partial_17_0231 : Poly :=
[
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 17. -/
theorem ep_Q2_024_partial_17_0231_valid :
    mulPoly ep_Q2_024_coefficient_17_0231
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0232 : Poly :=
[
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2)]
]

/-- Partial product 232 for generator 17. -/
def ep_Q2_024_partial_17_0232 : Poly :=
[
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 2)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 17. -/
theorem ep_Q2_024_partial_17_0232_valid :
    mulPoly ep_Q2_024_coefficient_17_0232
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0233 : Poly :=
[
  term ((-53201610503426714630052756016880039236 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 233 for generator 17. -/
def ep_Q2_024_partial_17_0233 : Poly :=
[
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((53201610503426714630052756016880039236 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term ((53201610503426714630052756016880039236 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 17. -/
theorem ep_Q2_024_partial_17_0233_valid :
    mulPoly ep_Q2_024_coefficient_17_0233
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0234 : Poly :=
[
  term ((-13759634313700007681080402352630204936 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 234 for generator 17. -/
def ep_Q2_024_partial_17_0234 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((13759634313700007681080402352630204936 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((13759634313700007681080402352630204936 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 17. -/
theorem ep_Q2_024_partial_17_0234_valid :
    mulPoly ep_Q2_024_coefficient_17_0234
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0235 : Poly :=
[
  term ((633906342902731841022190189473329404044793665473621464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 235 for generator 17. -/
def ep_Q2_024_partial_17_0235 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-633906342902731841022190189473329404044793665473621464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-633906342902731841022190189473329404044793665473621464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 17. -/
theorem ep_Q2_024_partial_17_0235_valid :
    mulPoly ep_Q2_024_coefficient_17_0235
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0236 : Poly :=
[
  term ((1580191892439936 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 17. -/
def ep_Q2_024_partial_17_0236 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1580191892439936 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1580191892439936 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 17. -/
theorem ep_Q2_024_partial_17_0236_valid :
    mulPoly ep_Q2_024_coefficient_17_0236
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0237 : Poly :=
[
  term ((4348826223007752233005669589428974209959 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)]
]

/-- Partial product 237 for generator 17. -/
def ep_Q2_024_partial_17_0237 : Poly :=
[
  term ((8697652446015504466011339178857948419918 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((8697652446015504466011339178857948419918 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-4348826223007752233005669589428974209959 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (14, 2)],
  term ((-4348826223007752233005669589428974209959 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 17. -/
theorem ep_Q2_024_partial_17_0237_valid :
    mulPoly ep_Q2_024_coefficient_17_0237
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0238 : Poly :=
[
  term ((-94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 238 for generator 17. -/
def ep_Q2_024_partial_17_0238 : Poly :=
[
  term ((-189599206884619014740523344981916435888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-189599206884619014740523344981916435888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 17. -/
theorem ep_Q2_024_partial_17_0238_valid :
    mulPoly ep_Q2_024_coefficient_17_0238
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0239 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 239 for generator 17. -/
def ep_Q2_024_partial_17_0239 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 17. -/
theorem ep_Q2_024_partial_17_0239_valid :
    mulPoly ep_Q2_024_coefficient_17_0239
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0240 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 17. -/
def ep_Q2_024_partial_17_0240 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 17. -/
theorem ep_Q2_024_partial_17_0240_valid :
    mulPoly ep_Q2_024_coefficient_17_0240
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0241 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 241 for generator 17. -/
def ep_Q2_024_partial_17_0241 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 17. -/
theorem ep_Q2_024_partial_17_0241_valid :
    mulPoly ep_Q2_024_coefficient_17_0241
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0242 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 242 for generator 17. -/
def ep_Q2_024_partial_17_0242 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 17. -/
theorem ep_Q2_024_partial_17_0242_valid :
    mulPoly ep_Q2_024_coefficient_17_0242
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0243 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 243 for generator 17. -/
def ep_Q2_024_partial_17_0243 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 17. -/
theorem ep_Q2_024_partial_17_0243_valid :
    mulPoly ep_Q2_024_coefficient_17_0243
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0244 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 244 for generator 17. -/
def ep_Q2_024_partial_17_0244 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 17. -/
theorem ep_Q2_024_partial_17_0244_valid :
    mulPoly ep_Q2_024_coefficient_17_0244
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0245 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 17. -/
def ep_Q2_024_partial_17_0245 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 17. -/
theorem ep_Q2_024_partial_17_0245_valid :
    mulPoly ep_Q2_024_coefficient_17_0245
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0246 : Poly :=
[
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 17. -/
def ep_Q2_024_partial_17_0246 : Poly :=
[
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 17. -/
theorem ep_Q2_024_partial_17_0246_valid :
    mulPoly ep_Q2_024_coefficient_17_0246
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0247 : Poly :=
[
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 17. -/
def ep_Q2_024_partial_17_0247 : Poly :=
[
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 17. -/
theorem ep_Q2_024_partial_17_0247_valid :
    mulPoly ep_Q2_024_coefficient_17_0247
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0248 : Poly :=
[
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 248 for generator 17. -/
def ep_Q2_024_partial_17_0248 : Poly :=
[
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 17. -/
theorem ep_Q2_024_partial_17_0248_valid :
    mulPoly ep_Q2_024_coefficient_17_0248
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0249 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 249 for generator 17. -/
def ep_Q2_024_partial_17_0249 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 17. -/
theorem ep_Q2_024_partial_17_0249_valid :
    mulPoly ep_Q2_024_coefficient_17_0249
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0250 : Poly :=
[
  term ((-1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 250 for generator 17. -/
def ep_Q2_024_partial_17_0250 : Poly :=
[
  term ((-3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((-3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 17. -/
theorem ep_Q2_024_partial_17_0250_valid :
    mulPoly ep_Q2_024_coefficient_17_0250
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0251 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 251 for generator 17. -/
def ep_Q2_024_partial_17_0251 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 4)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 17. -/
theorem ep_Q2_024_partial_17_0251_valid :
    mulPoly ep_Q2_024_coefficient_17_0251
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0252 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 17. -/
def ep_Q2_024_partial_17_0252 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 17. -/
theorem ep_Q2_024_partial_17_0252_valid :
    mulPoly ep_Q2_024_coefficient_17_0252
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0253 : Poly :=
[
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 253 for generator 17. -/
def ep_Q2_024_partial_17_0253 : Poly :=
[
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 17. -/
theorem ep_Q2_024_partial_17_0253_valid :
    mulPoly ep_Q2_024_coefficient_17_0253
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0254 : Poly :=
[
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 17. -/
def ep_Q2_024_partial_17_0254 : Poly :=
[
  term ((-11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11177629529470399 : Rat) / 3488340663459579) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 17. -/
theorem ep_Q2_024_partial_17_0254_valid :
    mulPoly ep_Q2_024_coefficient_17_0254
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0255 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 255 for generator 17. -/
def ep_Q2_024_partial_17_0255 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 17. -/
theorem ep_Q2_024_partial_17_0255_valid :
    mulPoly ep_Q2_024_coefficient_17_0255
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0256 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 256 for generator 17. -/
def ep_Q2_024_partial_17_0256 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 17. -/
theorem ep_Q2_024_partial_17_0256_valid :
    mulPoly ep_Q2_024_coefficient_17_0256
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0257 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 17. -/
def ep_Q2_024_partial_17_0257 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 17. -/
theorem ep_Q2_024_partial_17_0257_valid :
    mulPoly ep_Q2_024_coefficient_17_0257
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0258 : Poly :=
[
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 258 for generator 17. -/
def ep_Q2_024_partial_17_0258 : Poly :=
[
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 17. -/
theorem ep_Q2_024_partial_17_0258_valid :
    mulPoly ep_Q2_024_coefficient_17_0258
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0259 : Poly :=
[
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 259 for generator 17. -/
def ep_Q2_024_partial_17_0259 : Poly :=
[
  term ((-7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 17. -/
theorem ep_Q2_024_partial_17_0259_valid :
    mulPoly ep_Q2_024_coefficient_17_0259
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0260 : Poly :=
[
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 17. -/
def ep_Q2_024_partial_17_0260 : Poly :=
[
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 17. -/
theorem ep_Q2_024_partial_17_0260_valid :
    mulPoly ep_Q2_024_coefficient_17_0260
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0261 : Poly :=
[
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3)]
]

/-- Partial product 261 for generator 17. -/
def ep_Q2_024_partial_17_0261 : Poly :=
[
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (9, 3), (14, 1)],
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 2)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 17. -/
theorem ep_Q2_024_partial_17_0261_valid :
    mulPoly ep_Q2_024_coefficient_17_0261
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0262 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1)]
]

/-- Partial product 262 for generator 17. -/
def ep_Q2_024_partial_17_0262 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 2)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 17. -/
theorem ep_Q2_024_partial_17_0262_valid :
    mulPoly ep_Q2_024_coefficient_17_0262
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0263 : Poly :=
[
  term ((-94074434376090957575371949893952837672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 263 for generator 17. -/
def ep_Q2_024_partial_17_0263 : Poly :=
[
  term ((-188148868752181915150743899787905675344 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-188148868752181915150743899787905675344 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((94074434376090957575371949893952837672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((94074434376090957575371949893952837672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 17. -/
theorem ep_Q2_024_partial_17_0263_valid :
    mulPoly ep_Q2_024_coefficient_17_0263
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0264 : Poly :=
[
  term ((-10081978974460103823875182771872688064172414175843129609 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 264 for generator 17. -/
def ep_Q2_024_partial_17_0264 : Poly :=
[
  term ((-10081978974460103823875182771872688064172414175843129609 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10081978974460103823875182771872688064172414175843129609 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((10081978974460103823875182771872688064172414175843129609 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((10081978974460103823875182771872688064172414175843129609 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 17. -/
theorem ep_Q2_024_partial_17_0264_valid :
    mulPoly ep_Q2_024_coefficient_17_0264
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0265 : Poly :=
[
  term ((4639223145418950 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 17. -/
def ep_Q2_024_partial_17_0265 : Poly :=
[
  term ((9278446290837900 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9278446290837900 : Rat) / 1162780221153193) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4639223145418950 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4639223145418950 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 17. -/
theorem ep_Q2_024_partial_17_0265_valid :
    mulPoly ep_Q2_024_coefficient_17_0265
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0266 : Poly :=
[
  term ((-73554859096529583137294841892984770466 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1)]
]

/-- Partial product 266 for generator 17. -/
def ep_Q2_024_partial_17_0266 : Poly :=
[
  term ((-147109718193059166274589683785969540932 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-147109718193059166274589683785969540932 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((73554859096529583137294841892984770466 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 2)],
  term ((73554859096529583137294841892984770466 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 17. -/
theorem ep_Q2_024_partial_17_0266_valid :
    mulPoly ep_Q2_024_coefficient_17_0266
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0267 : Poly :=
[
  term ((66445397822546599032848435102111750744 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 267 for generator 17. -/
def ep_Q2_024_partial_17_0267 : Poly :=
[
  term ((132890795645093198065696870204223501488 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((132890795645093198065696870204223501488 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-66445397822546599032848435102111750744 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-66445397822546599032848435102111750744 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 17. -/
theorem ep_Q2_024_partial_17_0267_valid :
    mulPoly ep_Q2_024_coefficient_17_0267
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0268 : Poly :=
[
  term ((1213560025596890270149380674367873741972129157890554344 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 268 for generator 17. -/
def ep_Q2_024_partial_17_0268 : Poly :=
[
  term ((2427120051193780540298761348735747483944258315781108688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((2427120051193780540298761348735747483944258315781108688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1213560025596890270149380674367873741972129157890554344 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 3)],
  term ((-1213560025596890270149380674367873741972129157890554344 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 17. -/
theorem ep_Q2_024_partial_17_0268_valid :
    mulPoly ep_Q2_024_coefficient_17_0268
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0269 : Poly :=
[
  term ((1981145807020016 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 17. -/
def ep_Q2_024_partial_17_0269 : Poly :=
[
  term ((3962291614040032 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((3962291614040032 : Rat) / 1162780221153193) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1981145807020016 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1981145807020016 : Rat) / 1162780221153193) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 17. -/
theorem ep_Q2_024_partial_17_0269_valid :
    mulPoly ep_Q2_024_coefficient_17_0269
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0270 : Poly :=
[
  term ((1867177397864233590547853145696108125025509895068229431 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 1)]
]

/-- Partial product 270 for generator 17. -/
def ep_Q2_024_partial_17_0270 : Poly :=
[
  term ((3734354795728467181095706291392216250051019790136458862 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((3734354795728467181095706291392216250051019790136458862 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (15, 2)],
  term ((-1867177397864233590547853145696108125025509895068229431 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 2), (15, 1)],
  term ((-1867177397864233590547853145696108125025509895068229431 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 17. -/
theorem ep_Q2_024_partial_17_0270_valid :
    mulPoly ep_Q2_024_coefficient_17_0270
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0271 : Poly :=
[
  term ((-6050438563946060 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 17. -/
def ep_Q2_024_partial_17_0271 : Poly :=
[
  term ((-12100877127892120 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12100877127892120 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((6050438563946060 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((6050438563946060 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 17. -/
theorem ep_Q2_024_partial_17_0271_valid :
    mulPoly ep_Q2_024_coefficient_17_0271
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0272 : Poly :=
[
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 272 for generator 17. -/
def ep_Q2_024_partial_17_0272 : Poly :=
[
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 17. -/
theorem ep_Q2_024_partial_17_0272_valid :
    mulPoly ep_Q2_024_coefficient_17_0272
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0273 : Poly :=
[
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 273 for generator 17. -/
def ep_Q2_024_partial_17_0273 : Poly :=
[
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 17. -/
theorem ep_Q2_024_partial_17_0273_valid :
    mulPoly ep_Q2_024_coefficient_17_0273
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0274 : Poly :=
[
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 17. -/
def ep_Q2_024_partial_17_0274 : Poly :=
[
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 17. -/
theorem ep_Q2_024_partial_17_0274_valid :
    mulPoly ep_Q2_024_coefficient_17_0274
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0275 : Poly :=
[
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

/-- Partial product 275 for generator 17. -/
def ep_Q2_024_partial_17_0275 : Poly :=
[
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 2), (14, 1)],
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 2)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 17. -/
theorem ep_Q2_024_partial_17_0275_valid :
    mulPoly ep_Q2_024_coefficient_17_0275
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0276 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 276 for generator 17. -/
def ep_Q2_024_partial_17_0276 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 17. -/
theorem ep_Q2_024_partial_17_0276_valid :
    mulPoly ep_Q2_024_coefficient_17_0276
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0277 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 277 for generator 17. -/
def ep_Q2_024_partial_17_0277 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 17. -/
theorem ep_Q2_024_partial_17_0277_valid :
    mulPoly ep_Q2_024_coefficient_17_0277
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0278 : Poly :=
[
  term ((609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1)]
]

/-- Partial product 278 for generator 17. -/
def ep_Q2_024_partial_17_0278 : Poly :=
[
  term ((1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (14, 2)],
  term ((-609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (15, 2)],
  term ((1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 17. -/
theorem ep_Q2_024_partial_17_0278_valid :
    mulPoly ep_Q2_024_coefficient_17_0278
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0279 : Poly :=
[
  term ((-1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 279 for generator 17. -/
def ep_Q2_024_partial_17_0279 : Poly :=
[
  term ((-2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 17. -/
theorem ep_Q2_024_partial_17_0279_valid :
    mulPoly ep_Q2_024_coefficient_17_0279
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0280 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 280 for generator 17. -/
def ep_Q2_024_partial_17_0280 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 17. -/
theorem ep_Q2_024_partial_17_0280_valid :
    mulPoly ep_Q2_024_coefficient_17_0280
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0281 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 281 for generator 17. -/
def ep_Q2_024_partial_17_0281 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 4)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 17. -/
theorem ep_Q2_024_partial_17_0281_valid :
    mulPoly ep_Q2_024_coefficient_17_0281
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0282 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 282 for generator 17. -/
def ep_Q2_024_partial_17_0282 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(7, 2), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 17. -/
theorem ep_Q2_024_partial_17_0282_valid :
    mulPoly ep_Q2_024_coefficient_17_0282
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0283 : Poly :=
[
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 283 for generator 17. -/
def ep_Q2_024_partial_17_0283 : Poly :=
[
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 17. -/
theorem ep_Q2_024_partial_17_0283_valid :
    mulPoly ep_Q2_024_coefficient_17_0283
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0284 : Poly :=
[
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 17. -/
def ep_Q2_024_partial_17_0284 : Poly :=
[
  term ((3374627121101630 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((3374627121101630 : Rat) / 1162780221153193) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 17. -/
theorem ep_Q2_024_partial_17_0284_valid :
    mulPoly ep_Q2_024_coefficient_17_0284
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0285 : Poly :=
[
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2)]
]

/-- Partial product 285 for generator 17. -/
def ep_Q2_024_partial_17_0285 : Poly :=
[
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 2)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 17. -/
theorem ep_Q2_024_partial_17_0285_valid :
    mulPoly ep_Q2_024_coefficient_17_0285
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0286 : Poly :=
[
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 286 for generator 17. -/
def ep_Q2_024_partial_17_0286 : Poly :=
[
  term ((1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 3)],
  term ((1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 17. -/
theorem ep_Q2_024_partial_17_0286_valid :
    mulPoly ep_Q2_024_coefficient_17_0286
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0287 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 287 for generator 17. -/
def ep_Q2_024_partial_17_0287 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (15, 4)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 17. -/
theorem ep_Q2_024_partial_17_0287_valid :
    mulPoly ep_Q2_024_coefficient_17_0287
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0288 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 17. -/
def ep_Q2_024_partial_17_0288 : Poly :=
[
  term ((4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 17. -/
theorem ep_Q2_024_partial_17_0288_valid :
    mulPoly ep_Q2_024_coefficient_17_0288
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0289 : Poly :=
[
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 289 for generator 17. -/
def ep_Q2_024_partial_17_0289 : Poly :=
[
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 17. -/
theorem ep_Q2_024_partial_17_0289_valid :
    mulPoly ep_Q2_024_coefficient_17_0289
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0290 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 290 for generator 17. -/
def ep_Q2_024_partial_17_0290 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 3)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 17. -/
theorem ep_Q2_024_partial_17_0290_valid :
    mulPoly ep_Q2_024_coefficient_17_0290
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0291 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 17. -/
def ep_Q2_024_partial_17_0291 : Poly :=
[
  term ((-3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 17. -/
theorem ep_Q2_024_partial_17_0291_valid :
    mulPoly ep_Q2_024_coefficient_17_0291
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0292 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3)]
]

/-- Partial product 292 for generator 17. -/
def ep_Q2_024_partial_17_0292 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 3), (14, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 2)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (15, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 17. -/
theorem ep_Q2_024_partial_17_0292_valid :
    mulPoly ep_Q2_024_coefficient_17_0292
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0293 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1)]
]

/-- Partial product 293 for generator 17. -/
def ep_Q2_024_partial_17_0293 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 2)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (15, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 17. -/
theorem ep_Q2_024_partial_17_0293_valid :
    mulPoly ep_Q2_024_coefficient_17_0293
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0294 : Poly :=
[
  term ((-3093390205616882870836862021347079402 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 294 for generator 17. -/
def ep_Q2_024_partial_17_0294 : Poly :=
[
  term ((-6186780411233765741673724042694158804 : Rat) / 10167029300020994038700792610419824305) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((3093390205616882870836862021347079402 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((3093390205616882870836862021347079402 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6186780411233765741673724042694158804 : Rat) / 10167029300020994038700792610419824305) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 17. -/
theorem ep_Q2_024_partial_17_0294_valid :
    mulPoly ep_Q2_024_coefficient_17_0294
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0295 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 295 for generator 17. -/
def ep_Q2_024_partial_17_0295 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 4)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 17. -/
theorem ep_Q2_024_partial_17_0295_valid :
    mulPoly ep_Q2_024_coefficient_17_0295
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0296 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 296 for generator 17. -/
def ep_Q2_024_partial_17_0296 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 17. -/
theorem ep_Q2_024_partial_17_0296_valid :
    mulPoly ep_Q2_024_coefficient_17_0296
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0297 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 297 for generator 17. -/
def ep_Q2_024_partial_17_0297 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 3)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 17. -/
theorem ep_Q2_024_partial_17_0297_valid :
    mulPoly ep_Q2_024_coefficient_17_0297
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0298 : Poly :=
[
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 298 for generator 17. -/
def ep_Q2_024_partial_17_0298 : Poly :=
[
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (15, 3)],
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 17. -/
theorem ep_Q2_024_partial_17_0298_valid :
    mulPoly ep_Q2_024_coefficient_17_0298
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0299 : Poly :=
[
  term ((4498162330382319 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 17. -/
def ep_Q2_024_partial_17_0299 : Poly :=
[
  term ((8996324660764638 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4498162330382319 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4498162330382319 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((8996324660764638 : Rat) / 1162780221153193) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 17. -/
theorem ep_Q2_024_partial_17_0299_valid :
    mulPoly ep_Q2_024_coefficient_17_0299
        ep_Q2_024_generator_17_0200_0299 =
      ep_Q2_024_partial_17_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_17_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_17_0200,
  ep_Q2_024_partial_17_0201,
  ep_Q2_024_partial_17_0202,
  ep_Q2_024_partial_17_0203,
  ep_Q2_024_partial_17_0204,
  ep_Q2_024_partial_17_0205,
  ep_Q2_024_partial_17_0206,
  ep_Q2_024_partial_17_0207,
  ep_Q2_024_partial_17_0208,
  ep_Q2_024_partial_17_0209,
  ep_Q2_024_partial_17_0210,
  ep_Q2_024_partial_17_0211,
  ep_Q2_024_partial_17_0212,
  ep_Q2_024_partial_17_0213,
  ep_Q2_024_partial_17_0214,
  ep_Q2_024_partial_17_0215,
  ep_Q2_024_partial_17_0216,
  ep_Q2_024_partial_17_0217,
  ep_Q2_024_partial_17_0218,
  ep_Q2_024_partial_17_0219,
  ep_Q2_024_partial_17_0220,
  ep_Q2_024_partial_17_0221,
  ep_Q2_024_partial_17_0222,
  ep_Q2_024_partial_17_0223,
  ep_Q2_024_partial_17_0224,
  ep_Q2_024_partial_17_0225,
  ep_Q2_024_partial_17_0226,
  ep_Q2_024_partial_17_0227,
  ep_Q2_024_partial_17_0228,
  ep_Q2_024_partial_17_0229,
  ep_Q2_024_partial_17_0230,
  ep_Q2_024_partial_17_0231,
  ep_Q2_024_partial_17_0232,
  ep_Q2_024_partial_17_0233,
  ep_Q2_024_partial_17_0234,
  ep_Q2_024_partial_17_0235,
  ep_Q2_024_partial_17_0236,
  ep_Q2_024_partial_17_0237,
  ep_Q2_024_partial_17_0238,
  ep_Q2_024_partial_17_0239,
  ep_Q2_024_partial_17_0240,
  ep_Q2_024_partial_17_0241,
  ep_Q2_024_partial_17_0242,
  ep_Q2_024_partial_17_0243,
  ep_Q2_024_partial_17_0244,
  ep_Q2_024_partial_17_0245,
  ep_Q2_024_partial_17_0246,
  ep_Q2_024_partial_17_0247,
  ep_Q2_024_partial_17_0248,
  ep_Q2_024_partial_17_0249,
  ep_Q2_024_partial_17_0250,
  ep_Q2_024_partial_17_0251,
  ep_Q2_024_partial_17_0252,
  ep_Q2_024_partial_17_0253,
  ep_Q2_024_partial_17_0254,
  ep_Q2_024_partial_17_0255,
  ep_Q2_024_partial_17_0256,
  ep_Q2_024_partial_17_0257,
  ep_Q2_024_partial_17_0258,
  ep_Q2_024_partial_17_0259,
  ep_Q2_024_partial_17_0260,
  ep_Q2_024_partial_17_0261,
  ep_Q2_024_partial_17_0262,
  ep_Q2_024_partial_17_0263,
  ep_Q2_024_partial_17_0264,
  ep_Q2_024_partial_17_0265,
  ep_Q2_024_partial_17_0266,
  ep_Q2_024_partial_17_0267,
  ep_Q2_024_partial_17_0268,
  ep_Q2_024_partial_17_0269,
  ep_Q2_024_partial_17_0270,
  ep_Q2_024_partial_17_0271,
  ep_Q2_024_partial_17_0272,
  ep_Q2_024_partial_17_0273,
  ep_Q2_024_partial_17_0274,
  ep_Q2_024_partial_17_0275,
  ep_Q2_024_partial_17_0276,
  ep_Q2_024_partial_17_0277,
  ep_Q2_024_partial_17_0278,
  ep_Q2_024_partial_17_0279,
  ep_Q2_024_partial_17_0280,
  ep_Q2_024_partial_17_0281,
  ep_Q2_024_partial_17_0282,
  ep_Q2_024_partial_17_0283,
  ep_Q2_024_partial_17_0284,
  ep_Q2_024_partial_17_0285,
  ep_Q2_024_partial_17_0286,
  ep_Q2_024_partial_17_0287,
  ep_Q2_024_partial_17_0288,
  ep_Q2_024_partial_17_0289,
  ep_Q2_024_partial_17_0290,
  ep_Q2_024_partial_17_0291,
  ep_Q2_024_partial_17_0292,
  ep_Q2_024_partial_17_0293,
  ep_Q2_024_partial_17_0294,
  ep_Q2_024_partial_17_0295,
  ep_Q2_024_partial_17_0296,
  ep_Q2_024_partial_17_0297,
  ep_Q2_024_partial_17_0298,
  ep_Q2_024_partial_17_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_17_0200_0299 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (8, 1), (14, 1)],
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((29592223893620642344669829231474145728 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((49764665818140010446917748133642642905559387277118722716 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6638095439217936 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1294968788092047793765496140229179395728 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((25079421012636288424922284230155009949386462660822310079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6865610728377876 : Rat) / 1162780221153193) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247993450436313694867817847064693195168 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-2676908167036388 : Rat) / 1162780221153193) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (6, 1), (14, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((7729311995353440 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((29592223893620642344669829231474145728 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 2)],
  term ((55517972917702673555889748139211564565105034042936419072 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-6638095439217936 : Rat) / 1162780221153193) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1294968788092047793765496140229179395728 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((7786899527700624441276267646395711014778657812371415193 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-6865610728377876 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((247993450436313694867817847064693195168 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((249392015382751260180390495719056593184092941168958409 : Rat) / 23644041155898808945036612648379641461034231099511730) [(4, 1), (7, 1), (15, 3)],
  term ((-2746275640732770 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 2), (15, 2)],
  term ((138734947392764 : Rat) / 1162780221153193) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (14, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (15, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-14796111946810321172334914615737072864 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 3)],
  term ((-14796111946810321172334914615737072864 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-24882332909070005223458874066821321452779693638559361358 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((3319047719608968 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 3), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-24882332909070005223458874066821321452779693638559361358 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(4, 1), (9, 1), (15, 3)],
  term ((3319047719608968 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((647484394046023896882748070114589697864 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (14, 2)],
  term ((647484394046023896882748070114589697864 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (15, 2)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (11, 1), (15, 3)],
  term ((28986108453490 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (14, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1), (15, 2)],
  term ((-25079421012636288424922284230155009949386462660822310079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3432805364188938 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25079421012636288424922284230155009949386462660822310079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 3)],
  term ((3432805364188938 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-123996725218156847433908923532346597584 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (14, 2)],
  term ((-123996725218156847433908923532346597584 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (13, 2), (15, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1), (15, 2)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (14, 2), (15, 2)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 3)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (15, 4)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(4, 1), (15, 4), (16, 1)],
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-189599206884619014740523344981916435888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 2)],
  term ((8697652446015504466011339178857948419918 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (9, 3), (14, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-188148868752181915150743899787905675344 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10081978974460103823875182771872688064172414175843129609 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((9278446290837900 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-147109718193059166274589683785969540932 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((132890795645093198065696870204223501488 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((3734354795728467181095706291392216250051019790136458862 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-12100877127892120 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((2427120051193780540298761348735747483944258315781108688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((3962291614040032 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-189599206884619014740523344981916435888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((2579632599944095673750694644411219814712253668984896738331 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((8697652446015504466011339178857948419918 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-601363523113431957459354612178026438133571190664561600633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-20658780884110015 : Rat) / 3488340663459579) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 2)],
  term ((-38253202658961945939062962203166923814189680710394047994 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((23523905752088408 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-188148868752181915150743899787905675344 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10081978974460103823875182771872688064172414175843129609 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((9278446290837900 : Rat) / 1162780221153193) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((132890795645093198065696870204223501488 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-147109718193059166274589683785969540932 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 2)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((2427120051193780540298761348735747483944258315781108688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((3962291614040032 : Rat) / 1162780221153193) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((3734354795728467181095706291392216250051019790136458862 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (15, 2)],
  term ((-12100877127892120 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (9, 1), (15, 2)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((53201610503426714630052756016880039236 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term ((53201610503426714630052756016880039236 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((13759634313700007681080402352630204936 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((13759634313700007681080402352630204936 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-633906342902731841022190189473329404044793665473621464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1580191892439936 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-633906342902731841022190189473329404044793665473621464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (8, 1), (15, 3)],
  term ((-1580191892439936 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 4)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 3)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 4)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-4348826223007752233005669589428974209959 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (14, 2)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 3), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((-4348826223007752233005669589428974209959 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (15, 2)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 4)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 3)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 3)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 2)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (15, 2)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 2)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (15, 2)],
  term ((94074434376090957575371949893952837672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((94074434376090957575371949893952837672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((10081978974460103823875182771872688064172414175843129609 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4639223145418950 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10081978974460103823875182771872688064172414175843129609 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (12, 1), (15, 3)],
  term ((-4639223145418950 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-66445397822546599032848435102111750744 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((73554859096529583137294841892984770466 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 2)],
  term ((-66445397822546599032848435102111750744 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 3)],
  term ((73554859096529583137294841892984770466 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (15, 2)],
  term ((-1213560025596890270149380674367873741972129157890554344 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 3)],
  term ((-1981145807020016 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1867177397864233590547853145696108125025509895068229431 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 2), (15, 1)],
  term ((6050438563946060 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1213560025596890270149380674367873741972129157890554344 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 3), (15, 1)],
  term ((-1981145807020016 : Rat) / 1162780221153193) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1867177397864233590547853145696108125025509895068229431 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 3)],
  term ((6050438563946060 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)],
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 2), (14, 1)],
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 3)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 2)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (15, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((3374627121101630 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 3), (14, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-6186780411233765741673724042694158804 : Rat) / 10167029300020994038700792610419824305) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((8996324660764638 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 4)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 2)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (14, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 3)],
  term ((-609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (15, 4)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 3)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 2)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (15, 2)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 2)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (15, 2)],
  term ((3093390205616882870836862021347079402 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3093390205616882870836862021347079402 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 4)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 3)],
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4498162330382319 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-99166769400052648715920076472054220285961978579213337647 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (15, 3)],
  term ((-4498162330382319 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (9, 1), (12, 1), (15, 3)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(7, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((3374627121101630 : Rat) / 1162780221153193) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (13, 2), (15, 1)],
  term ((1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (15, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (9, 1), (15, 3)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (9, 2), (15, 2)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 3), (15, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (15, 1)],
  term ((-6186780411233765741673724042694158804 : Rat) / 10167029300020994038700792610419824305) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (12, 1), (13, 1), (15, 3)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (12, 1), (13, 2), (15, 2)],
  term ((99166769400052648715920076472054220285961978579213337647 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (12, 1), (15, 2)],
  term ((8996324660764638 : Rat) / 1162780221153193) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 200 through 299. -/
theorem ep_Q2_024_block_17_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_17_0200_0299
      ep_Q2_024_block_17_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
