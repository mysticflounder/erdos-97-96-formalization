/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 23:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_23_0000_0099 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0000 : Poly :=
[
  term ((899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) []
]

/-- Partial product 0 for generator 23. -/
def ep_Q2_024_partial_23_0000 : Poly :=
[
  term ((899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1)],
  term ((899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)],
  term ((-899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)],
  term ((-899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem ep_Q2_024_partial_23_0000_valid :
    mulPoly ep_Q2_024_coefficient_23_0000
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0001 : Poly :=
[
  term ((-28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1)]
]

/-- Partial product 1 for generator 23. -/
def ep_Q2_024_partial_23_0001 : Poly :=
[
  term ((-28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1)],
  term ((-28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 1)],
  term ((28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (12, 2)],
  term ((28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem ep_Q2_024_partial_23_0001_valid :
    mulPoly ep_Q2_024_coefficient_23_0001
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0002 : Poly :=
[
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 23. -/
def ep_Q2_024_partial_23_0002 : Poly :=
[
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem ep_Q2_024_partial_23_0002_valid :
    mulPoly ep_Q2_024_coefficient_23_0002
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0003 : Poly :=
[
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 3 for generator 23. -/
def ep_Q2_024_partial_23_0003 : Poly :=
[
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem ep_Q2_024_partial_23_0003_valid :
    mulPoly ep_Q2_024_coefficient_23_0003
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0004 : Poly :=
[
  term ((69903512563048563262714526982511277030043365376365681631 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 4 for generator 23. -/
def ep_Q2_024_partial_23_0004 : Poly :=
[
  term ((69903512563048563262714526982511277030043365376365681631 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((69903512563048563262714526982511277030043365376365681631 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-69903512563048563262714526982511277030043365376365681631 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-69903512563048563262714526982511277030043365376365681631 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem ep_Q2_024_partial_23_0004_valid :
    mulPoly ep_Q2_024_coefficient_23_0004
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0005 : Poly :=
[
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def ep_Q2_024_partial_23_0005 : Poly :=
[
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem ep_Q2_024_partial_23_0005_valid :
    mulPoly ep_Q2_024_coefficient_23_0005
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0006 : Poly :=
[
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 6 for generator 23. -/
def ep_Q2_024_partial_23_0006 : Poly :=
[
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem ep_Q2_024_partial_23_0006_valid :
    mulPoly ep_Q2_024_coefficient_23_0006
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0007 : Poly :=
[
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 7 for generator 23. -/
def ep_Q2_024_partial_23_0007 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem ep_Q2_024_partial_23_0007_valid :
    mulPoly ep_Q2_024_coefficient_23_0007
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0008 : Poly :=
[
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 23. -/
def ep_Q2_024_partial_23_0008 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem ep_Q2_024_partial_23_0008_valid :
    mulPoly ep_Q2_024_coefficient_23_0008
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0009 : Poly :=
[
  term ((375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 23. -/
def ep_Q2_024_partial_23_0009 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem ep_Q2_024_partial_23_0009_valid :
    mulPoly ep_Q2_024_coefficient_23_0009
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0010 : Poly :=
[
  term ((711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 10 for generator 23. -/
def ep_Q2_024_partial_23_0010 : Poly :=
[
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem ep_Q2_024_partial_23_0010_valid :
    mulPoly ep_Q2_024_coefficient_23_0010
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0011 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 11 for generator 23. -/
def ep_Q2_024_partial_23_0011 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 3)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem ep_Q2_024_partial_23_0011_valid :
    mulPoly ep_Q2_024_coefficient_23_0011
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0012 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 23. -/
def ep_Q2_024_partial_23_0012 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem ep_Q2_024_partial_23_0012_valid :
    mulPoly ep_Q2_024_coefficient_23_0012
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0013 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 23. -/
def ep_Q2_024_partial_23_0013 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem ep_Q2_024_partial_23_0013_valid :
    mulPoly ep_Q2_024_coefficient_23_0013
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0014 : Poly :=
[
  term ((-123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 14 for generator 23. -/
def ep_Q2_024_partial_23_0014 : Poly :=
[
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem ep_Q2_024_partial_23_0014_valid :
    mulPoly ep_Q2_024_coefficient_23_0014
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0015 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 15 for generator 23. -/
def ep_Q2_024_partial_23_0015 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem ep_Q2_024_partial_23_0015_valid :
    mulPoly ep_Q2_024_coefficient_23_0015
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0016 : Poly :=
[
  term ((-3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 23. -/
def ep_Q2_024_partial_23_0016 : Poly :=
[
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 23. -/
theorem ep_Q2_024_partial_23_0016_valid :
    mulPoly ep_Q2_024_coefficient_23_0016
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0017 : Poly :=
[
  term ((121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 17 for generator 23. -/
def ep_Q2_024_partial_23_0017 : Poly :=
[
  term ((243854094557028755510289041467279777520 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((243854094557028755510289041467279777520 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 23. -/
theorem ep_Q2_024_partial_23_0017_valid :
    mulPoly ep_Q2_024_coefficient_23_0017
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0018 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 18 for generator 23. -/
def ep_Q2_024_partial_23_0018 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 3)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 23. -/
theorem ep_Q2_024_partial_23_0018_valid :
    mulPoly ep_Q2_024_coefficient_23_0018
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0019 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 19 for generator 23. -/
def ep_Q2_024_partial_23_0019 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 23. -/
theorem ep_Q2_024_partial_23_0019_valid :
    mulPoly ep_Q2_024_coefficient_23_0019
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0020 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 23. -/
def ep_Q2_024_partial_23_0020 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 23. -/
theorem ep_Q2_024_partial_23_0020_valid :
    mulPoly ep_Q2_024_coefficient_23_0020
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0021 : Poly :=
[
  term ((-590961661791039192714595991097146275892 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 21 for generator 23. -/
def ep_Q2_024_partial_23_0021 : Poly :=
[
  term ((-1181923323582078385429191982194292551784 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1181923323582078385429191982194292551784 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((590961661791039192714595991097146275892 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((590961661791039192714595991097146275892 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 23. -/
theorem ep_Q2_024_partial_23_0021_valid :
    mulPoly ep_Q2_024_coefficient_23_0021
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0022 : Poly :=
[
  term ((-47479840100971212742799335136817851695976916729785922451 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 22 for generator 23. -/
def ep_Q2_024_partial_23_0022 : Poly :=
[
  term ((-47479840100971212742799335136817851695976916729785922451 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-47479840100971212742799335136817851695976916729785922451 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((47479840100971212742799335136817851695976916729785922451 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((47479840100971212742799335136817851695976916729785922451 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 23. -/
theorem ep_Q2_024_partial_23_0022_valid :
    mulPoly ep_Q2_024_coefficient_23_0022
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0023 : Poly :=
[
  term ((4572040099180891 : Rat) / 2325560442306386) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 23. -/
def ep_Q2_024_partial_23_0023 : Poly :=
[
  term ((4572040099180891 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4572040099180891 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4572040099180891 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4572040099180891 : Rat) / 2325560442306386) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 23. -/
theorem ep_Q2_024_partial_23_0023_valid :
    mulPoly ep_Q2_024_coefficient_23_0023
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0024 : Poly :=
[
  term ((236593235547160667662868707678827743956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)]
]

/-- Partial product 24 for generator 23. -/
def ep_Q2_024_partial_23_0024 : Poly :=
[
  term ((473186471094321335325737415357655487912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((473186471094321335325737415357655487912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((-236593235547160667662868707678827743956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 2)],
  term ((-236593235547160667662868707678827743956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 23. -/
theorem ep_Q2_024_partial_23_0024_valid :
    mulPoly ep_Q2_024_coefficient_23_0024
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0025 : Poly :=
[
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 25 for generator 23. -/
def ep_Q2_024_partial_23_0025 : Poly :=
[
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 3)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 3), (13, 1)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 23. -/
theorem ep_Q2_024_partial_23_0025_valid :
    mulPoly ep_Q2_024_coefficient_23_0025
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0026 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 23. -/
def ep_Q2_024_partial_23_0026 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 23. -/
theorem ep_Q2_024_partial_23_0026_valid :
    mulPoly ep_Q2_024_coefficient_23_0026
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0027 : Poly :=
[
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 23. -/
def ep_Q2_024_partial_23_0027 : Poly :=
[
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 23. -/
theorem ep_Q2_024_partial_23_0027_valid :
    mulPoly ep_Q2_024_coefficient_23_0027
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0028 : Poly :=
[
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 28 for generator 23. -/
def ep_Q2_024_partial_23_0028 : Poly :=
[
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)],
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 23. -/
theorem ep_Q2_024_partial_23_0028_valid :
    mulPoly ep_Q2_024_coefficient_23_0028
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0029 : Poly :=
[
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 29 for generator 23. -/
def ep_Q2_024_partial_23_0029 : Poly :=
[
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 23. -/
theorem ep_Q2_024_partial_23_0029_valid :
    mulPoly ep_Q2_024_coefficient_23_0029
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0030 : Poly :=
[
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 23. -/
def ep_Q2_024_partial_23_0030 : Poly :=
[
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 23. -/
theorem ep_Q2_024_partial_23_0030_valid :
    mulPoly ep_Q2_024_coefficient_23_0030
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0031 : Poly :=
[
  term ((545104149445809143527791993192916634983092109177817801 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 23. -/
def ep_Q2_024_partial_23_0031 : Poly :=
[
  term ((1090208298891618287055583986385833269966184218355635602 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1090208298891618287055583986385833269966184218355635602 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-545104149445809143527791993192916634983092109177817801 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-545104149445809143527791993192916634983092109177817801 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 23. -/
theorem ep_Q2_024_partial_23_0031_valid :
    mulPoly ep_Q2_024_coefficient_23_0031
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0032 : Poly :=
[
  term ((-37665296397180 : Rat) / 1162780221153193) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 23. -/
def ep_Q2_024_partial_23_0032 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 23. -/
theorem ep_Q2_024_partial_23_0032_valid :
    mulPoly ep_Q2_024_coefficient_23_0032
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0033 : Poly :=
[
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2)]
]

/-- Partial product 33 for generator 23. -/
def ep_Q2_024_partial_23_0033 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (12, 2), (13, 2)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 23. -/
theorem ep_Q2_024_partial_23_0033_valid :
    mulPoly ep_Q2_024_coefficient_23_0033
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0034 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 1)]
]

/-- Partial product 34 for generator 23. -/
def ep_Q2_024_partial_23_0034 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 23. -/
theorem ep_Q2_024_partial_23_0034_valid :
    mulPoly ep_Q2_024_coefficient_23_0034
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0035 : Poly :=
[
  term ((-217527369413225050048019098217196606852407478113813817197 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (15, 2)]
]

/-- Partial product 35 for generator 23. -/
def ep_Q2_024_partial_23_0035 : Poly :=
[
  term ((-217527369413225050048019098217196606852407478113813817197 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-217527369413225050048019098217196606852407478113813817197 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((217527369413225050048019098217196606852407478113813817197 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (12, 2), (15, 2)],
  term ((217527369413225050048019098217196606852407478113813817197 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 23. -/
theorem ep_Q2_024_partial_23_0035_valid :
    mulPoly ep_Q2_024_coefficient_23_0035
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0036 : Poly :=
[
  term ((8388870826070127 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 23. -/
def ep_Q2_024_partial_23_0036 : Poly :=
[
  term ((8388870826070127 : Rat) / 2325560442306386) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8388870826070127 : Rat) / 2325560442306386) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8388870826070127 : Rat) / 4651120884612772) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8388870826070127 : Rat) / 4651120884612772) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 23. -/
theorem ep_Q2_024_partial_23_0036_valid :
    mulPoly ep_Q2_024_coefficient_23_0036
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0037 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 37 for generator 23. -/
def ep_Q2_024_partial_23_0037 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 23. -/
theorem ep_Q2_024_partial_23_0037_valid :
    mulPoly ep_Q2_024_coefficient_23_0037
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0038 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 38 for generator 23. -/
def ep_Q2_024_partial_23_0038 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 23. -/
theorem ep_Q2_024_partial_23_0038_valid :
    mulPoly ep_Q2_024_coefficient_23_0038
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0039 : Poly :=
[
  term ((-1347382663288800 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 23. -/
def ep_Q2_024_partial_23_0039 : Poly :=
[
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 23. -/
theorem ep_Q2_024_partial_23_0039_valid :
    mulPoly ep_Q2_024_coefficient_23_0039
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0040 : Poly :=
[
  term ((2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)]
]

/-- Partial product 40 for generator 23. -/
def ep_Q2_024_partial_23_0040 : Poly :=
[
  term ((4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (12, 2)],
  term ((-2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 23. -/
theorem ep_Q2_024_partial_23_0040_valid :
    mulPoly ep_Q2_024_coefficient_23_0040
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0041 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 41 for generator 23. -/
def ep_Q2_024_partial_23_0041 : Poly :=
[
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 23. -/
theorem ep_Q2_024_partial_23_0041_valid :
    mulPoly ep_Q2_024_coefficient_23_0041
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0042 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 42 for generator 23. -/
def ep_Q2_024_partial_23_0042 : Poly :=
[
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 23. -/
theorem ep_Q2_024_partial_23_0042_valid :
    mulPoly ep_Q2_024_coefficient_23_0042
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0043 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 43 for generator 23. -/
def ep_Q2_024_partial_23_0043 : Poly :=
[
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 23. -/
theorem ep_Q2_024_partial_23_0043_valid :
    mulPoly ep_Q2_024_coefficient_23_0043
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0044 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 23. -/
def ep_Q2_024_partial_23_0044 : Poly :=
[
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 23. -/
theorem ep_Q2_024_partial_23_0044_valid :
    mulPoly ep_Q2_024_coefficient_23_0044
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0045 : Poly :=
[
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)]
]

/-- Partial product 45 for generator 23. -/
def ep_Q2_024_partial_23_0045 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 2)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 23. -/
theorem ep_Q2_024_partial_23_0045_valid :
    mulPoly ep_Q2_024_coefficient_23_0045
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0046 : Poly :=
[
  term ((-259775756829804363262833473597127105791 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1)]
]

/-- Partial product 46 for generator 23. -/
def ep_Q2_024_partial_23_0046 : Poly :=
[
  term ((-519551513659608726525666947194254211582 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-519551513659608726525666947194254211582 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((259775756829804363262833473597127105791 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 2)],
  term ((259775756829804363262833473597127105791 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 23. -/
theorem ep_Q2_024_partial_23_0046_valid :
    mulPoly ep_Q2_024_coefficient_23_0046
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0047 : Poly :=
[
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 47 for generator 23. -/
def ep_Q2_024_partial_23_0047 : Poly :=
[
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 23. -/
theorem ep_Q2_024_partial_23_0047_valid :
    mulPoly ep_Q2_024_coefficient_23_0047
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0048 : Poly :=
[
  term ((-1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 48 for generator 23. -/
def ep_Q2_024_partial_23_0048 : Poly :=
[
  term ((-3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 23. -/
theorem ep_Q2_024_partial_23_0048_valid :
    mulPoly ep_Q2_024_coefficient_23_0048
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0049 : Poly :=
[
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 49 for generator 23. -/
def ep_Q2_024_partial_23_0049 : Poly :=
[
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 23. -/
theorem ep_Q2_024_partial_23_0049_valid :
    mulPoly ep_Q2_024_coefficient_23_0049
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0050 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)]
]

/-- Partial product 50 for generator 23. -/
def ep_Q2_024_partial_23_0050 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 23. -/
theorem ep_Q2_024_partial_23_0050_valid :
    mulPoly ep_Q2_024_coefficient_23_0050
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0051 : Poly :=
[
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 51 for generator 23. -/
def ep_Q2_024_partial_23_0051 : Poly :=
[
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 23. -/
theorem ep_Q2_024_partial_23_0051_valid :
    mulPoly ep_Q2_024_coefficient_23_0051
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0052 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 52 for generator 23. -/
def ep_Q2_024_partial_23_0052 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 23. -/
theorem ep_Q2_024_partial_23_0052_valid :
    mulPoly ep_Q2_024_coefficient_23_0052
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0053 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 23. -/
def ep_Q2_024_partial_23_0053 : Poly :=
[
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 23. -/
theorem ep_Q2_024_partial_23_0053_valid :
    mulPoly ep_Q2_024_coefficient_23_0053
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0054 : Poly :=
[
  term ((3694602506488261700539521375719770525622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 54 for generator 23. -/
def ep_Q2_024_partial_23_0054 : Poly :=
[
  term ((7389205012976523401079042751439541051244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((7389205012976523401079042751439541051244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3694602506488261700539521375719770525622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 3)],
  term ((-3694602506488261700539521375719770525622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 23. -/
theorem ep_Q2_024_partial_23_0054_valid :
    mulPoly ep_Q2_024_coefficient_23_0054
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0055 : Poly :=
[
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 55 for generator 23. -/
def ep_Q2_024_partial_23_0055 : Poly :=
[
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 3), (14, 1)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 23. -/
theorem ep_Q2_024_partial_23_0055_valid :
    mulPoly ep_Q2_024_coefficient_23_0055
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0056 : Poly :=
[
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 56 for generator 23. -/
def ep_Q2_024_partial_23_0056 : Poly :=
[
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 23. -/
theorem ep_Q2_024_partial_23_0056_valid :
    mulPoly ep_Q2_024_coefficient_23_0056
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0057 : Poly :=
[
  term ((14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 23. -/
def ep_Q2_024_partial_23_0057 : Poly :=
[
  term ((14038382648281759 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14038382648281759 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 23. -/
theorem ep_Q2_024_partial_23_0057_valid :
    mulPoly ep_Q2_024_coefficient_23_0057
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0058 : Poly :=
[
  term ((42670163252890233524806839594618073049894640497335965057 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 58 for generator 23. -/
def ep_Q2_024_partial_23_0058 : Poly :=
[
  term ((42670163252890233524806839594618073049894640497335965057 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((42670163252890233524806839594618073049894640497335965057 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42670163252890233524806839594618073049894640497335965057 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-42670163252890233524806839594618073049894640497335965057 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 23. -/
theorem ep_Q2_024_partial_23_0058_valid :
    mulPoly ep_Q2_024_coefficient_23_0058
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0059 : Poly :=
[
  term ((119277895525157125 : Rat) / 13953362653838316) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 23. -/
def ep_Q2_024_partial_23_0059 : Poly :=
[
  term ((119277895525157125 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((119277895525157125 : Rat) / 6976681326919158) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-119277895525157125 : Rat) / 13953362653838316) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-119277895525157125 : Rat) / 13953362653838316) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 23. -/
theorem ep_Q2_024_partial_23_0059_valid :
    mulPoly ep_Q2_024_coefficient_23_0059
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0060 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 60 for generator 23. -/
def ep_Q2_024_partial_23_0060 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 3), (13, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 2), (13, 2)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 3)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 23. -/
theorem ep_Q2_024_partial_23_0060_valid :
    mulPoly ep_Q2_024_coefficient_23_0060
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0061 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 61 for generator 23. -/
def ep_Q2_024_partial_23_0061 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 23. -/
theorem ep_Q2_024_partial_23_0061_valid :
    mulPoly ep_Q2_024_coefficient_23_0061
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0062 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 23. -/
def ep_Q2_024_partial_23_0062 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 23. -/
theorem ep_Q2_024_partial_23_0062_valid :
    mulPoly ep_Q2_024_coefficient_23_0062
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0063 : Poly :=
[
  term ((-1472700919664388838557160673585933405504 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1)]
]

/-- Partial product 63 for generator 23. -/
def ep_Q2_024_partial_23_0063 : Poly :=
[
  term ((-2945401839328777677114321347171866811008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2945401839328777677114321347171866811008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2)],
  term ((1472700919664388838557160673585933405504 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1)],
  term ((1472700919664388838557160673585933405504 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 23. -/
theorem ep_Q2_024_partial_23_0063_valid :
    mulPoly ep_Q2_024_coefficient_23_0063
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0064 : Poly :=
[
  term ((6631080535490670377739534824483173195376 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 64 for generator 23. -/
def ep_Q2_024_partial_23_0064 : Poly :=
[
  term ((13262161070981340755479069648966346390752 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((13262161070981340755479069648966346390752 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6631080535490670377739534824483173195376 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-6631080535490670377739534824483173195376 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 23. -/
theorem ep_Q2_024_partial_23_0064_valid :
    mulPoly ep_Q2_024_coefficient_23_0064
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0065 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 65 for generator 23. -/
def ep_Q2_024_partial_23_0065 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 23. -/
theorem ep_Q2_024_partial_23_0065_valid :
    mulPoly ep_Q2_024_coefficient_23_0065
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0066 : Poly :=
[
  term ((-72007058824113739484180866806763665025597606343808478699 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 66 for generator 23. -/
def ep_Q2_024_partial_23_0066 : Poly :=
[
  term ((-72007058824113739484180866806763665025597606343808478699 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-72007058824113739484180866806763665025597606343808478699 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((72007058824113739484180866806763665025597606343808478699 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((72007058824113739484180866806763665025597606343808478699 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 23. -/
theorem ep_Q2_024_partial_23_0066_valid :
    mulPoly ep_Q2_024_coefficient_23_0066
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0067 : Poly :=
[
  term ((136808243557007545 : Rat) / 13953362653838316) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 23. -/
def ep_Q2_024_partial_23_0067 : Poly :=
[
  term ((136808243557007545 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((136808243557007545 : Rat) / 6976681326919158) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136808243557007545 : Rat) / 13953362653838316) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-136808243557007545 : Rat) / 13953362653838316) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 23. -/
theorem ep_Q2_024_partial_23_0067_valid :
    mulPoly ep_Q2_024_coefficient_23_0067
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0068 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 68 for generator 23. -/
def ep_Q2_024_partial_23_0068 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 23. -/
theorem ep_Q2_024_partial_23_0068_valid :
    mulPoly ep_Q2_024_coefficient_23_0068
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0069 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 23. -/
def ep_Q2_024_partial_23_0069 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 23. -/
theorem ep_Q2_024_partial_23_0069_valid :
    mulPoly ep_Q2_024_coefficient_23_0069
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0070 : Poly :=
[
  term ((47183744963950877880300288915811498724926854734612865245 : Rat) / 4463994970233695128822912468014076307843262831587814624) [(1, 1), (15, 1)]
]

/-- Partial product 70 for generator 23. -/
def ep_Q2_024_partial_23_0070 : Poly :=
[
  term ((47183744963950877880300288915811498724926854734612865245 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((47183744963950877880300288915811498724926854734612865245 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-47183744963950877880300288915811498724926854734612865245 : Rat) / 4463994970233695128822912468014076307843262831587814624) [(1, 1), (12, 2), (15, 1)],
  term ((-47183744963950877880300288915811498724926854734612865245 : Rat) / 4463994970233695128822912468014076307843262831587814624) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 23. -/
theorem ep_Q2_024_partial_23_0070_valid :
    mulPoly ep_Q2_024_coefficient_23_0070
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0071 : Poly :=
[
  term ((-287594756757815537 : Rat) / 27906725307676632) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 23. -/
def ep_Q2_024_partial_23_0071 : Poly :=
[
  term ((-287594756757815537 : Rat) / 13953362653838316) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-287594756757815537 : Rat) / 13953362653838316) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((287594756757815537 : Rat) / 27906725307676632) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((287594756757815537 : Rat) / 27906725307676632) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 23. -/
theorem ep_Q2_024_partial_23_0071_valid :
    mulPoly ep_Q2_024_coefficient_23_0071
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0072 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1)]
]

/-- Partial product 72 for generator 23. -/
def ep_Q2_024_partial_23_0072 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (10, 1), (12, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (11, 1), (13, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 23. -/
theorem ep_Q2_024_partial_23_0072_valid :
    mulPoly ep_Q2_024_coefficient_23_0072
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0073 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 73 for generator 23. -/
def ep_Q2_024_partial_23_0073 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 3)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 23. -/
theorem ep_Q2_024_partial_23_0073_valid :
    mulPoly ep_Q2_024_coefficient_23_0073
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0074 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 23. -/
def ep_Q2_024_partial_23_0074 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 23. -/
theorem ep_Q2_024_partial_23_0074_valid :
    mulPoly ep_Q2_024_coefficient_23_0074
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0075 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 23. -/
def ep_Q2_024_partial_23_0075 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 23. -/
theorem ep_Q2_024_partial_23_0075_valid :
    mulPoly ep_Q2_024_coefficient_23_0075
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0076 : Poly :=
[
  term ((360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 76 for generator 23. -/
def ep_Q2_024_partial_23_0076 : Poly :=
[
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 23. -/
theorem ep_Q2_024_partial_23_0076_valid :
    mulPoly ep_Q2_024_coefficient_23_0076
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0077 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 77 for generator 23. -/
def ep_Q2_024_partial_23_0077 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 23. -/
theorem ep_Q2_024_partial_23_0077_valid :
    mulPoly ep_Q2_024_coefficient_23_0077
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0078 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 78 for generator 23. -/
def ep_Q2_024_partial_23_0078 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 23. -/
theorem ep_Q2_024_partial_23_0078_valid :
    mulPoly ep_Q2_024_coefficient_23_0078
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0079 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 23. -/
def ep_Q2_024_partial_23_0079 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 23. -/
theorem ep_Q2_024_partial_23_0079_valid :
    mulPoly ep_Q2_024_coefficient_23_0079
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0080 : Poly :=
[
  term ((-11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 80 for generator 23. -/
def ep_Q2_024_partial_23_0080 : Poly :=
[
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 23. -/
theorem ep_Q2_024_partial_23_0080_valid :
    mulPoly ep_Q2_024_coefficient_23_0080
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0081 : Poly :=
[
  term ((1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 23. -/
def ep_Q2_024_partial_23_0081 : Poly :=
[
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 23. -/
theorem ep_Q2_024_partial_23_0081_valid :
    mulPoly ep_Q2_024_coefficient_23_0081
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0082 : Poly :=
[
  term ((-7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 82 for generator 23. -/
def ep_Q2_024_partial_23_0082 : Poly :=
[
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 23. -/
theorem ep_Q2_024_partial_23_0082_valid :
    mulPoly ep_Q2_024_coefficient_23_0082
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0083 : Poly :=
[
  term ((9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 83 for generator 23. -/
def ep_Q2_024_partial_23_0083 : Poly :=
[
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 23. -/
theorem ep_Q2_024_partial_23_0083_valid :
    mulPoly ep_Q2_024_coefficient_23_0083
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0084 : Poly :=
[
  term ((-1443865203915856 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 23. -/
def ep_Q2_024_partial_23_0084 : Poly :=
[
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 23. -/
theorem ep_Q2_024_partial_23_0084_valid :
    mulPoly ep_Q2_024_coefficient_23_0084
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0085 : Poly :=
[
  term ((21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2)]
]

/-- Partial product 85 for generator 23. -/
def ep_Q2_024_partial_23_0085 : Poly :=
[
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 2)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 23. -/
theorem ep_Q2_024_partial_23_0085_valid :
    mulPoly ep_Q2_024_coefficient_23_0085
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0086 : Poly :=
[
  term ((-18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 86 for generator 23. -/
def ep_Q2_024_partial_23_0086 : Poly :=
[
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (13, 3)],
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 23. -/
theorem ep_Q2_024_partial_23_0086_valid :
    mulPoly ep_Q2_024_coefficient_23_0086
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0087 : Poly :=
[
  term ((-365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 87 for generator 23. -/
def ep_Q2_024_partial_23_0087 : Poly :=
[
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 23. -/
theorem ep_Q2_024_partial_23_0087_valid :
    mulPoly ep_Q2_024_coefficient_23_0087
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0088 : Poly :=
[
  term ((464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 23. -/
def ep_Q2_024_partial_23_0088 : Poly :=
[
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 23. -/
theorem ep_Q2_024_partial_23_0088_valid :
    mulPoly ep_Q2_024_coefficient_23_0088
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0089 : Poly :=
[
  term ((-510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 89 for generator 23. -/
def ep_Q2_024_partial_23_0089 : Poly :=
[
  term ((-1021289075131334291831933164775608818979043698679391056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1021289075131334291831933164775608818979043698679391056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 23. -/
theorem ep_Q2_024_partial_23_0089_valid :
    mulPoly ep_Q2_024_coefficient_23_0089
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0090 : Poly :=
[
  term ((350852685727264 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 23. -/
def ep_Q2_024_partial_23_0090 : Poly :=
[
  term ((701705371454528 : Rat) / 1162780221153193) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((701705371454528 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-350852685727264 : Rat) / 1162780221153193) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-350852685727264 : Rat) / 1162780221153193) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 23. -/
theorem ep_Q2_024_partial_23_0090_valid :
    mulPoly ep_Q2_024_coefficient_23_0090
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0091 : Poly :=
[
  term ((-1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (13, 2)]
]

/-- Partial product 91 for generator 23. -/
def ep_Q2_024_partial_23_0091 : Poly :=
[
  term ((-2147764690357175588149467363101807168 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term ((-2147764690357175588149467363101807168 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (11, 1), (13, 3)],
  term ((1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 2), (13, 2)],
  term ((1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 23. -/
theorem ep_Q2_024_partial_23_0091_valid :
    mulPoly ep_Q2_024_coefficient_23_0091
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0092 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1)]
]

/-- Partial product 92 for generator 23. -/
def ep_Q2_024_partial_23_0092 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 23. -/
theorem ep_Q2_024_partial_23_0092_valid :
    mulPoly ep_Q2_024_coefficient_23_0092
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0093 : Poly :=
[
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 93 for generator 23. -/
def ep_Q2_024_partial_23_0093 : Poly :=
[
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 23. -/
theorem ep_Q2_024_partial_23_0093_valid :
    mulPoly ep_Q2_024_coefficient_23_0093
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0094 : Poly :=
[
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 94 for generator 23. -/
def ep_Q2_024_partial_23_0094 : Poly :=
[
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 23. -/
theorem ep_Q2_024_partial_23_0094_valid :
    mulPoly ep_Q2_024_coefficient_23_0094
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0095 : Poly :=
[
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 95 for generator 23. -/
def ep_Q2_024_partial_23_0095 : Poly :=
[
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 23. -/
theorem ep_Q2_024_partial_23_0095_valid :
    mulPoly ep_Q2_024_coefficient_23_0095
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0096 : Poly :=
[
  term ((-375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 23. -/
def ep_Q2_024_partial_23_0096 : Poly :=
[
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 23. -/
theorem ep_Q2_024_partial_23_0096_valid :
    mulPoly ep_Q2_024_coefficient_23_0096
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0097 : Poly :=
[
  term ((-3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)]
]

/-- Partial product 97 for generator 23. -/
def ep_Q2_024_partial_23_0097 : Poly :=
[
  term ((-7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 2)],
  term ((3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 23. -/
theorem ep_Q2_024_partial_23_0097_valid :
    mulPoly ep_Q2_024_coefficient_23_0097
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0098 : Poly :=
[
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 98 for generator 23. -/
def ep_Q2_024_partial_23_0098 : Poly :=
[
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 3)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 23. -/
theorem ep_Q2_024_partial_23_0098_valid :
    mulPoly ep_Q2_024_coefficient_23_0098
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0099 : Poly :=
[
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 99 for generator 23. -/
def ep_Q2_024_partial_23_0099 : Poly :=
[
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 23. -/
theorem ep_Q2_024_partial_23_0099_valid :
    mulPoly ep_Q2_024_coefficient_23_0099
        ep_Q2_024_generator_23_0000_0099 =
      ep_Q2_024_partial_23_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_23_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_23_0000,
  ep_Q2_024_partial_23_0001,
  ep_Q2_024_partial_23_0002,
  ep_Q2_024_partial_23_0003,
  ep_Q2_024_partial_23_0004,
  ep_Q2_024_partial_23_0005,
  ep_Q2_024_partial_23_0006,
  ep_Q2_024_partial_23_0007,
  ep_Q2_024_partial_23_0008,
  ep_Q2_024_partial_23_0009,
  ep_Q2_024_partial_23_0010,
  ep_Q2_024_partial_23_0011,
  ep_Q2_024_partial_23_0012,
  ep_Q2_024_partial_23_0013,
  ep_Q2_024_partial_23_0014,
  ep_Q2_024_partial_23_0015,
  ep_Q2_024_partial_23_0016,
  ep_Q2_024_partial_23_0017,
  ep_Q2_024_partial_23_0018,
  ep_Q2_024_partial_23_0019,
  ep_Q2_024_partial_23_0020,
  ep_Q2_024_partial_23_0021,
  ep_Q2_024_partial_23_0022,
  ep_Q2_024_partial_23_0023,
  ep_Q2_024_partial_23_0024,
  ep_Q2_024_partial_23_0025,
  ep_Q2_024_partial_23_0026,
  ep_Q2_024_partial_23_0027,
  ep_Q2_024_partial_23_0028,
  ep_Q2_024_partial_23_0029,
  ep_Q2_024_partial_23_0030,
  ep_Q2_024_partial_23_0031,
  ep_Q2_024_partial_23_0032,
  ep_Q2_024_partial_23_0033,
  ep_Q2_024_partial_23_0034,
  ep_Q2_024_partial_23_0035,
  ep_Q2_024_partial_23_0036,
  ep_Q2_024_partial_23_0037,
  ep_Q2_024_partial_23_0038,
  ep_Q2_024_partial_23_0039,
  ep_Q2_024_partial_23_0040,
  ep_Q2_024_partial_23_0041,
  ep_Q2_024_partial_23_0042,
  ep_Q2_024_partial_23_0043,
  ep_Q2_024_partial_23_0044,
  ep_Q2_024_partial_23_0045,
  ep_Q2_024_partial_23_0046,
  ep_Q2_024_partial_23_0047,
  ep_Q2_024_partial_23_0048,
  ep_Q2_024_partial_23_0049,
  ep_Q2_024_partial_23_0050,
  ep_Q2_024_partial_23_0051,
  ep_Q2_024_partial_23_0052,
  ep_Q2_024_partial_23_0053,
  ep_Q2_024_partial_23_0054,
  ep_Q2_024_partial_23_0055,
  ep_Q2_024_partial_23_0056,
  ep_Q2_024_partial_23_0057,
  ep_Q2_024_partial_23_0058,
  ep_Q2_024_partial_23_0059,
  ep_Q2_024_partial_23_0060,
  ep_Q2_024_partial_23_0061,
  ep_Q2_024_partial_23_0062,
  ep_Q2_024_partial_23_0063,
  ep_Q2_024_partial_23_0064,
  ep_Q2_024_partial_23_0065,
  ep_Q2_024_partial_23_0066,
  ep_Q2_024_partial_23_0067,
  ep_Q2_024_partial_23_0068,
  ep_Q2_024_partial_23_0069,
  ep_Q2_024_partial_23_0070,
  ep_Q2_024_partial_23_0071,
  ep_Q2_024_partial_23_0072,
  ep_Q2_024_partial_23_0073,
  ep_Q2_024_partial_23_0074,
  ep_Q2_024_partial_23_0075,
  ep_Q2_024_partial_23_0076,
  ep_Q2_024_partial_23_0077,
  ep_Q2_024_partial_23_0078,
  ep_Q2_024_partial_23_0079,
  ep_Q2_024_partial_23_0080,
  ep_Q2_024_partial_23_0081,
  ep_Q2_024_partial_23_0082,
  ep_Q2_024_partial_23_0083,
  ep_Q2_024_partial_23_0084,
  ep_Q2_024_partial_23_0085,
  ep_Q2_024_partial_23_0086,
  ep_Q2_024_partial_23_0087,
  ep_Q2_024_partial_23_0088,
  ep_Q2_024_partial_23_0089,
  ep_Q2_024_partial_23_0090,
  ep_Q2_024_partial_23_0091,
  ep_Q2_024_partial_23_0092,
  ep_Q2_024_partial_23_0093,
  ep_Q2_024_partial_23_0094,
  ep_Q2_024_partial_23_0095,
  ep_Q2_024_partial_23_0096,
  ep_Q2_024_partial_23_0097,
  ep_Q2_024_partial_23_0098,
  ep_Q2_024_partial_23_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_23_0000_0099 : Poly :=
[
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-93960150742173590801111461517357340096 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((69903512563048563262714526982511277030043365376365681631 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((69903512563048563262714526982511277030043365376365681631 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-69903512563048563262714526982511277030043365376365681631 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-69903512563048563262714526982511277030043365376365681631 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (13, 3)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (13, 2)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-375647204014056 : Rat) / 1162780221153193) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (13, 3)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((-711267717866237224134638869344200372606 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 3)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 3), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (12, 3), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((3316024588732535 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((123905327885937413341038734560550052154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 3)],
  term ((243854094557028755510289041467279777520 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1181923323582078385429191982194292551784 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-47479840100971212742799335136817851695976916729785922451 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((4572040099180891 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-121927047278514377755144520733639888760 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-47479840100971212742799335136817851695976916729785922451 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4572040099180891 : Rat) / 1162780221153193) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3010829032759794051756359793198890883184 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((243854094557028755510289041467279777520 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 3)],
  term ((590961661791039192714595991097146275892 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((47479840100971212742799335136817851695976916729785922451 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-4572040099180891 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 3), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (12, 3), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((47479840100971212742799335136817851695976916729785922451 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-4572040099180891 : Rat) / 2325560442306386) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((590961661791039192714595991097146275892 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 3)],
  term ((473186471094321335325737415357655487912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((473186471094321335325737415357655487912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((-236593235547160667662868707678827743956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 2)],
  term ((-236593235547160667662868707678827743956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2)],
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1)],
  term ((1090208298891618287055583986385833269966184218355635602 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-217527369413225050048019098217196606852407478113813817197 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((8388870826070127 : Rat) / 2325560442306386) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 1), (13, 3)],
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (12, 3), (13, 1)],
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 3), (15, 1)],
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-217527369413225050048019098217196606852407478113813817197 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((8388870826070127 : Rat) / 2325560442306386) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((217595606404445462237296198327481937096703352328387440267 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16103374091508321 : Rat) / 4651120884612772) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1400066296629126990021761377942680707918 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 2), (12, 1), (13, 2)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 2), (13, 2)],
  term ((28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (12, 2)],
  term ((-545104149445809143527791993192916634983092109177817801 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (12, 2), (13, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (14, 1)],
  term ((217527369413225050048019098217196606852407478113813817197 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (12, 2), (15, 2)],
  term ((-8388870826070127 : Rat) / 4651120884612772) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (13, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (13, 2), (14, 1)],
  term ((217527369413225050048019098217196606852407478113813817197 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 2), (15, 2)],
  term ((-8388870826070127 : Rat) / 4651120884612772) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-545104149445809143527791993192916634983092109177817801 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 3), (15, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 4)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 3)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((-2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (12, 2)],
  term ((-2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (13, 2)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 2)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-519551513659608726525666947194254211582 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-519551513659608726525666947194254211582 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((259775756829804363262833473597127105791 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 2)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 3)],
  term ((259775756829804363262833473597127105791 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2)],
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2945401839328777677114321347171866811008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((13262161070981340755479069648966346390752 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-72007058824113739484180866806763665025597606343808478699 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((136808243557007545 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((47183744963950877880300288915811498724926854734612865245 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-287594756757815537 : Rat) / 13953362653838316) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7389205012976523401079042751439541051244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42670163252890233524806839594618073049894640497335965057 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((119277895525157125 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 3), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42670163252890233524806839594618073049894640497335965057 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((119277895525157125 : Rat) / 6976681326919158) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7389205012976523401079042751439541051244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 2)],
  term ((27537677093102589192121749982286597926362177351669214241 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 2), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-72007058824113739484180866806763665025597606343808478699 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((136808243557007545 : Rat) / 6976681326919158) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((47183744963950877880300288915811498724926854734612865245 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-287594756757815537 : Rat) / 13953362653838316) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1458194678006027365498784119702917145163 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 1), (13, 2)],
  term ((13262161070981340755479069648966346390752 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (13, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42670163252890233524806839594618073049894640497335965057 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-119277895525157125 : Rat) / 13953362653838316) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3694602506488261700539521375719770525622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 3)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 3), (14, 1)],
  term ((1472700919664388838557160673585933405504 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1)],
  term ((-6631080535490670377739534824483173195376 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 3)],
  term ((72007058824113739484180866806763665025597606343808478699 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-136808243557007545 : Rat) / 13953362653838316) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-47183744963950877880300288915811498724926854734612865245 : Rat) / 4463994970233695128822912468014076307843262831587814624) [(1, 1), (12, 2), (15, 1)],
  term ((287594756757815537 : Rat) / 27906725307676632) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3694602506488261700539521375719770525622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 3), (13, 1)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1), (14, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 3), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42670163252890233524806839594618073049894640497335965057 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 3), (15, 1)],
  term ((-119277895525157125 : Rat) / 13953362653838316) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 4), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 4), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 4), (15, 1), (16, 1)],
  term ((72007058824113739484180866806763665025597606343808478699 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-136808243557007545 : Rat) / 13953362653838316) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-47183744963950877880300288915811498724926854734612865245 : Rat) / 4463994970233695128822912468014076307843262831587814624) [(1, 1), (13, 2), (15, 1)],
  term ((287594756757815537 : Rat) / 27906725307676632) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1472700919664388838557160673585933405504 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 3)],
  term ((-6631080535490670377739534824483173195376 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (13, 3), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)],
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22931552540936337080940463310268973772105137884795844034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3952343015357688 : Rat) / 1162780221153193) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((720252597887779523700067461220819384768 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 3)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 3), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 3), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11465776270468168540470231655134486886052568942397922017 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-1976171507678844 : Rat) / 1162780221153193) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-360126298943889761850033730610409692384 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 3)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 3), (14, 1)],
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((19431741046881836057856305303863349115326682125821936376 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2887730407831712 : Rat) / 1162780221153193) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14493962706218666334912276909778509024 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 2), (15, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9715870523440918028928152651931674557663341062910968188 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((1443865203915856 : Rat) / 1162780221153193) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7246981353109333167456138454889254512 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 1), (13, 3)],
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((42833375976597310015853633191136233168 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (12, 2)],
  term ((-21416687988298655007926816595568116584 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (9, 2), (13, 2)],
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (10, 1), (12, 1)],
  term ((-1021289075131334291831933164775608818979043698679391056 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((701705371454528 : Rat) / 1162780221153193) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2147764690357175588149467363101807168 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term ((18513734145245607042872260259687386608 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((365796635166128005531168494147648500425384687476294696 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-464227327740800 : Rat) / 1162780221153193) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (11, 1), (13, 1)],
  term ((4465660452360585791135594247439118687401726613465029384 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((237478043713728 : Rat) / 1162780221153193) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((44802378983950943187869443963553123984 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 3)],
  term ((-731593270332256011062336988295297000850769374952589392 : Rat) / 46499947606600990925238671541813294873367321162373069) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((928454655481600 : Rat) / 1162780221153193) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37027468290491214085744520519374773216 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (11, 2), (13, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (12, 2)],
  term ((510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-350852685727264 : Rat) / 1162780221153193) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 2), (13, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (13, 2)],
  term ((510644537565667145915966582387804409489521849339695528 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (13, 3), (15, 1)],
  term ((-350852685727264 : Rat) / 1162780221153193) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((1073882345178587794074733681550903584 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (13, 4)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (12, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (13, 2)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (12, 2)],
  term ((-2026668639087705403624852686972380630 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (12, 2), (13, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-90571061978454541516795555975182944929229918063114182 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((375647204014056 : Rat) / 1162780221153193) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13408278867591516263964573029451067132 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (13, 3)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7985535701021799898795819550348360348696 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 3)],
  term ((362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 2)],
  term ((3992767850510899949397909775174180174348 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (13, 2)],
  term ((899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(10, 1), (12, 1)],
  term ((899577984319840560871887548779244872903 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)],
  term ((-899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)],
  term ((-899577984319840560871887548779244872903 : Rat) / 3599128372207431889700080584088617803970) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 99. -/
theorem ep_Q2_024_block_23_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_23_0000_0099
      ep_Q2_024_block_23_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
