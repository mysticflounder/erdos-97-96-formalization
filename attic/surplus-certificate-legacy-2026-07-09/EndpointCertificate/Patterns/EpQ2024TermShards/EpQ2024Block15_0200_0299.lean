/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0200 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 15. -/
def ep_Q2_024_partial_15_0200 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 15. -/
theorem ep_Q2_024_partial_15_0200_valid :
    mulPoly ep_Q2_024_coefficient_15_0200
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0201 : Poly :=
[
  term ((10795372719665138221063404750195884933046033047003121792 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 201 for generator 15. -/
def ep_Q2_024_partial_15_0201 : Poly :=
[
  term ((21590745439330276442126809500391769866092066094006243584 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-10795372719665138221063404750195884933046033047003121792 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 15. -/
theorem ep_Q2_024_partial_15_0201_valid :
    mulPoly ep_Q2_024_coefficient_15_0201
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0202 : Poly :=
[
  term ((-3220171070308224 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 15. -/
def ep_Q2_024_partial_15_0202 : Poly :=
[
  term ((-6440342140616448 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3220171070308224 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 15. -/
theorem ep_Q2_024_partial_15_0202_valid :
    mulPoly ep_Q2_024_coefficient_15_0202
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0203 : Poly :=
[
  term ((-73165338442126124587633970086756440012 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 2)]
]

/-- Partial product 203 for generator 15. -/
def ep_Q2_024_partial_15_0203 : Poly :=
[
  term ((-146330676884252249175267940173512880024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (9, 2)],
  term ((73165338442126124587633970086756440012 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 15. -/
theorem ep_Q2_024_partial_15_0203_valid :
    mulPoly ep_Q2_024_coefficient_15_0203
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0204 : Poly :=
[
  term ((3820157375391411406284258301854949329441347293147256980 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 204 for generator 15. -/
def ep_Q2_024_partial_15_0204 : Poly :=
[
  term ((7640314750782822812568516603709898658882694586294513960 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3820157375391411406284258301854949329441347293147256980 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 15. -/
theorem ep_Q2_024_partial_15_0204_valid :
    mulPoly ep_Q2_024_coefficient_15_0204
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0205 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 15. -/
def ep_Q2_024_partial_15_0205 : Poly :=
[
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 15. -/
theorem ep_Q2_024_partial_15_0205_valid :
    mulPoly ep_Q2_024_coefficient_15_0205
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0206 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2)]
]

/-- Partial product 206 for generator 15. -/
def ep_Q2_024_partial_15_0206 : Poly :=
[
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 2)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 15. -/
theorem ep_Q2_024_partial_15_0206_valid :
    mulPoly ep_Q2_024_coefficient_15_0206
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0207 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (15, 2)]
]

/-- Partial product 207 for generator 15. -/
def ep_Q2_024_partial_15_0207 : Poly :=
[
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 15. -/
theorem ep_Q2_024_partial_15_0207_valid :
    mulPoly ep_Q2_024_coefficient_15_0207
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0208 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 208 for generator 15. -/
def ep_Q2_024_partial_15_0208 : Poly :=
[
  term ((-7729311995353440 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 15. -/
theorem ep_Q2_024_partial_15_0208_valid :
    mulPoly ep_Q2_024_coefficient_15_0208
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0209 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 209 for generator 15. -/
def ep_Q2_024_partial_15_0209 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 15. -/
theorem ep_Q2_024_partial_15_0209_valid :
    mulPoly ep_Q2_024_coefficient_15_0209
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0210 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 15. -/
def ep_Q2_024_partial_15_0210 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 15. -/
theorem ep_Q2_024_partial_15_0210_valid :
    mulPoly ep_Q2_024_coefficient_15_0210
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0211 : Poly :=
[
  term ((-27378379650629129153965724511555856570059719126616949028 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 15. -/
def ep_Q2_024_partial_15_0211 : Poly :=
[
  term ((-54756759301258258307931449023111713140119438253233898056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((27378379650629129153965724511555856570059719126616949028 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 15. -/
theorem ep_Q2_024_partial_15_0211_valid :
    mulPoly ep_Q2_024_coefficient_15_0211
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0212 : Poly :=
[
  term ((4074936246847952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 15. -/
def ep_Q2_024_partial_15_0212 : Poly :=
[
  term ((8149872493695904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4074936246847952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 15. -/
theorem ep_Q2_024_partial_15_0212_valid :
    mulPoly ep_Q2_024_coefficient_15_0212
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0213 : Poly :=
[
  term ((291644129732131314844431055946947754048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)]
]

/-- Partial product 213 for generator 15. -/
def ep_Q2_024_partial_15_0213 : Poly :=
[
  term ((583288259464262629688862111893895508096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((-291644129732131314844431055946947754048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 15. -/
theorem ep_Q2_024_partial_15_0213_valid :
    mulPoly ep_Q2_024_coefficient_15_0213
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0214 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2), (14, 1)]
]

/-- Partial product 214 for generator 15. -/
def ep_Q2_024_partial_15_0214 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 15. -/
theorem ep_Q2_024_partial_15_0214_valid :
    mulPoly ep_Q2_024_coefficient_15_0214
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0215 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (14, 1), (15, 2)]
]

/-- Partial product 215 for generator 15. -/
def ep_Q2_024_partial_15_0215 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 15. -/
theorem ep_Q2_024_partial_15_0215_valid :
    mulPoly ep_Q2_024_coefficient_15_0215
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0216 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 15. -/
def ep_Q2_024_partial_15_0216 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 15. -/
theorem ep_Q2_024_partial_15_0216_valid :
    mulPoly ep_Q2_024_coefficient_15_0216
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0217 : Poly :=
[
  term ((-18638311741108713692898021860690280683719078464622487695 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 217 for generator 15. -/
def ep_Q2_024_partial_15_0217 : Poly :=
[
  term ((-37276623482217427385796043721380561367438156929244975390 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((18638311741108713692898021860690280683719078464622487695 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 15. -/
theorem ep_Q2_024_partial_15_0217_valid :
    mulPoly ep_Q2_024_coefficient_15_0217
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0218 : Poly :=
[
  term ((8769345378651148 : Rat) / 1162780221153193) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 15. -/
def ep_Q2_024_partial_15_0218 : Poly :=
[
  term ((17538690757302296 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-8769345378651148 : Rat) / 1162780221153193) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 15. -/
theorem ep_Q2_024_partial_15_0218_valid :
    mulPoly ep_Q2_024_coefficient_15_0218
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0219 : Poly :=
[
  term ((5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 219 for generator 15. -/
def ep_Q2_024_partial_15_0219 : Poly :=
[
  term ((10139578104936318157725755370282093944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 15. -/
theorem ep_Q2_024_partial_15_0219_valid :
    mulPoly ep_Q2_024_coefficient_15_0219
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0220 : Poly :=
[
  term ((12662350944910765893830953930766947592 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 220 for generator 15. -/
def ep_Q2_024_partial_15_0220 : Poly :=
[
  term ((25324701889821531787661907861533895184 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-12662350944910765893830953930766947592 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 15. -/
theorem ep_Q2_024_partial_15_0220_valid :
    mulPoly ep_Q2_024_coefficient_15_0220
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0221 : Poly :=
[
  term ((-1651098374119649665258687162567146363269940582136361771 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 221 for generator 15. -/
def ep_Q2_024_partial_15_0221 : Poly :=
[
  term ((-3302196748239299330517374325134292726539881164272723542 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((1651098374119649665258687162567146363269940582136361771 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 15. -/
theorem ep_Q2_024_partial_15_0221_valid :
    mulPoly ep_Q2_024_coefficient_15_0221
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0222 : Poly :=
[
  term ((1013072125781164 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 15. -/
def ep_Q2_024_partial_15_0222 : Poly :=
[
  term ((2026144251562328 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1013072125781164 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 15. -/
theorem ep_Q2_024_partial_15_0222_valid :
    mulPoly ep_Q2_024_coefficient_15_0222
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0223 : Poly :=
[
  term ((4566259768818004420950179592357108106942 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 223 for generator 15. -/
def ep_Q2_024_partial_15_0223 : Poly :=
[
  term ((9132519537636008841900359184714216213884 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (9, 1)],
  term ((-4566259768818004420950179592357108106942 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 15. -/
theorem ep_Q2_024_partial_15_0223_valid :
    mulPoly ep_Q2_024_coefficient_15_0223
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0224 : Poly :=
[
  term ((-5512435321580771487254807732433556088 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)]
]

/-- Partial product 224 for generator 15. -/
def ep_Q2_024_partial_15_0224 : Poly :=
[
  term ((-11024870643161542974509615464867112176 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((5512435321580771487254807732433556088 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 15. -/
theorem ep_Q2_024_partial_15_0224_valid :
    mulPoly ep_Q2_024_coefficient_15_0224
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0225 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 225 for generator 15. -/
def ep_Q2_024_partial_15_0225 : Poly :=
[
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 15. -/
theorem ep_Q2_024_partial_15_0225_valid :
    mulPoly ep_Q2_024_coefficient_15_0225
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0226 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 226 for generator 15. -/
def ep_Q2_024_partial_15_0226 : Poly :=
[
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 15. -/
theorem ep_Q2_024_partial_15_0226_valid :
    mulPoly ep_Q2_024_coefficient_15_0226
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0227 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 15. -/
def ep_Q2_024_partial_15_0227 : Poly :=
[
  term ((-1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 15. -/
theorem ep_Q2_024_partial_15_0227_valid :
    mulPoly ep_Q2_024_coefficient_15_0227
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0228 : Poly :=
[
  term ((4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 228 for generator 15. -/
def ep_Q2_024_partial_15_0228 : Poly :=
[
  term ((9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 15. -/
theorem ep_Q2_024_partial_15_0228_valid :
    mulPoly ep_Q2_024_coefficient_15_0228
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0229 : Poly :=
[
  term ((64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 229 for generator 15. -/
def ep_Q2_024_partial_15_0229 : Poly :=
[
  term ((128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 15. -/
theorem ep_Q2_024_partial_15_0229_valid :
    mulPoly ep_Q2_024_coefficient_15_0229
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0230 : Poly :=
[
  term ((-14155356434448340 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 15. -/
def ep_Q2_024_partial_15_0230 : Poly :=
[
  term ((-28310712868896680 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((14155356434448340 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 15. -/
theorem ep_Q2_024_partial_15_0230_valid :
    mulPoly ep_Q2_024_coefficient_15_0230
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0231 : Poly :=
[
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

/-- Partial product 231 for generator 15. -/
def ep_Q2_024_partial_15_0231 : Poly :=
[
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 15. -/
theorem ep_Q2_024_partial_15_0231_valid :
    mulPoly ep_Q2_024_coefficient_15_0231
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0232 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 232 for generator 15. -/
def ep_Q2_024_partial_15_0232 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 15. -/
theorem ep_Q2_024_partial_15_0232_valid :
    mulPoly ep_Q2_024_coefficient_15_0232
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0233 : Poly :=
[
  term ((-365795766462428679623443853898866268752 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 233 for generator 15. -/
def ep_Q2_024_partial_15_0233 : Poly :=
[
  term ((-731591532924857359246887707797732537504 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((365795766462428679623443853898866268752 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 15. -/
theorem ep_Q2_024_partial_15_0233_valid :
    mulPoly ep_Q2_024_coefficient_15_0233
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0234 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 234 for generator 15. -/
def ep_Q2_024_partial_15_0234 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 15. -/
theorem ep_Q2_024_partial_15_0234_valid :
    mulPoly ep_Q2_024_coefficient_15_0234
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0235 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 235 for generator 15. -/
def ep_Q2_024_partial_15_0235 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 15. -/
theorem ep_Q2_024_partial_15_0235_valid :
    mulPoly ep_Q2_024_coefficient_15_0235
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0236 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 15. -/
def ep_Q2_024_partial_15_0236 : Poly :=
[
  term ((-9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 15. -/
theorem ep_Q2_024_partial_15_0236_valid :
    mulPoly ep_Q2_024_coefficient_15_0236
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0237 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 237 for generator 15. -/
def ep_Q2_024_partial_15_0237 : Poly :=
[
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 15. -/
theorem ep_Q2_024_partial_15_0237_valid :
    mulPoly ep_Q2_024_coefficient_15_0237
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0238 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 238 for generator 15. -/
def ep_Q2_024_partial_15_0238 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 15. -/
theorem ep_Q2_024_partial_15_0238_valid :
    mulPoly ep_Q2_024_coefficient_15_0238
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0239 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 15. -/
def ep_Q2_024_partial_15_0239 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 15. -/
theorem ep_Q2_024_partial_15_0239_valid :
    mulPoly ep_Q2_024_coefficient_15_0239
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0240 : Poly :=
[
  term ((44137098296435124062041745025751850800365565261518791174 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 15. -/
def ep_Q2_024_partial_15_0240 : Poly :=
[
  term ((88274196592870248124083490051503701600731130523037582348 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-44137098296435124062041745025751850800365565261518791174 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 15. -/
theorem ep_Q2_024_partial_15_0240_valid :
    mulPoly ep_Q2_024_coefficient_15_0240
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0241 : Poly :=
[
  term ((-9497927723051960 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 15. -/
def ep_Q2_024_partial_15_0241 : Poly :=
[
  term ((-18995855446103920 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((9497927723051960 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 15. -/
theorem ep_Q2_024_partial_15_0241_valid :
    mulPoly ep_Q2_024_coefficient_15_0241
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0242 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (12, 1), (15, 3)]
]

/-- Partial product 242 for generator 15. -/
def ep_Q2_024_partial_15_0242 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 15. -/
theorem ep_Q2_024_partial_15_0242_valid :
    mulPoly ep_Q2_024_coefficient_15_0242
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0243 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 243 for generator 15. -/
def ep_Q2_024_partial_15_0243 : Poly :=
[
  term ((26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 15. -/
theorem ep_Q2_024_partial_15_0243_valid :
    mulPoly ep_Q2_024_coefficient_15_0243
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0244 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 2), (13, 1)]
]

/-- Partial product 244 for generator 15. -/
def ep_Q2_024_partial_15_0244 : Poly :=
[
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 15. -/
theorem ep_Q2_024_partial_15_0244_valid :
    mulPoly ep_Q2_024_coefficient_15_0244
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0245 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (12, 2), (15, 1)]
]

/-- Partial product 245 for generator 15. -/
def ep_Q2_024_partial_15_0245 : Poly :=
[
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 15. -/
theorem ep_Q2_024_partial_15_0245_valid :
    mulPoly ep_Q2_024_coefficient_15_0245
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0246 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 15. -/
def ep_Q2_024_partial_15_0246 : Poly :=
[
  term ((9572621512797280 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 15. -/
theorem ep_Q2_024_partial_15_0246_valid :
    mulPoly ep_Q2_024_coefficient_15_0246
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0247 : Poly :=
[
  term ((1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 247 for generator 15. -/
def ep_Q2_024_partial_15_0247 : Poly :=
[
  term ((3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((-1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 15. -/
theorem ep_Q2_024_partial_15_0247_valid :
    mulPoly ep_Q2_024_coefficient_15_0247
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0248 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 248 for generator 15. -/
def ep_Q2_024_partial_15_0248 : Poly :=
[
  term ((186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 15. -/
theorem ep_Q2_024_partial_15_0248_valid :
    mulPoly ep_Q2_024_coefficient_15_0248
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0249 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 249 for generator 15. -/
def ep_Q2_024_partial_15_0249 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 15. -/
theorem ep_Q2_024_partial_15_0249_valid :
    mulPoly ep_Q2_024_coefficient_15_0249
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0250 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 250 for generator 15. -/
def ep_Q2_024_partial_15_0250 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 15. -/
theorem ep_Q2_024_partial_15_0250_valid :
    mulPoly ep_Q2_024_coefficient_15_0250
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0251 : Poly :=
[
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 251 for generator 15. -/
def ep_Q2_024_partial_15_0251 : Poly :=
[
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 15. -/
theorem ep_Q2_024_partial_15_0251_valid :
    mulPoly ep_Q2_024_coefficient_15_0251
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0252 : Poly :=
[
  term ((-49730484048564751 : Rat) / 6976681326919158) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 15. -/
def ep_Q2_024_partial_15_0252 : Poly :=
[
  term ((-49730484048564751 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 15. -/
theorem ep_Q2_024_partial_15_0252_valid :
    mulPoly ep_Q2_024_coefficient_15_0252
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0253 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 253 for generator 15. -/
def ep_Q2_024_partial_15_0253 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 15. -/
theorem ep_Q2_024_partial_15_0253_valid :
    mulPoly ep_Q2_024_coefficient_15_0253
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0254 : Poly :=
[
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 254 for generator 15. -/
def ep_Q2_024_partial_15_0254 : Poly :=
[
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 15. -/
theorem ep_Q2_024_partial_15_0254_valid :
    mulPoly ep_Q2_024_coefficient_15_0254
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0255 : Poly :=
[
  term ((8963350835233314821397760311224073480378312927687046376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 255 for generator 15. -/
def ep_Q2_024_partial_15_0255 : Poly :=
[
  term ((17926701670466629642795520622448146960756625855374092752 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-8963350835233314821397760311224073480378312927687046376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 15. -/
theorem ep_Q2_024_partial_15_0255_valid :
    mulPoly ep_Q2_024_coefficient_15_0255
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0256 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 15. -/
def ep_Q2_024_partial_15_0256 : Poly :=
[
  term ((-3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 15. -/
theorem ep_Q2_024_partial_15_0256_valid :
    mulPoly ep_Q2_024_coefficient_15_0256
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0257 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (14, 1), (15, 3)]
]

/-- Partial product 257 for generator 15. -/
def ep_Q2_024_partial_15_0257 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 15. -/
theorem ep_Q2_024_partial_15_0257_valid :
    mulPoly ep_Q2_024_coefficient_15_0257
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0258 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 258 for generator 15. -/
def ep_Q2_024_partial_15_0258 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 15. -/
theorem ep_Q2_024_partial_15_0258_valid :
    mulPoly ep_Q2_024_coefficient_15_0258
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0259 : Poly :=
[
  term ((-19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 259 for generator 15. -/
def ep_Q2_024_partial_15_0259 : Poly :=
[
  term ((-38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 15. -/
theorem ep_Q2_024_partial_15_0259_valid :
    mulPoly ep_Q2_024_coefficient_15_0259
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0260 : Poly :=
[
  term ((4628106147380416 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 15. -/
def ep_Q2_024_partial_15_0260 : Poly :=
[
  term ((9256212294760832 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4628106147380416 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 15. -/
theorem ep_Q2_024_partial_15_0260_valid :
    mulPoly ep_Q2_024_coefficient_15_0260
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0261 : Poly :=
[
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (15, 3)]
]

/-- Partial product 261 for generator 15. -/
def ep_Q2_024_partial_15_0261 : Poly :=
[
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 15. -/
theorem ep_Q2_024_partial_15_0261_valid :
    mulPoly ep_Q2_024_coefficient_15_0261
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0262 : Poly :=
[
  term ((23958955931124895 : Rat) / 6976681326919158) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 262 for generator 15. -/
def ep_Q2_024_partial_15_0262 : Poly :=
[
  term ((23958955931124895 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 15. -/
theorem ep_Q2_024_partial_15_0262_valid :
    mulPoly ep_Q2_024_coefficient_15_0262
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0263 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

/-- Partial product 263 for generator 15. -/
def ep_Q2_024_partial_15_0263 : Poly :=
[
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 15. -/
theorem ep_Q2_024_partial_15_0263_valid :
    mulPoly ep_Q2_024_coefficient_15_0263
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0264 : Poly :=
[
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (13, 1), (15, 1)]
]

/-- Partial product 264 for generator 15. -/
def ep_Q2_024_partial_15_0264 : Poly :=
[
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 15. -/
theorem ep_Q2_024_partial_15_0264_valid :
    mulPoly ep_Q2_024_coefficient_15_0264
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0265 : Poly :=
[
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (15, 2)]
]

/-- Partial product 265 for generator 15. -/
def ep_Q2_024_partial_15_0265 : Poly :=
[
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 15. -/
theorem ep_Q2_024_partial_15_0265_valid :
    mulPoly ep_Q2_024_coefficient_15_0265
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0266 : Poly :=
[
  term ((-2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 15. -/
def ep_Q2_024_partial_15_0266 : Poly :=
[
  term ((-5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 15. -/
theorem ep_Q2_024_partial_15_0266_valid :
    mulPoly ep_Q2_024_coefficient_15_0266
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0267 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 267 for generator 15. -/
def ep_Q2_024_partial_15_0267 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 15. -/
theorem ep_Q2_024_partial_15_0267_valid :
    mulPoly ep_Q2_024_coefficient_15_0267
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0268 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 268 for generator 15. -/
def ep_Q2_024_partial_15_0268 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 15. -/
theorem ep_Q2_024_partial_15_0268_valid :
    mulPoly ep_Q2_024_coefficient_15_0268
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0269 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 15. -/
def ep_Q2_024_partial_15_0269 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 15. -/
theorem ep_Q2_024_partial_15_0269_valid :
    mulPoly ep_Q2_024_coefficient_15_0269
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0270 : Poly :=
[
  term ((348099553739418349239401073071619419216 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 270 for generator 15. -/
def ep_Q2_024_partial_15_0270 : Poly :=
[
  term ((-348099553739418349239401073071619419216 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((696199107478836698478802146143238838432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 15. -/
theorem ep_Q2_024_partial_15_0270_valid :
    mulPoly ep_Q2_024_coefficient_15_0270
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0271 : Poly :=
[
  term ((-378436232841307212711511542563946625778244340010983240 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 271 for generator 15. -/
def ep_Q2_024_partial_15_0271 : Poly :=
[
  term ((378436232841307212711511542563946625778244340010983240 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-756872465682614425423023085127893251556488680021966480 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 15. -/
theorem ep_Q2_024_partial_15_0271_valid :
    mulPoly ep_Q2_024_coefficient_15_0271
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0272 : Poly :=
[
  term ((383652227451194 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 15. -/
def ep_Q2_024_partial_15_0272 : Poly :=
[
  term ((-383652227451194 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((767304454902388 : Rat) / 1162780221153193) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 15. -/
theorem ep_Q2_024_partial_15_0272_valid :
    mulPoly ep_Q2_024_coefficient_15_0272
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0273 : Poly :=
[
  term ((-20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (9, 2)]
]

/-- Partial product 273 for generator 15. -/
def ep_Q2_024_partial_15_0273 : Poly :=
[
  term ((20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (9, 2)],
  term ((-41487540071530061954723301431524064888 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 15. -/
theorem ep_Q2_024_partial_15_0273_valid :
    mulPoly ep_Q2_024_coefficient_15_0273
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0274 : Poly :=
[
  term ((-2983921640346915634287939396249227987056518826894144019 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 274 for generator 15. -/
def ep_Q2_024_partial_15_0274 : Poly :=
[
  term ((2983921640346915634287939396249227987056518826894144019 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2983921640346915634287939396249227987056518826894144019 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 15. -/
theorem ep_Q2_024_partial_15_0274_valid :
    mulPoly ep_Q2_024_coefficient_15_0274
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0275 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 15. -/
def ep_Q2_024_partial_15_0275 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 15. -/
theorem ep_Q2_024_partial_15_0275_valid :
    mulPoly ep_Q2_024_coefficient_15_0275
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0276 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (12, 1), (13, 2)]
]

/-- Partial product 276 for generator 15. -/
def ep_Q2_024_partial_15_0276 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 15. -/
theorem ep_Q2_024_partial_15_0276_valid :
    mulPoly ep_Q2_024_coefficient_15_0276
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0277 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (12, 1), (15, 2)]
]

/-- Partial product 277 for generator 15. -/
def ep_Q2_024_partial_15_0277 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 15. -/
theorem ep_Q2_024_partial_15_0277_valid :
    mulPoly ep_Q2_024_coefficient_15_0277
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0278 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 278 for generator 15. -/
def ep_Q2_024_partial_15_0278 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 15. -/
theorem ep_Q2_024_partial_15_0278_valid :
    mulPoly ep_Q2_024_coefficient_15_0278
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0279 : Poly :=
[
  term ((1044411224920203479395466046989529508355756141930125434 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 279 for generator 15. -/
def ep_Q2_024_partial_15_0279 : Poly :=
[
  term ((-1044411224920203479395466046989529508355756141930125434 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2088822449840406958790932093979059016711512283860250868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 15. -/
theorem ep_Q2_024_partial_15_0279_valid :
    mulPoly ep_Q2_024_coefficient_15_0279
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0280 : Poly :=
[
  term ((-811034815721058 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 15. -/
def ep_Q2_024_partial_15_0280 : Poly :=
[
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1622069631442116 : Rat) / 1162780221153193) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 15. -/
theorem ep_Q2_024_partial_15_0280_valid :
    mulPoly ep_Q2_024_coefficient_15_0280
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0281 : Poly :=
[
  term ((-39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (13, 2)]
]

/-- Partial product 281 for generator 15. -/
def ep_Q2_024_partial_15_0281 : Poly :=
[
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (13, 2)],
  term ((-78726166487926603128084977502874653716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 15. -/
theorem ep_Q2_024_partial_15_0281_valid :
    mulPoly ep_Q2_024_coefficient_15_0281
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0282 : Poly :=
[
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 282 for generator 15. -/
def ep_Q2_024_partial_15_0282 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (15, 2)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 15. -/
theorem ep_Q2_024_partial_15_0282_valid :
    mulPoly ep_Q2_024_coefficient_15_0282
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0283 : Poly :=
[
  term ((6632049177465070 : Rat) / 1162780221153193) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 283 for generator 15. -/
def ep_Q2_024_partial_15_0283 : Poly :=
[
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 15. -/
theorem ep_Q2_024_partial_15_0283_valid :
    mulPoly ep_Q2_024_coefficient_15_0283
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0284 : Poly :=
[
  term ((20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 284 for generator 15. -/
def ep_Q2_024_partial_15_0284 : Poly :=
[
  term ((41487540071530061954723301431524064888 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 15. -/
theorem ep_Q2_024_partial_15_0284_valid :
    mulPoly ep_Q2_024_coefficient_15_0284
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0285 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 285 for generator 15. -/
def ep_Q2_024_partial_15_0285 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 15. -/
theorem ep_Q2_024_partial_15_0285_valid :
    mulPoly ep_Q2_024_coefficient_15_0285
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0286 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 286 for generator 15. -/
def ep_Q2_024_partial_15_0286 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 15. -/
theorem ep_Q2_024_partial_15_0286_valid :
    mulPoly ep_Q2_024_coefficient_15_0286
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0287 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 15. -/
def ep_Q2_024_partial_15_0287 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 15. -/
theorem ep_Q2_024_partial_15_0287_valid :
    mulPoly ep_Q2_024_coefficient_15_0287
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0288 : Poly :=
[
  term ((-62881399510310800061036208211119564758 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 288 for generator 15. -/
def ep_Q2_024_partial_15_0288 : Poly :=
[
  term ((-125762799020621600122072416422239129516 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((62881399510310800061036208211119564758 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 15. -/
theorem ep_Q2_024_partial_15_0288_valid :
    mulPoly ep_Q2_024_coefficient_15_0288
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0289 : Poly :=
[
  term ((4022447424060347783831104343803005053396598872951486684 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 289 for generator 15. -/
def ep_Q2_024_partial_15_0289 : Poly :=
[
  term ((8044894848120695567662208687606010106793197745902973368 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-4022447424060347783831104343803005053396598872951486684 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 15. -/
theorem ep_Q2_024_partial_15_0289_valid :
    mulPoly ep_Q2_024_coefficient_15_0289
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0290 : Poly :=
[
  term ((-383652227451194 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 15. -/
def ep_Q2_024_partial_15_0290 : Poly :=
[
  term ((-767304454902388 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((383652227451194 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 15. -/
theorem ep_Q2_024_partial_15_0290_valid :
    mulPoly ep_Q2_024_coefficient_15_0290
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0291 : Poly :=
[
  term ((-521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 291 for generator 15. -/
def ep_Q2_024_partial_15_0291 : Poly :=
[
  term ((-1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 15. -/
theorem ep_Q2_024_partial_15_0291_valid :
    mulPoly ep_Q2_024_coefficient_15_0291
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0292 : Poly :=
[
  term ((-69980268845671607350691512113270062018 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 292 for generator 15. -/
def ep_Q2_024_partial_15_0292 : Poly :=
[
  term ((-139960537691343214701383024226540124036 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((69980268845671607350691512113270062018 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 15. -/
theorem ep_Q2_024_partial_15_0292_valid :
    mulPoly ep_Q2_024_coefficient_15_0292
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0293 : Poly :=
[
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 293 for generator 15. -/
def ep_Q2_024_partial_15_0293 : Poly :=
[
  term ((2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 15. -/
theorem ep_Q2_024_partial_15_0293_valid :
    mulPoly ep_Q2_024_coefficient_15_0293
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0294 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 294 for generator 15. -/
def ep_Q2_024_partial_15_0294 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 15. -/
theorem ep_Q2_024_partial_15_0294_valid :
    mulPoly ep_Q2_024_coefficient_15_0294
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0295 : Poly :=
[
  term ((1096802439214548716294802782415140892358 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 295 for generator 15. -/
def ep_Q2_024_partial_15_0295 : Poly :=
[
  term ((2193604878429097432589605564830281784716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1096802439214548716294802782415140892358 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 15. -/
theorem ep_Q2_024_partial_15_0295_valid :
    mulPoly ep_Q2_024_coefficient_15_0295
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0296 : Poly :=
[
  term ((51915704829790594969946334879621778984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 296 for generator 15. -/
def ep_Q2_024_partial_15_0296 : Poly :=
[
  term ((103831409659581189939892669759243557968 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-51915704829790594969946334879621778984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 15. -/
theorem ep_Q2_024_partial_15_0296_valid :
    mulPoly ep_Q2_024_coefficient_15_0296
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0297 : Poly :=
[
  term ((-213236464392768479375916064050604203761586285448738265 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 297 for generator 15. -/
def ep_Q2_024_partial_15_0297 : Poly :=
[
  term ((-213236464392768479375916064050604203761586285448738265 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((213236464392768479375916064050604203761586285448738265 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 15. -/
theorem ep_Q2_024_partial_15_0297_valid :
    mulPoly ep_Q2_024_coefficient_15_0297
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0298 : Poly :=
[
  term ((851445551046798 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 15. -/
def ep_Q2_024_partial_15_0298 : Poly :=
[
  term ((1702891102093596 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-851445551046798 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 15. -/
theorem ep_Q2_024_partial_15_0298_valid :
    mulPoly ep_Q2_024_coefficient_15_0298
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0299 : Poly :=
[
  term ((-15721402768530196087659603422996936335169769370568395171 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 299 for generator 15. -/
def ep_Q2_024_partial_15_0299 : Poly :=
[
  term ((-15721402768530196087659603422996936335169769370568395171 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((15721402768530196087659603422996936335169769370568395171 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 15. -/
theorem ep_Q2_024_partial_15_0299_valid :
    mulPoly ep_Q2_024_coefficient_15_0299
        ep_Q2_024_generator_15_0200_0299 =
      ep_Q2_024_partial_15_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_15_0200,
  ep_Q2_024_partial_15_0201,
  ep_Q2_024_partial_15_0202,
  ep_Q2_024_partial_15_0203,
  ep_Q2_024_partial_15_0204,
  ep_Q2_024_partial_15_0205,
  ep_Q2_024_partial_15_0206,
  ep_Q2_024_partial_15_0207,
  ep_Q2_024_partial_15_0208,
  ep_Q2_024_partial_15_0209,
  ep_Q2_024_partial_15_0210,
  ep_Q2_024_partial_15_0211,
  ep_Q2_024_partial_15_0212,
  ep_Q2_024_partial_15_0213,
  ep_Q2_024_partial_15_0214,
  ep_Q2_024_partial_15_0215,
  ep_Q2_024_partial_15_0216,
  ep_Q2_024_partial_15_0217,
  ep_Q2_024_partial_15_0218,
  ep_Q2_024_partial_15_0219,
  ep_Q2_024_partial_15_0220,
  ep_Q2_024_partial_15_0221,
  ep_Q2_024_partial_15_0222,
  ep_Q2_024_partial_15_0223,
  ep_Q2_024_partial_15_0224,
  ep_Q2_024_partial_15_0225,
  ep_Q2_024_partial_15_0226,
  ep_Q2_024_partial_15_0227,
  ep_Q2_024_partial_15_0228,
  ep_Q2_024_partial_15_0229,
  ep_Q2_024_partial_15_0230,
  ep_Q2_024_partial_15_0231,
  ep_Q2_024_partial_15_0232,
  ep_Q2_024_partial_15_0233,
  ep_Q2_024_partial_15_0234,
  ep_Q2_024_partial_15_0235,
  ep_Q2_024_partial_15_0236,
  ep_Q2_024_partial_15_0237,
  ep_Q2_024_partial_15_0238,
  ep_Q2_024_partial_15_0239,
  ep_Q2_024_partial_15_0240,
  ep_Q2_024_partial_15_0241,
  ep_Q2_024_partial_15_0242,
  ep_Q2_024_partial_15_0243,
  ep_Q2_024_partial_15_0244,
  ep_Q2_024_partial_15_0245,
  ep_Q2_024_partial_15_0246,
  ep_Q2_024_partial_15_0247,
  ep_Q2_024_partial_15_0248,
  ep_Q2_024_partial_15_0249,
  ep_Q2_024_partial_15_0250,
  ep_Q2_024_partial_15_0251,
  ep_Q2_024_partial_15_0252,
  ep_Q2_024_partial_15_0253,
  ep_Q2_024_partial_15_0254,
  ep_Q2_024_partial_15_0255,
  ep_Q2_024_partial_15_0256,
  ep_Q2_024_partial_15_0257,
  ep_Q2_024_partial_15_0258,
  ep_Q2_024_partial_15_0259,
  ep_Q2_024_partial_15_0260,
  ep_Q2_024_partial_15_0261,
  ep_Q2_024_partial_15_0262,
  ep_Q2_024_partial_15_0263,
  ep_Q2_024_partial_15_0264,
  ep_Q2_024_partial_15_0265,
  ep_Q2_024_partial_15_0266,
  ep_Q2_024_partial_15_0267,
  ep_Q2_024_partial_15_0268,
  ep_Q2_024_partial_15_0269,
  ep_Q2_024_partial_15_0270,
  ep_Q2_024_partial_15_0271,
  ep_Q2_024_partial_15_0272,
  ep_Q2_024_partial_15_0273,
  ep_Q2_024_partial_15_0274,
  ep_Q2_024_partial_15_0275,
  ep_Q2_024_partial_15_0276,
  ep_Q2_024_partial_15_0277,
  ep_Q2_024_partial_15_0278,
  ep_Q2_024_partial_15_0279,
  ep_Q2_024_partial_15_0280,
  ep_Q2_024_partial_15_0281,
  ep_Q2_024_partial_15_0282,
  ep_Q2_024_partial_15_0283,
  ep_Q2_024_partial_15_0284,
  ep_Q2_024_partial_15_0285,
  ep_Q2_024_partial_15_0286,
  ep_Q2_024_partial_15_0287,
  ep_Q2_024_partial_15_0288,
  ep_Q2_024_partial_15_0289,
  ep_Q2_024_partial_15_0290,
  ep_Q2_024_partial_15_0291,
  ep_Q2_024_partial_15_0292,
  ep_Q2_024_partial_15_0293,
  ep_Q2_024_partial_15_0294,
  ep_Q2_024_partial_15_0295,
  ep_Q2_024_partial_15_0296,
  ep_Q2_024_partial_15_0297,
  ep_Q2_024_partial_15_0298,
  ep_Q2_024_partial_15_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0200_0299 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((21590745439330276442126809500391769866092066094006243584 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-6440342140616448 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-146330676884252249175267940173512880024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (9, 2)],
  term ((7640314750782822812568516603709898658882694586294513960 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (12, 1), (13, 2)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54756759301258258307931449023111713140119438253233898056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((8149872493695904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((583288259464262629688862111893895508096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37276623482217427385796043721380561367438156929244975390 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((17538690757302296 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10795372719665138221063404750195884933046033047003121792 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((3220171070308224 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((73165338442126124587633970086756440012 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 2)],
  term ((-3820157375391411406284258301854949329441347293147256980 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (12, 1), (13, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27378379650629129153965724511555856570059719126616949028 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-4074936246847952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-291644129732131314844431055946947754048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (13, 2), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((18638311741108713692898021860690280683719078464622487695 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (4, 1), (15, 2)],
  term ((-8769345378651148 : Rat) / 1162780221153193) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((10139578104936318157725755370282093944 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((25324701889821531787661907861533895184 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-3302196748239299330517374325134292726539881164272723542 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((2026144251562328 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((9132519537636008841900359184714216213884 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (9, 1)],
  term ((-11024870643161542974509615464867112176 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-28310712868896680 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-731591532924857359246887707797732537504 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88274196592870248124083490051503701600731130523037582348 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-18995855446103920 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-49730484048564751 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((17926701670466629642795520622448146960756625855374092752 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((9256212294760832 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((23958955931124895 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5069789052468159078862877685141046972 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)],
  term ((-12662350944910765893830953930766947592 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((1651098374119649665258687162567146363269940582136361771 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-1013072125781164 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4566259768818004420950179592357108106942 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)],
  term ((5512435321580771487254807732433556088 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (15, 2)],
  term ((14155356434448340 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)],
  term ((365795766462428679623443853898866268752 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44137098296435124062041745025751850800365565261518791174 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((9497927723051960 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (13, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-8963350835233314821397760311224073480378312927687046376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (15, 1)],
  term ((-4628106147380416 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (15, 3)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (15, 2)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((41487540071530061954723301431524064888 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-125762799020621600122072416422239129516 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((8044894848120695567662208687606010106793197745902973368 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-767304454902388 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-139960537691343214701383024226540124036 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((2193604878429097432589605564830281784716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((103831409659581189939892669759243557968 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-213236464392768479375916064050604203761586285448738265 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1702891102093596 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15721402768530196087659603422996936335169769370568395171 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-348099553739418349239401073071619419216 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((378436232841307212711511542563946625778244340010983240 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-383652227451194 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (9, 2)],
  term ((2983921640346915634287939396249227987056518826894144019 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1044411224920203479395466046989529508355756141930125434 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (13, 2)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (15, 2)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((696199107478836698478802146143238838432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((-756872465682614425423023085127893251556488680021966480 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((767304454902388 : Rat) / 1162780221153193) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-41487540071530061954723301431524064888 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 2), (9, 2)],
  term ((-2983921640346915634287939396249227987056518826894144019 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 2), (12, 1), (13, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 2), (12, 1), (15, 2)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((2088822449840406958790932093979059016711512283860250868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-1622069631442116 : Rat) / 1162780221153193) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-78726166487926603128084977502874653716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (13, 2)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (15, 2)],
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-20743770035765030977361650715762032444 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (7, 1), (8, 1), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((62881399510310800061036208211119564758 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((-4022447424060347783831104343803005053396598872951486684 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((383652227451194 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)],
  term ((69980268845671607350691512113270062018 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (11, 1)],
  term ((-1096802439214548716294802782415140892358 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-51915704829790594969946334879621778984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((213236464392768479375916064050604203761586285448738265 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-851445551046798 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15721402768530196087659603422996936335169769370568395171 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 200 through 299. -/
theorem ep_Q2_024_block_15_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_15_0200_0299
      ep_Q2_024_block_15_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
