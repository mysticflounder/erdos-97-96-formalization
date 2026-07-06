/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 2:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_02_0000_0099 : Poly :=
[
  term (2 : Rat) [(0, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0000 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) []
]

/-- Partial product 0 for generator 2. -/
def ep_Q2_024_partial_02_0000 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(10, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 2. -/
theorem ep_Q2_024_partial_02_0000_valid :
    mulPoly ep_Q2_024_coefficient_02_0000
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0001 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 1 for generator 2. -/
def ep_Q2_024_partial_02_0001 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 2. -/
theorem ep_Q2_024_partial_02_0001_valid :
    mulPoly ep_Q2_024_coefficient_02_0001
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0002 : Poly :=
[
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 2 for generator 2. -/
def ep_Q2_024_partial_02_0002 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 2. -/
theorem ep_Q2_024_partial_02_0002_valid :
    mulPoly ep_Q2_024_coefficient_02_0002
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0003 : Poly :=
[
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 3 for generator 2. -/
def ep_Q2_024_partial_02_0003 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 2. -/
theorem ep_Q2_024_partial_02_0003_valid :
    mulPoly ep_Q2_024_coefficient_02_0003
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0004 : Poly :=
[
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 2. -/
def ep_Q2_024_partial_02_0004 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 2. -/
theorem ep_Q2_024_partial_02_0004_valid :
    mulPoly ep_Q2_024_coefficient_02_0004
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0005 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 5 for generator 2. -/
def ep_Q2_024_partial_02_0005 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 2. -/
theorem ep_Q2_024_partial_02_0005_valid :
    mulPoly ep_Q2_024_coefficient_02_0005
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0006 : Poly :=
[
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 6 for generator 2. -/
def ep_Q2_024_partial_02_0006 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 2. -/
theorem ep_Q2_024_partial_02_0006_valid :
    mulPoly ep_Q2_024_coefficient_02_0006
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0007 : Poly :=
[
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 7 for generator 2. -/
def ep_Q2_024_partial_02_0007 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 2. -/
theorem ep_Q2_024_partial_02_0007_valid :
    mulPoly ep_Q2_024_coefficient_02_0007
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0008 : Poly :=
[
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 2. -/
def ep_Q2_024_partial_02_0008 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 2. -/
theorem ep_Q2_024_partial_02_0008_valid :
    mulPoly ep_Q2_024_coefficient_02_0008
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0009 : Poly :=
[
  term ((60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 9 for generator 2. -/
def ep_Q2_024_partial_02_0009 : Poly :=
[
  term ((121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 3)],
  term ((121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 2. -/
theorem ep_Q2_024_partial_02_0009_valid :
    mulPoly ep_Q2_024_coefficient_02_0009
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0010 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 10 for generator 2. -/
def ep_Q2_024_partial_02_0010 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 2. -/
theorem ep_Q2_024_partial_02_0010_valid :
    mulPoly ep_Q2_024_coefficient_02_0010
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0011 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 11 for generator 2. -/
def ep_Q2_024_partial_02_0011 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 2. -/
theorem ep_Q2_024_partial_02_0011_valid :
    mulPoly ep_Q2_024_coefficient_02_0011
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0012 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 2. -/
def ep_Q2_024_partial_02_0012 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 2. -/
theorem ep_Q2_024_partial_02_0012_valid :
    mulPoly ep_Q2_024_coefficient_02_0012
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0013 : Poly :=
[
  term ((-581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 13 for generator 2. -/
def ep_Q2_024_partial_02_0013 : Poly :=
[
  term ((-1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 2. -/
theorem ep_Q2_024_partial_02_0013_valid :
    mulPoly ep_Q2_024_coefficient_02_0013
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0014 : Poly :=
[
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 14 for generator 2. -/
def ep_Q2_024_partial_02_0014 : Poly :=
[
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 2. -/
theorem ep_Q2_024_partial_02_0014_valid :
    mulPoly ep_Q2_024_coefficient_02_0014
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0015 : Poly :=
[
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 2. -/
def ep_Q2_024_partial_02_0015 : Poly :=
[
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 2. -/
theorem ep_Q2_024_partial_02_0015_valid :
    mulPoly ep_Q2_024_coefficient_02_0015
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0016 : Poly :=
[
  term ((-37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 16 for generator 2. -/
def ep_Q2_024_partial_02_0016 : Poly :=
[
  term ((-74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 3), (13, 1)],
  term ((-74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 2. -/
theorem ep_Q2_024_partial_02_0016_valid :
    mulPoly ep_Q2_024_coefficient_02_0016
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0017 : Poly :=
[
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 17 for generator 2. -/
def ep_Q2_024_partial_02_0017 : Poly :=
[
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (11, 3), (15, 1)],
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 2. -/
theorem ep_Q2_024_partial_02_0017_valid :
    mulPoly ep_Q2_024_coefficient_02_0017
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0018 : Poly :=
[
  term ((8142139841485055 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 2. -/
def ep_Q2_024_partial_02_0018 : Poly :=
[
  term ((8142139841485055 : Rat) / 2325560442306386) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8142139841485055 : Rat) / 4651120884612772) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8142139841485055 : Rat) / 4651120884612772) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((8142139841485055 : Rat) / 2325560442306386) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 2. -/
theorem ep_Q2_024_partial_02_0018_valid :
    mulPoly ep_Q2_024_coefficient_02_0018
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0019 : Poly :=
[
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 19 for generator 2. -/
def ep_Q2_024_partial_02_0019 : Poly :=
[
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 2. -/
theorem ep_Q2_024_partial_02_0019_valid :
    mulPoly ep_Q2_024_coefficient_02_0019
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0020 : Poly :=
[
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 2. -/
def ep_Q2_024_partial_02_0020 : Poly :=
[
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 2. -/
theorem ep_Q2_024_partial_02_0020_valid :
    mulPoly ep_Q2_024_coefficient_02_0020
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0021 : Poly :=
[
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (13, 2)]
]

/-- Partial product 21 for generator 2. -/
def ep_Q2_024_partial_02_0021 : Poly :=
[
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (13, 2)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (13, 2)],
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 2. -/
theorem ep_Q2_024_partial_02_0021_valid :
    mulPoly ep_Q2_024_coefficient_02_0021
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0022 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)]
]

/-- Partial product 22 for generator 2. -/
def ep_Q2_024_partial_02_0022 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (10, 2), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (11, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 2. -/
theorem ep_Q2_024_partial_02_0022_valid :
    mulPoly ep_Q2_024_coefficient_02_0022
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0023 : Poly :=
[
  term ((9851670194564511 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 2. -/
def ep_Q2_024_partial_02_0023 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 2. -/
theorem ep_Q2_024_partial_02_0023_valid :
    mulPoly ep_Q2_024_coefficient_02_0023
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0024 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 24 for generator 2. -/
def ep_Q2_024_partial_02_0024 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 2. -/
theorem ep_Q2_024_partial_02_0024_valid :
    mulPoly ep_Q2_024_coefficient_02_0024
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0025 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 25 for generator 2. -/
def ep_Q2_024_partial_02_0025 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 2. -/
theorem ep_Q2_024_partial_02_0025_valid :
    mulPoly ep_Q2_024_coefficient_02_0025
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0026 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 26 for generator 2. -/
def ep_Q2_024_partial_02_0026 : Poly :=
[
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 3)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 2. -/
theorem ep_Q2_024_partial_02_0026_valid :
    mulPoly ep_Q2_024_coefficient_02_0026
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0027 : Poly :=
[
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 27 for generator 2. -/
def ep_Q2_024_partial_02_0027 : Poly :=
[
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 2. -/
theorem ep_Q2_024_partial_02_0027_valid :
    mulPoly ep_Q2_024_coefficient_02_0027
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0028 : Poly :=
[
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 28 for generator 2. -/
def ep_Q2_024_partial_02_0028 : Poly :=
[
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 2. -/
theorem ep_Q2_024_partial_02_0028_valid :
    mulPoly ep_Q2_024_coefficient_02_0028
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0029 : Poly :=
[
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 2. -/
def ep_Q2_024_partial_02_0029 : Poly :=
[
  term ((6217296801248128 : Rat) / 3488340663459579) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 2. -/
theorem ep_Q2_024_partial_02_0029_valid :
    mulPoly ep_Q2_024_coefficient_02_0029
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0030 : Poly :=
[
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 30 for generator 2. -/
def ep_Q2_024_partial_02_0030 : Poly :=
[
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (5, 1), (9, 2), (10, 1)],
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (10, 2)],
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 2)],
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 2. -/
theorem ep_Q2_024_partial_02_0030_valid :
    mulPoly ep_Q2_024_coefficient_02_0030
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0031 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 31 for generator 2. -/
def ep_Q2_024_partial_02_0031 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 3), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 2. -/
theorem ep_Q2_024_partial_02_0031_valid :
    mulPoly ep_Q2_024_coefficient_02_0031
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0032 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 32 for generator 2. -/
def ep_Q2_024_partial_02_0032 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 2. -/
theorem ep_Q2_024_partial_02_0032_valid :
    mulPoly ep_Q2_024_coefficient_02_0032
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0033 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 2. -/
def ep_Q2_024_partial_02_0033 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 2. -/
theorem ep_Q2_024_partial_02_0033_valid :
    mulPoly ep_Q2_024_coefficient_02_0033
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0034 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 34 for generator 2. -/
def ep_Q2_024_partial_02_0034 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 2. -/
theorem ep_Q2_024_partial_02_0034_valid :
    mulPoly ep_Q2_024_coefficient_02_0034
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0035 : Poly :=
[
  term ((6720488212588295216737922567646683245256 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1)]
]

/-- Partial product 35 for generator 2. -/
def ep_Q2_024_partial_02_0035 : Poly :=
[
  term ((13440976425176590433475845135293366490512 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-6720488212588295216737922567646683245256 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (10, 2)],
  term ((-6720488212588295216737922567646683245256 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (11, 2)],
  term ((13440976425176590433475845135293366490512 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 2. -/
theorem ep_Q2_024_partial_02_0035_valid :
    mulPoly ep_Q2_024_coefficient_02_0035
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0036 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 2. -/
def ep_Q2_024_partial_02_0036 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 2. -/
theorem ep_Q2_024_partial_02_0036_valid :
    mulPoly ep_Q2_024_coefficient_02_0036
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0037 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 37 for generator 2. -/
def ep_Q2_024_partial_02_0037 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 2. -/
theorem ep_Q2_024_partial_02_0037_valid :
    mulPoly ep_Q2_024_coefficient_02_0037
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0038 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 2. -/
def ep_Q2_024_partial_02_0038 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 2. -/
theorem ep_Q2_024_partial_02_0038_valid :
    mulPoly ep_Q2_024_coefficient_02_0038
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0039 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 39 for generator 2. -/
def ep_Q2_024_partial_02_0039 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 2. -/
theorem ep_Q2_024_partial_02_0039_valid :
    mulPoly ep_Q2_024_coefficient_02_0039
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0040 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 2. -/
def ep_Q2_024_partial_02_0040 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 2. -/
theorem ep_Q2_024_partial_02_0040_valid :
    mulPoly ep_Q2_024_coefficient_02_0040
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0041 : Poly :=
[
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 41 for generator 2. -/
def ep_Q2_024_partial_02_0041 : Poly :=
[
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 2. -/
theorem ep_Q2_024_partial_02_0041_valid :
    mulPoly ep_Q2_024_coefficient_02_0041
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0042 : Poly :=
[
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 2. -/
def ep_Q2_024_partial_02_0042 : Poly :=
[
  term ((9285325420604210 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 2. -/
theorem ep_Q2_024_partial_02_0042_valid :
    mulPoly ep_Q2_024_coefficient_02_0042
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0043 : Poly :=
[
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 43 for generator 2. -/
def ep_Q2_024_partial_02_0043 : Poly :=
[
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 2. -/
theorem ep_Q2_024_partial_02_0043_valid :
    mulPoly ep_Q2_024_coefficient_02_0043
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0044 : Poly :=
[
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 44 for generator 2. -/
def ep_Q2_024_partial_02_0044 : Poly :=
[
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 2. -/
theorem ep_Q2_024_partial_02_0044_valid :
    mulPoly ep_Q2_024_coefficient_02_0044
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0045 : Poly :=
[
  term ((-183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 45 for generator 2. -/
def ep_Q2_024_partial_02_0045 : Poly :=
[
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 2. -/
theorem ep_Q2_024_partial_02_0045_valid :
    mulPoly ep_Q2_024_coefficient_02_0045
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0046 : Poly :=
[
  term ((25488046036701884 : Rat) / 3488340663459579) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 2. -/
def ep_Q2_024_partial_02_0046 : Poly :=
[
  term ((50976092073403768 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((50976092073403768 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 2. -/
theorem ep_Q2_024_partial_02_0046_valid :
    mulPoly ep_Q2_024_coefficient_02_0046
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0047 : Poly :=
[
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 47 for generator 2. -/
def ep_Q2_024_partial_02_0047 : Poly :=
[
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 2), (10, 1), (13, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (10, 2), (13, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 2. -/
theorem ep_Q2_024_partial_02_0047_valid :
    mulPoly ep_Q2_024_coefficient_02_0047
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0048 : Poly :=
[
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 48 for generator 2. -/
def ep_Q2_024_partial_02_0048 : Poly :=
[
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (10, 2), (15, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 2. -/
theorem ep_Q2_024_partial_02_0048_valid :
    mulPoly ep_Q2_024_coefficient_02_0048
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0049 : Poly :=
[
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 2. -/
def ep_Q2_024_partial_02_0049 : Poly :=
[
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 2. -/
theorem ep_Q2_024_partial_02_0049_valid :
    mulPoly ep_Q2_024_coefficient_02_0049
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0050 : Poly :=
[
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3)]
]

/-- Partial product 50 for generator 2. -/
def ep_Q2_024_partial_02_0050 : Poly :=
[
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 3), (10, 1)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (10, 2)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 2)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 2. -/
theorem ep_Q2_024_partial_02_0050_valid :
    mulPoly ep_Q2_024_coefficient_02_0050
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0051 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 51 for generator 2. -/
def ep_Q2_024_partial_02_0051 : Poly :=
[
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 2. -/
theorem ep_Q2_024_partial_02_0051_valid :
    mulPoly ep_Q2_024_coefficient_02_0051
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0052 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 52 for generator 2. -/
def ep_Q2_024_partial_02_0052 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 3), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 2. -/
theorem ep_Q2_024_partial_02_0052_valid :
    mulPoly ep_Q2_024_coefficient_02_0052
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0053 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 2. -/
def ep_Q2_024_partial_02_0053 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 2. -/
theorem ep_Q2_024_partial_02_0053_valid :
    mulPoly ep_Q2_024_coefficient_02_0053
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0054 : Poly :=
[
  term ((-30286581633353307372315972021281969306 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (13, 1)]
]

/-- Partial product 54 for generator 2. -/
def ep_Q2_024_partial_02_0054 : Poly :=
[
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((30286581633353307372315972021281969306 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (13, 1)],
  term ((30286581633353307372315972021281969306 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (13, 1)],
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 2. -/
theorem ep_Q2_024_partial_02_0054_valid :
    mulPoly ep_Q2_024_coefficient_02_0054
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0055 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(1, 1), (15, 1)]
]

/-- Partial product 55 for generator 2. -/
def ep_Q2_024_partial_02_0055 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(1, 1), (10, 2), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(1, 1), (11, 2), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 2. -/
theorem ep_Q2_024_partial_02_0055_valid :
    mulPoly ep_Q2_024_coefficient_02_0055
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0056 : Poly :=
[
  term ((9851670194564511 : Rat) / 9302241769225544) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 2. -/
def ep_Q2_024_partial_02_0056 : Poly :=
[
  term ((9851670194564511 : Rat) / 4651120884612772) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9851670194564511 : Rat) / 9302241769225544) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9851670194564511 : Rat) / 9302241769225544) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 2. -/
theorem ep_Q2_024_partial_02_0056_valid :
    mulPoly ep_Q2_024_coefficient_02_0056
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0057 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 57 for generator 2. -/
def ep_Q2_024_partial_02_0057 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 2. -/
theorem ep_Q2_024_partial_02_0057_valid :
    mulPoly ep_Q2_024_coefficient_02_0057
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0058 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 58 for generator 2. -/
def ep_Q2_024_partial_02_0058 : Poly :=
[
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 2. -/
theorem ep_Q2_024_partial_02_0058_valid :
    mulPoly ep_Q2_024_coefficient_02_0058
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0059 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 59 for generator 2. -/
def ep_Q2_024_partial_02_0059 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 2. -/
theorem ep_Q2_024_partial_02_0059_valid :
    mulPoly ep_Q2_024_coefficient_02_0059
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0060 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 60 for generator 2. -/
def ep_Q2_024_partial_02_0060 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 2. -/
theorem ep_Q2_024_partial_02_0060_valid :
    mulPoly ep_Q2_024_coefficient_02_0060
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0061 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 61 for generator 2. -/
def ep_Q2_024_partial_02_0061 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 2. -/
theorem ep_Q2_024_partial_02_0061_valid :
    mulPoly ep_Q2_024_coefficient_02_0061
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0062 : Poly :=
[
  term ((-5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 62 for generator 2. -/
def ep_Q2_024_partial_02_0062 : Poly :=
[
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 2. -/
theorem ep_Q2_024_partial_02_0062_valid :
    mulPoly ep_Q2_024_coefficient_02_0062
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0063 : Poly :=
[
  term ((-558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 63 for generator 2. -/
def ep_Q2_024_partial_02_0063 : Poly :=
[
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 2. -/
theorem ep_Q2_024_partial_02_0063_valid :
    mulPoly ep_Q2_024_coefficient_02_0063
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0064 : Poly :=
[
  term ((336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 2. -/
def ep_Q2_024_partial_02_0064 : Poly :=
[
  term ((673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 2. -/
theorem ep_Q2_024_partial_02_0064_valid :
    mulPoly ep_Q2_024_coefficient_02_0064
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0065 : Poly :=
[
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 65 for generator 2. -/
def ep_Q2_024_partial_02_0065 : Poly :=
[
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 2. -/
theorem ep_Q2_024_partial_02_0065_valid :
    mulPoly ep_Q2_024_coefficient_02_0065
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0066 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 66 for generator 2. -/
def ep_Q2_024_partial_02_0066 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 2. -/
theorem ep_Q2_024_partial_02_0066_valid :
    mulPoly ep_Q2_024_coefficient_02_0066
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0067 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 67 for generator 2. -/
def ep_Q2_024_partial_02_0067 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 2. -/
theorem ep_Q2_024_partial_02_0067_valid :
    mulPoly ep_Q2_024_coefficient_02_0067
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0068 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 2. -/
def ep_Q2_024_partial_02_0068 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 2. -/
theorem ep_Q2_024_partial_02_0068_valid :
    mulPoly ep_Q2_024_coefficient_02_0068
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0069 : Poly :=
[
  term ((-3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 69 for generator 2. -/
def ep_Q2_024_partial_02_0069 : Poly :=
[
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 2. -/
theorem ep_Q2_024_partial_02_0069_valid :
    mulPoly ep_Q2_024_coefficient_02_0069
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0070 : Poly :=
[
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 70 for generator 2. -/
def ep_Q2_024_partial_02_0070 : Poly :=
[
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 2. -/
theorem ep_Q2_024_partial_02_0070_valid :
    mulPoly ep_Q2_024_coefficient_02_0070
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0071 : Poly :=
[
  term ((-56432624242549970 : Rat) / 3488340663459579) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 2. -/
def ep_Q2_024_partial_02_0071 : Poly :=
[
  term ((-112865248485099940 : Rat) / 3488340663459579) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-112865248485099940 : Rat) / 3488340663459579) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 2. -/
theorem ep_Q2_024_partial_02_0071_valid :
    mulPoly ep_Q2_024_coefficient_02_0071
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0072 : Poly :=
[
  term ((51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2)]
]

/-- Partial product 72 for generator 2. -/
def ep_Q2_024_partial_02_0072 : Poly :=
[
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (10, 2)],
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 2. -/
theorem ep_Q2_024_partial_02_0072_valid :
    mulPoly ep_Q2_024_coefficient_02_0072
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0073 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 73 for generator 2. -/
def ep_Q2_024_partial_02_0073 : Poly :=
[
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 2. -/
theorem ep_Q2_024_partial_02_0073_valid :
    mulPoly ep_Q2_024_coefficient_02_0073
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0074 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 2. -/
def ep_Q2_024_partial_02_0074 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 2. -/
theorem ep_Q2_024_partial_02_0074_valid :
    mulPoly ep_Q2_024_coefficient_02_0074
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0075 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 2. -/
def ep_Q2_024_partial_02_0075 : Poly :=
[
  term ((-896456281639118 : Rat) / 1162780221153193) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 2. -/
theorem ep_Q2_024_partial_02_0075_valid :
    mulPoly ep_Q2_024_coefficient_02_0075
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0076 : Poly :=
[
  term ((926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 76 for generator 2. -/
def ep_Q2_024_partial_02_0076 : Poly :=
[
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 2. -/
theorem ep_Q2_024_partial_02_0076_valid :
    mulPoly ep_Q2_024_coefficient_02_0076
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0077 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 77 for generator 2. -/
def ep_Q2_024_partial_02_0077 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 2. -/
theorem ep_Q2_024_partial_02_0077_valid :
    mulPoly ep_Q2_024_coefficient_02_0077
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0078 : Poly :=
[
  term ((13766191430316001 : Rat) / 2325560442306386) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 2. -/
def ep_Q2_024_partial_02_0078 : Poly :=
[
  term ((13766191430316001 : Rat) / 1162780221153193) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 2. -/
theorem ep_Q2_024_partial_02_0078_valid :
    mulPoly ep_Q2_024_coefficient_02_0078
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0079 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)]
]

/-- Partial product 79 for generator 2. -/
def ep_Q2_024_partial_02_0079 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (7, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (10, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 2. -/
theorem ep_Q2_024_partial_02_0079_valid :
    mulPoly ep_Q2_024_coefficient_02_0079
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0080 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 80 for generator 2. -/
def ep_Q2_024_partial_02_0080 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (4, 1), (9, 1), (10, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1), (10, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 2. -/
theorem ep_Q2_024_partial_02_0080_valid :
    mulPoly ep_Q2_024_coefficient_02_0080
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0081 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 81 for generator 2. -/
def ep_Q2_024_partial_02_0081 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (10, 2), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 2. -/
theorem ep_Q2_024_partial_02_0081_valid :
    mulPoly ep_Q2_024_coefficient_02_0081
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0082 : Poly :=
[
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1)]
]

/-- Partial product 82 for generator 2. -/
def ep_Q2_024_partial_02_0082 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (10, 2)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 2. -/
theorem ep_Q2_024_partial_02_0082_valid :
    mulPoly ep_Q2_024_coefficient_02_0082
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0083 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 83 for generator 2. -/
def ep_Q2_024_partial_02_0083 : Poly :=
[
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 2)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 2. -/
theorem ep_Q2_024_partial_02_0083_valid :
    mulPoly ep_Q2_024_coefficient_02_0083
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0084 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 84 for generator 2. -/
def ep_Q2_024_partial_02_0084 : Poly :=
[
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (10, 2), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 2. -/
theorem ep_Q2_024_partial_02_0084_valid :
    mulPoly ep_Q2_024_coefficient_02_0084
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0085 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 85 for generator 2. -/
def ep_Q2_024_partial_02_0085 : Poly :=
[
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (10, 2), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 2. -/
theorem ep_Q2_024_partial_02_0085_valid :
    mulPoly ep_Q2_024_coefficient_02_0085
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0086 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 2. -/
def ep_Q2_024_partial_02_0086 : Poly :=
[
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 2. -/
theorem ep_Q2_024_partial_02_0086_valid :
    mulPoly ep_Q2_024_coefficient_02_0086
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0087 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 87 for generator 2. -/
def ep_Q2_024_partial_02_0087 : Poly :=
[
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 2. -/
theorem ep_Q2_024_partial_02_0087_valid :
    mulPoly ep_Q2_024_coefficient_02_0087
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0088 : Poly :=
[
  term ((251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 88 for generator 2. -/
def ep_Q2_024_partial_02_0088 : Poly :=
[
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 2. -/
theorem ep_Q2_024_partial_02_0088_valid :
    mulPoly ep_Q2_024_coefficient_02_0088
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0089 : Poly :=
[
  term ((-7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 89 for generator 2. -/
def ep_Q2_024_partial_02_0089 : Poly :=
[
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 2. -/
theorem ep_Q2_024_partial_02_0089_valid :
    mulPoly ep_Q2_024_coefficient_02_0089
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0090 : Poly :=
[
  term ((-18665969837312872 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 2. -/
def ep_Q2_024_partial_02_0090 : Poly :=
[
  term ((-37331939674625744 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37331939674625744 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 2. -/
theorem ep_Q2_024_partial_02_0090_valid :
    mulPoly ep_Q2_024_coefficient_02_0090
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0091 : Poly :=
[
  term ((621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 91 for generator 2. -/
def ep_Q2_024_partial_02_0091 : Poly :=
[
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1)],
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1)],
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (10, 2)],
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 2. -/
theorem ep_Q2_024_partial_02_0091_valid :
    mulPoly ep_Q2_024_coefficient_02_0091
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0092 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 92 for generator 2. -/
def ep_Q2_024_partial_02_0092 : Poly :=
[
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 2. -/
theorem ep_Q2_024_partial_02_0092_valid :
    mulPoly ep_Q2_024_coefficient_02_0092
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0093 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 93 for generator 2. -/
def ep_Q2_024_partial_02_0093 : Poly :=
[
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 2. -/
theorem ep_Q2_024_partial_02_0093_valid :
    mulPoly ep_Q2_024_coefficient_02_0093
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0094 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 2. -/
def ep_Q2_024_partial_02_0094 : Poly :=
[
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 2. -/
theorem ep_Q2_024_partial_02_0094_valid :
    mulPoly ep_Q2_024_coefficient_02_0094
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0095 : Poly :=
[
  term ((-148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1)]
]

/-- Partial product 95 for generator 2. -/
def ep_Q2_024_partial_02_0095 : Poly :=
[
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (10, 2)],
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 2. -/
theorem ep_Q2_024_partial_02_0095_valid :
    mulPoly ep_Q2_024_coefficient_02_0095
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0096 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 96 for generator 2. -/
def ep_Q2_024_partial_02_0096 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 2. -/
theorem ep_Q2_024_partial_02_0096_valid :
    mulPoly ep_Q2_024_coefficient_02_0096
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0097 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 97 for generator 2. -/
def ep_Q2_024_partial_02_0097 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 2. -/
theorem ep_Q2_024_partial_02_0097_valid :
    mulPoly ep_Q2_024_coefficient_02_0097
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0098 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 98 for generator 2. -/
def ep_Q2_024_partial_02_0098 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 2. -/
theorem ep_Q2_024_partial_02_0098_valid :
    mulPoly ep_Q2_024_coefficient_02_0098
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0099 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 2. -/
def ep_Q2_024_partial_02_0099 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 2. -/
theorem ep_Q2_024_partial_02_0099_valid :
    mulPoly ep_Q2_024_coefficient_02_0099
        ep_Q2_024_generator_02_0000_0099 =
      ep_Q2_024_partial_02_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_02_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_02_0000,
  ep_Q2_024_partial_02_0001,
  ep_Q2_024_partial_02_0002,
  ep_Q2_024_partial_02_0003,
  ep_Q2_024_partial_02_0004,
  ep_Q2_024_partial_02_0005,
  ep_Q2_024_partial_02_0006,
  ep_Q2_024_partial_02_0007,
  ep_Q2_024_partial_02_0008,
  ep_Q2_024_partial_02_0009,
  ep_Q2_024_partial_02_0010,
  ep_Q2_024_partial_02_0011,
  ep_Q2_024_partial_02_0012,
  ep_Q2_024_partial_02_0013,
  ep_Q2_024_partial_02_0014,
  ep_Q2_024_partial_02_0015,
  ep_Q2_024_partial_02_0016,
  ep_Q2_024_partial_02_0017,
  ep_Q2_024_partial_02_0018,
  ep_Q2_024_partial_02_0019,
  ep_Q2_024_partial_02_0020,
  ep_Q2_024_partial_02_0021,
  ep_Q2_024_partial_02_0022,
  ep_Q2_024_partial_02_0023,
  ep_Q2_024_partial_02_0024,
  ep_Q2_024_partial_02_0025,
  ep_Q2_024_partial_02_0026,
  ep_Q2_024_partial_02_0027,
  ep_Q2_024_partial_02_0028,
  ep_Q2_024_partial_02_0029,
  ep_Q2_024_partial_02_0030,
  ep_Q2_024_partial_02_0031,
  ep_Q2_024_partial_02_0032,
  ep_Q2_024_partial_02_0033,
  ep_Q2_024_partial_02_0034,
  ep_Q2_024_partial_02_0035,
  ep_Q2_024_partial_02_0036,
  ep_Q2_024_partial_02_0037,
  ep_Q2_024_partial_02_0038,
  ep_Q2_024_partial_02_0039,
  ep_Q2_024_partial_02_0040,
  ep_Q2_024_partial_02_0041,
  ep_Q2_024_partial_02_0042,
  ep_Q2_024_partial_02_0043,
  ep_Q2_024_partial_02_0044,
  ep_Q2_024_partial_02_0045,
  ep_Q2_024_partial_02_0046,
  ep_Q2_024_partial_02_0047,
  ep_Q2_024_partial_02_0048,
  ep_Q2_024_partial_02_0049,
  ep_Q2_024_partial_02_0050,
  ep_Q2_024_partial_02_0051,
  ep_Q2_024_partial_02_0052,
  ep_Q2_024_partial_02_0053,
  ep_Q2_024_partial_02_0054,
  ep_Q2_024_partial_02_0055,
  ep_Q2_024_partial_02_0056,
  ep_Q2_024_partial_02_0057,
  ep_Q2_024_partial_02_0058,
  ep_Q2_024_partial_02_0059,
  ep_Q2_024_partial_02_0060,
  ep_Q2_024_partial_02_0061,
  ep_Q2_024_partial_02_0062,
  ep_Q2_024_partial_02_0063,
  ep_Q2_024_partial_02_0064,
  ep_Q2_024_partial_02_0065,
  ep_Q2_024_partial_02_0066,
  ep_Q2_024_partial_02_0067,
  ep_Q2_024_partial_02_0068,
  ep_Q2_024_partial_02_0069,
  ep_Q2_024_partial_02_0070,
  ep_Q2_024_partial_02_0071,
  ep_Q2_024_partial_02_0072,
  ep_Q2_024_partial_02_0073,
  ep_Q2_024_partial_02_0074,
  ep_Q2_024_partial_02_0075,
  ep_Q2_024_partial_02_0076,
  ep_Q2_024_partial_02_0077,
  ep_Q2_024_partial_02_0078,
  ep_Q2_024_partial_02_0079,
  ep_Q2_024_partial_02_0080,
  ep_Q2_024_partial_02_0081,
  ep_Q2_024_partial_02_0082,
  ep_Q2_024_partial_02_0083,
  ep_Q2_024_partial_02_0084,
  ep_Q2_024_partial_02_0085,
  ep_Q2_024_partial_02_0086,
  ep_Q2_024_partial_02_0087,
  ep_Q2_024_partial_02_0088,
  ep_Q2_024_partial_02_0089,
  ep_Q2_024_partial_02_0090,
  ep_Q2_024_partial_02_0091,
  ep_Q2_024_partial_02_0092,
  ep_Q2_024_partial_02_0093,
  ep_Q2_024_partial_02_0094,
  ep_Q2_024_partial_02_0095,
  ep_Q2_024_partial_02_0096,
  ep_Q2_024_partial_02_0097,
  ep_Q2_024_partial_02_0098,
  ep_Q2_024_partial_02_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_02_0000_0099 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((6217296801248128 : Rat) / 3488340663459579) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (5, 1), (9, 2), (10, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((13440976425176590433475845135293366490512 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (1, 1), (9, 1), (10, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2)],
  term ((50976092073403768 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 2), (10, 1), (13, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (1, 1), (9, 3), (10, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((8142139841485055 : Rat) / 2325560442306386) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((673691331644400 : Rat) / 1162780221153193) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-112865248485099940 : Rat) / 3488340663459579) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(0, 1), (2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (7, 1), (10, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (4, 1), (9, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (4, 1), (10, 1), (11, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (11, 1)],
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-37331939674625744 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (10, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 3)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1)],
  term ((37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8142139841485055 : Rat) / 4651120884612772) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (10, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (11, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 3), (13, 1)],
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 1), (11, 3), (15, 1)],
  term ((-8142139841485055 : Rat) / 4651120884612772) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((36885281294131109 : Rat) / 3488340663459579) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((8142139841485055 : Rat) / 2325560442306386) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 1162780221153193) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 2), (10, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (11, 2)],
  term ((-11651501637049059178385426413555378112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((673691331644400 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-112865248485099940 : Rat) / 3488340663459579) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((383320814494054688553908305461524375768 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-37331939674625744 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2)],
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 3)],
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (10, 2)],
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 3), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((-6720488212588295216737922567646683245256 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (10, 2)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-6720488212588295216737922567646683245256 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (11, 2)],
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-25837544794359523259924583983314066333789972713307408873 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((183448520398521727710285568751192685707032009457835592289 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-25488046036701884 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (10, 2), (13, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (10, 2), (15, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((-3417434689737382686026454554257865562394472036753675263 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (10, 2)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 2)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((30286581633353307372315972021281969306 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (13, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(1, 1), (10, 2), (15, 1)],
  term ((-9851670194564511 : Rat) / 9302241769225544) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)],
  term ((30286581633353307372315972021281969306 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (13, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(1, 1), (11, 2), (15, 1)],
  term ((-9851670194564511 : Rat) / 9302241769225544) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 3), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (11, 2)],
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (9, 2), (11, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((13440976425176590433475845135293366490512 : Rat) / 5398692558311147834550120876132926705955) [(1, 2), (9, 1), (11, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((25837544794359523259924583983314066333789972713307408873 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-366897040797043455420571137502385371414064018915671184578 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((50976092073403768 : Rat) / 3488340663459579) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((3417434689737382686026454554257865562394472036753675263 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (9, 3), (11, 1)],
  term ((-60573163266706614744631944042563938612 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 1), (13, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 2), (11, 1), (15, 1)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (11, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (10, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (11, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (10, 2), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (11, 3)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 3)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((5825750818524529589192713206777689056 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((558264426224611819334380279491871956317971781782933742 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-336845665822200 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 3)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 3)],
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (10, 2)],
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (11, 2)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (13, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 3), (15, 1)],
  term ((-13766191430316001 : Rat) / 2325560442306386) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (10, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (11, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1), (10, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1), (11, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (10, 2), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (11, 3)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 2)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 2)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (10, 2), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (10, 2), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (11, 2), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (11, 3)],
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (10, 2)],
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (11, 2)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (10, 2)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 2)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (11, 3), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (10, 2)],
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (11, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(10, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 0 through 99. -/
theorem ep_Q2_024_block_02_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_02_0000_0099
      ep_Q2_024_block_02_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
