/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 1:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_01_0200_0299 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0200 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 1. -/
def ep_Q2_024_partial_01_0200 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 1. -/
theorem ep_Q2_024_partial_01_0200_valid :
    mulPoly ep_Q2_024_coefficient_01_0200
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0201 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 201 for generator 1. -/
def ep_Q2_024_partial_01_0201 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (9, 1), (12, 1), (15, 2)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 2), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 1. -/
theorem ep_Q2_024_partial_01_0201_valid :
    mulPoly ep_Q2_024_coefficient_01_0201
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0202 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 1. -/
def ep_Q2_024_partial_01_0202 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 1. -/
theorem ep_Q2_024_partial_01_0202_valid :
    mulPoly ep_Q2_024_coefficient_01_0202
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0203 : Poly :=
[
  term ((-4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 203 for generator 1. -/
def ep_Q2_024_partial_01_0203 : Poly :=
[
  term ((-9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 1. -/
theorem ep_Q2_024_partial_01_0203_valid :
    mulPoly ep_Q2_024_coefficient_01_0203
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0204 : Poly :=
[
  term ((-64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 204 for generator 1. -/
def ep_Q2_024_partial_01_0204 : Poly :=
[
  term ((-128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (9, 1), (15, 2)],
  term ((64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 1. -/
theorem ep_Q2_024_partial_01_0204_valid :
    mulPoly ep_Q2_024_coefficient_01_0204
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0205 : Poly :=
[
  term ((14155356434448340 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 1. -/
def ep_Q2_024_partial_01_0205 : Poly :=
[
  term ((28310712868896680 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((28310712868896680 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-14155356434448340 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-14155356434448340 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 1. -/
theorem ep_Q2_024_partial_01_0205_valid :
    mulPoly ep_Q2_024_coefficient_01_0205
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0206 : Poly :=
[
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 206 for generator 1. -/
def ep_Q2_024_partial_01_0206 : Poly :=
[
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 2), (15, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 1. -/
theorem ep_Q2_024_partial_01_0206_valid :
    mulPoly ep_Q2_024_coefficient_01_0206
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0207 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (11, 1)]
]

/-- Partial product 207 for generator 1. -/
def ep_Q2_024_partial_01_0207 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 2), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 1. -/
theorem ep_Q2_024_partial_01_0207_valid :
    mulPoly ep_Q2_024_coefficient_01_0207
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0208 : Poly :=
[
  term ((1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 208 for generator 1. -/
def ep_Q2_024_partial_01_0208 : Poly :=
[
  term ((3914852757930635246410701264643315647136 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((3914852757930635246410701264643315647136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 1. -/
theorem ep_Q2_024_partial_01_0208_valid :
    mulPoly ep_Q2_024_coefficient_01_0208
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0209 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 209 for generator 1. -/
def ep_Q2_024_partial_01_0209 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 1. -/
theorem ep_Q2_024_partial_01_0209_valid :
    mulPoly ep_Q2_024_coefficient_01_0209
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0210 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 210 for generator 1. -/
def ep_Q2_024_partial_01_0210 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (6, 2), (12, 1), (13, 1), (15, 2)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 1. -/
theorem ep_Q2_024_partial_01_0210_valid :
    mulPoly ep_Q2_024_coefficient_01_0210
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0211 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 1. -/
def ep_Q2_024_partial_01_0211 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 1. -/
theorem ep_Q2_024_partial_01_0211_valid :
    mulPoly ep_Q2_024_coefficient_01_0211
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0212 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 212 for generator 1. -/
def ep_Q2_024_partial_01_0212 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 1. -/
theorem ep_Q2_024_partial_01_0212_valid :
    mulPoly ep_Q2_024_coefficient_01_0212
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0213 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 213 for generator 1. -/
def ep_Q2_024_partial_01_0213 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 1. -/
theorem ep_Q2_024_partial_01_0213_valid :
    mulPoly ep_Q2_024_coefficient_01_0213
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0214 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 1. -/
def ep_Q2_024_partial_01_0214 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 1. -/
theorem ep_Q2_024_partial_01_0214_valid :
    mulPoly ep_Q2_024_coefficient_01_0214
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0215 : Poly :=
[
  term ((-41538529330920726546241863056934566664769300370126437513 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 1. -/
def ep_Q2_024_partial_01_0215 : Poly :=
[
  term ((-83077058661841453092483726113869133329538600740252875026 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-83077058661841453092483726113869133329538600740252875026 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((41538529330920726546241863056934566664769300370126437513 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((41538529330920726546241863056934566664769300370126437513 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 1. -/
theorem ep_Q2_024_partial_01_0215_valid :
    mulPoly ep_Q2_024_coefficient_01_0215
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0216 : Poly :=
[
  term ((7630090420731068 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 1. -/
def ep_Q2_024_partial_01_0216 : Poly :=
[
  term ((15260180841462136 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((15260180841462136 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 1. -/
theorem ep_Q2_024_partial_01_0216_valid :
    mulPoly ep_Q2_024_coefficient_01_0216
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0217 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 217 for generator 1. -/
def ep_Q2_024_partial_01_0217 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (6, 2), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (7, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 1. -/
theorem ep_Q2_024_partial_01_0217_valid :
    mulPoly ep_Q2_024_coefficient_01_0217
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0218 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 1. -/
def ep_Q2_024_partial_01_0218 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 3), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 1. -/
theorem ep_Q2_024_partial_01_0218_valid :
    mulPoly ep_Q2_024_coefficient_01_0218
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0219 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 219 for generator 1. -/
def ep_Q2_024_partial_01_0219 : Poly :=
[
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 2), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 1. -/
theorem ep_Q2_024_partial_01_0219_valid :
    mulPoly ep_Q2_024_coefficient_01_0219
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0220 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 220 for generator 1. -/
def ep_Q2_024_partial_01_0220 : Poly :=
[
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 1. -/
theorem ep_Q2_024_partial_01_0220_valid :
    mulPoly ep_Q2_024_coefficient_01_0220
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0221 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 1. -/
def ep_Q2_024_partial_01_0221 : Poly :=
[
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 1. -/
theorem ep_Q2_024_partial_01_0221_valid :
    mulPoly ep_Q2_024_coefficient_01_0221
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0222 : Poly :=
[
  term ((-1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (13, 1)]
]

/-- Partial product 222 for generator 1. -/
def ep_Q2_024_partial_01_0222 : Poly :=
[
  term ((-3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((-3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 2), (13, 1)],
  term ((1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 1. -/
theorem ep_Q2_024_partial_01_0222_valid :
    mulPoly ep_Q2_024_coefficient_01_0222
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0223 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 223 for generator 1. -/
def ep_Q2_024_partial_01_0223 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (13, 1), (14, 1), (15, 2)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 1. -/
theorem ep_Q2_024_partial_01_0223_valid :
    mulPoly ep_Q2_024_coefficient_01_0223
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0224 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 1. -/
def ep_Q2_024_partial_01_0224 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 1. -/
theorem ep_Q2_024_partial_01_0224_valid :
    mulPoly ep_Q2_024_coefficient_01_0224
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0225 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 225 for generator 1. -/
def ep_Q2_024_partial_01_0225 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 1. -/
theorem ep_Q2_024_partial_01_0225_valid :
    mulPoly ep_Q2_024_coefficient_01_0225
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0226 : Poly :=
[
  term ((49730484048564751 : Rat) / 6976681326919158) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 1. -/
def ep_Q2_024_partial_01_0226 : Poly :=
[
  term ((49730484048564751 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 1. -/
theorem ep_Q2_024_partial_01_0226_valid :
    mulPoly ep_Q2_024_coefficient_01_0226
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0227 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 1. -/
def ep_Q2_024_partial_01_0227 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 2), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 1. -/
theorem ep_Q2_024_partial_01_0227_valid :
    mulPoly ep_Q2_024_coefficient_01_0227
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0228 : Poly :=
[
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 228 for generator 1. -/
def ep_Q2_024_partial_01_0228 : Poly :=
[
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (7, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 1. -/
theorem ep_Q2_024_partial_01_0228_valid :
    mulPoly ep_Q2_024_coefficient_01_0228
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0229 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 229 for generator 1. -/
def ep_Q2_024_partial_01_0229 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 1. -/
theorem ep_Q2_024_partial_01_0229_valid :
    mulPoly ep_Q2_024_coefficient_01_0229
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0230 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 230 for generator 1. -/
def ep_Q2_024_partial_01_0230 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 1. -/
theorem ep_Q2_024_partial_01_0230_valid :
    mulPoly ep_Q2_024_coefficient_01_0230
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0231 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 231 for generator 1. -/
def ep_Q2_024_partial_01_0231 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 1. -/
theorem ep_Q2_024_partial_01_0231_valid :
    mulPoly ep_Q2_024_coefficient_01_0231
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0232 : Poly :=
[
  term ((19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(5, 1), (15, 1)]
]

/-- Partial product 232 for generator 1. -/
def ep_Q2_024_partial_01_0232 : Poly :=
[
  term ((38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(5, 1), (6, 2), (15, 1)],
  term ((-19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 1. -/
theorem ep_Q2_024_partial_01_0232_valid :
    mulPoly ep_Q2_024_coefficient_01_0232
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0233 : Poly :=
[
  term ((-4628106147380416 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 1. -/
def ep_Q2_024_partial_01_0233 : Poly :=
[
  term ((-9256212294760832 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9256212294760832 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 1. -/
theorem ep_Q2_024_partial_01_0233_valid :
    mulPoly ep_Q2_024_coefficient_01_0233
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0234 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (15, 3)]
]

/-- Partial product 234 for generator 1. -/
def ep_Q2_024_partial_01_0234 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (7, 1), (15, 3)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (6, 2), (15, 3)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (7, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 1. -/
theorem ep_Q2_024_partial_01_0234_valid :
    mulPoly ep_Q2_024_coefficient_01_0234
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0235 : Poly :=
[
  term ((-23958955931124895 : Rat) / 6976681326919158) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 235 for generator 1. -/
def ep_Q2_024_partial_01_0235 : Poly :=
[
  term ((-23958955931124895 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 1. -/
theorem ep_Q2_024_partial_01_0235_valid :
    mulPoly ep_Q2_024_coefficient_01_0235
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0236 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 236 for generator 1. -/
def ep_Q2_024_partial_01_0236 : Poly :=
[
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (9, 1), (15, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 1. -/
theorem ep_Q2_024_partial_01_0236_valid :
    mulPoly ep_Q2_024_coefficient_01_0236
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0237 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 237 for generator 1. -/
def ep_Q2_024_partial_01_0237 : Poly :=
[
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 2), (13, 1), (15, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 1. -/
theorem ep_Q2_024_partial_01_0237_valid :
    mulPoly ep_Q2_024_coefficient_01_0237
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0238 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (15, 2)]
]

/-- Partial product 238 for generator 1. -/
def ep_Q2_024_partial_01_0238 : Poly :=
[
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (7, 1), (15, 2)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (6, 2), (15, 2)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 1. -/
theorem ep_Q2_024_partial_01_0238_valid :
    mulPoly ep_Q2_024_coefficient_01_0238
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0239 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 1. -/
def ep_Q2_024_partial_01_0239 : Poly :=
[
  term ((5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (6, 2), (15, 2), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 1. -/
theorem ep_Q2_024_partial_01_0239_valid :
    mulPoly ep_Q2_024_coefficient_01_0239
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0240 : Poly :=
[
  term ((521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1)]
]

/-- Partial product 240 for generator 1. -/
def ep_Q2_024_partial_01_0240 : Poly :=
[
  term ((1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (9, 1)],
  term ((-521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (9, 1)],
  term ((-521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 1. -/
theorem ep_Q2_024_partial_01_0240_valid :
    mulPoly ep_Q2_024_coefficient_01_0240
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0241 : Poly :=
[
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 241 for generator 1. -/
def ep_Q2_024_partial_01_0241 : Poly :=
[
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (7, 1), (9, 1), (12, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(7, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 1. -/
theorem ep_Q2_024_partial_01_0241_valid :
    mulPoly ep_Q2_024_coefficient_01_0241
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0242 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1)]
]

/-- Partial product 242 for generator 1. -/
def ep_Q2_024_partial_01_0242 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 2), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (7, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 1. -/
theorem ep_Q2_024_partial_01_0242_valid :
    mulPoly ep_Q2_024_coefficient_01_0242
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0243 : Poly :=
[
  term ((-978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 243 for generator 1. -/
def ep_Q2_024_partial_01_0243 : Poly :=
[
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 1. -/
theorem ep_Q2_024_partial_01_0243_valid :
    mulPoly ep_Q2_024_coefficient_01_0243
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0244 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 244 for generator 1. -/
def ep_Q2_024_partial_01_0244 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 1. -/
theorem ep_Q2_024_partial_01_0244_valid :
    mulPoly ep_Q2_024_coefficient_01_0244
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0245 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 1. -/
def ep_Q2_024_partial_01_0245 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 1. -/
theorem ep_Q2_024_partial_01_0245_valid :
    mulPoly ep_Q2_024_coefficient_01_0245
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0246 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 1. -/
def ep_Q2_024_partial_01_0246 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 1. -/
theorem ep_Q2_024_partial_01_0246_valid :
    mulPoly ep_Q2_024_coefficient_01_0246
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0247 : Poly :=
[
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 1. -/
def ep_Q2_024_partial_01_0247 : Poly :=
[
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((-41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 1. -/
theorem ep_Q2_024_partial_01_0247_valid :
    mulPoly ep_Q2_024_coefficient_01_0247
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0248 : Poly :=
[
  term ((-3815045210365534 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 1. -/
def ep_Q2_024_partial_01_0248 : Poly :=
[
  term ((-7630090420731068 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((3815045210365534 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3815045210365534 : Rat) / 1162780221153193) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 1. -/
theorem ep_Q2_024_partial_01_0248_valid :
    mulPoly ep_Q2_024_coefficient_01_0248
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0249 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 249 for generator 1. -/
def ep_Q2_024_partial_01_0249 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 2), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 2), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 1. -/
theorem ep_Q2_024_partial_01_0249_valid :
    mulPoly ep_Q2_024_coefficient_01_0249
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0250 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 250 for generator 1. -/
def ep_Q2_024_partial_01_0250 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 2), (12, 2), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (7, 1), (12, 2), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 1. -/
theorem ep_Q2_024_partial_01_0250_valid :
    mulPoly ep_Q2_024_coefficient_01_0250
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0251 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 1. -/
def ep_Q2_024_partial_01_0251 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(7, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 1. -/
theorem ep_Q2_024_partial_01_0251_valid :
    mulPoly ep_Q2_024_coefficient_01_0251
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0252 : Poly :=
[
  term ((33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (13, 1)]
]

/-- Partial product 252 for generator 1. -/
def ep_Q2_024_partial_01_0252 : Poly :=
[
  term ((66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 2), (13, 1)],
  term ((-33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (7, 1), (13, 1)],
  term ((-33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 1. -/
theorem ep_Q2_024_partial_01_0252_valid :
    mulPoly ep_Q2_024_coefficient_01_0252
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0253 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 253 for generator 1. -/
def ep_Q2_024_partial_01_0253 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (7, 1), (13, 1), (15, 2)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 1. -/
theorem ep_Q2_024_partial_01_0253_valid :
    mulPoly ep_Q2_024_coefficient_01_0253
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0254 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 1. -/
def ep_Q2_024_partial_01_0254 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 1. -/
theorem ep_Q2_024_partial_01_0254_valid :
    mulPoly ep_Q2_024_coefficient_01_0254
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0255 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 255 for generator 1. -/
def ep_Q2_024_partial_01_0255 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (13, 2), (15, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (13, 2), (15, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 1. -/
theorem ep_Q2_024_partial_01_0255_valid :
    mulPoly ep_Q2_024_coefficient_01_0255
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0256 : Poly :=
[
  term ((-15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 1)]
]

/-- Partial product 256 for generator 1. -/
def ep_Q2_024_partial_01_0256 : Poly :=
[
  term ((-31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (15, 1)],
  term ((15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (7, 1), (15, 1)],
  term ((15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 1. -/
theorem ep_Q2_024_partial_01_0256_valid :
    mulPoly ep_Q2_024_coefficient_01_0256
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0257 : Poly :=
[
  term ((2314053073690208 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 1. -/
def ep_Q2_024_partial_01_0257 : Poly :=
[
  term ((4628106147380416 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2314053073690208 : Rat) / 1162780221153193) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2314053073690208 : Rat) / 1162780221153193) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 1. -/
theorem ep_Q2_024_partial_01_0257_valid :
    mulPoly ep_Q2_024_coefficient_01_0257
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0258 : Poly :=
[
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 258 for generator 1. -/
def ep_Q2_024_partial_01_0258 : Poly :=
[
  term ((-6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 1. -/
theorem ep_Q2_024_partial_01_0258_valid :
    mulPoly ep_Q2_024_coefficient_01_0258
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0259 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 259 for generator 1. -/
def ep_Q2_024_partial_01_0259 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 1. -/
theorem ep_Q2_024_partial_01_0259_valid :
    mulPoly ep_Q2_024_coefficient_01_0259
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0260 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 260 for generator 1. -/
def ep_Q2_024_partial_01_0260 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 2), (8, 1), (12, 1), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 1. -/
theorem ep_Q2_024_partial_01_0260_valid :
    mulPoly ep_Q2_024_coefficient_01_0260
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0261 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 1. -/
def ep_Q2_024_partial_01_0261 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(6, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 1. -/
theorem ep_Q2_024_partial_01_0261_valid :
    mulPoly ep_Q2_024_coefficient_01_0261
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0262 : Poly :=
[
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 262 for generator 1. -/
def ep_Q2_024_partial_01_0262 : Poly :=
[
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 1. -/
theorem ep_Q2_024_partial_01_0262_valid :
    mulPoly ep_Q2_024_coefficient_01_0262
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0263 : Poly :=
[
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (15, 2)]
]

/-- Partial product 263 for generator 1. -/
def ep_Q2_024_partial_01_0263 : Poly :=
[
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (15, 2)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 1. -/
theorem ep_Q2_024_partial_01_0263_valid :
    mulPoly ep_Q2_024_coefficient_01_0263
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0264 : Poly :=
[
  term ((8683303471552472 : Rat) / 3488340663459579) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 264 for generator 1. -/
def ep_Q2_024_partial_01_0264 : Poly :=
[
  term ((17366606943104944 : Rat) / 3488340663459579) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 1. -/
theorem ep_Q2_024_partial_01_0264_valid :
    mulPoly ep_Q2_024_coefficient_01_0264
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0265 : Poly :=
[
  term ((2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1)]
]

/-- Partial product 265 for generator 1. -/
def ep_Q2_024_partial_01_0265 : Poly :=
[
  term ((4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (11, 1)],
  term ((-2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 1. -/
theorem ep_Q2_024_partial_01_0265_valid :
    mulPoly ep_Q2_024_coefficient_01_0265
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0266 : Poly :=
[
  term ((-890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 266 for generator 1. -/
def ep_Q2_024_partial_01_0266 : Poly :=
[
  term ((-1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 1. -/
theorem ep_Q2_024_partial_01_0266_valid :
    mulPoly ep_Q2_024_coefficient_01_0266
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0267 : Poly :=
[
  term ((-9452664600915195252177344823023617784084 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 267 for generator 1. -/
def ep_Q2_024_partial_01_0267 : Poly :=
[
  term ((-18905329201830390504354689646047235568168 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-18905329201830390504354689646047235568168 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((9452664600915195252177344823023617784084 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((9452664600915195252177344823023617784084 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 1. -/
theorem ep_Q2_024_partial_01_0267_valid :
    mulPoly ep_Q2_024_coefficient_01_0267
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0268 : Poly :=
[
  term ((296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 268 for generator 1. -/
def ep_Q2_024_partial_01_0268 : Poly :=
[
  term ((593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 1. -/
theorem ep_Q2_024_partial_01_0268_valid :
    mulPoly ep_Q2_024_coefficient_01_0268
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0269 : Poly :=
[
  term ((-70420422433059743601040559959027413988253965519049025083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 269 for generator 1. -/
def ep_Q2_024_partial_01_0269 : Poly :=
[
  term ((-70420422433059743601040559959027413988253965519049025083 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-70420422433059743601040559959027413988253965519049025083 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((70420422433059743601040559959027413988253965519049025083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((70420422433059743601040559959027413988253965519049025083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 1. -/
theorem ep_Q2_024_partial_01_0269_valid :
    mulPoly ep_Q2_024_coefficient_01_0269
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0270 : Poly :=
[
  term ((2449693339989265 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 1. -/
def ep_Q2_024_partial_01_0270 : Poly :=
[
  term ((2449693339989265 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2449693339989265 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2449693339989265 : Rat) / 2325560442306386) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2449693339989265 : Rat) / 2325560442306386) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 1. -/
theorem ep_Q2_024_partial_01_0270_valid :
    mulPoly ep_Q2_024_coefficient_01_0270
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0271 : Poly :=
[
  term ((-112967691199439475208272831403466890112878409468560839413 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 271 for generator 1. -/
def ep_Q2_024_partial_01_0271 : Poly :=
[
  term ((-112967691199439475208272831403466890112878409468560839413 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-112967691199439475208272831403466890112878409468560839413 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((112967691199439475208272831403466890112878409468560839413 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((112967691199439475208272831403466890112878409468560839413 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 1. -/
theorem ep_Q2_024_partial_01_0271_valid :
    mulPoly ep_Q2_024_coefficient_01_0271
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0272 : Poly :=
[
  term ((-134110508162946499 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 1. -/
def ep_Q2_024_partial_01_0272 : Poly :=
[
  term ((-134110508162946499 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-134110508162946499 : Rat) / 6976681326919158) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((134110508162946499 : Rat) / 13953362653838316) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((134110508162946499 : Rat) / 13953362653838316) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 1. -/
theorem ep_Q2_024_partial_01_0272_valid :
    mulPoly ep_Q2_024_coefficient_01_0272
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0273 : Poly :=
[
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 273 for generator 1. -/
def ep_Q2_024_partial_01_0273 : Poly :=
[
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 1), (12, 2), (13, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 1. -/
theorem ep_Q2_024_partial_01_0273_valid :
    mulPoly ep_Q2_024_coefficient_01_0273
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0274 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 274 for generator 1. -/
def ep_Q2_024_partial_01_0274 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 2), (9, 1), (12, 2), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 2), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 1. -/
theorem ep_Q2_024_partial_01_0274_valid :
    mulPoly ep_Q2_024_coefficient_01_0274
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0275 : Poly :=
[
  term ((5003541596661801 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 1. -/
def ep_Q2_024_partial_01_0275 : Poly :=
[
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(6, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(7, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 1. -/
theorem ep_Q2_024_partial_01_0275_valid :
    mulPoly ep_Q2_024_coefficient_01_0275
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0276 : Poly :=
[
  term ((-90525549614133326500001161413553925318 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1)]
]

/-- Partial product 276 for generator 1. -/
def ep_Q2_024_partial_01_0276 : Poly :=
[
  term ((-181051099228266653000002322827107850636 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-181051099228266653000002322827107850636 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((90525549614133326500001161413553925318 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (9, 1), (13, 1)],
  term ((90525549614133326500001161413553925318 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 1. -/
theorem ep_Q2_024_partial_01_0276_valid :
    mulPoly ep_Q2_024_coefficient_01_0276
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0277 : Poly :=
[
  term ((-727559135645115300864493704993563264384 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 277 for generator 1. -/
def ep_Q2_024_partial_01_0277 : Poly :=
[
  term ((-1455118271290230601728987409987126528768 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1455118271290230601728987409987126528768 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((727559135645115300864493704993563264384 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((727559135645115300864493704993563264384 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 1. -/
theorem ep_Q2_024_partial_01_0277_valid :
    mulPoly ep_Q2_024_coefficient_01_0277
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0278 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 278 for generator 1. -/
def ep_Q2_024_partial_01_0278 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 1. -/
theorem ep_Q2_024_partial_01_0278_valid :
    mulPoly ep_Q2_024_coefficient_01_0278
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0279 : Poly :=
[
  term ((834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 279 for generator 1. -/
def ep_Q2_024_partial_01_0279 : Poly :=
[
  term ((1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((-834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 1. -/
theorem ep_Q2_024_partial_01_0279_valid :
    mulPoly ep_Q2_024_coefficient_01_0279
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0280 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 1. -/
def ep_Q2_024_partial_01_0280 : Poly :=
[
  term ((-2990296899089872 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 1. -/
theorem ep_Q2_024_partial_01_0280_valid :
    mulPoly ep_Q2_024_coefficient_01_0280
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0281 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 281 for generator 1. -/
def ep_Q2_024_partial_01_0281 : Poly :=
[
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 1), (13, 2), (15, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 1. -/
theorem ep_Q2_024_partial_01_0281_valid :
    mulPoly ep_Q2_024_coefficient_01_0281
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0282 : Poly :=
[
  term ((261482024224419825856956961547353498117749505372482717833 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 282 for generator 1. -/
def ep_Q2_024_partial_01_0282 : Poly :=
[
  term ((261482024224419825856956961547353498117749505372482717833 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((261482024224419825856956961547353498117749505372482717833 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-261482024224419825856956961547353498117749505372482717833 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-261482024224419825856956961547353498117749505372482717833 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 1. -/
theorem ep_Q2_024_partial_01_0282_valid :
    mulPoly ep_Q2_024_coefficient_01_0282
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0283 : Poly :=
[
  term ((-94862438539086739 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 1. -/
def ep_Q2_024_partial_01_0283 : Poly :=
[
  term ((-94862438539086739 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94862438539086739 : Rat) / 6976681326919158) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((94862438539086739 : Rat) / 13953362653838316) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((94862438539086739 : Rat) / 13953362653838316) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 1. -/
theorem ep_Q2_024_partial_01_0283_valid :
    mulPoly ep_Q2_024_coefficient_01_0283
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0284 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 284 for generator 1. -/
def ep_Q2_024_partial_01_0284 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (9, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 1. -/
theorem ep_Q2_024_partial_01_0284_valid :
    mulPoly ep_Q2_024_coefficient_01_0284
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0285 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 1. -/
def ep_Q2_024_partial_01_0285 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 1. -/
theorem ep_Q2_024_partial_01_0285_valid :
    mulPoly ep_Q2_024_coefficient_01_0285
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0286 : Poly :=
[
  term ((-1928943717610035164145216203529293708531070248863607955 : Rat) / 92999895213201981850477343083626589746734642324746138) [(9, 1), (15, 1)]
]

/-- Partial product 286 for generator 1. -/
def ep_Q2_024_partial_01_0286 : Poly :=
[
  term ((-1928943717610035164145216203529293708531070248863607955 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1928943717610035164145216203529293708531070248863607955 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((1928943717610035164145216203529293708531070248863607955 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 2), (9, 1), (15, 1)],
  term ((1928943717610035164145216203529293708531070248863607955 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 1. -/
theorem ep_Q2_024_partial_01_0286_valid :
    mulPoly ep_Q2_024_coefficient_01_0286
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0287 : Poly :=
[
  term ((4484829935676736 : Rat) / 1162780221153193) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 1. -/
def ep_Q2_024_partial_01_0287 : Poly :=
[
  term ((8969659871353472 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8969659871353472 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4484829935676736 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4484829935676736 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 1. -/
theorem ep_Q2_024_partial_01_0287_valid :
    mulPoly ep_Q2_024_coefficient_01_0287
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0288 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 3)]
]

/-- Partial product 288 for generator 1. -/
def ep_Q2_024_partial_01_0288 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (9, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 1. -/
theorem ep_Q2_024_partial_01_0288_valid :
    mulPoly ep_Q2_024_coefficient_01_0288
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0289 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 289 for generator 1. -/
def ep_Q2_024_partial_01_0289 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 1. -/
theorem ep_Q2_024_partial_01_0289_valid :
    mulPoly ep_Q2_024_coefficient_01_0289
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0290 : Poly :=
[
  term ((975304351101513484636753820406853475104 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 290 for generator 1. -/
def ep_Q2_024_partial_01_0290 : Poly :=
[
  term ((1950608702203026969273507640813706950208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2)],
  term ((1950608702203026969273507640813706950208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 2)],
  term ((-975304351101513484636753820406853475104 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2)],
  term ((-975304351101513484636753820406853475104 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 1. -/
theorem ep_Q2_024_partial_01_0290_valid :
    mulPoly ep_Q2_024_coefficient_01_0290
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0291 : Poly :=
[
  term ((334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1)]
]

/-- Partial product 291 for generator 1. -/
def ep_Q2_024_partial_01_0291 : Poly :=
[
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(6, 2), (9, 2), (12, 1)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 1. -/
theorem ep_Q2_024_partial_01_0291_valid :
    mulPoly ep_Q2_024_coefficient_01_0291
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0292 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 292 for generator 1. -/
def ep_Q2_024_partial_01_0292 : Poly :=
[
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (13, 1), (15, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 1. -/
theorem ep_Q2_024_partial_01_0292_valid :
    mulPoly ep_Q2_024_coefficient_01_0292
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0293 : Poly :=
[
  term ((-242818647307167607290045417041953584104 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)]
]

/-- Partial product 293 for generator 1. -/
def ep_Q2_024_partial_01_0293 : Poly :=
[
  term ((-485637294614335214580090834083907168208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-485637294614335214580090834083907168208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 2), (14, 1)],
  term ((242818647307167607290045417041953584104 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2), (14, 1)],
  term ((242818647307167607290045417041953584104 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 1. -/
theorem ep_Q2_024_partial_01_0293_valid :
    mulPoly ep_Q2_024_coefficient_01_0293
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0294 : Poly :=
[
  term ((-404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 294 for generator 1. -/
def ep_Q2_024_partial_01_0294 : Poly :=
[
  term ((-809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 1. -/
theorem ep_Q2_024_partial_01_0294_valid :
    mulPoly ep_Q2_024_coefficient_01_0294
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0295 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 295 for generator 1. -/
def ep_Q2_024_partial_01_0295 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 1. -/
theorem ep_Q2_024_partial_01_0295_valid :
    mulPoly ep_Q2_024_coefficient_01_0295
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0296 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 296 for generator 1. -/
def ep_Q2_024_partial_01_0296 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 1. -/
theorem ep_Q2_024_partial_01_0296_valid :
    mulPoly ep_Q2_024_coefficient_01_0296
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0297 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 1. -/
def ep_Q2_024_partial_01_0297 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 1. -/
theorem ep_Q2_024_partial_01_0297_valid :
    mulPoly ep_Q2_024_coefficient_01_0297
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0298 : Poly :=
[
  term ((3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 298 for generator 1. -/
def ep_Q2_024_partial_01_0298 : Poly :=
[
  term ((7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 1. -/
theorem ep_Q2_024_partial_01_0298_valid :
    mulPoly ep_Q2_024_coefficient_01_0298
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0299 : Poly :=
[
  term ((1258416035554584 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 1. -/
def ep_Q2_024_partial_01_0299 : Poly :=
[
  term ((2516832071109168 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2516832071109168 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1258416035554584 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1258416035554584 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 1. -/
theorem ep_Q2_024_partial_01_0299_valid :
    mulPoly ep_Q2_024_coefficient_01_0299
        ep_Q2_024_generator_01_0200_0299 =
      ep_Q2_024_partial_01_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_01_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_01_0200,
  ep_Q2_024_partial_01_0201,
  ep_Q2_024_partial_01_0202,
  ep_Q2_024_partial_01_0203,
  ep_Q2_024_partial_01_0204,
  ep_Q2_024_partial_01_0205,
  ep_Q2_024_partial_01_0206,
  ep_Q2_024_partial_01_0207,
  ep_Q2_024_partial_01_0208,
  ep_Q2_024_partial_01_0209,
  ep_Q2_024_partial_01_0210,
  ep_Q2_024_partial_01_0211,
  ep_Q2_024_partial_01_0212,
  ep_Q2_024_partial_01_0213,
  ep_Q2_024_partial_01_0214,
  ep_Q2_024_partial_01_0215,
  ep_Q2_024_partial_01_0216,
  ep_Q2_024_partial_01_0217,
  ep_Q2_024_partial_01_0218,
  ep_Q2_024_partial_01_0219,
  ep_Q2_024_partial_01_0220,
  ep_Q2_024_partial_01_0221,
  ep_Q2_024_partial_01_0222,
  ep_Q2_024_partial_01_0223,
  ep_Q2_024_partial_01_0224,
  ep_Q2_024_partial_01_0225,
  ep_Q2_024_partial_01_0226,
  ep_Q2_024_partial_01_0227,
  ep_Q2_024_partial_01_0228,
  ep_Q2_024_partial_01_0229,
  ep_Q2_024_partial_01_0230,
  ep_Q2_024_partial_01_0231,
  ep_Q2_024_partial_01_0232,
  ep_Q2_024_partial_01_0233,
  ep_Q2_024_partial_01_0234,
  ep_Q2_024_partial_01_0235,
  ep_Q2_024_partial_01_0236,
  ep_Q2_024_partial_01_0237,
  ep_Q2_024_partial_01_0238,
  ep_Q2_024_partial_01_0239,
  ep_Q2_024_partial_01_0240,
  ep_Q2_024_partial_01_0241,
  ep_Q2_024_partial_01_0242,
  ep_Q2_024_partial_01_0243,
  ep_Q2_024_partial_01_0244,
  ep_Q2_024_partial_01_0245,
  ep_Q2_024_partial_01_0246,
  ep_Q2_024_partial_01_0247,
  ep_Q2_024_partial_01_0248,
  ep_Q2_024_partial_01_0249,
  ep_Q2_024_partial_01_0250,
  ep_Q2_024_partial_01_0251,
  ep_Q2_024_partial_01_0252,
  ep_Q2_024_partial_01_0253,
  ep_Q2_024_partial_01_0254,
  ep_Q2_024_partial_01_0255,
  ep_Q2_024_partial_01_0256,
  ep_Q2_024_partial_01_0257,
  ep_Q2_024_partial_01_0258,
  ep_Q2_024_partial_01_0259,
  ep_Q2_024_partial_01_0260,
  ep_Q2_024_partial_01_0261,
  ep_Q2_024_partial_01_0262,
  ep_Q2_024_partial_01_0263,
  ep_Q2_024_partial_01_0264,
  ep_Q2_024_partial_01_0265,
  ep_Q2_024_partial_01_0266,
  ep_Q2_024_partial_01_0267,
  ep_Q2_024_partial_01_0268,
  ep_Q2_024_partial_01_0269,
  ep_Q2_024_partial_01_0270,
  ep_Q2_024_partial_01_0271,
  ep_Q2_024_partial_01_0272,
  ep_Q2_024_partial_01_0273,
  ep_Q2_024_partial_01_0274,
  ep_Q2_024_partial_01_0275,
  ep_Q2_024_partial_01_0276,
  ep_Q2_024_partial_01_0277,
  ep_Q2_024_partial_01_0278,
  ep_Q2_024_partial_01_0279,
  ep_Q2_024_partial_01_0280,
  ep_Q2_024_partial_01_0281,
  ep_Q2_024_partial_01_0282,
  ep_Q2_024_partial_01_0283,
  ep_Q2_024_partial_01_0284,
  ep_Q2_024_partial_01_0285,
  ep_Q2_024_partial_01_0286,
  ep_Q2_024_partial_01_0287,
  ep_Q2_024_partial_01_0288,
  ep_Q2_024_partial_01_0289,
  ep_Q2_024_partial_01_0290,
  ep_Q2_024_partial_01_0291,
  ep_Q2_024_partial_01_0292,
  ep_Q2_024_partial_01_0293,
  ep_Q2_024_partial_01_0294,
  ep_Q2_024_partial_01_0295,
  ep_Q2_024_partial_01_0296,
  ep_Q2_024_partial_01_0297,
  ep_Q2_024_partial_01_0298,
  ep_Q2_024_partial_01_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_01_0200_0299 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((28310712868896680 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((3914852757930635246410701264643315647136 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83077058661841453092483726113869133329538600740252875026 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((15260180841462136 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1)],
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((49730484048564751 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-9256212294760832 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-23958955931124895 : Rat) / 3488340663459579) [(0, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-18905329201830390504354689646047235568168 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-70420422433059743601040559959027413988253965519049025083 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2449693339989265 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112967691199439475208272831403466890112878409468560839413 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-134110508162946499 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-181051099228266653000002322827107850636 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-1455118271290230601728987409987126528768 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((261482024224419825856956961547353498117749505372482717833 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-94862438539086739 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1928943717610035164145216203529293708531070248863607955 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((8969659871353472 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((1950608702203026969273507640813706950208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2)],
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-485637294614335214580090834083907168208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2516832071109168 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9292388085935623394935834385708275875088 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-128961049898733716980839249182621550719906967959782253506 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((28310712868896680 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((3914852757930635246410701264643315647136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83077058661841453092483726113869133329538600740252875026 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((15260180841462136 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3122286202393853616871306683810333907348 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((38520160230321884839278521978447363532198300405046110610 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-9256212294760832 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (7, 1), (15, 3)],
  term ((-23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (7, 1), (15, 2)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((17366606943104944 : Rat) / 3488340663459579) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1780359734670997098290531680796761691576 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-18905329201830390504354689646047235568168 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-70420422433059743601040559959027413988253965519049025083 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2449693339989265 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112967691199439475208272831403466890112878409468560839413 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-134110508162946499 : Rat) / 6976681326919158) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-181051099228266653000002322827107850636 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1455118271290230601728987409987126528768 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((261482024224419825856956961547353498117749505372482717833 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-94862438539086739 : Rat) / 6976681326919158) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1928943717610035164145216203529293708531070248863607955 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((8969659871353472 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (9, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((1950608702203026969273507640813706950208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 2)],
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (9, 2), (12, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-485637294614335214580090834083907168208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (9, 2), (14, 1)],
  term ((-809034296560014240734172506958810413608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7129600382308906724960435516547192807103997378923004944 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((2516832071109168 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1042564181049768868938118184704952526022 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (9, 1)],
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 2), (9, 1), (12, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 2), (11, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 2), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 2), (13, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (13, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 2), (13, 2), (15, 1)],
  term ((-31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 2), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (9, 1), (12, 1), (15, 2)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (9, 1), (15, 2)],
  term ((-14155356434448340 : Rat) / 1162780221153193) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (9, 2), (15, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 2), (11, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (6, 2), (12, 1), (13, 1), (15, 2)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 1), (13, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41538529330920726546241863056934566664769300370126437513 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (6, 2), (12, 1), (15, 3)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 1), (15, 3), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 2), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(5, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 2), (13, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 2), (13, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 2), (13, 2), (14, 1), (15, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 2), (13, 2), (15, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 2), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(5, 1), (6, 2), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (6, 2), (15, 3)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((4646194042967811697467917192854137937544 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((64480524949366858490419624591310775359953483979891126753 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (9, 1), (15, 2)],
  term ((-14155356434448340 : Rat) / 1162780221153193) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 2), (11, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41538529330920726546241863056934566664769300370126437513 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (7, 2), (12, 1), (15, 3)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 2), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((1561143101196926808435653341905166953674 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 2), (13, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (7, 2), (13, 2), (14, 1), (15, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (7, 2), (13, 2), (15, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (7, 2), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-19260080115160942419639260989223681766099150202523055305 : Rat) / 418499528459408918327148043876319653860305890461357621) [(5, 1), (7, 2), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (7, 2), (15, 3)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (9, 1), (15, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 2), (13, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (6, 2), (15, 2)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (6, 2), (15, 2), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (7, 2), (9, 1), (15, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (7, 2), (13, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 2), (7, 2), (15, 2)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (9, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (7, 1), (9, 1), (12, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (7, 1), (11, 1)],
  term ((978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((3815045210365534 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (12, 2), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (7, 1), (12, 2), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(6, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (7, 1), (13, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (7, 1), (13, 1), (15, 2)],
  term ((449127554429600 : Rat) / 1162780221153193) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (7, 1), (13, 2), (15, 1)],
  term ((15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (7, 1), (15, 1)],
  term ((-2314053073690208 : Rat) / 1162780221153193) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(6, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 2), (8, 1), (12, 1), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(6, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (8, 1), (15, 2)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (11, 1)],
  term ((890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((9452664600915195252177344823023617784084 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((70420422433059743601040559959027413988253965519049025083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2449693339989265 : Rat) / 2325560442306386) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((112967691199439475208272831403466890112878409468560839413 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((134110508162946499 : Rat) / 13953362653838316) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 2), (9, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(6, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((90525549614133326500001161413553925318 : Rat) / 39990315246749243218889784267651308933) [(6, 2), (9, 1), (13, 1)],
  term ((727559135645115300864493704993563264384 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 1), (13, 1), (14, 2)],
  term ((-834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 1), (13, 2), (15, 1)],
  term ((-261482024224419825856956961547353498117749505372482717833 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((94862438539086739 : Rat) / 13953362653838316) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (9, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1928943717610035164145216203529293708531070248863607955 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 2), (9, 1), (15, 1)],
  term ((-4484829935676736 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (9, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-975304351101513484636753820406853475104 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(6, 2), (9, 2), (12, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (9, 2), (13, 1), (15, 1)],
  term ((242818647307167607290045417041953584104 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (9, 2), (14, 1)],
  term ((404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1258416035554584 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 2), (8, 1), (12, 1), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (8, 1), (15, 2)],
  term ((-8683303471552472 : Rat) / 3488340663459579) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (11, 1)],
  term ((890179867335498549145265840398380845788 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((9452664600915195252177344823023617784084 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((70420422433059743601040559959027413988253965519049025083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2449693339989265 : Rat) / 2325560442306386) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((112967691199439475208272831403466890112878409468560839413 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((134110508162946499 : Rat) / 13953362653838316) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 2), (9, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(7, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((90525549614133326500001161413553925318 : Rat) / 39990315246749243218889784267651308933) [(7, 2), (9, 1), (13, 1)],
  term ((727559135645115300864493704993563264384 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 1), (13, 1), (14, 2)],
  term ((-834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 1), (13, 2), (15, 1)],
  term ((-261482024224419825856956961547353498117749505372482717833 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((94862438539086739 : Rat) / 13953362653838316) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (9, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1928943717610035164145216203529293708531070248863607955 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (9, 1), (15, 1)],
  term ((-4484829935676736 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (9, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-975304351101513484636753820406853475104 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 2)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(7, 2), (9, 2), (12, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((242818647307167607290045417041953584104 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (9, 2), (14, 1)],
  term ((404517148280007120367086253479405206804 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3564800191154453362480217758273596403551998689461502472 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1258416035554584 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521282090524884434469059092352476263011 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (9, 1)],
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(7, 3), (9, 1), (12, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 3), (11, 1)],
  term ((978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 3), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 3), (12, 1), (15, 1)],
  term ((3815045210365534 : Rat) / 1162780221153193) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (12, 2), (13, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 3), (12, 2), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(7, 3), (13, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 3), (13, 1), (15, 2)],
  term ((449127554429600 : Rat) / 1162780221153193) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(7, 3), (13, 2), (15, 1)],
  term ((15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 3), (15, 1)],
  term ((-2314053073690208 : Rat) / 1162780221153193) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 200 through 299. -/
theorem ep_Q2_024_block_01_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_01_0200_0299
      ep_Q2_024_block_01_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
