/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 5:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_05_0300_0399 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0300 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 5. -/
def ep_Q2_024_partial_05_0300 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem ep_Q2_024_partial_05_0300_valid :
    mulPoly ep_Q2_024_coefficient_05_0300
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0301 : Poly :=
[
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 301 for generator 5. -/
def ep_Q2_024_partial_05_0301 : Poly :=
[
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 2), (11, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (14, 2)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem ep_Q2_024_partial_05_0301_valid :
    mulPoly ep_Q2_024_coefficient_05_0301
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0302 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 302 for generator 5. -/
def ep_Q2_024_partial_05_0302 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem ep_Q2_024_partial_05_0302_valid :
    mulPoly ep_Q2_024_coefficient_05_0302
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0303 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 303 for generator 5. -/
def ep_Q2_024_partial_05_0303 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem ep_Q2_024_partial_05_0303_valid :
    mulPoly ep_Q2_024_coefficient_05_0303
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0304 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 5. -/
def ep_Q2_024_partial_05_0304 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem ep_Q2_024_partial_05_0304_valid :
    mulPoly ep_Q2_024_coefficient_05_0304
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0305 : Poly :=
[
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 305 for generator 5. -/
def ep_Q2_024_partial_05_0305 : Poly :=
[
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem ep_Q2_024_partial_05_0305_valid :
    mulPoly ep_Q2_024_coefficient_05_0305
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0306 : Poly :=
[
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 306 for generator 5. -/
def ep_Q2_024_partial_05_0306 : Poly :=
[
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem ep_Q2_024_partial_05_0306_valid :
    mulPoly ep_Q2_024_coefficient_05_0306
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0307 : Poly :=
[
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 5. -/
def ep_Q2_024_partial_05_0307 : Poly :=
[
  term ((-11761952876044204 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem ep_Q2_024_partial_05_0307_valid :
    mulPoly ep_Q2_024_coefficient_05_0307
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0308 : Poly :=
[
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3)]
]

/-- Partial product 308 for generator 5. -/
def ep_Q2_024_partial_05_0308 : Poly :=
[
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (9, 3)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (9, 3)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 2)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem ep_Q2_024_partial_05_0308_valid :
    mulPoly ep_Q2_024_coefficient_05_0308
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0309 : Poly :=
[
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1)]
]

/-- Partial product 309 for generator 5. -/
def ep_Q2_024_partial_05_0309 : Poly :=
[
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1)],
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 2)],
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem ep_Q2_024_partial_05_0309_valid :
    mulPoly ep_Q2_024_coefficient_05_0309
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0310 : Poly :=
[
  term ((32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 310 for generator 5. -/
def ep_Q2_024_partial_05_0310 : Poly :=
[
  term ((32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem ep_Q2_024_partial_05_0310_valid :
    mulPoly ep_Q2_024_coefficient_05_0310
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0311 : Poly :=
[
  term ((3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 311 for generator 5. -/
def ep_Q2_024_partial_05_0311 : Poly :=
[
  term ((3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem ep_Q2_024_partial_05_0311_valid :
    mulPoly ep_Q2_024_coefficient_05_0311
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0312 : Poly :=
[
  term ((-3024938416541954 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 5. -/
def ep_Q2_024_partial_05_0312 : Poly :=
[
  term ((-3024938416541954 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3024938416541954 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3024938416541954 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3024938416541954 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem ep_Q2_024_partial_05_0312_valid :
    mulPoly ep_Q2_024_coefficient_05_0312
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0313 : Poly :=
[
  term ((-20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1)]
]

/-- Partial product 313 for generator 5. -/
def ep_Q2_024_partial_05_0313 : Poly :=
[
  term ((-20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (13, 1)],
  term ((-20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (13, 1)],
  term ((20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1), (14, 2)],
  term ((20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem ep_Q2_024_partial_05_0313_valid :
    mulPoly ep_Q2_024_coefficient_05_0313
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0314 : Poly :=
[
  term ((293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 314 for generator 5. -/
def ep_Q2_024_partial_05_0314 : Poly :=
[
  term ((293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem ep_Q2_024_partial_05_0314_valid :
    mulPoly ep_Q2_024_coefficient_05_0314
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0315 : Poly :=
[
  term ((-8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 315 for generator 5. -/
def ep_Q2_024_partial_05_0315 : Poly :=
[
  term ((-8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 1), (15, 3)],
  term ((8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem ep_Q2_024_partial_05_0315_valid :
    mulPoly ep_Q2_024_coefficient_05_0315
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0316 : Poly :=
[
  term ((324063331475366 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 5. -/
def ep_Q2_024_partial_05_0316 : Poly :=
[
  term ((324063331475366 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((324063331475366 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-324063331475366 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-324063331475366 : Rat) / 1162780221153193) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem ep_Q2_024_partial_05_0316_valid :
    mulPoly ep_Q2_024_coefficient_05_0316
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0317 : Poly :=
[
  term ((-2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 1)]
]

/-- Partial product 317 for generator 5. -/
def ep_Q2_024_partial_05_0317 : Poly :=
[
  term ((-2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (15, 1)],
  term ((-2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (15, 1)],
  term ((2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 2), (15, 1)],
  term ((2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem ep_Q2_024_partial_05_0317_valid :
    mulPoly ep_Q2_024_coefficient_05_0317
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0318 : Poly :=
[
  term ((2099695728793444 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 5. -/
def ep_Q2_024_partial_05_0318 : Poly :=
[
  term ((2099695728793444 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((2099695728793444 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2099695728793444 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2099695728793444 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem ep_Q2_024_partial_05_0318_valid :
    mulPoly ep_Q2_024_coefficient_05_0318
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0319 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 319 for generator 5. -/
def ep_Q2_024_partial_05_0319 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem ep_Q2_024_partial_05_0319_valid :
    mulPoly ep_Q2_024_coefficient_05_0319
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0320 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 320 for generator 5. -/
def ep_Q2_024_partial_05_0320 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem ep_Q2_024_partial_05_0320_valid :
    mulPoly ep_Q2_024_coefficient_05_0320
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0321 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 5. -/
def ep_Q2_024_partial_05_0321 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem ep_Q2_024_partial_05_0321_valid :
    mulPoly ep_Q2_024_coefficient_05_0321
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0322 : Poly :=
[
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

/-- Partial product 322 for generator 5. -/
def ep_Q2_024_partial_05_0322 : Poly :=
[
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 2)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem ep_Q2_024_partial_05_0322_valid :
    mulPoly ep_Q2_024_coefficient_05_0322
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0323 : Poly :=
[
  term ((398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 323 for generator 5. -/
def ep_Q2_024_partial_05_0323 : Poly :=
[
  term ((398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((-398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 2)],
  term ((-398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem ep_Q2_024_partial_05_0323_valid :
    mulPoly ep_Q2_024_coefficient_05_0323
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0324 : Poly :=
[
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 324 for generator 5. -/
def ep_Q2_024_partial_05_0324 : Poly :=
[
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem ep_Q2_024_partial_05_0324_valid :
    mulPoly ep_Q2_024_coefficient_05_0324
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0325 : Poly :=
[
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 325 for generator 5. -/
def ep_Q2_024_partial_05_0325 : Poly :=
[
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem ep_Q2_024_partial_05_0325_valid :
    mulPoly ep_Q2_024_coefficient_05_0325
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0326 : Poly :=
[
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 5. -/
def ep_Q2_024_partial_05_0326 : Poly :=
[
  term ((1146295204983097 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem ep_Q2_024_partial_05_0326_valid :
    mulPoly ep_Q2_024_coefficient_05_0326
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0327 : Poly :=
[
  term ((403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 327 for generator 5. -/
def ep_Q2_024_partial_05_0327 : Poly :=
[
  term ((403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem ep_Q2_024_partial_05_0327_valid :
    mulPoly ep_Q2_024_coefficient_05_0327
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0328 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 328 for generator 5. -/
def ep_Q2_024_partial_05_0328 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem ep_Q2_024_partial_05_0328_valid :
    mulPoly ep_Q2_024_coefficient_05_0328
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0329 : Poly :=
[
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 5. -/
def ep_Q2_024_partial_05_0329 : Poly :=
[
  term ((1082535559364413 : Rat) / 2325560442306386) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem ep_Q2_024_partial_05_0329_valid :
    mulPoly ep_Q2_024_coefficient_05_0329
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0330 : Poly :=
[
  term ((-7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1)]
]

/-- Partial product 330 for generator 5. -/
def ep_Q2_024_partial_05_0330 : Poly :=
[
  term ((-7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (7, 1), (9, 1)],
  term ((-7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (9, 1)],
  term ((7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (14, 2)],
  term ((7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem ep_Q2_024_partial_05_0330_valid :
    mulPoly ep_Q2_024_coefficient_05_0330
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0331 : Poly :=
[
  term ((1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 331 for generator 5. -/
def ep_Q2_024_partial_05_0331 : Poly :=
[
  term ((1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem ep_Q2_024_partial_05_0331_valid :
    mulPoly ep_Q2_024_coefficient_05_0331
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0332 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 332 for generator 5. -/
def ep_Q2_024_partial_05_0332 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem ep_Q2_024_partial_05_0332_valid :
    mulPoly ep_Q2_024_coefficient_05_0332
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0333 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 333 for generator 5. -/
def ep_Q2_024_partial_05_0333 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem ep_Q2_024_partial_05_0333_valid :
    mulPoly ep_Q2_024_coefficient_05_0333
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0334 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 5. -/
def ep_Q2_024_partial_05_0334 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem ep_Q2_024_partial_05_0334_valid :
    mulPoly ep_Q2_024_coefficient_05_0334
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0335 : Poly :=
[
  term ((-52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 335 for generator 5. -/
def ep_Q2_024_partial_05_0335 : Poly :=
[
  term ((-52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem ep_Q2_024_partial_05_0335_valid :
    mulPoly ep_Q2_024_coefficient_05_0335
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0336 : Poly :=
[
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 5. -/
def ep_Q2_024_partial_05_0336 : Poly :=
[
  term ((-1687313560550815 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem ep_Q2_024_partial_05_0336_valid :
    mulPoly ep_Q2_024_coefficient_05_0336
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0337 : Poly :=
[
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2)]
]

/-- Partial product 337 for generator 5. -/
def ep_Q2_024_partial_05_0337 : Poly :=
[
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 2)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 2)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 2)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem ep_Q2_024_partial_05_0337_valid :
    mulPoly ep_Q2_024_coefficient_05_0337
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0338 : Poly :=
[
  term ((-97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 338 for generator 5. -/
def ep_Q2_024_partial_05_0338 : Poly :=
[
  term ((-97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem ep_Q2_024_partial_05_0338_valid :
    mulPoly ep_Q2_024_coefficient_05_0338
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0339 : Poly :=
[
  term ((179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 339 for generator 5. -/
def ep_Q2_024_partial_05_0339 : Poly :=
[
  term ((179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem ep_Q2_024_partial_05_0339_valid :
    mulPoly ep_Q2_024_coefficient_05_0339
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0340 : Poly :=
[
  term ((-3310291618026951 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 5. -/
def ep_Q2_024_partial_05_0340 : Poly :=
[
  term ((-3310291618026951 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3310291618026951 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3310291618026951 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((3310291618026951 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem ep_Q2_024_partial_05_0340_valid :
    mulPoly ep_Q2_024_coefficient_05_0340
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0341 : Poly :=
[
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 341 for generator 5. -/
def ep_Q2_024_partial_05_0341 : Poly :=
[
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 2), (13, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 2), (13, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem ep_Q2_024_partial_05_0341_valid :
    mulPoly ep_Q2_024_coefficient_05_0341
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0342 : Poly :=
[
  term ((-6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 342 for generator 5. -/
def ep_Q2_024_partial_05_0342 : Poly :=
[
  term ((-6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((-6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem ep_Q2_024_partial_05_0342_valid :
    mulPoly ep_Q2_024_coefficient_05_0342
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0343 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 5. -/
def ep_Q2_024_partial_05_0343 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem ep_Q2_024_partial_05_0343_valid :
    mulPoly ep_Q2_024_coefficient_05_0343
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0344 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3)]
]

/-- Partial product 344 for generator 5. -/
def ep_Q2_024_partial_05_0344 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 3)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem ep_Q2_024_partial_05_0344_valid :
    mulPoly ep_Q2_024_coefficient_05_0344
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0345 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1)]
]

/-- Partial product 345 for generator 5. -/
def ep_Q2_024_partial_05_0345 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (11, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (11, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 2)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem ep_Q2_024_partial_05_0345_valid :
    mulPoly ep_Q2_024_coefficient_05_0345
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0346 : Poly :=
[
  term ((489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 346 for generator 5. -/
def ep_Q2_024_partial_05_0346 : Poly :=
[
  term ((489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem ep_Q2_024_partial_05_0346_valid :
    mulPoly ep_Q2_024_coefficient_05_0346
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0347 : Poly :=
[
  term ((107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 347 for generator 5. -/
def ep_Q2_024_partial_05_0347 : Poly :=
[
  term ((107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem ep_Q2_024_partial_05_0347_valid :
    mulPoly ep_Q2_024_coefficient_05_0347
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0348 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 348 for generator 5. -/
def ep_Q2_024_partial_05_0348 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem ep_Q2_024_partial_05_0348_valid :
    mulPoly ep_Q2_024_coefficient_05_0348
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0349 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 5. -/
def ep_Q2_024_partial_05_0349 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem ep_Q2_024_partial_05_0349_valid :
    mulPoly ep_Q2_024_coefficient_05_0349
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0350 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 350 for generator 5. -/
def ep_Q2_024_partial_05_0350 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem ep_Q2_024_partial_05_0350_valid :
    mulPoly ep_Q2_024_coefficient_05_0350
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0351 : Poly :=
[
  term ((-6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 351 for generator 5. -/
def ep_Q2_024_partial_05_0351 : Poly :=
[
  term ((-6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem ep_Q2_024_partial_05_0351_valid :
    mulPoly ep_Q2_024_coefficient_05_0351
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0352 : Poly :=
[
  term ((3567371984676116 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 5. -/
def ep_Q2_024_partial_05_0352 : Poly :=
[
  term ((3567371984676116 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3567371984676116 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3567371984676116 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3567371984676116 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem ep_Q2_024_partial_05_0352_valid :
    mulPoly ep_Q2_024_coefficient_05_0352
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0353 : Poly :=
[
  term ((-98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 353 for generator 5. -/
def ep_Q2_024_partial_05_0353 : Poly :=
[
  term ((-98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem ep_Q2_024_partial_05_0353_valid :
    mulPoly ep_Q2_024_coefficient_05_0353
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0354 : Poly :=
[
  term ((-11289707851805915 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 5. -/
def ep_Q2_024_partial_05_0354 : Poly :=
[
  term ((-11289707851805915 : Rat) / 2325560442306386) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11289707851805915 : Rat) / 2325560442306386) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((11289707851805915 : Rat) / 2325560442306386) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11289707851805915 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem ep_Q2_024_partial_05_0354_valid :
    mulPoly ep_Q2_024_coefficient_05_0354
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0355 : Poly :=
[
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 355 for generator 5. -/
def ep_Q2_024_partial_05_0355 : Poly :=
[
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem ep_Q2_024_partial_05_0355_valid :
    mulPoly ep_Q2_024_coefficient_05_0355
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0356 : Poly :=
[
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 356 for generator 5. -/
def ep_Q2_024_partial_05_0356 : Poly :=
[
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem ep_Q2_024_partial_05_0356_valid :
    mulPoly ep_Q2_024_coefficient_05_0356
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0357 : Poly :=
[
  term ((-1823186202855382 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 5. -/
def ep_Q2_024_partial_05_0357 : Poly :=
[
  term ((-1823186202855382 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem ep_Q2_024_partial_05_0357_valid :
    mulPoly ep_Q2_024_coefficient_05_0357
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0358 : Poly :=
[
  term ((312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1)]
]

/-- Partial product 358 for generator 5. -/
def ep_Q2_024_partial_05_0358 : Poly :=
[
  term ((312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (13, 1)],
  term ((312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (13, 1)],
  term ((-312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 2)],
  term ((-312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem ep_Q2_024_partial_05_0358_valid :
    mulPoly ep_Q2_024_coefficient_05_0358
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0359 : Poly :=
[
  term ((158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 359 for generator 5. -/
def ep_Q2_024_partial_05_0359 : Poly :=
[
  term ((158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem ep_Q2_024_partial_05_0359_valid :
    mulPoly ep_Q2_024_coefficient_05_0359
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0360 : Poly :=
[
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 360 for generator 5. -/
def ep_Q2_024_partial_05_0360 : Poly :=
[
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 2)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 2)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem ep_Q2_024_partial_05_0360_valid :
    mulPoly ep_Q2_024_coefficient_05_0360
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0361 : Poly :=
[
  term ((-45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 361 for generator 5. -/
def ep_Q2_024_partial_05_0361 : Poly :=
[
  term ((-45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem ep_Q2_024_partial_05_0361_valid :
    mulPoly ep_Q2_024_coefficient_05_0361
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0362 : Poly :=
[
  term ((1939984377328187 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 362 for generator 5. -/
def ep_Q2_024_partial_05_0362 : Poly :=
[
  term ((1939984377328187 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1939984377328187 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1939984377328187 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1939984377328187 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem ep_Q2_024_partial_05_0362_valid :
    mulPoly ep_Q2_024_coefficient_05_0362
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0363 : Poly :=
[
  term ((63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 363 for generator 5. -/
def ep_Q2_024_partial_05_0363 : Poly :=
[
  term ((63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem ep_Q2_024_partial_05_0363_valid :
    mulPoly ep_Q2_024_coefficient_05_0363
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0364 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 5. -/
def ep_Q2_024_partial_05_0364 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem ep_Q2_024_partial_05_0364_valid :
    mulPoly ep_Q2_024_coefficient_05_0364
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0365 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3)]
]

/-- Partial product 365 for generator 5. -/
def ep_Q2_024_partial_05_0365 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 3)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 3)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem ep_Q2_024_partial_05_0365_valid :
    mulPoly ep_Q2_024_coefficient_05_0365
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0366 : Poly :=
[
  term ((-8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 366 for generator 5. -/
def ep_Q2_024_partial_05_0366 : Poly :=
[
  term ((-8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 1), (15, 3)],
  term ((8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem ep_Q2_024_partial_05_0366_valid :
    mulPoly ep_Q2_024_coefficient_05_0366
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0367 : Poly :=
[
  term ((-2330355049337645 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 5. -/
def ep_Q2_024_partial_05_0367 : Poly :=
[
  term ((-2330355049337645 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2330355049337645 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2330355049337645 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((2330355049337645 : Rat) / 1162780221153193) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 5. -/
theorem ep_Q2_024_partial_05_0367_valid :
    mulPoly ep_Q2_024_coefficient_05_0367
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0368 : Poly :=
[
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 368 for generator 5. -/
def ep_Q2_024_partial_05_0368 : Poly :=
[
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (14, 2), (15, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 3)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 5. -/
theorem ep_Q2_024_partial_05_0368_valid :
    mulPoly ep_Q2_024_coefficient_05_0368
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0369 : Poly :=
[
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 5. -/
def ep_Q2_024_partial_05_0369 : Poly :=
[
  term ((938674662914812 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(7, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 5. -/
theorem ep_Q2_024_partial_05_0369_valid :
    mulPoly ep_Q2_024_coefficient_05_0369
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0370 : Poly :=
[
  term ((639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (15, 1)]
]

/-- Partial product 370 for generator 5. -/
def ep_Q2_024_partial_05_0370 : Poly :=
[
  term ((639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (7, 1), (15, 1)],
  term ((639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (7, 1), (15, 1)],
  term ((-639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (14, 2), (15, 1)],
  term ((-639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 5. -/
theorem ep_Q2_024_partial_05_0370_valid :
    mulPoly ep_Q2_024_coefficient_05_0370
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0371 : Poly :=
[
  term ((3998471135601491 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 5. -/
def ep_Q2_024_partial_05_0371 : Poly :=
[
  term ((3998471135601491 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((3998471135601491 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3998471135601491 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3998471135601491 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 5. -/
theorem ep_Q2_024_partial_05_0371_valid :
    mulPoly ep_Q2_024_coefficient_05_0371
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0372 : Poly :=
[
  term ((-4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)]
]

/-- Partial product 372 for generator 5. -/
def ep_Q2_024_partial_05_0372 : Poly :=
[
  term ((-4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (15, 3)],
  term ((-4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (15, 3)],
  term ((4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 3)],
  term ((4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 5. -/
theorem ep_Q2_024_partial_05_0372_valid :
    mulPoly ep_Q2_024_coefficient_05_0372
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0373 : Poly :=
[
  term ((2364631218389772 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 373 for generator 5. -/
def ep_Q2_024_partial_05_0373 : Poly :=
[
  term ((2364631218389772 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((2364631218389772 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2364631218389772 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2364631218389772 : Rat) / 1162780221153193) [(7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 5. -/
theorem ep_Q2_024_partial_05_0373_valid :
    mulPoly ep_Q2_024_coefficient_05_0373
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0374 : Poly :=
[
  term ((-277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(8, 1)]
]

/-- Partial product 374 for generator 5. -/
def ep_Q2_024_partial_05_0374 : Poly :=
[
  term ((-277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(2, 2), (8, 1)],
  term ((-277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(3, 2), (8, 1)],
  term ((277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(8, 1), (14, 2)],
  term ((277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 5. -/
theorem ep_Q2_024_partial_05_0374_valid :
    mulPoly ep_Q2_024_coefficient_05_0374
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0375 : Poly :=
[
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 375 for generator 5. -/
def ep_Q2_024_partial_05_0375 : Poly :=
[
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 5. -/
theorem ep_Q2_024_partial_05_0375_valid :
    mulPoly ep_Q2_024_coefficient_05_0375
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0376 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 376 for generator 5. -/
def ep_Q2_024_partial_05_0376 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 5. -/
theorem ep_Q2_024_partial_05_0376_valid :
    mulPoly ep_Q2_024_coefficient_05_0376
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0377 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 377 for generator 5. -/
def ep_Q2_024_partial_05_0377 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 5. -/
theorem ep_Q2_024_partial_05_0377_valid :
    mulPoly ep_Q2_024_coefficient_05_0377
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0378 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 5. -/
def ep_Q2_024_partial_05_0378 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 5. -/
theorem ep_Q2_024_partial_05_0378_valid :
    mulPoly ep_Q2_024_coefficient_05_0378
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0379 : Poly :=
[
  term ((257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 379 for generator 5. -/
def ep_Q2_024_partial_05_0379 : Poly :=
[
  term ((257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((-257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 5. -/
theorem ep_Q2_024_partial_05_0379_valid :
    mulPoly ep_Q2_024_coefficient_05_0379
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0380 : Poly :=
[
  term ((6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 380 for generator 5. -/
def ep_Q2_024_partial_05_0380 : Poly :=
[
  term ((6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 5. -/
theorem ep_Q2_024_partial_05_0380_valid :
    mulPoly ep_Q2_024_coefficient_05_0380
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0381 : Poly :=
[
  term ((-6441657106601453 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 5. -/
def ep_Q2_024_partial_05_0381 : Poly :=
[
  term ((-6441657106601453 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6441657106601453 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6441657106601453 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((6441657106601453 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 5. -/
theorem ep_Q2_024_partial_05_0381_valid :
    mulPoly ep_Q2_024_coefficient_05_0381
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0382 : Poly :=
[
  term ((-271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

/-- Partial product 382 for generator 5. -/
def ep_Q2_024_partial_05_0382 : Poly :=
[
  term ((-271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 2)],
  term ((-271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2)],
  term ((271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (14, 2)],
  term ((271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 5. -/
theorem ep_Q2_024_partial_05_0382_valid :
    mulPoly ep_Q2_024_coefficient_05_0382
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0383 : Poly :=
[
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 383 for generator 5. -/
def ep_Q2_024_partial_05_0383 : Poly :=
[
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 5. -/
theorem ep_Q2_024_partial_05_0383_valid :
    mulPoly ep_Q2_024_coefficient_05_0383
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0384 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 384 for generator 5. -/
def ep_Q2_024_partial_05_0384 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 5. -/
theorem ep_Q2_024_partial_05_0384_valid :
    mulPoly ep_Q2_024_coefficient_05_0384
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0385 : Poly :=
[
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 5. -/
def ep_Q2_024_partial_05_0385 : Poly :=
[
  term ((1081662649697379 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 5. -/
theorem ep_Q2_024_partial_05_0385_valid :
    mulPoly ep_Q2_024_coefficient_05_0385
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0386 : Poly :=
[
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 386 for generator 5. -/
def ep_Q2_024_partial_05_0386 : Poly :=
[
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 5. -/
theorem ep_Q2_024_partial_05_0386_valid :
    mulPoly ep_Q2_024_coefficient_05_0386
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0387 : Poly :=
[
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 387 for generator 5. -/
def ep_Q2_024_partial_05_0387 : Poly :=
[
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 5. -/
theorem ep_Q2_024_partial_05_0387_valid :
    mulPoly ep_Q2_024_coefficient_05_0387
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0388 : Poly :=
[
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 5. -/
def ep_Q2_024_partial_05_0388 : Poly :=
[
  term ((4815941933934353 : Rat) / 4651120884612772) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 5. -/
theorem ep_Q2_024_partial_05_0388_valid :
    mulPoly ep_Q2_024_coefficient_05_0388
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0389 : Poly :=
[
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1)]
]

/-- Partial product 389 for generator 5. -/
def ep_Q2_024_partial_05_0389 : Poly :=
[
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)],
  term ((548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 2)],
  term ((548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 5. -/
theorem ep_Q2_024_partial_05_0389_valid :
    mulPoly ep_Q2_024_coefficient_05_0389
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0390 : Poly :=
[
  term ((-4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 390 for generator 5. -/
def ep_Q2_024_partial_05_0390 : Poly :=
[
  term ((-4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 5. -/
theorem ep_Q2_024_partial_05_0390_valid :
    mulPoly ep_Q2_024_coefficient_05_0390
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0391 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 5. -/
def ep_Q2_024_partial_05_0391 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 5. -/
theorem ep_Q2_024_partial_05_0391_valid :
    mulPoly ep_Q2_024_coefficient_05_0391
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0392 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 392 for generator 5. -/
def ep_Q2_024_partial_05_0392 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 5. -/
theorem ep_Q2_024_partial_05_0392_valid :
    mulPoly ep_Q2_024_coefficient_05_0392
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0393 : Poly :=
[
  term ((221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 393 for generator 5. -/
def ep_Q2_024_partial_05_0393 : Poly :=
[
  term ((221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((-221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 5. -/
theorem ep_Q2_024_partial_05_0393_valid :
    mulPoly ep_Q2_024_coefficient_05_0393
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0394 : Poly :=
[
  term ((-69124106904144 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 394 for generator 5. -/
def ep_Q2_024_partial_05_0394 : Poly :=
[
  term ((-69124106904144 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-69124106904144 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((69124106904144 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((69124106904144 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 5. -/
theorem ep_Q2_024_partial_05_0394_valid :
    mulPoly ep_Q2_024_coefficient_05_0394
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0395 : Poly :=
[
  term ((180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 395 for generator 5. -/
def ep_Q2_024_partial_05_0395 : Poly :=
[
  term ((180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 5. -/
theorem ep_Q2_024_partial_05_0395_valid :
    mulPoly ep_Q2_024_coefficient_05_0395
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0396 : Poly :=
[
  term ((-32424553965926659 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 5. -/
def ep_Q2_024_partial_05_0396 : Poly :=
[
  term ((-32424553965926659 : Rat) / 6976681326919158) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32424553965926659 : Rat) / 6976681326919158) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32424553965926659 : Rat) / 6976681326919158) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((32424553965926659 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 5. -/
theorem ep_Q2_024_partial_05_0396_valid :
    mulPoly ep_Q2_024_coefficient_05_0396
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0397 : Poly :=
[
  term ((1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2)]
]

/-- Partial product 397 for generator 5. -/
def ep_Q2_024_partial_05_0397 : Poly :=
[
  term ((1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (13, 2)],
  term ((1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)],
  term ((-1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2), (14, 2)],
  term ((-1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 5. -/
theorem ep_Q2_024_partial_05_0397_valid :
    mulPoly ep_Q2_024_coefficient_05_0397
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0398 : Poly :=
[
  term ((1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1)]
]

/-- Partial product 398 for generator 5. -/
def ep_Q2_024_partial_05_0398 : Poly :=
[
  term ((1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (8, 1), (14, 1)],
  term ((1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (8, 1), (14, 1)],
  term ((-1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1), (15, 2)],
  term ((-1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 5. -/
theorem ep_Q2_024_partial_05_0398_valid :
    mulPoly ep_Q2_024_coefficient_05_0398
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0399 : Poly :=
[
  term ((864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (15, 2)]
]

/-- Partial product 399 for generator 5. -/
def ep_Q2_024_partial_05_0399 : Poly :=
[
  term ((864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (15, 2)],
  term ((864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (15, 2)],
  term ((-864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (14, 2), (15, 2)],
  term ((-864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 5. -/
theorem ep_Q2_024_partial_05_0399_valid :
    mulPoly ep_Q2_024_coefficient_05_0399
        ep_Q2_024_generator_05_0300_0399 =
      ep_Q2_024_partial_05_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_05_0300_0399 : List Poly :=
[
  ep_Q2_024_partial_05_0300,
  ep_Q2_024_partial_05_0301,
  ep_Q2_024_partial_05_0302,
  ep_Q2_024_partial_05_0303,
  ep_Q2_024_partial_05_0304,
  ep_Q2_024_partial_05_0305,
  ep_Q2_024_partial_05_0306,
  ep_Q2_024_partial_05_0307,
  ep_Q2_024_partial_05_0308,
  ep_Q2_024_partial_05_0309,
  ep_Q2_024_partial_05_0310,
  ep_Q2_024_partial_05_0311,
  ep_Q2_024_partial_05_0312,
  ep_Q2_024_partial_05_0313,
  ep_Q2_024_partial_05_0314,
  ep_Q2_024_partial_05_0315,
  ep_Q2_024_partial_05_0316,
  ep_Q2_024_partial_05_0317,
  ep_Q2_024_partial_05_0318,
  ep_Q2_024_partial_05_0319,
  ep_Q2_024_partial_05_0320,
  ep_Q2_024_partial_05_0321,
  ep_Q2_024_partial_05_0322,
  ep_Q2_024_partial_05_0323,
  ep_Q2_024_partial_05_0324,
  ep_Q2_024_partial_05_0325,
  ep_Q2_024_partial_05_0326,
  ep_Q2_024_partial_05_0327,
  ep_Q2_024_partial_05_0328,
  ep_Q2_024_partial_05_0329,
  ep_Q2_024_partial_05_0330,
  ep_Q2_024_partial_05_0331,
  ep_Q2_024_partial_05_0332,
  ep_Q2_024_partial_05_0333,
  ep_Q2_024_partial_05_0334,
  ep_Q2_024_partial_05_0335,
  ep_Q2_024_partial_05_0336,
  ep_Q2_024_partial_05_0337,
  ep_Q2_024_partial_05_0338,
  ep_Q2_024_partial_05_0339,
  ep_Q2_024_partial_05_0340,
  ep_Q2_024_partial_05_0341,
  ep_Q2_024_partial_05_0342,
  ep_Q2_024_partial_05_0343,
  ep_Q2_024_partial_05_0344,
  ep_Q2_024_partial_05_0345,
  ep_Q2_024_partial_05_0346,
  ep_Q2_024_partial_05_0347,
  ep_Q2_024_partial_05_0348,
  ep_Q2_024_partial_05_0349,
  ep_Q2_024_partial_05_0350,
  ep_Q2_024_partial_05_0351,
  ep_Q2_024_partial_05_0352,
  ep_Q2_024_partial_05_0353,
  ep_Q2_024_partial_05_0354,
  ep_Q2_024_partial_05_0355,
  ep_Q2_024_partial_05_0356,
  ep_Q2_024_partial_05_0357,
  ep_Q2_024_partial_05_0358,
  ep_Q2_024_partial_05_0359,
  ep_Q2_024_partial_05_0360,
  ep_Q2_024_partial_05_0361,
  ep_Q2_024_partial_05_0362,
  ep_Q2_024_partial_05_0363,
  ep_Q2_024_partial_05_0364,
  ep_Q2_024_partial_05_0365,
  ep_Q2_024_partial_05_0366,
  ep_Q2_024_partial_05_0367,
  ep_Q2_024_partial_05_0368,
  ep_Q2_024_partial_05_0369,
  ep_Q2_024_partial_05_0370,
  ep_Q2_024_partial_05_0371,
  ep_Q2_024_partial_05_0372,
  ep_Q2_024_partial_05_0373,
  ep_Q2_024_partial_05_0374,
  ep_Q2_024_partial_05_0375,
  ep_Q2_024_partial_05_0376,
  ep_Q2_024_partial_05_0377,
  ep_Q2_024_partial_05_0378,
  ep_Q2_024_partial_05_0379,
  ep_Q2_024_partial_05_0380,
  ep_Q2_024_partial_05_0381,
  ep_Q2_024_partial_05_0382,
  ep_Q2_024_partial_05_0383,
  ep_Q2_024_partial_05_0384,
  ep_Q2_024_partial_05_0385,
  ep_Q2_024_partial_05_0386,
  ep_Q2_024_partial_05_0387,
  ep_Q2_024_partial_05_0388,
  ep_Q2_024_partial_05_0389,
  ep_Q2_024_partial_05_0390,
  ep_Q2_024_partial_05_0391,
  ep_Q2_024_partial_05_0392,
  ep_Q2_024_partial_05_0393,
  ep_Q2_024_partial_05_0394,
  ep_Q2_024_partial_05_0395,
  ep_Q2_024_partial_05_0396,
  ep_Q2_024_partial_05_0397,
  ep_Q2_024_partial_05_0398,
  ep_Q2_024_partial_05_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_05_0300_0399 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (9, 2), (11, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (9, 3)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (11, 1)],
  term ((32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3024938416541954 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (13, 1)],
  term ((293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((324063331475366 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (15, 1)],
  term ((2099695728793444 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (7, 1), (9, 1)],
  term ((1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 2)],
  term ((-97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-3310291618026951 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 2), (13, 1)],
  term ((-6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 3)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (11, 1)],
  term ((489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((3567371984676116 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-11289707851805915 : Rat) / 2325560442306386) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (13, 1)],
  term ((158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 2)],
  term ((-45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((1939984377328187 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 3)],
  term ((-8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2330355049337645 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (14, 2), (15, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (7, 1), (15, 1)],
  term ((3998471135601491 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (15, 3)],
  term ((2364631218389772 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(2, 2), (8, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-6441657106601453 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 2)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1)],
  term ((-4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((-69124106904144 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-32424553965926659 : Rat) / 6976681326919158) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (13, 2)],
  term ((1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (8, 1), (14, 1)],
  term ((864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (15, 2)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (9, 2), (11, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-11761952876044204 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (9, 3)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (11, 1)],
  term ((32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3024938416541954 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (13, 1)],
  term ((293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((324063331475366 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (15, 1)],
  term ((2099695728793444 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)],
  term ((398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (9, 1)],
  term ((1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1687313560550815 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 2)],
  term ((-97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-3310291618026951 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 2), (13, 1)],
  term ((-6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 3)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (11, 1)],
  term ((489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((3567371984676116 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-11289707851805915 : Rat) / 2325560442306386) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (13, 1)],
  term ((158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 2)],
  term ((-45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((1939984377328187 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 3)],
  term ((-8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2330355049337645 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (7, 1), (15, 1)],
  term ((3998471135601491 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (15, 3)],
  term ((2364631218389772 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(3, 2), (8, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-6441657106601453 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 2)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)],
  term ((-4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((-69124106904144 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-32424553965926659 : Rat) / 6976681326919158) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)],
  term ((1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (8, 1), (14, 1)],
  term ((864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (15, 2)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (14, 2)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (15, 3)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 2)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (15, 3)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 2)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (15, 2)],
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 2)],
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (15, 2)],
  term ((-32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-32417828217271974032195428195694168056 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((3024938416541954 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3447715145226764962511848103359926024475752114607045351 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (15, 3)],
  term ((3024938416541954 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1), (14, 2)],
  term ((-293894111502919707654400147160330680 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (13, 1), (14, 3)],
  term ((20658363293024892364928499919073245948 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1), (15, 2)],
  term ((8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 1), (15, 3)],
  term ((-324063331475366 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 2), (15, 1)],
  term ((-2099695728793444 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((8397679290628399423966441301698010281899925889293671473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 3), (15, 1)],
  term ((-324063331475366 : Rat) / 1162780221153193) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((2038474988055170981815414088325387370992300140802903839 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (15, 3)],
  term ((-2099695728793444 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 3)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (14, 2)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (15, 2)],
  term ((-398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (14, 2)],
  term ((-398917757964415352839085752122273342538 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-403878313230235197254966473524654407444 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 3)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1204345022072612518622315362045003281694 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 4)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((52808480708298509676994520068864343003684363210416047067 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 2)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (14, 2)],
  term ((-179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((3310291618026951 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((97432701592663441401471007407098879825 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (14, 3)],
  term ((7921073155884175586155296842218593961978 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (15, 2)],
  term ((-179642746780363376849260884860567332344631019243846277541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (15, 4)],
  term ((3310291618026951 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((6557404159786237131029412361767799622784447661334664499 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 3)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (15, 2)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 2)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (15, 2)],
  term ((-107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-107666389357418485640225692905473866448 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((-489047064295200002846747815760585431292 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 4)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 3)],
  term ((6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3567371984676116 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((11289707851805915 : Rat) / 2325560442306386) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6599159348015124201981479266950461743814689445916853127 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-3567371984676116 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((98215868793152504608839313585380026831547687689591060149 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (15, 3)],
  term ((11289707851805915 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 3)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 2)],
  term ((135625742353168679810550133850992932315113782529334068321 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1939984377328187 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-158082325898387996017882292757415563049 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 3)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 4)],
  term ((-312460554694482227782397533767703123139 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (15, 2)],
  term ((45238594339169959789058379943284837572104660732572275499 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (13, 1), (15, 4)],
  term ((-1939984377328187 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-63954012192817815823720487960527262763486263904054593537 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 3)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (15, 2)],
  term ((8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 1), (15, 3)],
  term ((2330355049337645 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (14, 2), (15, 1)],
  term ((-3998471135601491 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((28031555607967354362731448631345756209876956599624474 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (14, 2), (15, 3)],
  term ((-3303305881304584 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((8570206160396419760520875914535474965818601703263309323 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 3), (15, 1)],
  term ((2330355049337645 : Rat) / 1162780221153193) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 4), (15, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(7, 1), (14, 4), (15, 1), (16, 1)],
  term ((-639023484125349318887636188995846025275331125347893403123 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (15, 3)],
  term ((-3998471135601491 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)],
  term ((4193875308067876026913014004063982252380262837976758621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 5)],
  term ((-2364631218389772 : Rat) / 1162780221153193) [(7, 1), (15, 5), (16, 1)],
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-257368998670685897680281069161844734384 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((6441657106601453 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6680089488790710918262533039811155453343194160387597677 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (15, 3)],
  term ((6441657106601453 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (14, 2)],
  term ((271113958817366138934175714680420897596 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (15, 2)],
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (15, 3)],
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4627269999197548761009004411733786169389025583560923477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 2)],
  term ((-221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((69124106904144 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (15, 2)],
  term ((-221751605349741308977422478980834192606517596978439804 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (15, 4)],
  term ((69124106904144 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((32424553965926659 : Rat) / 6976681326919158) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-180776766574094998827642747217538365170965369745554585507 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 3)],
  term ((32424553965926659 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2), (14, 2)],
  term ((-1911900429711575576299832164866984304714 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2), (15, 2)],
  term ((-1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1), (15, 2)],
  term ((277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(8, 1), (14, 2)],
  term ((-864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (14, 2), (15, 2)],
  term ((-1043870646441516196762981722932362957651 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 3)],
  term ((277571743458860765889160466422078755389 : Rat) / 719825674441486377940016116817723560794) [(8, 1), (15, 2)],
  term ((-864041433991141632747625901041267921794733484367484334783 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 399. -/
theorem ep_Q2_024_block_05_0300_0399_valid :
    checkProductSumEq ep_Q2_024_partials_05_0300_0399
      ep_Q2_024_block_05_0300_0399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
