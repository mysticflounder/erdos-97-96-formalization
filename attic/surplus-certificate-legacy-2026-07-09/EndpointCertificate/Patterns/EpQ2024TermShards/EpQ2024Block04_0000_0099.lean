/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 4:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_04_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0000 : Poly :=
[
  term ((-1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) []
]

/-- Partial product 0 for generator 4. -/
def ep_Q2_024_partial_04_0000 : Poly :=
[
  term ((-1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(2, 2)],
  term ((-1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(3, 2)],
  term ((1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(10, 2)],
  term ((1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem ep_Q2_024_partial_04_0000_valid :
    mulPoly ep_Q2_024_coefficient_04_0000
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0001 : Poly :=
[
  term ((-2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1)]
]

/-- Partial product 1 for generator 4. -/
def ep_Q2_024_partial_04_0001 : Poly :=
[
  term ((-2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2)],
  term ((-2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2)],
  term ((2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 2)],
  term ((2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem ep_Q2_024_partial_04_0001_valid :
    mulPoly ep_Q2_024_coefficient_04_0001
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0002 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 4. -/
def ep_Q2_024_partial_04_0002 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem ep_Q2_024_partial_04_0002_valid :
    mulPoly ep_Q2_024_coefficient_04_0002
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0003 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 4. -/
def ep_Q2_024_partial_04_0003 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem ep_Q2_024_partial_04_0003_valid :
    mulPoly ep_Q2_024_coefficient_04_0003
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0004 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 4. -/
def ep_Q2_024_partial_04_0004 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem ep_Q2_024_partial_04_0004_valid :
    mulPoly ep_Q2_024_coefficient_04_0004
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0005 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 4. -/
def ep_Q2_024_partial_04_0005 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem ep_Q2_024_partial_04_0005_valid :
    mulPoly ep_Q2_024_coefficient_04_0005
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0006 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1)]
]

/-- Partial product 6 for generator 4. -/
def ep_Q2_024_partial_04_0006 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (10, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (11, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem ep_Q2_024_partial_04_0006_valid :
    mulPoly ep_Q2_024_coefficient_04_0006
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0007 : Poly :=
[
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 7 for generator 4. -/
def ep_Q2_024_partial_04_0007 : Poly :=
[
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem ep_Q2_024_partial_04_0007_valid :
    mulPoly ep_Q2_024_coefficient_04_0007
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0008 : Poly :=
[
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 8 for generator 4. -/
def ep_Q2_024_partial_04_0008 : Poly :=
[
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem ep_Q2_024_partial_04_0008_valid :
    mulPoly ep_Q2_024_coefficient_04_0008
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0009 : Poly :=
[
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 9 for generator 4. -/
def ep_Q2_024_partial_04_0009 : Poly :=
[
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem ep_Q2_024_partial_04_0009_valid :
    mulPoly ep_Q2_024_coefficient_04_0009
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0010 : Poly :=
[
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 4. -/
def ep_Q2_024_partial_04_0010 : Poly :=
[
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem ep_Q2_024_partial_04_0010_valid :
    mulPoly ep_Q2_024_coefficient_04_0010
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0011 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1)]
]

/-- Partial product 11 for generator 4. -/
def ep_Q2_024_partial_04_0011 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (4, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (4, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (10, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem ep_Q2_024_partial_04_0011_valid :
    mulPoly ep_Q2_024_coefficient_04_0011
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0012 : Poly :=
[
  term ((-63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 12 for generator 4. -/
def ep_Q2_024_partial_04_0012 : Poly :=
[
  term ((-63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((-63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem ep_Q2_024_partial_04_0012_valid :
    mulPoly ep_Q2_024_coefficient_04_0012
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0013 : Poly :=
[
  term ((-52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 13 for generator 4. -/
def ep_Q2_024_partial_04_0013 : Poly :=
[
  term ((-52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem ep_Q2_024_partial_04_0013_valid :
    mulPoly ep_Q2_024_coefficient_04_0013
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0014 : Poly :=
[
  term ((-118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 14 for generator 4. -/
def ep_Q2_024_partial_04_0014 : Poly :=
[
  term ((-118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem ep_Q2_024_partial_04_0014_valid :
    mulPoly ep_Q2_024_coefficient_04_0014
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0015 : Poly :=
[
  term ((1763419003148316 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 4. -/
def ep_Q2_024_partial_04_0015 : Poly :=
[
  term ((1763419003148316 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1763419003148316 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1763419003148316 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1763419003148316 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem ep_Q2_024_partial_04_0015_valid :
    mulPoly ep_Q2_024_coefficient_04_0015
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0016 : Poly :=
[
  term ((-159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 16 for generator 4. -/
def ep_Q2_024_partial_04_0016 : Poly :=
[
  term ((-159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem ep_Q2_024_partial_04_0016_valid :
    mulPoly ep_Q2_024_coefficient_04_0016
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0017 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 17 for generator 4. -/
def ep_Q2_024_partial_04_0017 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem ep_Q2_024_partial_04_0017_valid :
    mulPoly ep_Q2_024_coefficient_04_0017
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0018 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 18 for generator 4. -/
def ep_Q2_024_partial_04_0018 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem ep_Q2_024_partial_04_0018_valid :
    mulPoly ep_Q2_024_coefficient_04_0018
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0019 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 4. -/
def ep_Q2_024_partial_04_0019 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem ep_Q2_024_partial_04_0019_valid :
    mulPoly ep_Q2_024_coefficient_04_0019
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0020 : Poly :=
[
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 20 for generator 4. -/
def ep_Q2_024_partial_04_0020 : Poly :=
[
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem ep_Q2_024_partial_04_0020_valid :
    mulPoly ep_Q2_024_coefficient_04_0020
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0021 : Poly :=
[
  term ((-2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 21 for generator 4. -/
def ep_Q2_024_partial_04_0021 : Poly :=
[
  term ((-2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem ep_Q2_024_partial_04_0021_valid :
    mulPoly ep_Q2_024_coefficient_04_0021
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0022 : Poly :=
[
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 4. -/
def ep_Q2_024_partial_04_0022 : Poly :=
[
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-811034815721058 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-811034815721058 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem ep_Q2_024_partial_04_0022_valid :
    mulPoly ep_Q2_024_coefficient_04_0022
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0023 : Poly :=
[
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1)]
]

/-- Partial product 23 for generator 4. -/
def ep_Q2_024_partial_04_0023 : Poly :=
[
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (8, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (8, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem ep_Q2_024_partial_04_0023_valid :
    mulPoly ep_Q2_024_coefficient_04_0023
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0024 : Poly :=
[
  term ((585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 24 for generator 4. -/
def ep_Q2_024_partial_04_0024 : Poly :=
[
  term ((585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem ep_Q2_024_partial_04_0024_valid :
    mulPoly ep_Q2_024_coefficient_04_0024
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0025 : Poly :=
[
  term ((-200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 25 for generator 4. -/
def ep_Q2_024_partial_04_0025 : Poly :=
[
  term ((-200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem ep_Q2_024_partial_04_0025_valid :
    mulPoly ep_Q2_024_coefficient_04_0025
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0026 : Poly :=
[
  term ((7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 4. -/
def ep_Q2_024_partial_04_0026 : Poly :=
[
  term ((7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem ep_Q2_024_partial_04_0026_valid :
    mulPoly ep_Q2_024_coefficient_04_0026
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0027 : Poly :=
[
  term ((-1946094459131597 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 4. -/
def ep_Q2_024_partial_04_0027 : Poly :=
[
  term ((-1946094459131597 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1946094459131597 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1946094459131597 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1946094459131597 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem ep_Q2_024_partial_04_0027_valid :
    mulPoly ep_Q2_024_coefficient_04_0027
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0028 : Poly :=
[
  term ((-124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 28 for generator 4. -/
def ep_Q2_024_partial_04_0028 : Poly :=
[
  term ((-124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem ep_Q2_024_partial_04_0028_valid :
    mulPoly ep_Q2_024_coefficient_04_0028
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0029 : Poly :=
[
  term ((487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 29 for generator 4. -/
def ep_Q2_024_partial_04_0029 : Poly :=
[
  term ((487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem ep_Q2_024_partial_04_0029_valid :
    mulPoly ep_Q2_024_coefficient_04_0029
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0030 : Poly :=
[
  term ((-68474925933918023 : Rat) / 6976681326919158) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 4. -/
def ep_Q2_024_partial_04_0030 : Poly :=
[
  term ((-68474925933918023 : Rat) / 6976681326919158) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-68474925933918023 : Rat) / 6976681326919158) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((68474925933918023 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((68474925933918023 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem ep_Q2_024_partial_04_0030_valid :
    mulPoly ep_Q2_024_coefficient_04_0030
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0031 : Poly :=
[
  term ((-3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)]
]

/-- Partial product 31 for generator 4. -/
def ep_Q2_024_partial_04_0031 : Poly :=
[
  term ((-3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 2)],
  term ((-3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 2)],
  term ((3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 2)],
  term ((3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem ep_Q2_024_partial_04_0031_valid :
    mulPoly ep_Q2_024_coefficient_04_0031
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0032 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 32 for generator 4. -/
def ep_Q2_024_partial_04_0032 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem ep_Q2_024_partial_04_0032_valid :
    mulPoly ep_Q2_024_coefficient_04_0032
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0033 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 33 for generator 4. -/
def ep_Q2_024_partial_04_0033 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem ep_Q2_024_partial_04_0033_valid :
    mulPoly ep_Q2_024_coefficient_04_0033
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0034 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 4. -/
def ep_Q2_024_partial_04_0034 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem ep_Q2_024_partial_04_0034_valid :
    mulPoly ep_Q2_024_coefficient_04_0034
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0035 : Poly :=
[
  term ((57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 35 for generator 4. -/
def ep_Q2_024_partial_04_0035 : Poly :=
[
  term ((57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem ep_Q2_024_partial_04_0035_valid :
    mulPoly ep_Q2_024_coefficient_04_0035
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0036 : Poly :=
[
  term ((18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 4. -/
def ep_Q2_024_partial_04_0036 : Poly :=
[
  term ((18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem ep_Q2_024_partial_04_0036_valid :
    mulPoly ep_Q2_024_coefficient_04_0036
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0037 : Poly :=
[
  term ((-23115768549494651 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 4. -/
def ep_Q2_024_partial_04_0037 : Poly :=
[
  term ((-23115768549494651 : Rat) / 4651120884612772) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23115768549494651 : Rat) / 4651120884612772) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((23115768549494651 : Rat) / 4651120884612772) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((23115768549494651 : Rat) / 4651120884612772) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem ep_Q2_024_partial_04_0037_valid :
    mulPoly ep_Q2_024_coefficient_04_0037
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0038 : Poly :=
[
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1)]
]

/-- Partial product 38 for generator 4. -/
def ep_Q2_024_partial_04_0038 : Poly :=
[
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (12, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem ep_Q2_024_partial_04_0038_valid :
    mulPoly ep_Q2_024_coefficient_04_0038
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0039 : Poly :=
[
  term ((-31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 4. -/
def ep_Q2_024_partial_04_0039 : Poly :=
[
  term ((-31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem ep_Q2_024_partial_04_0039_valid :
    mulPoly ep_Q2_024_coefficient_04_0039
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0040 : Poly :=
[
  term ((11484534391609223 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 4. -/
def ep_Q2_024_partial_04_0040 : Poly :=
[
  term ((11484534391609223 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11484534391609223 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11484534391609223 : Rat) / 2325560442306386) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11484534391609223 : Rat) / 2325560442306386) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem ep_Q2_024_partial_04_0040_valid :
    mulPoly ep_Q2_024_coefficient_04_0040
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0041 : Poly :=
[
  term ((700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 41 for generator 4. -/
def ep_Q2_024_partial_04_0041 : Poly :=
[
  term ((700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((-700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (12, 1), (13, 2)],
  term ((-700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem ep_Q2_024_partial_04_0041_valid :
    mulPoly ep_Q2_024_coefficient_04_0041
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0042 : Poly :=
[
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 42 for generator 4. -/
def ep_Q2_024_partial_04_0042 : Poly :=
[
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem ep_Q2_024_partial_04_0042_valid :
    mulPoly ep_Q2_024_coefficient_04_0042
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0043 : Poly :=
[
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 4. -/
def ep_Q2_024_partial_04_0043 : Poly :=
[
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem ep_Q2_024_partial_04_0043_valid :
    mulPoly ep_Q2_024_coefficient_04_0043
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0044 : Poly :=
[
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 4. -/
def ep_Q2_024_partial_04_0044 : Poly :=
[
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem ep_Q2_024_partial_04_0044_valid :
    mulPoly ep_Q2_024_coefficient_04_0044
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0045 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 4. -/
def ep_Q2_024_partial_04_0045 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem ep_Q2_024_partial_04_0045_valid :
    mulPoly ep_Q2_024_coefficient_04_0045
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0046 : Poly :=
[
  term ((233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 46 for generator 4. -/
def ep_Q2_024_partial_04_0046 : Poly :=
[
  term ((233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem ep_Q2_024_partial_04_0046_valid :
    mulPoly ep_Q2_024_coefficient_04_0046
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0047 : Poly :=
[
  term ((136008937313412307 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 4. -/
def ep_Q2_024_partial_04_0047 : Poly :=
[
  term ((136008937313412307 : Rat) / 13953362653838316) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((136008937313412307 : Rat) / 13953362653838316) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136008937313412307 : Rat) / 13953362653838316) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136008937313412307 : Rat) / 13953362653838316) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem ep_Q2_024_partial_04_0047_valid :
    mulPoly ep_Q2_024_coefficient_04_0047
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0048 : Poly :=
[
  term ((1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)]
]

/-- Partial product 48 for generator 4. -/
def ep_Q2_024_partial_04_0048 : Poly :=
[
  term ((1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((-1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (10, 2), (13, 2)],
  term ((-1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem ep_Q2_024_partial_04_0048_valid :
    mulPoly ep_Q2_024_coefficient_04_0048
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0049 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 49 for generator 4. -/
def ep_Q2_024_partial_04_0049 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem ep_Q2_024_partial_04_0049_valid :
    mulPoly ep_Q2_024_coefficient_04_0049
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0050 : Poly :=
[
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (14, 1)]
]

/-- Partial product 50 for generator 4. -/
def ep_Q2_024_partial_04_0050 : Poly :=
[
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (2, 2), (14, 1)],
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (3, 2), (14, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (10, 2), (14, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem ep_Q2_024_partial_04_0050_valid :
    mulPoly ep_Q2_024_coefficient_04_0050
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0051 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 51 for generator 4. -/
def ep_Q2_024_partial_04_0051 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem ep_Q2_024_partial_04_0051_valid :
    mulPoly ep_Q2_024_coefficient_04_0051
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0052 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 4. -/
def ep_Q2_024_partial_04_0052 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem ep_Q2_024_partial_04_0052_valid :
    mulPoly ep_Q2_024_coefficient_04_0052
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0053 : Poly :=
[
  term ((-43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (15, 2)]
]

/-- Partial product 53 for generator 4. -/
def ep_Q2_024_partial_04_0053 : Poly :=
[
  term ((-43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (2, 2), (15, 2)],
  term ((-43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (3, 2), (15, 2)],
  term ((43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 2), (15, 2)],
  term ((43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem ep_Q2_024_partial_04_0053_valid :
    mulPoly ep_Q2_024_coefficient_04_0053
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0054 : Poly :=
[
  term ((2665716342382343 : Rat) / 1162780221153193) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 4. -/
def ep_Q2_024_partial_04_0054 : Poly :=
[
  term ((2665716342382343 : Rat) / 1162780221153193) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((2665716342382343 : Rat) / 1162780221153193) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-2665716342382343 : Rat) / 1162780221153193) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2665716342382343 : Rat) / 1162780221153193) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem ep_Q2_024_partial_04_0054_valid :
    mulPoly ep_Q2_024_coefficient_04_0054
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0055 : Poly :=
[
  term ((14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 55 for generator 4. -/
def ep_Q2_024_partial_04_0055 : Poly :=
[
  term ((-14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((-14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 3)],
  term ((14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem ep_Q2_024_partial_04_0055_valid :
    mulPoly ep_Q2_024_coefficient_04_0055
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0056 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 56 for generator 4. -/
def ep_Q2_024_partial_04_0056 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem ep_Q2_024_partial_04_0056_valid :
    mulPoly ep_Q2_024_coefficient_04_0056
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0057 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 57 for generator 4. -/
def ep_Q2_024_partial_04_0057 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem ep_Q2_024_partial_04_0057_valid :
    mulPoly ep_Q2_024_coefficient_04_0057
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0058 : Poly :=
[
  term ((4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 58 for generator 4. -/
def ep_Q2_024_partial_04_0058 : Poly :=
[
  term ((4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem ep_Q2_024_partial_04_0058_valid :
    mulPoly ep_Q2_024_coefficient_04_0058
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0059 : Poly :=
[
  term ((-31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 59 for generator 4. -/
def ep_Q2_024_partial_04_0059 : Poly :=
[
  term ((-31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (10, 2), (12, 1), (13, 1)],
  term ((31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1)],
  term ((-31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem ep_Q2_024_partial_04_0059_valid :
    mulPoly ep_Q2_024_coefficient_04_0059
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0060 : Poly :=
[
  term ((10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 60 for generator 4. -/
def ep_Q2_024_partial_04_0060 : Poly :=
[
  term ((10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((-10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((-10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem ep_Q2_024_partial_04_0060_valid :
    mulPoly ep_Q2_024_coefficient_04_0060
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0061 : Poly :=
[
  term ((-679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 4. -/
def ep_Q2_024_partial_04_0061 : Poly :=
[
  term ((-679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 4. -/
theorem ep_Q2_024_partial_04_0061_valid :
    mulPoly ep_Q2_024_coefficient_04_0061
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0062 : Poly :=
[
  term ((3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 62 for generator 4. -/
def ep_Q2_024_partial_04_0062 : Poly :=
[
  term ((3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((-3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 4. -/
theorem ep_Q2_024_partial_04_0062_valid :
    mulPoly ep_Q2_024_coefficient_04_0062
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0063 : Poly :=
[
  term ((-132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 63 for generator 4. -/
def ep_Q2_024_partial_04_0063 : Poly :=
[
  term ((-132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 4. -/
theorem ep_Q2_024_partial_04_0063_valid :
    mulPoly ep_Q2_024_coefficient_04_0063
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0064 : Poly :=
[
  term ((6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 4. -/
def ep_Q2_024_partial_04_0064 : Poly :=
[
  term ((6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 4. -/
theorem ep_Q2_024_partial_04_0064_valid :
    mulPoly ep_Q2_024_coefficient_04_0064
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0065 : Poly :=
[
  term ((-2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1)]
]

/-- Partial product 65 for generator 4. -/
def ep_Q2_024_partial_04_0065 : Poly :=
[
  term ((-2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 2), (3, 1)],
  term ((2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (10, 2)],
  term ((2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (11, 2)],
  term ((-2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 4. -/
theorem ep_Q2_024_partial_04_0065_valid :
    mulPoly ep_Q2_024_coefficient_04_0065
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0066 : Poly :=
[
  term ((-10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 66 for generator 4. -/
def ep_Q2_024_partial_04_0066 : Poly :=
[
  term ((-10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (10, 2)],
  term ((10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 4. -/
theorem ep_Q2_024_partial_04_0066_valid :
    mulPoly ep_Q2_024_coefficient_04_0066
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0067 : Poly :=
[
  term ((-629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 67 for generator 4. -/
def ep_Q2_024_partial_04_0067 : Poly :=
[
  term ((-629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 2)],
  term ((629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2)],
  term ((-629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 4. -/
theorem ep_Q2_024_partial_04_0067_valid :
    mulPoly ep_Q2_024_coefficient_04_0067
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0068 : Poly :=
[
  term ((-792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 68 for generator 4. -/
def ep_Q2_024_partial_04_0068 : Poly :=
[
  term ((-792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (10, 2), (13, 1)],
  term ((792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1)],
  term ((-792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 4. -/
theorem ep_Q2_024_partial_04_0068_valid :
    mulPoly ep_Q2_024_coefficient_04_0068
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0069 : Poly :=
[
  term ((4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 69 for generator 4. -/
def ep_Q2_024_partial_04_0069 : Poly :=
[
  term ((4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)],
  term ((-4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 4. -/
theorem ep_Q2_024_partial_04_0069_valid :
    mulPoly ep_Q2_024_coefficient_04_0069
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0070 : Poly :=
[
  term ((17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 4. -/
def ep_Q2_024_partial_04_0070 : Poly :=
[
  term ((17563184661734624 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 4. -/
theorem ep_Q2_024_partial_04_0070_valid :
    mulPoly ep_Q2_024_coefficient_04_0070
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0071 : Poly :=
[
  term ((5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 71 for generator 4. -/
def ep_Q2_024_partial_04_0071 : Poly :=
[
  term ((5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((-5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (10, 2)],
  term ((-5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 4. -/
theorem ep_Q2_024_partial_04_0071_valid :
    mulPoly ep_Q2_024_coefficient_04_0071
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0072 : Poly :=
[
  term ((-1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 72 for generator 4. -/
def ep_Q2_024_partial_04_0072 : Poly :=
[
  term ((-1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (10, 2), (13, 1)],
  term ((1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 4. -/
theorem ep_Q2_024_partial_04_0072_valid :
    mulPoly ep_Q2_024_coefficient_04_0072
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0073 : Poly :=
[
  term ((35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 73 for generator 4. -/
def ep_Q2_024_partial_04_0073 : Poly :=
[
  term ((35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)],
  term ((-35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 4. -/
theorem ep_Q2_024_partial_04_0073_valid :
    mulPoly ep_Q2_024_coefficient_04_0073
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0074 : Poly :=
[
  term ((-11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 4. -/
def ep_Q2_024_partial_04_0074 : Poly :=
[
  term ((-11587400483973254 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 4. -/
theorem ep_Q2_024_partial_04_0074_valid :
    mulPoly ep_Q2_024_coefficient_04_0074
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0075 : Poly :=
[
  term ((-978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 75 for generator 4. -/
def ep_Q2_024_partial_04_0075 : Poly :=
[
  term ((-978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (10, 2)],
  term ((978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (11, 2)],
  term ((-978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 4. -/
theorem ep_Q2_024_partial_04_0075_valid :
    mulPoly ep_Q2_024_coefficient_04_0075
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0076 : Poly :=
[
  term ((629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 76 for generator 4. -/
def ep_Q2_024_partial_04_0076 : Poly :=
[
  term ((629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (12, 1)],
  term ((-629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 4. -/
theorem ep_Q2_024_partial_04_0076_valid :
    mulPoly ep_Q2_024_coefficient_04_0076
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0077 : Poly :=
[
  term ((-77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 77 for generator 4. -/
def ep_Q2_024_partial_04_0077 : Poly :=
[
  term ((-77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 4. -/
theorem ep_Q2_024_partial_04_0077_valid :
    mulPoly ep_Q2_024_coefficient_04_0077
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0078 : Poly :=
[
  term ((1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 78 for generator 4. -/
def ep_Q2_024_partial_04_0078 : Poly :=
[
  term ((1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((-1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2)],
  term ((-1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 4. -/
theorem ep_Q2_024_partial_04_0078_valid :
    mulPoly ep_Q2_024_coefficient_04_0078
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0079 : Poly :=
[
  term ((-3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 4. -/
def ep_Q2_024_partial_04_0079 : Poly :=
[
  term ((-3690475370921024 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 4. -/
theorem ep_Q2_024_partial_04_0079_valid :
    mulPoly ep_Q2_024_coefficient_04_0079
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0080 : Poly :=
[
  term ((77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 4. -/
def ep_Q2_024_partial_04_0080 : Poly :=
[
  term ((77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((-77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)],
  term ((-77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 4. -/
theorem ep_Q2_024_partial_04_0080_valid :
    mulPoly ep_Q2_024_coefficient_04_0080
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0081 : Poly :=
[
  term ((4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 4. -/
def ep_Q2_024_partial_04_0081 : Poly :=
[
  term ((4004914258786135 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 4. -/
theorem ep_Q2_024_partial_04_0081_valid :
    mulPoly ep_Q2_024_coefficient_04_0081
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0082 : Poly :=
[
  term ((-961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 82 for generator 4. -/
def ep_Q2_024_partial_04_0082 : Poly :=
[
  term ((-961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (10, 2), (13, 2)],
  term ((961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (11, 2), (13, 2)],
  term ((-961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 4. -/
theorem ep_Q2_024_partial_04_0082_valid :
    mulPoly ep_Q2_024_coefficient_04_0082
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0083 : Poly :=
[
  term ((4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 83 for generator 4. -/
def ep_Q2_024_partial_04_0083 : Poly :=
[
  term ((4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((-4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 4. -/
theorem ep_Q2_024_partial_04_0083_valid :
    mulPoly ep_Q2_024_coefficient_04_0083
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0084 : Poly :=
[
  term ((-861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 84 for generator 4. -/
def ep_Q2_024_partial_04_0084 : Poly :=
[
  term ((-861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (10, 2), (15, 2)],
  term ((861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 4. -/
theorem ep_Q2_024_partial_04_0084_valid :
    mulPoly ep_Q2_024_coefficient_04_0084
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0085 : Poly :=
[
  term ((2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 4. -/
def ep_Q2_024_partial_04_0085 : Poly :=
[
  term ((2223911285130401 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 4. -/
theorem ep_Q2_024_partial_04_0085_valid :
    mulPoly ep_Q2_024_coefficient_04_0085
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0086 : Poly :=
[
  term ((7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 86 for generator 4. -/
def ep_Q2_024_partial_04_0086 : Poly :=
[
  term ((7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((-7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((-7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 4. -/
theorem ep_Q2_024_partial_04_0086_valid :
    mulPoly ep_Q2_024_coefficient_04_0086
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0087 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 87 for generator 4. -/
def ep_Q2_024_partial_04_0087 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 4. -/
theorem ep_Q2_024_partial_04_0087_valid :
    mulPoly ep_Q2_024_coefficient_04_0087
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0088 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 88 for generator 4. -/
def ep_Q2_024_partial_04_0088 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 4. -/
theorem ep_Q2_024_partial_04_0088_valid :
    mulPoly ep_Q2_024_coefficient_04_0088
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0089 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 4. -/
def ep_Q2_024_partial_04_0089 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 4. -/
theorem ep_Q2_024_partial_04_0089_valid :
    mulPoly ep_Q2_024_coefficient_04_0089
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0090 : Poly :=
[
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 90 for generator 4. -/
def ep_Q2_024_partial_04_0090 : Poly :=
[
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (10, 2), (13, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 4. -/
theorem ep_Q2_024_partial_04_0090_valid :
    mulPoly ep_Q2_024_coefficient_04_0090
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0091 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 91 for generator 4. -/
def ep_Q2_024_partial_04_0091 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 4. -/
theorem ep_Q2_024_partial_04_0091_valid :
    mulPoly ep_Q2_024_coefficient_04_0091
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0092 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 92 for generator 4. -/
def ep_Q2_024_partial_04_0092 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (10, 2), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 4. -/
theorem ep_Q2_024_partial_04_0092_valid :
    mulPoly ep_Q2_024_coefficient_04_0092
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0093 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 4. -/
def ep_Q2_024_partial_04_0093 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 4. -/
theorem ep_Q2_024_partial_04_0093_valid :
    mulPoly ep_Q2_024_coefficient_04_0093
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0094 : Poly :=
[
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 94 for generator 4. -/
def ep_Q2_024_partial_04_0094 : Poly :=
[
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 4. -/
theorem ep_Q2_024_partial_04_0094_valid :
    mulPoly ep_Q2_024_coefficient_04_0094
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0095 : Poly :=
[
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 4. -/
def ep_Q2_024_partial_04_0095 : Poly :=
[
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 4. -/
theorem ep_Q2_024_partial_04_0095_valid :
    mulPoly ep_Q2_024_coefficient_04_0095
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0096 : Poly :=
[
  term ((-9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)]
]

/-- Partial product 96 for generator 4. -/
def ep_Q2_024_partial_04_0096 : Poly :=
[
  term ((-9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (5, 1)],
  term ((-9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (5, 1)],
  term ((9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 2)],
  term ((9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 4. -/
theorem ep_Q2_024_partial_04_0096_valid :
    mulPoly ep_Q2_024_coefficient_04_0096
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0097 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 97 for generator 4. -/
def ep_Q2_024_partial_04_0097 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 4. -/
theorem ep_Q2_024_partial_04_0097_valid :
    mulPoly ep_Q2_024_coefficient_04_0097
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0098 : Poly :=
[
  term ((268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 98 for generator 4. -/
def ep_Q2_024_partial_04_0098 : Poly :=
[
  term ((268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((-268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 4. -/
theorem ep_Q2_024_partial_04_0098_valid :
    mulPoly ep_Q2_024_coefficient_04_0098
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0099 : Poly :=
[
  term ((-12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 99 for generator 4. -/
def ep_Q2_024_partial_04_0099 : Poly :=
[
  term ((-12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((-12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 4. -/
theorem ep_Q2_024_partial_04_0099_valid :
    mulPoly ep_Q2_024_coefficient_04_0099
        ep_Q2_024_generator_04_0000_0099 =
      ep_Q2_024_partial_04_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_04_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_04_0000,
  ep_Q2_024_partial_04_0001,
  ep_Q2_024_partial_04_0002,
  ep_Q2_024_partial_04_0003,
  ep_Q2_024_partial_04_0004,
  ep_Q2_024_partial_04_0005,
  ep_Q2_024_partial_04_0006,
  ep_Q2_024_partial_04_0007,
  ep_Q2_024_partial_04_0008,
  ep_Q2_024_partial_04_0009,
  ep_Q2_024_partial_04_0010,
  ep_Q2_024_partial_04_0011,
  ep_Q2_024_partial_04_0012,
  ep_Q2_024_partial_04_0013,
  ep_Q2_024_partial_04_0014,
  ep_Q2_024_partial_04_0015,
  ep_Q2_024_partial_04_0016,
  ep_Q2_024_partial_04_0017,
  ep_Q2_024_partial_04_0018,
  ep_Q2_024_partial_04_0019,
  ep_Q2_024_partial_04_0020,
  ep_Q2_024_partial_04_0021,
  ep_Q2_024_partial_04_0022,
  ep_Q2_024_partial_04_0023,
  ep_Q2_024_partial_04_0024,
  ep_Q2_024_partial_04_0025,
  ep_Q2_024_partial_04_0026,
  ep_Q2_024_partial_04_0027,
  ep_Q2_024_partial_04_0028,
  ep_Q2_024_partial_04_0029,
  ep_Q2_024_partial_04_0030,
  ep_Q2_024_partial_04_0031,
  ep_Q2_024_partial_04_0032,
  ep_Q2_024_partial_04_0033,
  ep_Q2_024_partial_04_0034,
  ep_Q2_024_partial_04_0035,
  ep_Q2_024_partial_04_0036,
  ep_Q2_024_partial_04_0037,
  ep_Q2_024_partial_04_0038,
  ep_Q2_024_partial_04_0039,
  ep_Q2_024_partial_04_0040,
  ep_Q2_024_partial_04_0041,
  ep_Q2_024_partial_04_0042,
  ep_Q2_024_partial_04_0043,
  ep_Q2_024_partial_04_0044,
  ep_Q2_024_partial_04_0045,
  ep_Q2_024_partial_04_0046,
  ep_Q2_024_partial_04_0047,
  ep_Q2_024_partial_04_0048,
  ep_Q2_024_partial_04_0049,
  ep_Q2_024_partial_04_0050,
  ep_Q2_024_partial_04_0051,
  ep_Q2_024_partial_04_0052,
  ep_Q2_024_partial_04_0053,
  ep_Q2_024_partial_04_0054,
  ep_Q2_024_partial_04_0055,
  ep_Q2_024_partial_04_0056,
  ep_Q2_024_partial_04_0057,
  ep_Q2_024_partial_04_0058,
  ep_Q2_024_partial_04_0059,
  ep_Q2_024_partial_04_0060,
  ep_Q2_024_partial_04_0061,
  ep_Q2_024_partial_04_0062,
  ep_Q2_024_partial_04_0063,
  ep_Q2_024_partial_04_0064,
  ep_Q2_024_partial_04_0065,
  ep_Q2_024_partial_04_0066,
  ep_Q2_024_partial_04_0067,
  ep_Q2_024_partial_04_0068,
  ep_Q2_024_partial_04_0069,
  ep_Q2_024_partial_04_0070,
  ep_Q2_024_partial_04_0071,
  ep_Q2_024_partial_04_0072,
  ep_Q2_024_partial_04_0073,
  ep_Q2_024_partial_04_0074,
  ep_Q2_024_partial_04_0075,
  ep_Q2_024_partial_04_0076,
  ep_Q2_024_partial_04_0077,
  ep_Q2_024_partial_04_0078,
  ep_Q2_024_partial_04_0079,
  ep_Q2_024_partial_04_0080,
  ep_Q2_024_partial_04_0081,
  ep_Q2_024_partial_04_0082,
  ep_Q2_024_partial_04_0083,
  ep_Q2_024_partial_04_0084,
  ep_Q2_024_partial_04_0085,
  ep_Q2_024_partial_04_0086,
  ep_Q2_024_partial_04_0087,
  ep_Q2_024_partial_04_0088,
  ep_Q2_024_partial_04_0089,
  ep_Q2_024_partial_04_0090,
  ep_Q2_024_partial_04_0091,
  ep_Q2_024_partial_04_0092,
  ep_Q2_024_partial_04_0093,
  ep_Q2_024_partial_04_0094,
  ep_Q2_024_partial_04_0095,
  ep_Q2_024_partial_04_0096,
  ep_Q2_024_partial_04_0097,
  ep_Q2_024_partial_04_0098,
  ep_Q2_024_partial_04_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_04_0000_0099 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (10, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (11, 2)],
  term ((-2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (4, 1)],
  term ((-63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((-52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((1763419003148316 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (8, 1)],
  term ((585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1946094459131597 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-68474925933918023 : Rat) / 6976681326919158) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-23115768549494651 : Rat) / 4651120884612772) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1)],
  term ((-31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((11484534391609223 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((136008937313412307 : Rat) / 13953362653838316) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (2, 2), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (2, 2), (15, 2)],
  term ((2665716342382343 : Rat) / 1162780221153193) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 3)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1), (11, 2)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (4, 1)],
  term ((-63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((-52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((1763419003148316 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((811034815721058 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (8, 1)],
  term ((585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1946094459131597 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-68474925933918023 : Rat) / 6976681326919158) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-23115768549494651 : Rat) / 4651120884612772) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1)],
  term ((-31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((11484534391609223 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((136008937313412307 : Rat) / 13953362653838316) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (3, 2), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (3, 2), (15, 2)],
  term ((2665716342382343 : Rat) / 1162780221153193) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 3), (9, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 3), (13, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 3), (15, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (10, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 2)],
  term ((63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((63334953698865241648177019451741942386 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-1763419003148316 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((52078508101395949313368251005350893404 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((118569898787200417822576322626046413198570731740112243 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1763419003148316 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((159455355208485949056292448438260724942 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-811034815721058 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-39363083243963301564042488751437326858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((2845084345638072043843014584360927576289820445443120858 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-811034815721058 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 2)],
  term ((-585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((1946094459131597 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((68474925933918023 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((200237401804764580441737701438292683636 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-7461668663987364544383567110853958039879449914504814021 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1946094459131597 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((124768839668460870047873872195787909816 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-487104718630773289144289720502087971056171000706323117679 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((68474925933918023 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-585061099779946236864321078346731804812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 3)],
  term ((3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 2)],
  term ((3924711935171974118357090677782292148488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 2)],
  term ((2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((23115768549494651 : Rat) / 4651120884612772) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (12, 1)],
  term ((31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11484534391609223 : Rat) / 2325560442306386) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (12, 1), (13, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-136008937313412307 : Rat) / 13953362653838316) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (10, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (13, 2), (14, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (10, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 2), (15, 2)],
  term ((-2665716342382343 : Rat) / 1162780221153193) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((2962350993454090012565587681879741989367 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (12, 1)],
  term ((31954208961859985846555667386259383121528255933831488633 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11484534391609223 : Rat) / 2325560442306386) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-700480268529906731626877381917101666238 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (12, 1), (13, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233063290261949395698413885386462340745983521720500097767 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-136008937313412307 : Rat) / 13953362653838316) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1404915886346724296160336600561395218774 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (11, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (13, 2), (14, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (11, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((43326142563856538120275389606470555303574389699844240907 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (11, 2), (15, 2)],
  term ((-2665716342382343 : Rat) / 1162780221153193) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 3), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-57814161914182430892857097567141763682 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 3), (13, 1)],
  term ((-18317039431375270388451574530495162786883025334876750787 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 3), (15, 1)],
  term ((23115768549494651 : Rat) / 4651120884612772) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((-14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((-679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 3)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (10, 2), (12, 1), (13, 1)],
  term ((-10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1)],
  term ((-10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 2), (3, 1)],
  term ((-10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((-792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((17563184661734624 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((-1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-11587400483973254 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((-3690475370921024 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((4004914258786135 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((2223911285130401 : Rat) / 3488340663459579) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (4, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (5, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1)],
  term ((268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((-12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((14983812037645007098259012883901005560 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 3), (3, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (5, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (7, 1)],
  term ((4676518873066696539664060124390867877392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (9, 1)],
  term ((-31740894851489356254672682766813396156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (12, 1), (13, 1)],
  term ((10336930775685362827552642001605561822785303535892223847 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 3), (12, 1), (15, 1)],
  term ((-679225441375957 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((3908454000272958674453703814284622139864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 3), (13, 1)],
  term ((-132578733610427318393902996892842542029295981893677999327 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 3), (15, 1)],
  term ((6538169368720007 : Rat) / 6976681326919158) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (10, 2)],
  term ((10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 2)],
  term ((629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2)],
  term ((792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (10, 2), (13, 1)],
  term ((-4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)],
  term ((-17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1)],
  term ((-4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (10, 2)],
  term ((-5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (10, 2), (13, 1)],
  term ((-35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)],
  term ((11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1)],
  term ((-35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (10, 2)],
  term ((978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (11, 2)],
  term ((2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (10, 2)],
  term ((-629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (12, 1)],
  term ((77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2)],
  term ((3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (10, 2), (13, 2)],
  term ((-4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (10, 2), (15, 2)],
  term ((-2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (11, 2)],
  term ((-629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (11, 2), (13, 2)],
  term ((-4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((5625452497643948 : Rat) / 1162780221153193) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (5, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1)],
  term ((268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((-2542305383547081319176040733713086734611 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 3)],
  term ((-10255522321497778895957378207304592318556 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (4, 1)],
  term ((-629973834226672171188929270684272186408 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (9, 1)],
  term ((-792165018149146360275024141900470369168 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (13, 1)],
  term ((4225276947071191825568926029421474707533419116418241912 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((17563184661734624 : Rat) / 3488340663459579) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)],
  term ((5784432949051675283312758667058079324048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (8, 1)],
  term ((-1254821782137841510986097651138428820928 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (9, 1), (13, 1)],
  term ((35573567576581364647669002408438594600518348091717569321 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((-11587400483973254 : Rat) / 3488340663459579) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)],
  term ((-978244248890284168135229730941356526368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (9, 2)],
  term ((629651730431132386054468363647243155006 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (12, 1)],
  term ((-77639172380608229838209443359056841568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)],
  term ((1391219315325832607986644719479387448945168865543742816 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 3), (12, 1), (15, 2)],
  term ((-3690475370921024 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)],
  term ((77063408475821631915840499800344200289803413181889884039 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((4004914258786135 : Rat) / 3488340663459579) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)],
  term ((-961102594165990279145024527812911951812 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (13, 2)],
  term ((4127954100094806561061254939500692070899 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3), (14, 1)],
  term ((-861713286930621508015602859273763796298372471356971868467 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 3), (15, 2)],
  term ((2223911285130401 : Rat) / 3488340663459579) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((-7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((-7936355199797196552457713128843332983548 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (10, 2), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (10, 2), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (11, 2), (12, 1), (13, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-19175911641765942668946118011013940304 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (11, 2), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((46297346902676175640402165826134159087885762653346004147 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-5625452497643948 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((-268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((-268781301535006815710028773202159563936 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((12919977442407561211720794466568435806793070235852966304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 3)],
  term ((9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 2)],
  term ((9449327528679987937233790561147244543392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (11, 2)],
  term ((-1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(2, 2)],
  term ((-1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(3, 2)],
  term ((1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(10, 2)],
  term ((1532125646274334371412129445309154101189 : Rat) / 1799564186103715944850040292044308901985) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 99. -/
theorem ep_Q2_024_block_04_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_04_0000_0099
      ep_Q2_024_block_04_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
