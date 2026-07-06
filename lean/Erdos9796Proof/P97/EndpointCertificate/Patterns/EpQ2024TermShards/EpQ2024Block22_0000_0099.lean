/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 22:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_22_0000_0099 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0000 : Poly :=
[
  term ((-7816551174574345793991723044114373147767 : Rat) / 3599128372207431889700080584088617803970) []
]

/-- Partial product 0 for generator 22. -/
def ep_Q2_024_partial_22_0000 : Poly :=
[
  term ((-7816551174574345793991723044114373147767 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1)],
  term ((7816551174574345793991723044114373147767 : Rat) / 3599128372207431889700080584088617803970) [(8, 2)],
  term ((-7816551174574345793991723044114373147767 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1)],
  term ((7816551174574345793991723044114373147767 : Rat) / 3599128372207431889700080584088617803970) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem ep_Q2_024_partial_22_0000_valid :
    mulPoly ep_Q2_024_coefficient_22_0000
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0001 : Poly :=
[
  term ((-2940581431430522067215759801691633288358 : Rat) / 1799564186103715944850040292044308901985) [(0, 1)]
]

/-- Partial product 1 for generator 22. -/
def ep_Q2_024_partial_22_0001 : Poly :=
[
  term ((-5881162862861044134431519603383266576716 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (10, 1)],
  term ((2940581431430522067215759801691633288358 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 2)],
  term ((-5881162862861044134431519603383266576716 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)],
  term ((2940581431430522067215759801691633288358 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem ep_Q2_024_partial_22_0001_valid :
    mulPoly ep_Q2_024_coefficient_22_0001
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0002 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 22. -/
def ep_Q2_024_partial_22_0002 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem ep_Q2_024_partial_22_0002_valid :
    mulPoly ep_Q2_024_coefficient_22_0002
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0003 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (12, 1), (13, 1)]
]

/-- Partial product 3 for generator 22. -/
def ep_Q2_024_partial_22_0003 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem ep_Q2_024_partial_22_0003_valid :
    mulPoly ep_Q2_024_coefficient_22_0003
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0004 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 4 for generator 22. -/
def ep_Q2_024_partial_22_0004 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem ep_Q2_024_partial_22_0004_valid :
    mulPoly ep_Q2_024_coefficient_22_0004
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0005 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def ep_Q2_024_partial_22_0005 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem ep_Q2_024_partial_22_0005_valid :
    mulPoly ep_Q2_024_coefficient_22_0005
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0006 : Poly :=
[
  term ((4419960049506021878092054834447457545228 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 22. -/
def ep_Q2_024_partial_22_0006 : Poly :=
[
  term ((8839920099012043756184109668894915090456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-4419960049506021878092054834447457545228 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((8839920099012043756184109668894915090456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4419960049506021878092054834447457545228 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem ep_Q2_024_partial_22_0006_valid :
    mulPoly ep_Q2_024_coefficient_22_0006
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0007 : Poly :=
[
  term ((283662989173134613791700918547178988419686434067548234733 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 7 for generator 22. -/
def ep_Q2_024_partial_22_0007 : Poly :=
[
  term ((283662989173134613791700918547178988419686434067548234733 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-283662989173134613791700918547178988419686434067548234733 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((283662989173134613791700918547178988419686434067548234733 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-283662989173134613791700918547178988419686434067548234733 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem ep_Q2_024_partial_22_0007_valid :
    mulPoly ep_Q2_024_coefficient_22_0007
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0008 : Poly :=
[
  term ((-33220145938912321 : Rat) / 3488340663459579) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 22. -/
def ep_Q2_024_partial_22_0008 : Poly :=
[
  term ((-66440291877824642 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((33220145938912321 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-66440291877824642 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((33220145938912321 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem ep_Q2_024_partial_22_0008_valid :
    mulPoly ep_Q2_024_coefficient_22_0008
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0009 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1)]
]

/-- Partial product 9 for generator 22. -/
def ep_Q2_024_partial_22_0009 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (8, 1), (10, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (8, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem ep_Q2_024_partial_22_0009_valid :
    mulPoly ep_Q2_024_coefficient_22_0009
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0010 : Poly :=
[
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 10 for generator 22. -/
def ep_Q2_024_partial_22_0010 : Poly :=
[
  term ((-82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((-82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 2), (11, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem ep_Q2_024_partial_22_0010_valid :
    mulPoly ep_Q2_024_coefficient_22_0010
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0011 : Poly :=
[
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 11 for generator 22. -/
def ep_Q2_024_partial_22_0011 : Poly :=
[
  term ((-390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((-390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem ep_Q2_024_partial_22_0011_valid :
    mulPoly ep_Q2_024_coefficient_22_0011
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0012 : Poly :=
[
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 12 for generator 22. -/
def ep_Q2_024_partial_22_0012 : Poly :=
[
  term ((-21339014074195144291865401037760036293281307975261086418 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-21339014074195144291865401037760036293281307975261086418 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem ep_Q2_024_partial_22_0012_valid :
    mulPoly ep_Q2_024_coefficient_22_0012
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0013 : Poly :=
[
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 22. -/
def ep_Q2_024_partial_22_0013 : Poly :=
[
  term ((4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem ep_Q2_024_partial_22_0013_valid :
    mulPoly ep_Q2_024_coefficient_22_0013
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0014 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1)]
]

/-- Partial product 14 for generator 22. -/
def ep_Q2_024_partial_22_0014 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (10, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem ep_Q2_024_partial_22_0014_valid :
    mulPoly ep_Q2_024_coefficient_22_0014
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0015 : Poly :=
[
  term ((-98804772337648981781412687441468698808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 15 for generator 22. -/
def ep_Q2_024_partial_22_0015 : Poly :=
[
  term ((-197609544675297963562825374882937397616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((98804772337648981781412687441468698808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 2), (9, 1)],
  term ((-197609544675297963562825374882937397616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((98804772337648981781412687441468698808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem ep_Q2_024_partial_22_0015_valid :
    mulPoly ep_Q2_024_coefficient_22_0015
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0016 : Poly :=
[
  term ((-391607713698558135455997291987188205328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 16 for generator 22. -/
def ep_Q2_024_partial_22_0016 : Poly :=
[
  term ((-783215427397116270911994583974376410656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((391607713698558135455997291987188205328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-783215427397116270911994583974376410656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((391607713698558135455997291987188205328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem ep_Q2_024_partial_22_0016_valid :
    mulPoly ep_Q2_024_coefficient_22_0016
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0017 : Poly :=
[
  term ((2659251373243366367793579998687365682634073487054555653 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 17 for generator 22. -/
def ep_Q2_024_partial_22_0017 : Poly :=
[
  term ((5318502746486732735587159997374731365268146974109111306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2659251373243366367793579998687365682634073487054555653 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((5318502746486732735587159997374731365268146974109111306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2659251373243366367793579998687365682634073487054555653 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem ep_Q2_024_partial_22_0017_valid :
    mulPoly ep_Q2_024_coefficient_22_0017
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0018 : Poly :=
[
  term ((2294272359929796 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 22. -/
def ep_Q2_024_partial_22_0018 : Poly :=
[
  term ((4588544719859592 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2294272359929796 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((4588544719859592 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2294272359929796 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem ep_Q2_024_partial_22_0018_valid :
    mulPoly ep_Q2_024_coefficient_22_0018
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0019 : Poly :=
[
  term ((-870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 19 for generator 22. -/
def ep_Q2_024_partial_22_0019 : Poly :=
[
  term ((-1741446146149446346381862635564922195096 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((-1741446146149446346381862635564922195096 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem ep_Q2_024_partial_22_0019_valid :
    mulPoly ep_Q2_024_coefficient_22_0019
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0020 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 20 for generator 22. -/
def ep_Q2_024_partial_22_0020 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem ep_Q2_024_partial_22_0020_valid :
    mulPoly ep_Q2_024_coefficient_22_0020
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0021 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 21 for generator 22. -/
def ep_Q2_024_partial_22_0021 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem ep_Q2_024_partial_22_0021_valid :
    mulPoly ep_Q2_024_coefficient_22_0021
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0022 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 22. -/
def ep_Q2_024_partial_22_0022 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem ep_Q2_024_partial_22_0022_valid :
    mulPoly ep_Q2_024_coefficient_22_0022
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0023 : Poly :=
[
  term ((241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 23 for generator 22. -/
def ep_Q2_024_partial_22_0023 : Poly :=
[
  term ((483989155235654636066332401629724065456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((483989155235654636066332401629724065456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem ep_Q2_024_partial_22_0023_valid :
    mulPoly ep_Q2_024_coefficient_22_0023
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0024 : Poly :=
[
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 24 for generator 22. -/
def ep_Q2_024_partial_22_0024 : Poly :=
[
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem ep_Q2_024_partial_22_0024_valid :
    mulPoly ep_Q2_024_coefficient_22_0024
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0025 : Poly :=
[
  term ((4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 22. -/
def ep_Q2_024_partial_22_0025 : Poly :=
[
  term ((8254118808907186 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((8254118808907186 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem ep_Q2_024_partial_22_0025_valid :
    mulPoly ep_Q2_024_coefficient_22_0025
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0026 : Poly :=
[
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1)]
]

/-- Partial product 26 for generator 22. -/
def ep_Q2_024_partial_22_0026 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (10, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem ep_Q2_024_partial_22_0026_valid :
    mulPoly ep_Q2_024_coefficient_22_0026
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0027 : Poly :=
[
  term ((-1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 27 for generator 22. -/
def ep_Q2_024_partial_22_0027 : Poly :=
[
  term ((-2487689218795538858925693465315733053176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-2487689218795538858925693465315733053176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 2)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem ep_Q2_024_partial_22_0027_valid :
    mulPoly ep_Q2_024_coefficient_22_0027
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0028 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 28 for generator 22. -/
def ep_Q2_024_partial_22_0028 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem ep_Q2_024_partial_22_0028_valid :
    mulPoly ep_Q2_024_coefficient_22_0028
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0029 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 22. -/
def ep_Q2_024_partial_22_0029 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 22. -/
theorem ep_Q2_024_partial_22_0029_valid :
    mulPoly ep_Q2_024_coefficient_22_0029
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0030 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 22. -/
def ep_Q2_024_partial_22_0030 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 22. -/
theorem ep_Q2_024_partial_22_0030_valid :
    mulPoly ep_Q2_024_coefficient_22_0030
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0031 : Poly :=
[
  term ((-453584363313699022150761332896824465788 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 31 for generator 22. -/
def ep_Q2_024_partial_22_0031 : Poly :=
[
  term ((-907168726627398044301522665793648931576 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((453584363313699022150761332896824465788 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-907168726627398044301522665793648931576 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((453584363313699022150761332896824465788 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 22. -/
theorem ep_Q2_024_partial_22_0031_valid :
    mulPoly ep_Q2_024_coefficient_22_0031
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0032 : Poly :=
[
  term ((-119030043914219485518537739495889676872549589935334719951 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 32 for generator 22. -/
def ep_Q2_024_partial_22_0032 : Poly :=
[
  term ((-119030043914219485518537739495889676872549589935334719951 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((119030043914219485518537739495889676872549589935334719951 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-119030043914219485518537739495889676872549589935334719951 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((119030043914219485518537739495889676872549589935334719951 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 22. -/
theorem ep_Q2_024_partial_22_0032_valid :
    mulPoly ep_Q2_024_coefficient_22_0032
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0033 : Poly :=
[
  term ((7454729232382617 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 22. -/
def ep_Q2_024_partial_22_0033 : Poly :=
[
  term ((14909458464765234 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7454729232382617 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((14909458464765234 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7454729232382617 : Rat) / 1162780221153193) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 22. -/
theorem ep_Q2_024_partial_22_0033_valid :
    mulPoly ep_Q2_024_coefficient_22_0033
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0034 : Poly :=
[
  term ((286323325974770616170764347735844038512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)]
]

/-- Partial product 34 for generator 22. -/
def ep_Q2_024_partial_22_0034 : Poly :=
[
  term ((572646651949541232341528695471688077024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((-286323325974770616170764347735844038512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 2)],
  term ((572646651949541232341528695471688077024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (11, 1)],
  term ((-286323325974770616170764347735844038512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 22. -/
theorem ep_Q2_024_partial_22_0034_valid :
    mulPoly ep_Q2_024_coefficient_22_0034
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0035 : Poly :=
[
  term ((-125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 35 for generator 22. -/
def ep_Q2_024_partial_22_0035 : Poly :=
[
  term ((-251092751805125446114704620943898470736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-251092751805125446114704620943898470736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 22. -/
theorem ep_Q2_024_partial_22_0035_valid :
    mulPoly ep_Q2_024_coefficient_22_0035
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0036 : Poly :=
[
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 36 for generator 22. -/
def ep_Q2_024_partial_22_0036 : Poly :=
[
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 22. -/
theorem ep_Q2_024_partial_22_0036_valid :
    mulPoly ep_Q2_024_coefficient_22_0036
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0037 : Poly :=
[
  term ((-1294401938342114 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 22. -/
def ep_Q2_024_partial_22_0037 : Poly :=
[
  term ((-2588803876684228 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2588803876684228 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 22. -/
theorem ep_Q2_024_partial_22_0037_valid :
    mulPoly ep_Q2_024_coefficient_22_0037
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0038 : Poly :=
[
  term ((-1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 38 for generator 22. -/
def ep_Q2_024_partial_22_0038 : Poly :=
[
  term ((-2603558413317821484025710320688599795128 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-2603558413317821484025710320688599795128 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 22. -/
theorem ep_Q2_024_partial_22_0038_valid :
    mulPoly ep_Q2_024_coefficient_22_0038
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0039 : Poly :=
[
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 39 for generator 22. -/
def ep_Q2_024_partial_22_0039 : Poly :=
[
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 22. -/
theorem ep_Q2_024_partial_22_0039_valid :
    mulPoly ep_Q2_024_coefficient_22_0039
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0040 : Poly :=
[
  term ((-9729455067456383 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 22. -/
def ep_Q2_024_partial_22_0040 : Poly :=
[
  term ((-19458910134912766 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19458910134912766 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 22. -/
theorem ep_Q2_024_partial_22_0040_valid :
    mulPoly ep_Q2_024_coefficient_22_0040
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0041 : Poly :=
[
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1)]
]

/-- Partial product 41 for generator 22. -/
def ep_Q2_024_partial_22_0041 : Poly :=
[
  term ((71463028544351259775806763065947055254 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (12, 1)],
  term ((71463028544351259775806763065947055254 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 22. -/
theorem ep_Q2_024_partial_22_0041_valid :
    mulPoly ep_Q2_024_coefficient_22_0041
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0042 : Poly :=
[
  term ((-81240315428260858384558626402096438922249698305625373933 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 42 for generator 22. -/
def ep_Q2_024_partial_22_0042 : Poly :=
[
  term ((-81240315428260858384558626402096438922249698305625373933 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((81240315428260858384558626402096438922249698305625373933 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-81240315428260858384558626402096438922249698305625373933 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((81240315428260858384558626402096438922249698305625373933 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 22. -/
theorem ep_Q2_024_partial_22_0042_valid :
    mulPoly ep_Q2_024_coefficient_22_0042
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0043 : Poly :=
[
  term ((4569079916135479 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 22. -/
def ep_Q2_024_partial_22_0043 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 22. -/
theorem ep_Q2_024_partial_22_0043_valid :
    mulPoly ep_Q2_024_coefficient_22_0043
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0044 : Poly :=
[
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 44 for generator 22. -/
def ep_Q2_024_partial_22_0044 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 22. -/
theorem ep_Q2_024_partial_22_0044_valid :
    mulPoly ep_Q2_024_coefficient_22_0044
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0045 : Poly :=
[
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 45 for generator 22. -/
def ep_Q2_024_partial_22_0045 : Poly :=
[
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 2), (12, 1), (15, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 22. -/
theorem ep_Q2_024_partial_22_0045_valid :
    mulPoly ep_Q2_024_coefficient_22_0045
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0046 : Poly :=
[
  term ((-10893858290800909 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 22. -/
def ep_Q2_024_partial_22_0046 : Poly :=
[
  term ((-10893858290800909 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10893858290800909 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 22. -/
theorem ep_Q2_024_partial_22_0046_valid :
    mulPoly ep_Q2_024_coefficient_22_0046
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0047 : Poly :=
[
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 47 for generator 22. -/
def ep_Q2_024_partial_22_0047 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 22. -/
theorem ep_Q2_024_partial_22_0047_valid :
    mulPoly ep_Q2_024_coefficient_22_0047
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0048 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 22. -/
def ep_Q2_024_partial_22_0048 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 22. -/
theorem ep_Q2_024_partial_22_0048_valid :
    mulPoly ep_Q2_024_coefficient_22_0048
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0049 : Poly :=
[
  term ((742460209483593027862498107261497752007077919240776103099 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 49 for generator 22. -/
def ep_Q2_024_partial_22_0049 : Poly :=
[
  term ((742460209483593027862498107261497752007077919240776103099 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-742460209483593027862498107261497752007077919240776103099 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((742460209483593027862498107261497752007077919240776103099 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-742460209483593027862498107261497752007077919240776103099 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 22. -/
theorem ep_Q2_024_partial_22_0049_valid :
    mulPoly ep_Q2_024_coefficient_22_0049
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0050 : Poly :=
[
  term ((79550111447102989 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 22. -/
def ep_Q2_024_partial_22_0050 : Poly :=
[
  term ((79550111447102989 : Rat) / 6976681326919158) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79550111447102989 : Rat) / 13953362653838316) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((79550111447102989 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79550111447102989 : Rat) / 13953362653838316) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 22. -/
theorem ep_Q2_024_partial_22_0050_valid :
    mulPoly ep_Q2_024_coefficient_22_0050
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0051 : Poly :=
[
  term ((-1104560248480339068657833542005231734698 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2)]
]

/-- Partial product 51 for generator 22. -/
def ep_Q2_024_partial_22_0051 : Poly :=
[
  term ((-2209120496960678137315667084010463469396 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((1104560248480339068657833542005231734698 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 2), (13, 2)],
  term ((-2209120496960678137315667084010463469396 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((1104560248480339068657833542005231734698 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 22. -/
theorem ep_Q2_024_partial_22_0051_valid :
    mulPoly ep_Q2_024_coefficient_22_0051
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0052 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 52 for generator 22. -/
def ep_Q2_024_partial_22_0052 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 22. -/
theorem ep_Q2_024_partial_22_0052_valid :
    mulPoly ep_Q2_024_coefficient_22_0052
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0053 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (14, 1)]
]

/-- Partial product 53 for generator 22. -/
def ep_Q2_024_partial_22_0053 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (8, 2), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 22. -/
theorem ep_Q2_024_partial_22_0053_valid :
    mulPoly ep_Q2_024_coefficient_22_0053
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0054 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 54 for generator 22. -/
def ep_Q2_024_partial_22_0054 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 22. -/
theorem ep_Q2_024_partial_22_0054_valid :
    mulPoly ep_Q2_024_coefficient_22_0054
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0055 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 22. -/
def ep_Q2_024_partial_22_0055 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 22. -/
theorem ep_Q2_024_partial_22_0055_valid :
    mulPoly ep_Q2_024_coefficient_22_0055
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0056 : Poly :=
[
  term ((-886231223239486513807593027498961424340302475632948056597 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)]
]

/-- Partial product 56 for generator 22. -/
def ep_Q2_024_partial_22_0056 : Poly :=
[
  term ((-886231223239486513807593027498961424340302475632948056597 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((886231223239486513807593027498961424340302475632948056597 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (15, 2)],
  term ((-886231223239486513807593027498961424340302475632948056597 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((886231223239486513807593027498961424340302475632948056597 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 22. -/
theorem ep_Q2_024_partial_22_0056_valid :
    mulPoly ep_Q2_024_coefficient_22_0056
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0057 : Poly :=
[
  term ((12324487883430863 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 22. -/
def ep_Q2_024_partial_22_0057 : Poly :=
[
  term ((12324487883430863 : Rat) / 2325560442306386) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12324487883430863 : Rat) / 4651120884612772) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((12324487883430863 : Rat) / 2325560442306386) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12324487883430863 : Rat) / 4651120884612772) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 22. -/
theorem ep_Q2_024_partial_22_0057_valid :
    mulPoly ep_Q2_024_coefficient_22_0057
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0058 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 58 for generator 22. -/
def ep_Q2_024_partial_22_0058 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 22. -/
theorem ep_Q2_024_partial_22_0058_valid :
    mulPoly ep_Q2_024_coefficient_22_0058
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0059 : Poly :=
[
  term ((1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 59 for generator 22. -/
def ep_Q2_024_partial_22_0059 : Poly :=
[
  term ((2178349579036134737651108649822320030952 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 2), (9, 1)],
  term ((2178349579036134737651108649822320030952 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 22. -/
theorem ep_Q2_024_partial_22_0059_valid :
    mulPoly ep_Q2_024_coefficient_22_0059
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0060 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 60 for generator 22. -/
def ep_Q2_024_partial_22_0060 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 22. -/
theorem ep_Q2_024_partial_22_0060_valid :
    mulPoly ep_Q2_024_coefficient_22_0060
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0061 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 61 for generator 22. -/
def ep_Q2_024_partial_22_0061 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 22. -/
theorem ep_Q2_024_partial_22_0061_valid :
    mulPoly ep_Q2_024_coefficient_22_0061
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0062 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 22. -/
def ep_Q2_024_partial_22_0062 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 22. -/
theorem ep_Q2_024_partial_22_0062_valid :
    mulPoly ep_Q2_024_coefficient_22_0062
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0063 : Poly :=
[
  term ((141570258935227246768767774510900048188 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 63 for generator 22. -/
def ep_Q2_024_partial_22_0063 : Poly :=
[
  term ((283140517870454493537535549021800096376 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1)],
  term ((-141570258935227246768767774510900048188 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((283140517870454493537535549021800096376 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-141570258935227246768767774510900048188 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 22. -/
theorem ep_Q2_024_partial_22_0063_valid :
    mulPoly ep_Q2_024_coefficient_22_0063
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0064 : Poly :=
[
  term ((-14868546091200395594900912023920948479469237099565863203 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 64 for generator 22. -/
def ep_Q2_024_partial_22_0064 : Poly :=
[
  term ((-14868546091200395594900912023920948479469237099565863203 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((14868546091200395594900912023920948479469237099565863203 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((-14868546091200395594900912023920948479469237099565863203 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((14868546091200395594900912023920948479469237099565863203 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (2, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 22. -/
theorem ep_Q2_024_partial_22_0064_valid :
    mulPoly ep_Q2_024_coefficient_22_0064
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0065 : Poly :=
[
  term ((12268756423974647 : Rat) / 2325560442306386) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 22. -/
def ep_Q2_024_partial_22_0065 : Poly :=
[
  term ((12268756423974647 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12268756423974647 : Rat) / 2325560442306386) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((12268756423974647 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12268756423974647 : Rat) / 2325560442306386) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 22. -/
theorem ep_Q2_024_partial_22_0065_valid :
    mulPoly ep_Q2_024_coefficient_22_0065
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0066 : Poly :=
[
  term ((-315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1)]
]

/-- Partial product 66 for generator 22. -/
def ep_Q2_024_partial_22_0066 : Poly :=
[
  term ((-631517628506636367149065713600653902694 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-631517628506636367149065713600653902694 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 22. -/
theorem ep_Q2_024_partial_22_0066_valid :
    mulPoly ep_Q2_024_coefficient_22_0066
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0067 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 67 for generator 22. -/
def ep_Q2_024_partial_22_0067 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 22. -/
theorem ep_Q2_024_partial_22_0067_valid :
    mulPoly ep_Q2_024_coefficient_22_0067
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0068 : Poly :=
[
  term ((-170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 68 for generator 22. -/
def ep_Q2_024_partial_22_0068 : Poly :=
[
  term ((-341157965882929673323384032952157469648 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 2), (9, 1)],
  term ((-341157965882929673323384032952157469648 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 22. -/
theorem ep_Q2_024_partial_22_0068_valid :
    mulPoly ep_Q2_024_coefficient_22_0068
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0069 : Poly :=
[
  term ((-599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 69 for generator 22. -/
def ep_Q2_024_partial_22_0069 : Poly :=
[
  term ((-1199550225790108651076724475504453678048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 2), (13, 1)],
  term ((-1199550225790108651076724475504453678048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 22. -/
theorem ep_Q2_024_partial_22_0069_valid :
    mulPoly ep_Q2_024_coefficient_22_0069
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0070 : Poly :=
[
  term ((184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 70 for generator 22. -/
def ep_Q2_024_partial_22_0070 : Poly :=
[
  term ((369313049262934730994290639361940535028362523941032068 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1)],
  term ((369313049262934730994290639361940535028362523941032068 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 22. -/
theorem ep_Q2_024_partial_22_0070_valid :
    mulPoly ep_Q2_024_coefficient_22_0070
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0071 : Poly :=
[
  term ((5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 22. -/
def ep_Q2_024_partial_22_0071 : Poly :=
[
  term ((11097351452465712 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((11097351452465712 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 22. -/
theorem ep_Q2_024_partial_22_0071_valid :
    mulPoly ep_Q2_024_coefficient_22_0071
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0072 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 72 for generator 22. -/
def ep_Q2_024_partial_22_0072 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (10, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 22. -/
theorem ep_Q2_024_partial_22_0072_valid :
    mulPoly ep_Q2_024_coefficient_22_0072
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0073 : Poly :=
[
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 73 for generator 22. -/
def ep_Q2_024_partial_22_0073 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 1), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 22. -/
theorem ep_Q2_024_partial_22_0073_valid :
    mulPoly ep_Q2_024_coefficient_22_0073
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0074 : Poly :=
[
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 74 for generator 22. -/
def ep_Q2_024_partial_22_0074 : Poly :=
[
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 22. -/
theorem ep_Q2_024_partial_22_0074_valid :
    mulPoly ep_Q2_024_coefficient_22_0074
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0075 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 22. -/
def ep_Q2_024_partial_22_0075 : Poly :=
[
  term ((-3737871123862340 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 22. -/
theorem ep_Q2_024_partial_22_0075_valid :
    mulPoly ep_Q2_024_coefficient_22_0075
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0076 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 76 for generator 22. -/
def ep_Q2_024_partial_22_0076 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 1), (9, 2), (10, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (11, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 22. -/
theorem ep_Q2_024_partial_22_0076_valid :
    mulPoly ep_Q2_024_coefficient_22_0076
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0077 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 77 for generator 22. -/
def ep_Q2_024_partial_22_0077 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 22. -/
theorem ep_Q2_024_partial_22_0077_valid :
    mulPoly ep_Q2_024_coefficient_22_0077
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0078 : Poly :=
[
  term ((-83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 78 for generator 22. -/
def ep_Q2_024_partial_22_0078 : Poly :=
[
  term ((-167551006886425541818338446459009081152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-167551006886425541818338446459009081152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 22. -/
theorem ep_Q2_024_partial_22_0078_valid :
    mulPoly ep_Q2_024_coefficient_22_0078
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0079 : Poly :=
[
  term ((2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 79 for generator 22. -/
def ep_Q2_024_partial_22_0079 : Poly :=
[
  term ((4861918750901344115871531971578729481697981432324452976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2)],
  term ((4861918750901344115871531971578729481697981432324452976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 22. -/
theorem ep_Q2_024_partial_22_0079_valid :
    mulPoly ep_Q2_024_coefficient_22_0079
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0080 : Poly :=
[
  term ((-3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 22. -/
def ep_Q2_024_partial_22_0080 : Poly :=
[
  term ((-6603025634909760 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6603025634909760 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 22. -/
theorem ep_Q2_024_partial_22_0080_valid :
    mulPoly ep_Q2_024_coefficient_22_0080
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0081 : Poly :=
[
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 81 for generator 22. -/
def ep_Q2_024_partial_22_0081 : Poly :=
[
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 22. -/
theorem ep_Q2_024_partial_22_0081_valid :
    mulPoly ep_Q2_024_coefficient_22_0081
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0082 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 22. -/
def ep_Q2_024_partial_22_0082 : Poly :=
[
  term ((-363244002760710 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 22. -/
theorem ep_Q2_024_partial_22_0082_valid :
    mulPoly ep_Q2_024_coefficient_22_0082
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0083 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 83 for generator 22. -/
def ep_Q2_024_partial_22_0083 : Poly :=
[
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (13, 2)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 22. -/
theorem ep_Q2_024_partial_22_0083_valid :
    mulPoly ep_Q2_024_coefficient_22_0083
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0084 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 84 for generator 22. -/
def ep_Q2_024_partial_22_0084 : Poly :=
[
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (14, 1)],
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 22. -/
theorem ep_Q2_024_partial_22_0084_valid :
    mulPoly ep_Q2_024_coefficient_22_0084
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0085 : Poly :=
[
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 85 for generator 22. -/
def ep_Q2_024_partial_22_0085 : Poly :=
[
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 22. -/
theorem ep_Q2_024_partial_22_0085_valid :
    mulPoly ep_Q2_024_coefficient_22_0085
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0086 : Poly :=
[
  term ((-6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 22. -/
def ep_Q2_024_partial_22_0086 : Poly :=
[
  term ((-12371062197796438 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((-12371062197796438 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 22. -/
theorem ep_Q2_024_partial_22_0086_valid :
    mulPoly ep_Q2_024_coefficient_22_0086
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0087 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 87 for generator 22. -/
def ep_Q2_024_partial_22_0087 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 2), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 22. -/
theorem ep_Q2_024_partial_22_0087_valid :
    mulPoly ep_Q2_024_coefficient_22_0087
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0088 : Poly :=
[
  term ((-781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1)]
]

/-- Partial product 88 for generator 22. -/
def ep_Q2_024_partial_22_0088 : Poly :=
[
  term ((-1562461093231304628631223526731630636142 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2)],
  term ((-1562461093231304628631223526731630636142 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 22. -/
theorem ep_Q2_024_partial_22_0088_valid :
    mulPoly ep_Q2_024_coefficient_22_0088
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0089 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 89 for generator 22. -/
def ep_Q2_024_partial_22_0089 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 22. -/
theorem ep_Q2_024_partial_22_0089_valid :
    mulPoly ep_Q2_024_coefficient_22_0089
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0090 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 90 for generator 22. -/
def ep_Q2_024_partial_22_0090 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 22. -/
theorem ep_Q2_024_partial_22_0090_valid :
    mulPoly ep_Q2_024_coefficient_22_0090
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0091 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 22. -/
def ep_Q2_024_partial_22_0091 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 22. -/
theorem ep_Q2_024_partial_22_0091_valid :
    mulPoly ep_Q2_024_coefficient_22_0091
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0092 : Poly :=
[
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 92 for generator 22. -/
def ep_Q2_024_partial_22_0092 : Poly :=
[
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 22. -/
theorem ep_Q2_024_partial_22_0092_valid :
    mulPoly ep_Q2_024_coefficient_22_0092
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0093 : Poly :=
[
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 93 for generator 22. -/
def ep_Q2_024_partial_22_0093 : Poly :=
[
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 22. -/
theorem ep_Q2_024_partial_22_0093_valid :
    mulPoly ep_Q2_024_coefficient_22_0093
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0094 : Poly :=
[
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 22. -/
def ep_Q2_024_partial_22_0094 : Poly :=
[
  term ((70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 22. -/
theorem ep_Q2_024_partial_22_0094_valid :
    mulPoly ep_Q2_024_coefficient_22_0094
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0095 : Poly :=
[
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 95 for generator 22. -/
def ep_Q2_024_partial_22_0095 : Poly :=
[
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 2)],
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (11, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 22. -/
theorem ep_Q2_024_partial_22_0095_valid :
    mulPoly ep_Q2_024_coefficient_22_0095
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0096 : Poly :=
[
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 96 for generator 22. -/
def ep_Q2_024_partial_22_0096 : Poly :=
[
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 22. -/
theorem ep_Q2_024_partial_22_0096_valid :
    mulPoly ep_Q2_024_coefficient_22_0096
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0097 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 97 for generator 22. -/
def ep_Q2_024_partial_22_0097 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 22. -/
theorem ep_Q2_024_partial_22_0097_valid :
    mulPoly ep_Q2_024_coefficient_22_0097
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0098 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 22. -/
def ep_Q2_024_partial_22_0098 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 22. -/
theorem ep_Q2_024_partial_22_0098_valid :
    mulPoly ep_Q2_024_coefficient_22_0098
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0099 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 99 for generator 22. -/
def ep_Q2_024_partial_22_0099 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 22. -/
theorem ep_Q2_024_partial_22_0099_valid :
    mulPoly ep_Q2_024_coefficient_22_0099
        ep_Q2_024_generator_22_0000_0099 =
      ep_Q2_024_partial_22_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_22_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_22_0000,
  ep_Q2_024_partial_22_0001,
  ep_Q2_024_partial_22_0002,
  ep_Q2_024_partial_22_0003,
  ep_Q2_024_partial_22_0004,
  ep_Q2_024_partial_22_0005,
  ep_Q2_024_partial_22_0006,
  ep_Q2_024_partial_22_0007,
  ep_Q2_024_partial_22_0008,
  ep_Q2_024_partial_22_0009,
  ep_Q2_024_partial_22_0010,
  ep_Q2_024_partial_22_0011,
  ep_Q2_024_partial_22_0012,
  ep_Q2_024_partial_22_0013,
  ep_Q2_024_partial_22_0014,
  ep_Q2_024_partial_22_0015,
  ep_Q2_024_partial_22_0016,
  ep_Q2_024_partial_22_0017,
  ep_Q2_024_partial_22_0018,
  ep_Q2_024_partial_22_0019,
  ep_Q2_024_partial_22_0020,
  ep_Q2_024_partial_22_0021,
  ep_Q2_024_partial_22_0022,
  ep_Q2_024_partial_22_0023,
  ep_Q2_024_partial_22_0024,
  ep_Q2_024_partial_22_0025,
  ep_Q2_024_partial_22_0026,
  ep_Q2_024_partial_22_0027,
  ep_Q2_024_partial_22_0028,
  ep_Q2_024_partial_22_0029,
  ep_Q2_024_partial_22_0030,
  ep_Q2_024_partial_22_0031,
  ep_Q2_024_partial_22_0032,
  ep_Q2_024_partial_22_0033,
  ep_Q2_024_partial_22_0034,
  ep_Q2_024_partial_22_0035,
  ep_Q2_024_partial_22_0036,
  ep_Q2_024_partial_22_0037,
  ep_Q2_024_partial_22_0038,
  ep_Q2_024_partial_22_0039,
  ep_Q2_024_partial_22_0040,
  ep_Q2_024_partial_22_0041,
  ep_Q2_024_partial_22_0042,
  ep_Q2_024_partial_22_0043,
  ep_Q2_024_partial_22_0044,
  ep_Q2_024_partial_22_0045,
  ep_Q2_024_partial_22_0046,
  ep_Q2_024_partial_22_0047,
  ep_Q2_024_partial_22_0048,
  ep_Q2_024_partial_22_0049,
  ep_Q2_024_partial_22_0050,
  ep_Q2_024_partial_22_0051,
  ep_Q2_024_partial_22_0052,
  ep_Q2_024_partial_22_0053,
  ep_Q2_024_partial_22_0054,
  ep_Q2_024_partial_22_0055,
  ep_Q2_024_partial_22_0056,
  ep_Q2_024_partial_22_0057,
  ep_Q2_024_partial_22_0058,
  ep_Q2_024_partial_22_0059,
  ep_Q2_024_partial_22_0060,
  ep_Q2_024_partial_22_0061,
  ep_Q2_024_partial_22_0062,
  ep_Q2_024_partial_22_0063,
  ep_Q2_024_partial_22_0064,
  ep_Q2_024_partial_22_0065,
  ep_Q2_024_partial_22_0066,
  ep_Q2_024_partial_22_0067,
  ep_Q2_024_partial_22_0068,
  ep_Q2_024_partial_22_0069,
  ep_Q2_024_partial_22_0070,
  ep_Q2_024_partial_22_0071,
  ep_Q2_024_partial_22_0072,
  ep_Q2_024_partial_22_0073,
  ep_Q2_024_partial_22_0074,
  ep_Q2_024_partial_22_0075,
  ep_Q2_024_partial_22_0076,
  ep_Q2_024_partial_22_0077,
  ep_Q2_024_partial_22_0078,
  ep_Q2_024_partial_22_0079,
  ep_Q2_024_partial_22_0080,
  ep_Q2_024_partial_22_0081,
  ep_Q2_024_partial_22_0082,
  ep_Q2_024_partial_22_0083,
  ep_Q2_024_partial_22_0084,
  ep_Q2_024_partial_22_0085,
  ep_Q2_024_partial_22_0086,
  ep_Q2_024_partial_22_0087,
  ep_Q2_024_partial_22_0088,
  ep_Q2_024_partial_22_0089,
  ep_Q2_024_partial_22_0090,
  ep_Q2_024_partial_22_0091,
  ep_Q2_024_partial_22_0092,
  ep_Q2_024_partial_22_0093,
  ep_Q2_024_partial_22_0094,
  ep_Q2_024_partial_22_0095,
  ep_Q2_024_partial_22_0096,
  ep_Q2_024_partial_22_0097,
  ep_Q2_024_partial_22_0098,
  ep_Q2_024_partial_22_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_22_0000_0099 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8839920099012043756184109668894915090456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1)],
  term ((283662989173134613791700918547178988419686434067548234733 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-66440291877824642 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4419960049506021878092054834447457545228 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((-283662989173134613791700918547178988419686434067548234733 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((33220145938912321 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8839920099012043756184109668894915090456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((283662989173134613791700918547178988419686434067548234733 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-66440291877824642 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (11, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4419960049506021878092054834447457545228 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((-283662989173134613791700918547178988419686434067548234733 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((33220145938912321 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 3)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (8, 1), (10, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (8, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 1), (9, 2)],
  term ((-82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-21339014074195144291865401037760036293281307975261086418 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-21339014074195144291865401037760036293281307975261086418 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 2), (11, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 3)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 1), (10, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 2)],
  term ((-197609544675297963562825374882937397616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-783215427397116270911994583974376410656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((5318502746486732735587159997374731365268146974109111306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((4588544719859592 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((98804772337648981781412687441468698808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 2), (9, 1)],
  term ((391607713698558135455997291987188205328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-2659251373243366367793579998687365682634073487054555653 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-2294272359929796 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-783215427397116270911994583974376410656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((5318502746486732735587159997374731365268146974109111306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((4588544719859592 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-197609544675297963562825374882937397616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((391607713698558135455997291987188205328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((-2659251373243366367793579998687365682634073487054555653 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((-2294272359929796 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((98804772337648981781412687441468698808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 3)],
  term ((-1741446146149446346381862635564922195096 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((483989155235654636066332401629724065456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((8254118808907186 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((483989155235654636066332401629724065456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((8254118808907186 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1741446146149446346381862635564922195096 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 3)],
  term ((-2487689218795538858925693465315733053176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-907168726627398044301522665793648931576 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-119030043914219485518537739495889676872549589935334719951 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((14909458464765234 : Rat) / 1162780221153193) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 2)],
  term ((572646651949541232341528695471688077024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((-5881162862861044134431519603383266576716 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (10, 1)],
  term ((-251092751805125446114704620943898470736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2588803876684228 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2603558413317821484025710320688599795128 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-19458910134912766 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((71463028544351259775806763065947055254 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((-81240315428260858384558626402096438922249698305625373933 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-10893858290800909 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((742460209483593027862498107261497752007077919240776103099 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((79550111447102989 : Rat) / 6976681326919158) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2209120496960678137315667084010463469396 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-886231223239486513807593027498961424340302475632948056597 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((12324487883430863 : Rat) / 2325560442306386) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2940581431430522067215759801691633288358 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 2)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((453584363313699022150761332896824465788 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((119030043914219485518537739495889676872549589935334719951 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-7454729232382617 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-286323325974770616170764347735844038512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (10, 1)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (12, 1)],
  term ((81240315428260858384558626402096438922249698305625373933 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (12, 1), (13, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 2), (12, 1), (15, 2)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-742460209483593027862498107261497752007077919240776103099 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-79550111447102989 : Rat) / 13953362653838316) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1104560248480339068657833542005231734698 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (8, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (8, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((886231223239486513807593027498961424340302475632948056597 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (15, 2)],
  term ((-12324487883430863 : Rat) / 4651120884612772) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 3)],
  term ((-5881162862861044134431519603383266576716 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)],
  term ((71463028544351259775806763065947055254 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-81240315428260858384558626402096438922249698305625373933 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((46116738420041677998158468131508090822139296914466593797 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10893858290800909 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((742460209483593027862498107261497752007077919240776103099 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((79550111447102989 : Rat) / 6976681326919158) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2209120496960678137315667084010463469396 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-886231223239486513807593027498961424340302475632948056597 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((12324487883430863 : Rat) / 2325560442306386) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-251092751805125446114704620943898470736 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2588803876684228 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2603558413317821484025710320688599795128 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-19458910134912766 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2940581431430522067215759801691633288358 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2)],
  term ((177463058635149882813695888838931844056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3394252663657790040137325182205964706329554064301517559 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2145359092921054 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1078021475492693159831586056207981586772 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((-284392603025249423646626529743804544710113602586811151019 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((24638913532221617 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2487689218795538858925693465315733053176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 2)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1)],
  term ((81240315428260858384558626402096438922249698305625373933 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1), (13, 2)],
  term ((-46116738420041677998158468131508090822139296914466593797 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((10893858290800909 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-742460209483593027862498107261497752007077919240776103099 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-79550111447102989 : Rat) / 13953362653838316) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1104560248480339068657833542005231734698 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(0, 1), (9, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((886231223239486513807593027498961424340302475632948056597 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (15, 2)],
  term ((-12324487883430863 : Rat) / 4651120884612772) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((1816491261347310661804375428129554603612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 3), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((453584363313699022150761332896824465788 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 3), (13, 1)],
  term ((119030043914219485518537739495889676872549589935334719951 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 3), (15, 1)],
  term ((-7454729232382617 : Rat) / 1162780221153193) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-286323325974770616170764347735844038512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 2)],
  term ((2178349579036134737651108649822320030952 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((283140517870454493537535549021800096376 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1)],
  term ((-14868546091200395594900912023920948479469237099565863203 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((12268756423974647 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 2), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-141570258935227246768767774510900048188 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((14868546091200395594900912023920948479469237099565863203 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((-12268756423974647 : Rat) / 2325560442306386) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((283140517870454493537535549021800096376 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-14868546091200395594900912023920948479469237099565863203 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((12268756423974647 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2178349579036134737651108649822320030952 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-141570258935227246768767774510900048188 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (9, 2), (13, 1)],
  term ((14868546091200395594900912023920948479469237099565863203 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-12268756423974647 : Rat) / 2325560442306386) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 3)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 2)],
  term ((-341157965882929673323384032952157469648 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1199550225790108651076724475504453678048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((369313049262934730994290639361940535028362523941032068 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((11097351452465712 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 2), (9, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 2), (13, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1199550225790108651076724475504453678048 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((369313049262934730994290639361940535028362523941032068 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((11097351452465712 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-341157965882929673323384032952157469648 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 3)],
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 1), (9, 2), (10, 1)],
  term ((-631517628506636367149065713600653902694 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((-167551006886425541818338446459009081152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4861918750901344115871531971578729481697981432324452976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6603025634909760 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 2)],
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((-12371062197796438 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 1), (13, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (10, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (14, 1)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 3)],
  term ((-631517628506636367149065713600653902694 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-167551006886425541818338446459009081152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4861918750901344115871531971578729481697981432324452976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-6603025634909760 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2)],
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-12371062197796438 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 2)],
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 2), (11, 1), (13, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (11, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (13, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 3), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 3), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 4)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 2), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 3)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1)],
  term ((-1562461093231304628631223526731630636142 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2)],
  term ((-1562461093231304628631223526731630636142 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1)],
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1)],
  term ((70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2)],
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (11, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 3), (13, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (15, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 4)],
  term ((-7816551174574345793991723044114373147767 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1)],
  term ((7816551174574345793991723044114373147767 : Rat) / 3599128372207431889700080584088617803970) [(8, 2)],
  term ((-7816551174574345793991723044114373147767 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1)],
  term ((7816551174574345793991723044114373147767 : Rat) / 3599128372207431889700080584088617803970) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 99. -/
theorem ep_Q2_024_block_22_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_22_0000_0099
      ep_Q2_024_block_22_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
