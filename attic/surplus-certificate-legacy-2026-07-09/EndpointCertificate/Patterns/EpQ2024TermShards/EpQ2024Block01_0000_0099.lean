/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 1:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_01_0000_0099 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0000 : Poly :=
[
  term ((-64817896860443942518314385851622112348 : Rat) / 599854728701238648283346764014769633995) []
]

/-- Partial product 0 for generator 1. -/
def ep_Q2_024_partial_01_0000 : Poly :=
[
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)],
  term ((64817896860443942518314385851622112348 : Rat) / 599854728701238648283346764014769633995) [(6, 2)],
  term ((64817896860443942518314385851622112348 : Rat) / 599854728701238648283346764014769633995) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 1. -/
theorem ep_Q2_024_partial_01_0000_valid :
    mulPoly ep_Q2_024_coefficient_01_0000
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0001 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1 for generator 1. -/
def ep_Q2_024_partial_01_0001 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (7, 2), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 1. -/
theorem ep_Q2_024_partial_01_0001_valid :
    mulPoly ep_Q2_024_coefficient_01_0001
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0002 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 2 for generator 1. -/
def ep_Q2_024_partial_01_0002 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 1. -/
theorem ep_Q2_024_partial_01_0002_valid :
    mulPoly ep_Q2_024_coefficient_01_0002
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0003 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 1. -/
def ep_Q2_024_partial_01_0003 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 1. -/
theorem ep_Q2_024_partial_01_0003_valid :
    mulPoly ep_Q2_024_coefficient_01_0003
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0004 : Poly :=
[
  term ((3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 4 for generator 1. -/
def ep_Q2_024_partial_01_0004 : Poly :=
[
  term ((6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 1. -/
theorem ep_Q2_024_partial_01_0004_valid :
    mulPoly ep_Q2_024_coefficient_01_0004
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0005 : Poly :=
[
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 1. -/
def ep_Q2_024_partial_01_0005 : Poly :=
[
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 1. -/
theorem ep_Q2_024_partial_01_0005_valid :
    mulPoly ep_Q2_024_coefficient_01_0005
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0006 : Poly :=
[
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 1. -/
def ep_Q2_024_partial_01_0006 : Poly :=
[
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 1. -/
theorem ep_Q2_024_partial_01_0006_valid :
    mulPoly ep_Q2_024_coefficient_01_0006
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0007 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 7 for generator 1. -/
def ep_Q2_024_partial_01_0007 : Poly :=
[
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 2), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (7, 2), (9, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 1. -/
theorem ep_Q2_024_partial_01_0007_valid :
    mulPoly ep_Q2_024_coefficient_01_0007
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0008 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 8 for generator 1. -/
def ep_Q2_024_partial_01_0008 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 1. -/
theorem ep_Q2_024_partial_01_0008_valid :
    mulPoly ep_Q2_024_coefficient_01_0008
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0009 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 1. -/
def ep_Q2_024_partial_01_0009 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 1. -/
theorem ep_Q2_024_partial_01_0009_valid :
    mulPoly ep_Q2_024_coefficient_01_0009
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0010 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 1. -/
def ep_Q2_024_partial_01_0010 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 1. -/
theorem ep_Q2_024_partial_01_0010_valid :
    mulPoly ep_Q2_024_coefficient_01_0010
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0011 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 11 for generator 1. -/
def ep_Q2_024_partial_01_0011 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 3), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 1. -/
theorem ep_Q2_024_partial_01_0011_valid :
    mulPoly ep_Q2_024_coefficient_01_0011
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0012 : Poly :=
[
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 12 for generator 1. -/
def ep_Q2_024_partial_01_0012 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 3), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 1. -/
theorem ep_Q2_024_partial_01_0012_valid :
    mulPoly ep_Q2_024_coefficient_01_0012
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0013 : Poly :=
[
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 13 for generator 1. -/
def ep_Q2_024_partial_01_0013 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 3), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 1. -/
theorem ep_Q2_024_partial_01_0013_valid :
    mulPoly ep_Q2_024_coefficient_01_0013
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0014 : Poly :=
[
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 1. -/
def ep_Q2_024_partial_01_0014 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 1. -/
theorem ep_Q2_024_partial_01_0014_valid :
    mulPoly ep_Q2_024_coefficient_01_0014
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0015 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 15 for generator 1. -/
def ep_Q2_024_partial_01_0015 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 1. -/
theorem ep_Q2_024_partial_01_0015_valid :
    mulPoly ep_Q2_024_coefficient_01_0015
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0016 : Poly :=
[
  term ((-215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 16 for generator 1. -/
def ep_Q2_024_partial_01_0016 : Poly :=
[
  term ((-430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 1. -/
theorem ep_Q2_024_partial_01_0016_valid :
    mulPoly ep_Q2_024_coefficient_01_0016
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0017 : Poly :=
[
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 17 for generator 1. -/
def ep_Q2_024_partial_01_0017 : Poly :=
[
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 1. -/
theorem ep_Q2_024_partial_01_0017_valid :
    mulPoly ep_Q2_024_coefficient_01_0017
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0018 : Poly :=
[
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 1. -/
def ep_Q2_024_partial_01_0018 : Poly :=
[
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 1. -/
theorem ep_Q2_024_partial_01_0018_valid :
    mulPoly ep_Q2_024_coefficient_01_0018
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0019 : Poly :=
[
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2)]
]

/-- Partial product 19 for generator 1. -/
def ep_Q2_024_partial_01_0019 : Poly :=
[
  term ((93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 2)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 2)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 2)],
  term ((93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 1. -/
theorem ep_Q2_024_partial_01_0019_valid :
    mulPoly ep_Q2_024_coefficient_01_0019
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0020 : Poly :=
[
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 20 for generator 1. -/
def ep_Q2_024_partial_01_0020 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 1. -/
theorem ep_Q2_024_partial_01_0020_valid :
    mulPoly ep_Q2_024_coefficient_01_0020
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0021 : Poly :=
[
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 21 for generator 1. -/
def ep_Q2_024_partial_01_0021 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 1. -/
theorem ep_Q2_024_partial_01_0021_valid :
    mulPoly ep_Q2_024_coefficient_01_0021
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0022 : Poly :=
[
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 1. -/
def ep_Q2_024_partial_01_0022 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 1. -/
theorem ep_Q2_024_partial_01_0022_valid :
    mulPoly ep_Q2_024_coefficient_01_0022
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0023 : Poly :=
[
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 1. -/
def ep_Q2_024_partial_01_0023 : Poly :=
[
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 1. -/
theorem ep_Q2_024_partial_01_0023_valid :
    mulPoly ep_Q2_024_coefficient_01_0023
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0024 : Poly :=
[
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 1. -/
def ep_Q2_024_partial_01_0024 : Poly :=
[
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 1. -/
theorem ep_Q2_024_partial_01_0024_valid :
    mulPoly ep_Q2_024_coefficient_01_0024
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0025 : Poly :=
[
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (13, 2)]
]

/-- Partial product 25 for generator 1. -/
def ep_Q2_024_partial_01_0025 : Poly :=
[
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (13, 2)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (13, 2)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 1. -/
theorem ep_Q2_024_partial_01_0025_valid :
    mulPoly ep_Q2_024_coefficient_01_0025
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0026 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (15, 2)]
]

/-- Partial product 26 for generator 1. -/
def ep_Q2_024_partial_01_0026 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 2), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 1. -/
theorem ep_Q2_024_partial_01_0026_valid :
    mulPoly ep_Q2_024_coefficient_01_0026
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0027 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 27 for generator 1. -/
def ep_Q2_024_partial_01_0027 : Poly :=
[
  term ((-19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-19703340389129022 : Rat) / 1162780221153193) [(0, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 1. -/
theorem ep_Q2_024_partial_01_0027_valid :
    mulPoly ep_Q2_024_coefficient_01_0027
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0028 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 28 for generator 1. -/
def ep_Q2_024_partial_01_0028 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 1. -/
theorem ep_Q2_024_partial_01_0028_valid :
    mulPoly ep_Q2_024_coefficient_01_0028
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0029 : Poly :=
[
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1)]
]

/-- Partial product 29 for generator 1. -/
def ep_Q2_024_partial_01_0029 : Poly :=
[
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (6, 2)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (7, 2)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 1. -/
theorem ep_Q2_024_partial_01_0029_valid :
    mulPoly ep_Q2_024_coefficient_01_0029
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0030 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 30 for generator 1. -/
def ep_Q2_024_partial_01_0030 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (6, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (7, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 1. -/
theorem ep_Q2_024_partial_01_0030_valid :
    mulPoly ep_Q2_024_coefficient_01_0030
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0031 : Poly :=
[
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 31 for generator 1. -/
def ep_Q2_024_partial_01_0031 : Poly :=
[
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 2), (9, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 2), (9, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 1. -/
theorem ep_Q2_024_partial_01_0031_valid :
    mulPoly ep_Q2_024_coefficient_01_0031
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0032 : Poly :=
[
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 32 for generator 1. -/
def ep_Q2_024_partial_01_0032 : Poly :=
[
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 2), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 2), (13, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 1. -/
theorem ep_Q2_024_partial_01_0032_valid :
    mulPoly ep_Q2_024_coefficient_01_0032
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0033 : Poly :=
[
  term ((4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 33 for generator 1. -/
def ep_Q2_024_partial_01_0033 : Poly :=
[
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 1. -/
theorem ep_Q2_024_partial_01_0033_valid :
    mulPoly ep_Q2_024_coefficient_01_0033
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0034 : Poly :=
[
  term ((2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 1. -/
def ep_Q2_024_partial_01_0034 : Poly :=
[
  term ((4039885317228608 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 1. -/
theorem ep_Q2_024_partial_01_0034_valid :
    mulPoly ep_Q2_024_coefficient_01_0034
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0035 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 35 for generator 1. -/
def ep_Q2_024_partial_01_0035 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (6, 1), (8, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 2), (8, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 1. -/
theorem ep_Q2_024_partial_01_0035_valid :
    mulPoly ep_Q2_024_coefficient_01_0035
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0036 : Poly :=
[
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 36 for generator 1. -/
def ep_Q2_024_partial_01_0036 : Poly :=
[
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (9, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (9, 1), (13, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 1. -/
theorem ep_Q2_024_partial_01_0036_valid :
    mulPoly ep_Q2_024_coefficient_01_0036
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0037 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 37 for generator 1. -/
def ep_Q2_024_partial_01_0037 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 1. -/
theorem ep_Q2_024_partial_01_0037_valid :
    mulPoly ep_Q2_024_coefficient_01_0037
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0038 : Poly :=
[
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 1. -/
def ep_Q2_024_partial_01_0038 : Poly :=
[
  term ((9718464922042084 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 1. -/
theorem ep_Q2_024_partial_01_0038_valid :
    mulPoly ep_Q2_024_coefficient_01_0038
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0039 : Poly :=
[
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 39 for generator 1. -/
def ep_Q2_024_partial_01_0039 : Poly :=
[
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 2)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (9, 2)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (9, 2)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 1. -/
theorem ep_Q2_024_partial_01_0039_valid :
    mulPoly ep_Q2_024_coefficient_01_0039
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0040 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 40 for generator 1. -/
def ep_Q2_024_partial_01_0040 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 1. -/
theorem ep_Q2_024_partial_01_0040_valid :
    mulPoly ep_Q2_024_coefficient_01_0040
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0041 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 41 for generator 1. -/
def ep_Q2_024_partial_01_0041 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 1. -/
theorem ep_Q2_024_partial_01_0041_valid :
    mulPoly ep_Q2_024_coefficient_01_0041
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0042 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 42 for generator 1. -/
def ep_Q2_024_partial_01_0042 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (6, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 1. -/
theorem ep_Q2_024_partial_01_0042_valid :
    mulPoly ep_Q2_024_coefficient_01_0042
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0043 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 1. -/
def ep_Q2_024_partial_01_0043 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 1. -/
theorem ep_Q2_024_partial_01_0043_valid :
    mulPoly ep_Q2_024_coefficient_01_0043
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0044 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 44 for generator 1. -/
def ep_Q2_024_partial_01_0044 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 1. -/
theorem ep_Q2_024_partial_01_0044_valid :
    mulPoly ep_Q2_024_coefficient_01_0044
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0045 : Poly :=
[
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 1. -/
def ep_Q2_024_partial_01_0045 : Poly :=
[
  term ((-9285325420604210 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 1. -/
theorem ep_Q2_024_partial_01_0045_valid :
    mulPoly ep_Q2_024_coefficient_01_0045
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0046 : Poly :=
[
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 46 for generator 1. -/
def ep_Q2_024_partial_01_0046 : Poly :=
[
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (6, 2), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (7, 2), (13, 2)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 1. -/
theorem ep_Q2_024_partial_01_0046_valid :
    mulPoly ep_Q2_024_coefficient_01_0046
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0047 : Poly :=
[
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 47 for generator 1. -/
def ep_Q2_024_partial_01_0047 : Poly :=
[
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 1. -/
theorem ep_Q2_024_partial_01_0047_valid :
    mulPoly ep_Q2_024_coefficient_01_0047
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0048 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 48 for generator 1. -/
def ep_Q2_024_partial_01_0048 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (6, 2), (15, 2)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (7, 2), (15, 2)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 1. -/
theorem ep_Q2_024_partial_01_0048_valid :
    mulPoly ep_Q2_024_coefficient_01_0048
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0049 : Poly :=
[
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 1. -/
def ep_Q2_024_partial_01_0049 : Poly :=
[
  term ((8133929093983298 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 1. -/
theorem ep_Q2_024_partial_01_0049_valid :
    mulPoly ep_Q2_024_coefficient_01_0049
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0050 : Poly :=
[
  term ((121687859351459219218308011459800030528 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 50 for generator 1. -/
def ep_Q2_024_partial_01_0050 : Poly :=
[
  term ((243375718702918438436616022919600061056 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((243375718702918438436616022919600061056 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-121687859351459219218308011459800030528 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((-121687859351459219218308011459800030528 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 1. -/
theorem ep_Q2_024_partial_01_0050_valid :
    mulPoly ep_Q2_024_coefficient_01_0050
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0051 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 51 for generator 1. -/
def ep_Q2_024_partial_01_0051 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 1. -/
theorem ep_Q2_024_partial_01_0051_valid :
    mulPoly ep_Q2_024_coefficient_01_0051
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0052 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 52 for generator 1. -/
def ep_Q2_024_partial_01_0052 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 2), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 1. -/
theorem ep_Q2_024_partial_01_0052_valid :
    mulPoly ep_Q2_024_coefficient_01_0052
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0053 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 53 for generator 1. -/
def ep_Q2_024_partial_01_0053 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 1. -/
theorem ep_Q2_024_partial_01_0053_valid :
    mulPoly ep_Q2_024_coefficient_01_0053
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0054 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 1. -/
def ep_Q2_024_partial_01_0054 : Poly :=
[
  term ((-2606770083157932 : Rat) / 1162780221153193) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 1. -/
theorem ep_Q2_024_partial_01_0054_valid :
    mulPoly ep_Q2_024_coefficient_01_0054
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0055 : Poly :=
[
  term ((-4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 55 for generator 1. -/
def ep_Q2_024_partial_01_0055 : Poly :=
[
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 1. -/
theorem ep_Q2_024_partial_01_0055_valid :
    mulPoly ep_Q2_024_coefficient_01_0055
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0056 : Poly :=
[
  term ((-70347408301588376659270670124713779079841599155269701883 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 56 for generator 1. -/
def ep_Q2_024_partial_01_0056 : Poly :=
[
  term ((-70347408301588376659270670124713779079841599155269701883 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-70347408301588376659270670124713779079841599155269701883 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((70347408301588376659270670124713779079841599155269701883 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((70347408301588376659270670124713779079841599155269701883 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 1. -/
theorem ep_Q2_024_partial_01_0056_valid :
    mulPoly ep_Q2_024_coefficient_01_0056
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0057 : Poly :=
[
  term ((29914930724491025 : Rat) / 3488340663459579) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 1. -/
def ep_Q2_024_partial_01_0057 : Poly :=
[
  term ((59829861448982050 : Rat) / 3488340663459579) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((59829861448982050 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 1. -/
theorem ep_Q2_024_partial_01_0057_valid :
    mulPoly ep_Q2_024_coefficient_01_0057
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0058 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2)]
]

/-- Partial product 58 for generator 1. -/
def ep_Q2_024_partial_01_0058 : Poly :=
[
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (6, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 1. -/
theorem ep_Q2_024_partial_01_0058_valid :
    mulPoly ep_Q2_024_coefficient_01_0058
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0059 : Poly :=
[
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 59 for generator 1. -/
def ep_Q2_024_partial_01_0059 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 1. -/
theorem ep_Q2_024_partial_01_0059_valid :
    mulPoly ep_Q2_024_coefficient_01_0059
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0060 : Poly :=
[
  term ((-336828034831294770874975467126816070728603462080692484 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 60 for generator 1. -/
def ep_Q2_024_partial_01_0060 : Poly :=
[
  term ((-673656069662589541749950934253632141457206924161384968 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-673656069662589541749950934253632141457206924161384968 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((336828034831294770874975467126816070728603462080692484 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((336828034831294770874975467126816070728603462080692484 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 1. -/
theorem ep_Q2_024_partial_01_0060_valid :
    mulPoly ep_Q2_024_coefficient_01_0060
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0061 : Poly :=
[
  term ((673691331644400 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 1. -/
def ep_Q2_024_partial_01_0061 : Poly :=
[
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 1. -/
theorem ep_Q2_024_partial_01_0061_valid :
    mulPoly ep_Q2_024_coefficient_01_0061
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0062 : Poly :=
[
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 62 for generator 1. -/
def ep_Q2_024_partial_01_0062 : Poly :=
[
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 1. -/
theorem ep_Q2_024_partial_01_0062_valid :
    mulPoly ep_Q2_024_coefficient_01_0062
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0063 : Poly :=
[
  term ((576139354762197049083184606140680193682820877597527170 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 63 for generator 1. -/
def ep_Q2_024_partial_01_0063 : Poly :=
[
  term ((1152278709524394098166369212281360387365641755195054340 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((1152278709524394098166369212281360387365641755195054340 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-576139354762197049083184606140680193682820877597527170 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((-576139354762197049083184606140680193682820877597527170 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 1. -/
theorem ep_Q2_024_partial_01_0063_valid :
    mulPoly ep_Q2_024_coefficient_01_0063
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0064 : Poly :=
[
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 1. -/
def ep_Q2_024_partial_01_0064 : Poly :=
[
  term ((-673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 1. -/
theorem ep_Q2_024_partial_01_0064_valid :
    mulPoly ep_Q2_024_coefficient_01_0064
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0065 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 65 for generator 1. -/
def ep_Q2_024_partial_01_0065 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 1. -/
theorem ep_Q2_024_partial_01_0065_valid :
    mulPoly ep_Q2_024_coefficient_01_0065
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0066 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 66 for generator 1. -/
def ep_Q2_024_partial_01_0066 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 1. -/
theorem ep_Q2_024_partial_01_0066_valid :
    mulPoly ep_Q2_024_coefficient_01_0066
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0067 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 1. -/
def ep_Q2_024_partial_01_0067 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 1. -/
theorem ep_Q2_024_partial_01_0067_valid :
    mulPoly ep_Q2_024_coefficient_01_0067
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0068 : Poly :=
[
  term ((2466577711590288194077705759651839240512 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 68 for generator 1. -/
def ep_Q2_024_partial_01_0068 : Poly :=
[
  term ((4933155423180576388155411519303678481024 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((4933155423180576388155411519303678481024 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2466577711590288194077705759651839240512 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-2466577711590288194077705759651839240512 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 1. -/
theorem ep_Q2_024_partial_01_0068_valid :
    mulPoly ep_Q2_024_coefficient_01_0068
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0069 : Poly :=
[
  term ((388092957014915365220536907034346766773656899752789675513 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 69 for generator 1. -/
def ep_Q2_024_partial_01_0069 : Poly :=
[
  term ((388092957014915365220536907034346766773656899752789675513 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((388092957014915365220536907034346766773656899752789675513 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-388092957014915365220536907034346766773656899752789675513 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-388092957014915365220536907034346766773656899752789675513 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 1. -/
theorem ep_Q2_024_partial_01_0069_valid :
    mulPoly ep_Q2_024_coefficient_01_0069
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0070 : Poly :=
[
  term ((72016831223309599 : Rat) / 6976681326919158) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 1. -/
def ep_Q2_024_partial_01_0070 : Poly :=
[
  term ((72016831223309599 : Rat) / 3488340663459579) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 1. -/
theorem ep_Q2_024_partial_01_0070_valid :
    mulPoly ep_Q2_024_coefficient_01_0070
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0071 : Poly :=
[
  term ((-3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2)]
]

/-- Partial product 71 for generator 1. -/
def ep_Q2_024_partial_01_0071 : Poly :=
[
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (9, 2)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 2)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 2)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 1. -/
theorem ep_Q2_024_partial_01_0071_valid :
    mulPoly ep_Q2_024_coefficient_01_0071
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0072 : Poly :=
[
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 72 for generator 1. -/
def ep_Q2_024_partial_01_0072 : Poly :=
[
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 1. -/
theorem ep_Q2_024_partial_01_0072_valid :
    mulPoly ep_Q2_024_coefficient_01_0072
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0073 : Poly :=
[
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 73 for generator 1. -/
def ep_Q2_024_partial_01_0073 : Poly :=
[
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 1. -/
theorem ep_Q2_024_partial_01_0073_valid :
    mulPoly ep_Q2_024_coefficient_01_0073
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0074 : Poly :=
[
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 1. -/
def ep_Q2_024_partial_01_0074 : Poly :=
[
  term ((-673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 1. -/
theorem ep_Q2_024_partial_01_0074_valid :
    mulPoly ep_Q2_024_coefficient_01_0074
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0075 : Poly :=
[
  term ((-1730436445770671173116076540657309416905725241094713299 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 75 for generator 1. -/
def ep_Q2_024_partial_01_0075 : Poly :=
[
  term ((-1730436445770671173116076540657309416905725241094713299 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1730436445770671173116076540657309416905725241094713299 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((1730436445770671173116076540657309416905725241094713299 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((1730436445770671173116076540657309416905725241094713299 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 1. -/
theorem ep_Q2_024_partial_01_0075_valid :
    mulPoly ep_Q2_024_coefficient_01_0075
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0076 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 1. -/
def ep_Q2_024_partial_01_0076 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 1. -/
theorem ep_Q2_024_partial_01_0076_valid :
    mulPoly ep_Q2_024_coefficient_01_0076
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0077 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 77 for generator 1. -/
def ep_Q2_024_partial_01_0077 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (12, 1), (13, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 1. -/
theorem ep_Q2_024_partial_01_0077_valid :
    mulPoly ep_Q2_024_coefficient_01_0077
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0078 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 78 for generator 1. -/
def ep_Q2_024_partial_01_0078 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 2), (12, 1), (15, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 1. -/
theorem ep_Q2_024_partial_01_0078_valid :
    mulPoly ep_Q2_024_coefficient_01_0078
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0079 : Poly :=
[
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 1. -/
def ep_Q2_024_partial_01_0079 : Poly :=
[
  term ((3530759285383524 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 1. -/
theorem ep_Q2_024_partial_01_0079_valid :
    mulPoly ep_Q2_024_coefficient_01_0079
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0080 : Poly :=
[
  term ((-397287409281015101839226113300826552103935345329306962713 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 1. -/
def ep_Q2_024_partial_01_0080 : Poly :=
[
  term ((-397287409281015101839226113300826552103935345329306962713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-397287409281015101839226113300826552103935345329306962713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((397287409281015101839226113300826552103935345329306962713 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((397287409281015101839226113300826552103935345329306962713 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 1. -/
theorem ep_Q2_024_partial_01_0080_valid :
    mulPoly ep_Q2_024_coefficient_01_0080
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0081 : Poly :=
[
  term ((-72016831223309599 : Rat) / 6976681326919158) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 1. -/
def ep_Q2_024_partial_01_0081 : Poly :=
[
  term ((-72016831223309599 : Rat) / 3488340663459579) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((72016831223309599 : Rat) / 6976681326919158) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((72016831223309599 : Rat) / 6976681326919158) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 1. -/
theorem ep_Q2_024_partial_01_0081_valid :
    mulPoly ep_Q2_024_coefficient_01_0081
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0082 : Poly :=
[
  term ((-1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (13, 2)]
]

/-- Partial product 82 for generator 1. -/
def ep_Q2_024_partial_01_0082 : Poly :=
[
  term ((-3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((-3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 2), (13, 2)],
  term ((1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 1. -/
theorem ep_Q2_024_partial_01_0082_valid :
    mulPoly ep_Q2_024_coefficient_01_0082
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0083 : Poly :=
[
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (15, 2)]
]

/-- Partial product 83 for generator 1. -/
def ep_Q2_024_partial_01_0083 : Poly :=
[
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (6, 2), (15, 2)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 1. -/
theorem ep_Q2_024_partial_01_0083_valid :
    mulPoly ep_Q2_024_coefficient_01_0083
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0084 : Poly :=
[
  term ((-4926960257629686 : Rat) / 1162780221153193) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 1. -/
def ep_Q2_024_partial_01_0084 : Poly :=
[
  term ((-9853920515259372 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 1. -/
theorem ep_Q2_024_partial_01_0084_valid :
    mulPoly ep_Q2_024_coefficient_01_0084
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0085 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 85 for generator 1. -/
def ep_Q2_024_partial_01_0085 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (6, 2), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 1. -/
theorem ep_Q2_024_partial_01_0085_valid :
    mulPoly ep_Q2_024_coefficient_01_0085
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0086 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 86 for generator 1. -/
def ep_Q2_024_partial_01_0086 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 1. -/
theorem ep_Q2_024_partial_01_0086_valid :
    mulPoly ep_Q2_024_coefficient_01_0086
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0087 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 87 for generator 1. -/
def ep_Q2_024_partial_01_0087 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 1. -/
theorem ep_Q2_024_partial_01_0087_valid :
    mulPoly ep_Q2_024_coefficient_01_0087
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0088 : Poly :=
[
  term ((-3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1)]
]

/-- Partial product 88 for generator 1. -/
def ep_Q2_024_partial_01_0088 : Poly :=
[
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1), (6, 1)],
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (6, 2)],
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 1. -/
theorem ep_Q2_024_partial_01_0088_valid :
    mulPoly ep_Q2_024_coefficient_01_0088
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0089 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 89 for generator 1. -/
def ep_Q2_024_partial_01_0089 : Poly :=
[
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 1. -/
theorem ep_Q2_024_partial_01_0089_valid :
    mulPoly ep_Q2_024_coefficient_01_0089
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0090 : Poly :=
[
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 90 for generator 1. -/
def ep_Q2_024_partial_01_0090 : Poly :=
[
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 1. -/
theorem ep_Q2_024_partial_01_0090_valid :
    mulPoly ep_Q2_024_coefficient_01_0090
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0091 : Poly :=
[
  term ((4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 91 for generator 1. -/
def ep_Q2_024_partial_01_0091 : Poly :=
[
  term ((9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1)],
  term ((-4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 1. -/
theorem ep_Q2_024_partial_01_0091_valid :
    mulPoly ep_Q2_024_coefficient_01_0091
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0092 : Poly :=
[
  term ((2019942658614304 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 1. -/
def ep_Q2_024_partial_01_0092 : Poly :=
[
  term ((4039885317228608 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 1. -/
theorem ep_Q2_024_partial_01_0092_valid :
    mulPoly ep_Q2_024_coefficient_01_0092
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0093 : Poly :=
[
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 93 for generator 1. -/
def ep_Q2_024_partial_01_0093 : Poly :=
[
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (9, 2)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 1. -/
theorem ep_Q2_024_partial_01_0093_valid :
    mulPoly ep_Q2_024_coefficient_01_0093
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0094 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 94 for generator 1. -/
def ep_Q2_024_partial_01_0094 : Poly :=
[
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 1. -/
theorem ep_Q2_024_partial_01_0094_valid :
    mulPoly ep_Q2_024_coefficient_01_0094
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0095 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 95 for generator 1. -/
def ep_Q2_024_partial_01_0095 : Poly :=
[
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 1. -/
theorem ep_Q2_024_partial_01_0095_valid :
    mulPoly ep_Q2_024_coefficient_01_0095
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0096 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 1. -/
def ep_Q2_024_partial_01_0096 : Poly :=
[
  term ((-6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 1. -/
theorem ep_Q2_024_partial_01_0096_valid :
    mulPoly ep_Q2_024_coefficient_01_0096
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0097 : Poly :=
[
  term ((-46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 97 for generator 1. -/
def ep_Q2_024_partial_01_0097 : Poly :=
[
  term ((-93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)],
  term ((46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 1. -/
theorem ep_Q2_024_partial_01_0097_valid :
    mulPoly ep_Q2_024_coefficient_01_0097
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0098 : Poly :=
[
  term ((1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 98 for generator 1. -/
def ep_Q2_024_partial_01_0098 : Poly :=
[
  term ((3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((-1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 2), (15, 2)],
  term ((-1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 1. -/
theorem ep_Q2_024_partial_01_0098_valid :
    mulPoly ep_Q2_024_coefficient_01_0098
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0099 : Poly :=
[
  term ((1490036832493784 : Rat) / 1162780221153193) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 99 for generator 1. -/
def ep_Q2_024_partial_01_0099 : Poly :=
[
  term ((2980073664987568 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((2980073664987568 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1490036832493784 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1490036832493784 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 1. -/
theorem ep_Q2_024_partial_01_0099_valid :
    mulPoly ep_Q2_024_coefficient_01_0099
        ep_Q2_024_generator_01_0000_0099 =
      ep_Q2_024_partial_01_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_01_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_01_0000,
  ep_Q2_024_partial_01_0001,
  ep_Q2_024_partial_01_0002,
  ep_Q2_024_partial_01_0003,
  ep_Q2_024_partial_01_0004,
  ep_Q2_024_partial_01_0005,
  ep_Q2_024_partial_01_0006,
  ep_Q2_024_partial_01_0007,
  ep_Q2_024_partial_01_0008,
  ep_Q2_024_partial_01_0009,
  ep_Q2_024_partial_01_0010,
  ep_Q2_024_partial_01_0011,
  ep_Q2_024_partial_01_0012,
  ep_Q2_024_partial_01_0013,
  ep_Q2_024_partial_01_0014,
  ep_Q2_024_partial_01_0015,
  ep_Q2_024_partial_01_0016,
  ep_Q2_024_partial_01_0017,
  ep_Q2_024_partial_01_0018,
  ep_Q2_024_partial_01_0019,
  ep_Q2_024_partial_01_0020,
  ep_Q2_024_partial_01_0021,
  ep_Q2_024_partial_01_0022,
  ep_Q2_024_partial_01_0023,
  ep_Q2_024_partial_01_0024,
  ep_Q2_024_partial_01_0025,
  ep_Q2_024_partial_01_0026,
  ep_Q2_024_partial_01_0027,
  ep_Q2_024_partial_01_0028,
  ep_Q2_024_partial_01_0029,
  ep_Q2_024_partial_01_0030,
  ep_Q2_024_partial_01_0031,
  ep_Q2_024_partial_01_0032,
  ep_Q2_024_partial_01_0033,
  ep_Q2_024_partial_01_0034,
  ep_Q2_024_partial_01_0035,
  ep_Q2_024_partial_01_0036,
  ep_Q2_024_partial_01_0037,
  ep_Q2_024_partial_01_0038,
  ep_Q2_024_partial_01_0039,
  ep_Q2_024_partial_01_0040,
  ep_Q2_024_partial_01_0041,
  ep_Q2_024_partial_01_0042,
  ep_Q2_024_partial_01_0043,
  ep_Q2_024_partial_01_0044,
  ep_Q2_024_partial_01_0045,
  ep_Q2_024_partial_01_0046,
  ep_Q2_024_partial_01_0047,
  ep_Q2_024_partial_01_0048,
  ep_Q2_024_partial_01_0049,
  ep_Q2_024_partial_01_0050,
  ep_Q2_024_partial_01_0051,
  ep_Q2_024_partial_01_0052,
  ep_Q2_024_partial_01_0053,
  ep_Q2_024_partial_01_0054,
  ep_Q2_024_partial_01_0055,
  ep_Q2_024_partial_01_0056,
  ep_Q2_024_partial_01_0057,
  ep_Q2_024_partial_01_0058,
  ep_Q2_024_partial_01_0059,
  ep_Q2_024_partial_01_0060,
  ep_Q2_024_partial_01_0061,
  ep_Q2_024_partial_01_0062,
  ep_Q2_024_partial_01_0063,
  ep_Q2_024_partial_01_0064,
  ep_Q2_024_partial_01_0065,
  ep_Q2_024_partial_01_0066,
  ep_Q2_024_partial_01_0067,
  ep_Q2_024_partial_01_0068,
  ep_Q2_024_partial_01_0069,
  ep_Q2_024_partial_01_0070,
  ep_Q2_024_partial_01_0071,
  ep_Q2_024_partial_01_0072,
  ep_Q2_024_partial_01_0073,
  ep_Q2_024_partial_01_0074,
  ep_Q2_024_partial_01_0075,
  ep_Q2_024_partial_01_0076,
  ep_Q2_024_partial_01_0077,
  ep_Q2_024_partial_01_0078,
  ep_Q2_024_partial_01_0079,
  ep_Q2_024_partial_01_0080,
  ep_Q2_024_partial_01_0081,
  ep_Q2_024_partial_01_0082,
  ep_Q2_024_partial_01_0083,
  ep_Q2_024_partial_01_0084,
  ep_Q2_024_partial_01_0085,
  ep_Q2_024_partial_01_0086,
  ep_Q2_024_partial_01_0087,
  ep_Q2_024_partial_01_0088,
  ep_Q2_024_partial_01_0089,
  ep_Q2_024_partial_01_0090,
  ep_Q2_024_partial_01_0091,
  ep_Q2_024_partial_01_0092,
  ep_Q2_024_partial_01_0093,
  ep_Q2_024_partial_01_0094,
  ep_Q2_024_partial_01_0095,
  ep_Q2_024_partial_01_0096,
  ep_Q2_024_partial_01_0097,
  ep_Q2_024_partial_01_0098,
  ep_Q2_024_partial_01_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_01_0000_0099 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (9, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (6, 1), (8, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (1, 1), (3, 1), (6, 1), (13, 2)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2)],
  term ((8133929093983298 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1)],
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 2), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 2), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((243375718702918438436616022919600061056 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(0, 1), (2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-70347408301588376659270670124713779079841599155269701883 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((59829861448982050 : Rat) / 3488340663459579) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-673656069662589541749950934253632141457206924161384968 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((1152278709524394098166369212281360387365641755195054340 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4933155423180576388155411519303678481024 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((388092957014915365220536907034346766773656899752789675513 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((72016831223309599 : Rat) / 3488340663459579) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (9, 2)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1730436445770671173116076540657309416905725241094713299 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (6, 1), (12, 1), (13, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-397287409281015101839226113300826552103935345329306962713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-72016831223309599 : Rat) / 3488340663459579) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-9853920515259372 : Rat) / 1162780221153193) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1), (6, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((2980073664987568 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (7, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3329643110705302812688679841681306650212 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-112925877134122375318482939998583635371844772388621857119 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (6, 2), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (7, 2), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (7, 1), (9, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (9, 2)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 2), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((215163034437195021883807057763171023072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((71468851862135219280772996134182424817310949427353054879 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (9, 2)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72157377400783269951842257442992766033230702678758901343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 2), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 3), (9, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 3), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 3), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((6659286221410605625377359683362613300424 : Rat) / 1799564186103715944850040292044308901985) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((112925877134122375318482939998583635371844772388621857119 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (6, 1), (9, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (6, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-430326068874390043767614115526342046144 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-71468851862135219280772996134182424817310949427353054879 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (9, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((72157377400783269951842257442992766033230702678758901343 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (6, 1), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 2), (6, 1), (15, 2)],
  term ((-19703340389129022 : Rat) / 1162780221153193) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((243375718702918438436616022919600061056 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((-70347408301588376659270670124713779079841599155269701883 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((59829861448982050 : Rat) / 3488340663459579) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((-673656069662589541749950934253632141457206924161384968 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4933155423180576388155411519303678481024 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((388092957014915365220536907034346766773656899752789675513 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7053112859169064948004670416012589500176 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 2)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1730436445770671173116076540657309416905725241094713299 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-397287409281015101839226113300826552103935345329306962713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-72016831223309599 : Rat) / 3488340663459579) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3506438538395687096763046348480623904592 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((1152278709524394098166369212281360387365641755195054340 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (6, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (7, 2)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 2), (9, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 2), (13, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((2980073664987568 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 2), (9, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (7, 2), (13, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (6, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 2), (8, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (9, 1), (13, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (6, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (6, 2), (13, 2)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (6, 2), (15, 2)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (7, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (9, 1), (13, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (7, 2), (13, 2)],
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (7, 2), (15, 2)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (4, 1), (7, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (3, 1), (7, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (8, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (3, 1), (7, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 1), (7, 1), (13, 2)],
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-121687859351459219218308011459800030528 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((70347408301588376659270670124713779079841599155269701883 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-121687859351459219218308011459800030528 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((70347408301588376659270670124713779079841599155269701883 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (6, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 2)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((336828034831294770874975467126816070728603462080692484 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((336828034831294770874975467126816070728603462080692484 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((-673691331644400 : Rat) / 1162780221153193) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-576139354762197049083184606140680193682820877597527170 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(2, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2466577711590288194077705759651839240512 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-388092957014915365220536907034346766773656899752789675513 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (9, 2)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1730436445770671173116076540657309416905725241094713299 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 2), (12, 1), (13, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 2), (12, 1), (15, 2)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((397287409281015101839226113300826552103935345329306962713 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((72016831223309599 : Rat) / 6976681326919158) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 2), (13, 2)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (6, 2), (15, 2)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2466577711590288194077705759651839240512 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-388092957014915365220536907034346766773656899752789675513 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-72016831223309599 : Rat) / 6976681326919158) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3526556429584532474002335208006294750088 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 2)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1730436445770671173116076540657309416905725241094713299 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (12, 1), (13, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (7, 2), (12, 1), (15, 2)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((397287409281015101839226113300826552103935345329306962713 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((72016831223309599 : Rat) / 6976681326919158) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1753219269197843548381523174240311952296 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (7, 2), (13, 2)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (7, 2), (15, 2)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 3), (13, 1)],
  term ((-576139354762197049083184606140680193682820877597527170 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (7, 3), (15, 1)],
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (6, 2), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (7, 2), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (6, 2)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 2), (9, 1), (11, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1)],
  term ((-4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (9, 2)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)],
  term ((-1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 2), (15, 2)],
  term ((-1490036832493784 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (7, 2)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 2), (9, 1), (11, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1)],
  term ((-4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 2), (9, 2)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((-1490036832493784 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((64817896860443942518314385851622112348 : Rat) / 599854728701238648283346764014769633995) [(6, 2)],
  term ((64817896860443942518314385851622112348 : Rat) / 599854728701238648283346764014769633995) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 0 through 99. -/
theorem ep_Q2_024_block_01_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_01_0000_0099
      ep_Q2_024_block_01_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
