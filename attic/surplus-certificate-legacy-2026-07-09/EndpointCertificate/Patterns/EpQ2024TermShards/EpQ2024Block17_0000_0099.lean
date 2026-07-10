/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 17:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_17_0000_0099 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0000 : Poly :=
[
  term ((4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) []
]

/-- Partial product 0 for generator 17. -/
def ep_Q2_024_partial_17_0000 : Poly :=
[
  term ((4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (14, 1)],
  term ((4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (15, 1)],
  term ((-4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(14, 2)],
  term ((-4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem ep_Q2_024_partial_17_0000_valid :
    mulPoly ep_Q2_024_coefficient_17_0000
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0001 : Poly :=
[
  term ((853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1)]
]

/-- Partial product 1 for generator 17. -/
def ep_Q2_024_partial_17_0001 : Poly :=
[
  term ((853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (14, 1)],
  term ((853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (15, 1)],
  term ((-853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (14, 2)],
  term ((-853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem ep_Q2_024_partial_17_0001_valid :
    mulPoly ep_Q2_024_coefficient_17_0001
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0002 : Poly :=
[
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 17. -/
def ep_Q2_024_partial_17_0002 : Poly :=
[
  term ((336550981563442632720847442659916180784 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (6, 1), (9, 1), (14, 1)],
  term ((336550981563442632720847442659916180784 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem ep_Q2_024_partial_17_0002_valid :
    mulPoly ep_Q2_024_coefficient_17_0002
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0003 : Poly :=
[
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 17. -/
def ep_Q2_024_partial_17_0003 : Poly :=
[
  term ((-484585306133652917957055552340511508896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-484585306133652917957055552340511508896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem ep_Q2_024_partial_17_0003_valid :
    mulPoly ep_Q2_024_coefficient_17_0003
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0004 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 17. -/
def ep_Q2_024_partial_17_0004 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem ep_Q2_024_partial_17_0004_valid :
    mulPoly ep_Q2_024_coefficient_17_0004
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0005 : Poly :=
[
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def ep_Q2_024_partial_17_0005 : Poly :=
[
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem ep_Q2_024_partial_17_0005_valid :
    mulPoly ep_Q2_024_coefficient_17_0005
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0006 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 6 for generator 17. -/
def ep_Q2_024_partial_17_0006 : Poly :=
[
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem ep_Q2_024_partial_17_0006_valid :
    mulPoly ep_Q2_024_coefficient_17_0006
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0007 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 7 for generator 17. -/
def ep_Q2_024_partial_17_0007 : Poly :=
[
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (7, 1), (15, 2)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem ep_Q2_024_partial_17_0007_valid :
    mulPoly ep_Q2_024_coefficient_17_0007
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0008 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def ep_Q2_024_partial_17_0008 : Poly :=
[
  term ((3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem ep_Q2_024_partial_17_0008_valid :
    mulPoly ep_Q2_024_coefficient_17_0008
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0009 : Poly :=
[
  term ((-1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 9 for generator 17. -/
def ep_Q2_024_partial_17_0009 : Poly :=
[
  term ((-2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem ep_Q2_024_partial_17_0009_valid :
    mulPoly ep_Q2_024_coefficient_17_0009
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0010 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 10 for generator 17. -/
def ep_Q2_024_partial_17_0010 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem ep_Q2_024_partial_17_0010_valid :
    mulPoly ep_Q2_024_coefficient_17_0010
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0011 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 11 for generator 17. -/
def ep_Q2_024_partial_17_0011 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem ep_Q2_024_partial_17_0011_valid :
    mulPoly ep_Q2_024_coefficient_17_0011
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0012 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def ep_Q2_024_partial_17_0012 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem ep_Q2_024_partial_17_0012_valid :
    mulPoly ep_Q2_024_coefficient_17_0012
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0013 : Poly :=
[
  term ((247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 13 for generator 17. -/
def ep_Q2_024_partial_17_0013 : Poly :=
[
  term ((495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem ep_Q2_024_partial_17_0013_valid :
    mulPoly ep_Q2_024_coefficient_17_0013
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0014 : Poly :=
[
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 14 for generator 17. -/
def ep_Q2_024_partial_17_0014 : Poly :=
[
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (15, 3)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem ep_Q2_024_partial_17_0014_valid :
    mulPoly ep_Q2_024_coefficient_17_0014
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0015 : Poly :=
[
  term ((6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def ep_Q2_024_partial_17_0015 : Poly :=
[
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem ep_Q2_024_partial_17_0015_valid :
    mulPoly ep_Q2_024_coefficient_17_0015
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0016 : Poly :=
[
  term ((-275989760439192731909499751266012953492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 16 for generator 17. -/
def ep_Q2_024_partial_17_0016 : Poly :=
[
  term ((-551979520878385463818999502532025906984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-551979520878385463818999502532025906984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((275989760439192731909499751266012953492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((275989760439192731909499751266012953492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem ep_Q2_024_partial_17_0016_valid :
    mulPoly ep_Q2_024_coefficient_17_0016
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0017 : Poly :=
[
  term ((10336131250137519220274178054604991165941475824623920117 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 17 for generator 17. -/
def ep_Q2_024_partial_17_0017 : Poly :=
[
  term ((10336131250137519220274178054604991165941475824623920117 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10336131250137519220274178054604991165941475824623920117 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-10336131250137519220274178054604991165941475824623920117 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10336131250137519220274178054604991165941475824623920117 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem ep_Q2_024_partial_17_0017_valid :
    mulPoly ep_Q2_024_coefficient_17_0017
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0018 : Poly :=
[
  term ((-2806034716947389 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def ep_Q2_024_partial_17_0018 : Poly :=
[
  term ((-5612069433894778 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5612069433894778 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2806034716947389 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2806034716947389 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem ep_Q2_024_partial_17_0018_valid :
    mulPoly ep_Q2_024_coefficient_17_0018
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0019 : Poly :=
[
  term ((17441542770706915596575437887457256791372 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 19 for generator 17. -/
def ep_Q2_024_partial_17_0019 : Poly :=
[
  term ((34883085541413831193150875774914513582744 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((34883085541413831193150875774914513582744 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-17441542770706915596575437887457256791372 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-17441542770706915596575437887457256791372 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem ep_Q2_024_partial_17_0019_valid :
    mulPoly ep_Q2_024_coefficient_17_0019
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0020 : Poly :=
[
  term ((304493063200360672092520973415460034608055572874832630713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 20 for generator 17. -/
def ep_Q2_024_partial_17_0020 : Poly :=
[
  term ((304493063200360672092520973415460034608055572874832630713 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((304493063200360672092520973415460034608055572874832630713 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-304493063200360672092520973415460034608055572874832630713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-304493063200360672092520973415460034608055572874832630713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem ep_Q2_024_partial_17_0020_valid :
    mulPoly ep_Q2_024_coefficient_17_0020
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0021 : Poly :=
[
  term ((-55367998906079413 : Rat) / 3488340663459579) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def ep_Q2_024_partial_17_0021 : Poly :=
[
  term ((-110735997812158826 : Rat) / 3488340663459579) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110735997812158826 : Rat) / 3488340663459579) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((55367998906079413 : Rat) / 3488340663459579) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((55367998906079413 : Rat) / 3488340663459579) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem ep_Q2_024_partial_17_0021_valid :
    mulPoly ep_Q2_024_coefficient_17_0021
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0022 : Poly :=
[
  term ((-84272910475517436045976846456678932668 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (9, 2)]
]

/-- Partial product 22 for generator 17. -/
def ep_Q2_024_partial_17_0022 : Poly :=
[
  term ((-168545820951034872091953692913357865336 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-168545820951034872091953692913357865336 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((84272910475517436045976846456678932668 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (9, 2), (14, 2)],
  term ((84272910475517436045976846456678932668 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem ep_Q2_024_partial_17_0022_valid :
    mulPoly ep_Q2_024_coefficient_17_0022
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0023 : Poly :=
[
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 17. -/
def ep_Q2_024_partial_17_0023 : Poly :=
[
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 7881347051966269648345537549459880487011410366503910) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 7881347051966269648345537549459880487011410366503910) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem ep_Q2_024_partial_17_0023_valid :
    mulPoly ep_Q2_024_coefficient_17_0023
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0024 : Poly :=
[
  term ((3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def ep_Q2_024_partial_17_0024 : Poly :=
[
  term ((7349916156000066 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7349916156000066 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem ep_Q2_024_partial_17_0024_valid :
    mulPoly ep_Q2_024_coefficient_17_0024
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0025 : Poly :=
[
  term ((125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 25 for generator 17. -/
def ep_Q2_024_partial_17_0025 : Poly :=
[
  term ((250385196650307916725786848369647256344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((250385196650307916725786848369647256344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem ep_Q2_024_partial_17_0025_valid :
    mulPoly ep_Q2_024_coefficient_17_0025
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0026 : Poly :=
[
  term ((-19310972984137371790808696587043236156631077225026078756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 26 for generator 17. -/
def ep_Q2_024_partial_17_0026 : Poly :=
[
  term ((-38621945968274743581617393174086472313262154450052157512 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38621945968274743581617393174086472313262154450052157512 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((19310972984137371790808696587043236156631077225026078756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((19310972984137371790808696587043236156631077225026078756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem ep_Q2_024_partial_17_0026_valid :
    mulPoly ep_Q2_024_coefficient_17_0026
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0027 : Poly :=
[
  term ((-16674072068982140 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def ep_Q2_024_partial_17_0027 : Poly :=
[
  term ((-33348144137964280 : Rat) / 3488340663459579) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33348144137964280 : Rat) / 3488340663459579) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16674072068982140 : Rat) / 3488340663459579) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16674072068982140 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem ep_Q2_024_partial_17_0027_valid :
    mulPoly ep_Q2_024_coefficient_17_0027
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0028 : Poly :=
[
  term ((5329083543433803306789227163304061650136 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2)]
]

/-- Partial product 28 for generator 17. -/
def ep_Q2_024_partial_17_0028 : Poly :=
[
  term ((10658167086867606613578454326608123300272 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((10658167086867606613578454326608123300272 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-5329083543433803306789227163304061650136 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 2)],
  term ((-5329083543433803306789227163304061650136 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem ep_Q2_024_partial_17_0028_valid :
    mulPoly ep_Q2_024_coefficient_17_0028
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0029 : Poly :=
[
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (15, 2)]
]

/-- Partial product 29 for generator 17. -/
def ep_Q2_024_partial_17_0029 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 3)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (14, 2), (15, 2)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem ep_Q2_024_partial_17_0029_valid :
    mulPoly ep_Q2_024_coefficient_17_0029
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0030 : Poly :=
[
  term ((224563777214800 : Rat) / 1162780221153193) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 17. -/
def ep_Q2_024_partial_17_0030 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-224563777214800 : Rat) / 1162780221153193) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-224563777214800 : Rat) / 1162780221153193) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem ep_Q2_024_partial_17_0030_valid :
    mulPoly ep_Q2_024_coefficient_17_0030
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0031 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 31 for generator 17. -/
def ep_Q2_024_partial_17_0031 : Poly :=
[
  term ((8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem ep_Q2_024_partial_17_0031_valid :
    mulPoly ep_Q2_024_coefficient_17_0031
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0032 : Poly :=
[
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 32 for generator 17. -/
def ep_Q2_024_partial_17_0032 : Poly :=
[
  term ((976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem ep_Q2_024_partial_17_0032_valid :
    mulPoly ep_Q2_024_coefficient_17_0032
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0033 : Poly :=
[
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 33 for generator 17. -/
def ep_Q2_024_partial_17_0033 : Poly :=
[
  term ((-2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem ep_Q2_024_partial_17_0033_valid :
    mulPoly ep_Q2_024_coefficient_17_0033
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0034 : Poly :=
[
  term ((2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 34 for generator 17. -/
def ep_Q2_024_partial_17_0034 : Poly :=
[
  term ((4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem ep_Q2_024_partial_17_0034_valid :
    mulPoly ep_Q2_024_coefficient_17_0034
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0035 : Poly :=
[
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 35 for generator 17. -/
def ep_Q2_024_partial_17_0035 : Poly :=
[
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem ep_Q2_024_partial_17_0035_valid :
    mulPoly ep_Q2_024_coefficient_17_0035
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0036 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 36 for generator 17. -/
def ep_Q2_024_partial_17_0036 : Poly :=
[
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem ep_Q2_024_partial_17_0036_valid :
    mulPoly ep_Q2_024_coefficient_17_0036
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0037 : Poly :=
[
  term ((-1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 17. -/
def ep_Q2_024_partial_17_0037 : Poly :=
[
  term ((-3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem ep_Q2_024_partial_17_0037_valid :
    mulPoly ep_Q2_024_coefficient_17_0037
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0038 : Poly :=
[
  term ((-346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 38 for generator 17. -/
def ep_Q2_024_partial_17_0038 : Poly :=
[
  term ((-693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem ep_Q2_024_partial_17_0038_valid :
    mulPoly ep_Q2_024_coefficient_17_0038
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0039 : Poly :=
[
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 39 for generator 17. -/
def ep_Q2_024_partial_17_0039 : Poly :=
[
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 17. -/
theorem ep_Q2_024_partial_17_0039_valid :
    mulPoly ep_Q2_024_coefficient_17_0039
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0040 : Poly :=
[
  term ((4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 17. -/
def ep_Q2_024_partial_17_0040 : Poly :=
[
  term ((9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 17. -/
theorem ep_Q2_024_partial_17_0040_valid :
    mulPoly ep_Q2_024_coefficient_17_0040
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0041 : Poly :=
[
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1)]
]

/-- Partial product 41 for generator 17. -/
def ep_Q2_024_partial_17_0041 : Poly :=
[
  term ((636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 17. -/
theorem ep_Q2_024_partial_17_0041_valid :
    mulPoly ep_Q2_024_coefficient_17_0041
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0042 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 42 for generator 17. -/
def ep_Q2_024_partial_17_0042 : Poly :=
[
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (6, 1), (14, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 17. -/
theorem ep_Q2_024_partial_17_0042_valid :
    mulPoly ep_Q2_024_coefficient_17_0042
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0043 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 43 for generator 17. -/
def ep_Q2_024_partial_17_0043 : Poly :=
[
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 17. -/
theorem ep_Q2_024_partial_17_0043_valid :
    mulPoly ep_Q2_024_coefficient_17_0043
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0044 : Poly :=
[
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 44 for generator 17. -/
def ep_Q2_024_partial_17_0044 : Poly :=
[
  term ((18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 17. -/
theorem ep_Q2_024_partial_17_0044_valid :
    mulPoly ep_Q2_024_coefficient_17_0044
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0045 : Poly :=
[
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 45 for generator 17. -/
def ep_Q2_024_partial_17_0045 : Poly :=
[
  term ((-29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 17. -/
theorem ep_Q2_024_partial_17_0045_valid :
    mulPoly ep_Q2_024_coefficient_17_0045
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0046 : Poly :=
[
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 17. -/
def ep_Q2_024_partial_17_0046 : Poly :=
[
  term ((612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 17. -/
theorem ep_Q2_024_partial_17_0046_valid :
    mulPoly ep_Q2_024_coefficient_17_0046
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0047 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 47 for generator 17. -/
def ep_Q2_024_partial_17_0047 : Poly :=
[
  term ((3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 17. -/
theorem ep_Q2_024_partial_17_0047_valid :
    mulPoly ep_Q2_024_coefficient_17_0047
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0048 : Poly :=
[
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 48 for generator 17. -/
def ep_Q2_024_partial_17_0048 : Poly :=
[
  term ((-1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 17. -/
theorem ep_Q2_024_partial_17_0048_valid :
    mulPoly ep_Q2_024_coefficient_17_0048
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0049 : Poly :=
[
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 49 for generator 17. -/
def ep_Q2_024_partial_17_0049 : Poly :=
[
  term ((17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 17. -/
theorem ep_Q2_024_partial_17_0049_valid :
    mulPoly ep_Q2_024_coefficient_17_0049
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0050 : Poly :=
[
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 17. -/
def ep_Q2_024_partial_17_0050 : Poly :=
[
  term ((-10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 17. -/
theorem ep_Q2_024_partial_17_0050_valid :
    mulPoly ep_Q2_024_coefficient_17_0050
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0051 : Poly :=
[
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 51 for generator 17. -/
def ep_Q2_024_partial_17_0051 : Poly :=
[
  term ((-883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 2), (14, 1)],
  term ((-883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 2)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 17. -/
theorem ep_Q2_024_partial_17_0051_valid :
    mulPoly ep_Q2_024_coefficient_17_0051
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0052 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 52 for generator 17. -/
def ep_Q2_024_partial_17_0052 : Poly :=
[
  term ((359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 17. -/
theorem ep_Q2_024_partial_17_0052_valid :
    mulPoly ep_Q2_024_coefficient_17_0052
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0053 : Poly :=
[
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 53 for generator 17. -/
def ep_Q2_024_partial_17_0053 : Poly :=
[
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 17. -/
theorem ep_Q2_024_partial_17_0053_valid :
    mulPoly ep_Q2_024_coefficient_17_0053
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0054 : Poly :=
[
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 54 for generator 17. -/
def ep_Q2_024_partial_17_0054 : Poly :=
[
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 17. -/
theorem ep_Q2_024_partial_17_0054_valid :
    mulPoly ep_Q2_024_coefficient_17_0054
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0055 : Poly :=
[
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 17. -/
def ep_Q2_024_partial_17_0055 : Poly :=
[
  term ((-2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 17. -/
theorem ep_Q2_024_partial_17_0055_valid :
    mulPoly ep_Q2_024_coefficient_17_0055
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0056 : Poly :=
[
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 56 for generator 17. -/
def ep_Q2_024_partial_17_0056 : Poly :=
[
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 17. -/
theorem ep_Q2_024_partial_17_0056_valid :
    mulPoly ep_Q2_024_coefficient_17_0056
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0057 : Poly :=
[
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 17. -/
def ep_Q2_024_partial_17_0057 : Poly :=
[
  term ((-1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 17. -/
theorem ep_Q2_024_partial_17_0057_valid :
    mulPoly ep_Q2_024_coefficient_17_0057
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0058 : Poly :=
[
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 58 for generator 17. -/
def ep_Q2_024_partial_17_0058 : Poly :=
[
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (13, 2), (14, 1)],
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 17. -/
theorem ep_Q2_024_partial_17_0058_valid :
    mulPoly ep_Q2_024_coefficient_17_0058
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0059 : Poly :=
[
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 59 for generator 17. -/
def ep_Q2_024_partial_17_0059 : Poly :=
[
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 17. -/
theorem ep_Q2_024_partial_17_0059_valid :
    mulPoly ep_Q2_024_coefficient_17_0059
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0060 : Poly :=
[
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 60 for generator 17. -/
def ep_Q2_024_partial_17_0060 : Poly :=
[
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 17. -/
theorem ep_Q2_024_partial_17_0060_valid :
    mulPoly ep_Q2_024_coefficient_17_0060
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0061 : Poly :=
[
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 17. -/
def ep_Q2_024_partial_17_0061 : Poly :=
[
  term ((1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 17. -/
theorem ep_Q2_024_partial_17_0061_valid :
    mulPoly ep_Q2_024_coefficient_17_0061
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0062 : Poly :=
[
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 62 for generator 17. -/
def ep_Q2_024_partial_17_0062 : Poly :=
[
  term ((287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 17. -/
theorem ep_Q2_024_partial_17_0062_valid :
    mulPoly ep_Q2_024_coefficient_17_0062
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0063 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 63 for generator 17. -/
def ep_Q2_024_partial_17_0063 : Poly :=
[
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 17. -/
theorem ep_Q2_024_partial_17_0063_valid :
    mulPoly ep_Q2_024_coefficient_17_0063
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0064 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 64 for generator 17. -/
def ep_Q2_024_partial_17_0064 : Poly :=
[
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 17. -/
theorem ep_Q2_024_partial_17_0064_valid :
    mulPoly ep_Q2_024_coefficient_17_0064
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0065 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 17. -/
def ep_Q2_024_partial_17_0065 : Poly :=
[
  term ((-7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 17. -/
theorem ep_Q2_024_partial_17_0065_valid :
    mulPoly ep_Q2_024_coefficient_17_0065
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0066 : Poly :=
[
  term ((72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 66 for generator 17. -/
def ep_Q2_024_partial_17_0066 : Poly :=
[
  term ((145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((-72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 17. -/
theorem ep_Q2_024_partial_17_0066_valid :
    mulPoly ep_Q2_024_coefficient_17_0066
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0067 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 67 for generator 17. -/
def ep_Q2_024_partial_17_0067 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 17. -/
theorem ep_Q2_024_partial_17_0067_valid :
    mulPoly ep_Q2_024_coefficient_17_0067
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0068 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 68 for generator 17. -/
def ep_Q2_024_partial_17_0068 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 17. -/
theorem ep_Q2_024_partial_17_0068_valid :
    mulPoly ep_Q2_024_coefficient_17_0068
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0069 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 17. -/
def ep_Q2_024_partial_17_0069 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 17. -/
theorem ep_Q2_024_partial_17_0069_valid :
    mulPoly ep_Q2_024_coefficient_17_0069
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0070 : Poly :=
[
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 70 for generator 17. -/
def ep_Q2_024_partial_17_0070 : Poly :=
[
  term ((-132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 17. -/
theorem ep_Q2_024_partial_17_0070_valid :
    mulPoly ep_Q2_024_coefficient_17_0070
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0071 : Poly :=
[
  term ((6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 17. -/
def ep_Q2_024_partial_17_0071 : Poly :=
[
  term ((13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 17. -/
theorem ep_Q2_024_partial_17_0071_valid :
    mulPoly ep_Q2_024_coefficient_17_0071
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0072 : Poly :=
[
  term ((-5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)]
]

/-- Partial product 72 for generator 17. -/
def ep_Q2_024_partial_17_0072 : Poly :=
[
  term ((-11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 2)],
  term ((5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 17. -/
theorem ep_Q2_024_partial_17_0072_valid :
    mulPoly ep_Q2_024_coefficient_17_0072
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0073 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 73 for generator 17. -/
def ep_Q2_024_partial_17_0073 : Poly :=
[
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 17. -/
theorem ep_Q2_024_partial_17_0073_valid :
    mulPoly ep_Q2_024_coefficient_17_0073
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0074 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 17. -/
def ep_Q2_024_partial_17_0074 : Poly :=
[
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 17. -/
theorem ep_Q2_024_partial_17_0074_valid :
    mulPoly ep_Q2_024_coefficient_17_0074
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0075 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 17. -/
def ep_Q2_024_partial_17_0075 : Poly :=
[
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 17. -/
theorem ep_Q2_024_partial_17_0075_valid :
    mulPoly ep_Q2_024_coefficient_17_0075
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0076 : Poly :=
[
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 76 for generator 17. -/
def ep_Q2_024_partial_17_0076 : Poly :=
[
  term ((3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 17. -/
theorem ep_Q2_024_partial_17_0076_valid :
    mulPoly ep_Q2_024_coefficient_17_0076
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0077 : Poly :=
[
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 77 for generator 17. -/
def ep_Q2_024_partial_17_0077 : Poly :=
[
  term ((120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 17. -/
theorem ep_Q2_024_partial_17_0077_valid :
    mulPoly ep_Q2_024_coefficient_17_0077
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0078 : Poly :=
[
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 17. -/
def ep_Q2_024_partial_17_0078 : Poly :=
[
  term ((-26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 17. -/
theorem ep_Q2_024_partial_17_0078_valid :
    mulPoly ep_Q2_024_coefficient_17_0078
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0079 : Poly :=
[
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 79 for generator 17. -/
def ep_Q2_024_partial_17_0079 : Poly :=
[
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 2)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 17. -/
theorem ep_Q2_024_partial_17_0079_valid :
    mulPoly ep_Q2_024_coefficient_17_0079
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0080 : Poly :=
[
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 80 for generator 17. -/
def ep_Q2_024_partial_17_0080 : Poly :=
[
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 17. -/
theorem ep_Q2_024_partial_17_0080_valid :
    mulPoly ep_Q2_024_coefficient_17_0080
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0081 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 81 for generator 17. -/
def ep_Q2_024_partial_17_0081 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 17. -/
theorem ep_Q2_024_partial_17_0081_valid :
    mulPoly ep_Q2_024_coefficient_17_0081
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0082 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 17. -/
def ep_Q2_024_partial_17_0082 : Poly :=
[
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 17. -/
theorem ep_Q2_024_partial_17_0082_valid :
    mulPoly ep_Q2_024_coefficient_17_0082
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0083 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 83 for generator 17. -/
def ep_Q2_024_partial_17_0083 : Poly :=
[
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 17. -/
theorem ep_Q2_024_partial_17_0083_valid :
    mulPoly ep_Q2_024_coefficient_17_0083
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0084 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 84 for generator 17. -/
def ep_Q2_024_partial_17_0084 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 17. -/
theorem ep_Q2_024_partial_17_0084_valid :
    mulPoly ep_Q2_024_coefficient_17_0084
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0085 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 17. -/
def ep_Q2_024_partial_17_0085 : Poly :=
[
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 17. -/
theorem ep_Q2_024_partial_17_0085_valid :
    mulPoly ep_Q2_024_coefficient_17_0085
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0086 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 86 for generator 17. -/
def ep_Q2_024_partial_17_0086 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 17. -/
theorem ep_Q2_024_partial_17_0086_valid :
    mulPoly ep_Q2_024_coefficient_17_0086
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0087 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 17. -/
def ep_Q2_024_partial_17_0087 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 17. -/
theorem ep_Q2_024_partial_17_0087_valid :
    mulPoly ep_Q2_024_coefficient_17_0087
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0088 : Poly :=
[
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 88 for generator 17. -/
def ep_Q2_024_partial_17_0088 : Poly :=
[
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 17. -/
theorem ep_Q2_024_partial_17_0088_valid :
    mulPoly ep_Q2_024_coefficient_17_0088
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0089 : Poly :=
[
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 17. -/
def ep_Q2_024_partial_17_0089 : Poly :=
[
  term ((-49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 17. -/
theorem ep_Q2_024_partial_17_0089_valid :
    mulPoly ep_Q2_024_coefficient_17_0089
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0090 : Poly :=
[
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 90 for generator 17. -/
def ep_Q2_024_partial_17_0090 : Poly :=
[
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1)],
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 17. -/
theorem ep_Q2_024_partial_17_0090_valid :
    mulPoly ep_Q2_024_coefficient_17_0090
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0091 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1)]
]

/-- Partial product 91 for generator 17. -/
def ep_Q2_024_partial_17_0091 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 17. -/
theorem ep_Q2_024_partial_17_0091_valid :
    mulPoly ep_Q2_024_coefficient_17_0091
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0092 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 92 for generator 17. -/
def ep_Q2_024_partial_17_0092 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 17. -/
theorem ep_Q2_024_partial_17_0092_valid :
    mulPoly ep_Q2_024_coefficient_17_0092
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0093 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 93 for generator 17. -/
def ep_Q2_024_partial_17_0093 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 4)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 17. -/
theorem ep_Q2_024_partial_17_0093_valid :
    mulPoly ep_Q2_024_coefficient_17_0093
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0094 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 17. -/
def ep_Q2_024_partial_17_0094 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 17. -/
theorem ep_Q2_024_partial_17_0094_valid :
    mulPoly ep_Q2_024_coefficient_17_0094
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0095 : Poly :=
[
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 95 for generator 17. -/
def ep_Q2_024_partial_17_0095 : Poly :=
[
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (7, 1), (15, 3)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 17. -/
theorem ep_Q2_024_partial_17_0095_valid :
    mulPoly ep_Q2_024_coefficient_17_0095
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0096 : Poly :=
[
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 17. -/
def ep_Q2_024_partial_17_0096 : Poly :=
[
  term ((23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 17. -/
theorem ep_Q2_024_partial_17_0096_valid :
    mulPoly ep_Q2_024_coefficient_17_0096
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0097 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1)]
]

/-- Partial product 97 for generator 17. -/
def ep_Q2_024_partial_17_0097 : Poly :=
[
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 17. -/
theorem ep_Q2_024_partial_17_0097_valid :
    mulPoly ep_Q2_024_coefficient_17_0097
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0098 : Poly :=
[
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1)]
]

/-- Partial product 98 for generator 17. -/
def ep_Q2_024_partial_17_0098 : Poly :=
[
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (6, 1), (13, 1), (14, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 2)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 17. -/
theorem ep_Q2_024_partial_17_0098_valid :
    mulPoly ep_Q2_024_coefficient_17_0098
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0099 : Poly :=
[
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 1)]
]

/-- Partial product 99 for generator 17. -/
def ep_Q2_024_partial_17_0099 : Poly :=
[
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (7, 1), (15, 2)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 17. -/
theorem ep_Q2_024_partial_17_0099_valid :
    mulPoly ep_Q2_024_coefficient_17_0099
        ep_Q2_024_generator_17_0000_0099 =
      ep_Q2_024_partial_17_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_17_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_17_0000,
  ep_Q2_024_partial_17_0001,
  ep_Q2_024_partial_17_0002,
  ep_Q2_024_partial_17_0003,
  ep_Q2_024_partial_17_0004,
  ep_Q2_024_partial_17_0005,
  ep_Q2_024_partial_17_0006,
  ep_Q2_024_partial_17_0007,
  ep_Q2_024_partial_17_0008,
  ep_Q2_024_partial_17_0009,
  ep_Q2_024_partial_17_0010,
  ep_Q2_024_partial_17_0011,
  ep_Q2_024_partial_17_0012,
  ep_Q2_024_partial_17_0013,
  ep_Q2_024_partial_17_0014,
  ep_Q2_024_partial_17_0015,
  ep_Q2_024_partial_17_0016,
  ep_Q2_024_partial_17_0017,
  ep_Q2_024_partial_17_0018,
  ep_Q2_024_partial_17_0019,
  ep_Q2_024_partial_17_0020,
  ep_Q2_024_partial_17_0021,
  ep_Q2_024_partial_17_0022,
  ep_Q2_024_partial_17_0023,
  ep_Q2_024_partial_17_0024,
  ep_Q2_024_partial_17_0025,
  ep_Q2_024_partial_17_0026,
  ep_Q2_024_partial_17_0027,
  ep_Q2_024_partial_17_0028,
  ep_Q2_024_partial_17_0029,
  ep_Q2_024_partial_17_0030,
  ep_Q2_024_partial_17_0031,
  ep_Q2_024_partial_17_0032,
  ep_Q2_024_partial_17_0033,
  ep_Q2_024_partial_17_0034,
  ep_Q2_024_partial_17_0035,
  ep_Q2_024_partial_17_0036,
  ep_Q2_024_partial_17_0037,
  ep_Q2_024_partial_17_0038,
  ep_Q2_024_partial_17_0039,
  ep_Q2_024_partial_17_0040,
  ep_Q2_024_partial_17_0041,
  ep_Q2_024_partial_17_0042,
  ep_Q2_024_partial_17_0043,
  ep_Q2_024_partial_17_0044,
  ep_Q2_024_partial_17_0045,
  ep_Q2_024_partial_17_0046,
  ep_Q2_024_partial_17_0047,
  ep_Q2_024_partial_17_0048,
  ep_Q2_024_partial_17_0049,
  ep_Q2_024_partial_17_0050,
  ep_Q2_024_partial_17_0051,
  ep_Q2_024_partial_17_0052,
  ep_Q2_024_partial_17_0053,
  ep_Q2_024_partial_17_0054,
  ep_Q2_024_partial_17_0055,
  ep_Q2_024_partial_17_0056,
  ep_Q2_024_partial_17_0057,
  ep_Q2_024_partial_17_0058,
  ep_Q2_024_partial_17_0059,
  ep_Q2_024_partial_17_0060,
  ep_Q2_024_partial_17_0061,
  ep_Q2_024_partial_17_0062,
  ep_Q2_024_partial_17_0063,
  ep_Q2_024_partial_17_0064,
  ep_Q2_024_partial_17_0065,
  ep_Q2_024_partial_17_0066,
  ep_Q2_024_partial_17_0067,
  ep_Q2_024_partial_17_0068,
  ep_Q2_024_partial_17_0069,
  ep_Q2_024_partial_17_0070,
  ep_Q2_024_partial_17_0071,
  ep_Q2_024_partial_17_0072,
  ep_Q2_024_partial_17_0073,
  ep_Q2_024_partial_17_0074,
  ep_Q2_024_partial_17_0075,
  ep_Q2_024_partial_17_0076,
  ep_Q2_024_partial_17_0077,
  ep_Q2_024_partial_17_0078,
  ep_Q2_024_partial_17_0079,
  ep_Q2_024_partial_17_0080,
  ep_Q2_024_partial_17_0081,
  ep_Q2_024_partial_17_0082,
  ep_Q2_024_partial_17_0083,
  ep_Q2_024_partial_17_0084,
  ep_Q2_024_partial_17_0085,
  ep_Q2_024_partial_17_0086,
  ep_Q2_024_partial_17_0087,
  ep_Q2_024_partial_17_0088,
  ep_Q2_024_partial_17_0089,
  ep_Q2_024_partial_17_0090,
  ep_Q2_024_partial_17_0091,
  ep_Q2_024_partial_17_0092,
  ep_Q2_024_partial_17_0093,
  ep_Q2_024_partial_17_0094,
  ep_Q2_024_partial_17_0095,
  ep_Q2_024_partial_17_0096,
  ep_Q2_024_partial_17_0097,
  ep_Q2_024_partial_17_0098,
  ep_Q2_024_partial_17_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_17_0000_0099 : Poly :=
[
  term ((336550981563442632720847442659916180784 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (6, 1), (9, 1), (14, 1)],
  term ((-484585306133652917957055552340511508896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((336550981563442632720847442659916180784 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-484585306133652917957055552340511508896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((19703340389129022 : Rat) / 1162780221153193) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (1, 1), (15, 3)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186424026192784946854166822616886049792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-17864461639187578218700168943739902602175097017053879744 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (7, 1), (15, 2)],
  term ((3593020435436800 : Rat) / 1162780221153193) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-551979520878385463818999502532025906984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((10336131250137519220274178054604991165941475824623920117 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5612069433894778 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34883085541413831193150875774914513582744 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((304493063200360672092520973415460034608055572874832630713 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-110735997812158826 : Rat) / 3488340663459579) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168545820951034872091953692913357865336 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-237388069701818425679127847259107306728735847934448923 : Rat) / 7881347051966269648345537549459880487011410366503910) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7349916156000066 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((250385196650307916725786848369647256344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-38621945968274743581617393174086472313262154450052157512 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33348144137964280 : Rat) / 3488340663459579) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10658167086867606613578454326608123300272 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (14, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-551979520878385463818999502532025906984 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((10336131250137519220274178054604991165941475824623920117 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5612069433894778 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((34883085541413831193150875774914513582744 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((61560251067495838581240822200954484654921941065851830909 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-110735997812158826 : Rat) / 3488340663459579) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-168545820951034872091953692913357865336 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-41901889340399566488609546116868256771603212872266099739 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((7349916156000066 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((250385196650307916725786848369647256344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (15, 3)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-23230797446789353827839112615773415577712782266100745596 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-33348144137964280 : Rat) / 3488340663459579) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((10658167086867606613578454326608123300272 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((853492242690111599427956437383942032069 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (7, 1), (15, 1)],
  term ((-811278348682050291022451112079921546463409203312095447 : Rat) / 23644041155898808945036612648379641461034231099511730) [(0, 1), (7, 1), (15, 3)],
  term ((-6182921623035470 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (7, 2), (12, 1), (15, 2)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 2), (15, 2)],
  term ((13264098354930140 : Rat) / 1162780221153193) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((275989760439192731909499751266012953492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((275989760439192731909499751266012953492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10336131250137519220274178054604991165941475824623920117 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2806034716947389 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10336131250137519220274178054604991165941475824623920117 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((2806034716947389 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17441542770706915596575437887457256791372 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-17441542770706915596575437887457256791372 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-304493063200360672092520973415460034608055572874832630713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((55367998906079413 : Rat) / 3488340663459579) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-304493063200360672092520973415460034608055572874832630713 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (9, 1), (15, 3)],
  term ((55367998906079413 : Rat) / 3488340663459579) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((84272910475517436045976846456678932668 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (9, 2), (14, 2)],
  term ((84272910475517436045976846456678932668 : Rat) / 10167029300020994038700792610419824305) [(0, 1), (9, 2), (15, 2)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((237388069701818425679127847259107306728735847934448923 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3674958078000033 : Rat) / 1162780221153193) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-125192598325153958362893424184823628172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((19310972984137371790808696587043236156631077225026078756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((16674072068982140 : Rat) / 3488340663459579) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((19310972984137371790808696587043236156631077225026078756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (15, 3)],
  term ((16674072068982140 : Rat) / 3488340663459579) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5329083543433803306789227163304061650136 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 2)],
  term ((-5329083543433803306789227163304061650136 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (15, 2)],
  term ((-853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (14, 2)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (14, 2), (15, 2)],
  term ((-224563777214800 : Rat) / 1162780221153193) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-853492242690111599427956437383942032069 : Rat) / 3599128372207431889700080584088617803970) [(0, 1), (15, 2)],
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (15, 4)],
  term ((-224563777214800 : Rat) / 1162780221153193) [(0, 1), (15, 4), (16, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((4056273048307645354412530146604063118008 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2)],
  term ((-3530759285383524 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-693149333427189174185131041977358325136 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-81553505544066326432312753825874637787777401964558204621 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2074172699534206160586060347251907595136 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((-2028136524153822677206265073302031559004 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((1765379642691762 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((346574666713594587092565520988679162568 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (15, 3)],
  term ((-4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (6, 1), (14, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term ((-1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 2), (14, 1)],
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (13, 2), (14, 1)],
  term ((636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2)],
  term ((-10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1)],
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3)],
  term ((-2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (7, 1), (13, 2), (15, 1)],
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 2)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 4)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 4), (16, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 3)],
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (15, 2)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (15, 4)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((-132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((-7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 3)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 3)],
  term ((-72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 3), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)],
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 3)],
  term ((-6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2)],
  term ((-11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (7, 1), (15, 3)],
  term ((23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (15, 3)],
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 2)],
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (15, 2)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 4)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 3)],
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 1), (15, 4)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 1), (15, 4), (16, 1)],
  term ((5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 2)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 3), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 3), (15, 2), (16, 1)],
  term ((5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (15, 2)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (15, 4)],
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (6, 1), (13, 1), (14, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (7, 1), (15, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (15, 2)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 2)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (15, 2)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (15, 3)],
  term ((4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (14, 1)],
  term ((4755698281312862199878491300995248060437 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (15, 1)],
  term ((-4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(14, 2)],
  term ((-4755698281312862199878491300995248060437 : Rat) / 1199709457402477296566693528029539267990) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 99. -/
theorem ep_Q2_024_block_17_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_17_0000_0099
      ep_Q2_024_block_17_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
