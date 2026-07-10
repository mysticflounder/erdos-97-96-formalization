/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0100 : Poly :=
[
  term ((3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1)]
]

/-- Partial product 100 for generator 15. -/
def ep_Q2_024_partial_15_0100 : Poly :=
[
  term ((-3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1)],
  term ((7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 15. -/
theorem ep_Q2_024_partial_15_0100_valid :
    mulPoly ep_Q2_024_coefficient_15_0100
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0101 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 101 for generator 15. -/
def ep_Q2_024_partial_15_0101 : Poly :=
[
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 15. -/
theorem ep_Q2_024_partial_15_0101_valid :
    mulPoly ep_Q2_024_coefficient_15_0101
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0102 : Poly :=
[
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 102 for generator 15. -/
def ep_Q2_024_partial_15_0102 : Poly :=
[
  term ((309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 15. -/
theorem ep_Q2_024_partial_15_0102_valid :
    mulPoly ep_Q2_024_coefficient_15_0102
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0103 : Poly :=
[
  term ((-4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 103 for generator 15. -/
def ep_Q2_024_partial_15_0103 : Poly :=
[
  term ((-9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 15. -/
theorem ep_Q2_024_partial_15_0103_valid :
    mulPoly ep_Q2_024_coefficient_15_0103
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0104 : Poly :=
[
  term ((-2019942658614304 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 15. -/
def ep_Q2_024_partial_15_0104 : Poly :=
[
  term ((-4039885317228608 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2019942658614304 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 15. -/
theorem ep_Q2_024_partial_15_0104_valid :
    mulPoly ep_Q2_024_coefficient_15_0104
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0105 : Poly :=
[
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 2)]
]

/-- Partial product 105 for generator 15. -/
def ep_Q2_024_partial_15_0105 : Poly :=
[
  term ((219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 15. -/
theorem ep_Q2_024_partial_15_0105_valid :
    mulPoly ep_Q2_024_coefficient_15_0105
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0106 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 106 for generator 15. -/
def ep_Q2_024_partial_15_0106 : Poly :=
[
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 15. -/
theorem ep_Q2_024_partial_15_0106_valid :
    mulPoly ep_Q2_024_coefficient_15_0106
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0107 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 107 for generator 15. -/
def ep_Q2_024_partial_15_0107 : Poly :=
[
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 15. -/
theorem ep_Q2_024_partial_15_0107_valid :
    mulPoly ep_Q2_024_coefficient_15_0107
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0108 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 15. -/
def ep_Q2_024_partial_15_0108 : Poly :=
[
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 15. -/
theorem ep_Q2_024_partial_15_0108_valid :
    mulPoly ep_Q2_024_coefficient_15_0108
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0109 : Poly :=
[
  term ((46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 15. -/
def ep_Q2_024_partial_15_0109 : Poly :=
[
  term ((93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 15. -/
theorem ep_Q2_024_partial_15_0109_valid :
    mulPoly ep_Q2_024_coefficient_15_0109
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0110 : Poly :=
[
  term ((-1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (15, 2)]
]

/-- Partial product 110 for generator 15. -/
def ep_Q2_024_partial_15_0110 : Poly :=
[
  term ((-3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 15. -/
theorem ep_Q2_024_partial_15_0110_valid :
    mulPoly ep_Q2_024_coefficient_15_0110
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0111 : Poly :=
[
  term ((-1490036832493784 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 15. -/
def ep_Q2_024_partial_15_0111 : Poly :=
[
  term ((-2980073664987568 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1490036832493784 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 15. -/
theorem ep_Q2_024_partial_15_0111_valid :
    mulPoly ep_Q2_024_coefficient_15_0111
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0112 : Poly :=
[
  term ((1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 1)]
]

/-- Partial product 112 for generator 15. -/
def ep_Q2_024_partial_15_0112 : Poly :=
[
  term ((-1422535435732474448269277738688400745212 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 1)],
  term ((2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 15. -/
theorem ep_Q2_024_partial_15_0112_valid :
    mulPoly ep_Q2_024_coefficient_15_0112
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0113 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 113 for generator 15. -/
def ep_Q2_024_partial_15_0113 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 15. -/
theorem ep_Q2_024_partial_15_0113_valid :
    mulPoly ep_Q2_024_coefficient_15_0113
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0114 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 114 for generator 15. -/
def ep_Q2_024_partial_15_0114 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 15. -/
theorem ep_Q2_024_partial_15_0114_valid :
    mulPoly ep_Q2_024_coefficient_15_0114
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0115 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 15. -/
def ep_Q2_024_partial_15_0115 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 15. -/
theorem ep_Q2_024_partial_15_0115_valid :
    mulPoly ep_Q2_024_coefficient_15_0115
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0116 : Poly :=
[
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (13, 1)]
]

/-- Partial product 116 for generator 15. -/
def ep_Q2_024_partial_15_0116 : Poly :=
[
  term ((247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 15. -/
theorem ep_Q2_024_partial_15_0116_valid :
    mulPoly ep_Q2_024_coefficient_15_0116
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0117 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 117 for generator 15. -/
def ep_Q2_024_partial_15_0117 : Poly :=
[
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 15. -/
theorem ep_Q2_024_partial_15_0117_valid :
    mulPoly ep_Q2_024_coefficient_15_0117
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0118 : Poly :=
[
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 15. -/
def ep_Q2_024_partial_15_0118 : Poly :=
[
  term ((6632049177465070 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-13264098354930140 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 15. -/
theorem ep_Q2_024_partial_15_0118_valid :
    mulPoly ep_Q2_024_coefficient_15_0118
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0119 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 119 for generator 15. -/
def ep_Q2_024_partial_15_0119 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 15. -/
theorem ep_Q2_024_partial_15_0119_valid :
    mulPoly ep_Q2_024_coefficient_15_0119
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0120 : Poly :=
[
  term ((2683773623074224058244140723370799658984 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)]
]

/-- Partial product 120 for generator 15. -/
def ep_Q2_024_partial_15_0120 : Poly :=
[
  term ((5367547246148448116488281446741599317968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-2683773623074224058244140723370799658984 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 15. -/
theorem ep_Q2_024_partial_15_0120_valid :
    mulPoly ep_Q2_024_coefficient_15_0120
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0121 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 121 for generator 15. -/
def ep_Q2_024_partial_15_0121 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 15. -/
theorem ep_Q2_024_partial_15_0121_valid :
    mulPoly ep_Q2_024_coefficient_15_0121
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0122 : Poly :=
[
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 1), (13, 1)]
]

/-- Partial product 122 for generator 15. -/
def ep_Q2_024_partial_15_0122 : Poly :=
[
  term ((390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 15. -/
theorem ep_Q2_024_partial_15_0122_valid :
    mulPoly ep_Q2_024_coefficient_15_0122
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0123 : Poly :=
[
  term ((33930242318076751684402307392833765964131874077319311131 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 123 for generator 15. -/
def ep_Q2_024_partial_15_0123 : Poly :=
[
  term ((67860484636153503368804614785667531928263748154638622262 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-33930242318076751684402307392833765964131874077319311131 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 15. -/
theorem ep_Q2_024_partial_15_0123_valid :
    mulPoly ep_Q2_024_coefficient_15_0123
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0124 : Poly :=
[
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 15. -/
def ep_Q2_024_partial_15_0124 : Poly :=
[
  term ((-4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 15. -/
theorem ep_Q2_024_partial_15_0124_valid :
    mulPoly ep_Q2_024_coefficient_15_0124
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0125 : Poly :=
[
  term ((32511906891681623718034078541426585533517 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 125 for generator 15. -/
def ep_Q2_024_partial_15_0125 : Poly :=
[
  term ((65023813783363247436068157082853171067034 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (6, 1), (9, 1)],
  term ((-32511906891681623718034078541426585533517 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 15. -/
theorem ep_Q2_024_partial_15_0125_valid :
    mulPoly ep_Q2_024_coefficient_15_0125
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0126 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 126 for generator 15. -/
def ep_Q2_024_partial_15_0126 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 15. -/
theorem ep_Q2_024_partial_15_0126_valid :
    mulPoly ep_Q2_024_coefficient_15_0126
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0127 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 127 for generator 15. -/
def ep_Q2_024_partial_15_0127 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 15. -/
theorem ep_Q2_024_partial_15_0127_valid :
    mulPoly ep_Q2_024_coefficient_15_0127
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0128 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 15. -/
def ep_Q2_024_partial_15_0128 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 15. -/
theorem ep_Q2_024_partial_15_0128_valid :
    mulPoly ep_Q2_024_coefficient_15_0128
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0129 : Poly :=
[
  term ((-6900819073486362130837691699935276660694 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)]
]

/-- Partial product 129 for generator 15. -/
def ep_Q2_024_partial_15_0129 : Poly :=
[
  term ((-13801638146972724261675383399870553321388 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((6900819073486362130837691699935276660694 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 15. -/
theorem ep_Q2_024_partial_15_0129_valid :
    mulPoly ep_Q2_024_coefficient_15_0129
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0130 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 130 for generator 15. -/
def ep_Q2_024_partial_15_0130 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 15. -/
theorem ep_Q2_024_partial_15_0130_valid :
    mulPoly ep_Q2_024_coefficient_15_0130
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0131 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 131 for generator 15. -/
def ep_Q2_024_partial_15_0131 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 15. -/
theorem ep_Q2_024_partial_15_0131_valid :
    mulPoly ep_Q2_024_coefficient_15_0131
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0132 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 15. -/
def ep_Q2_024_partial_15_0132 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 15. -/
theorem ep_Q2_024_partial_15_0132_valid :
    mulPoly ep_Q2_024_coefficient_15_0132
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0133 : Poly :=
[
  term ((116699243230878717513872100215465423301681631139135041229 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 133 for generator 15. -/
def ep_Q2_024_partial_15_0133 : Poly :=
[
  term ((116699243230878717513872100215465423301681631139135041229 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-116699243230878717513872100215465423301681631139135041229 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 15. -/
theorem ep_Q2_024_partial_15_0133_valid :
    mulPoly ep_Q2_024_coefficient_15_0133
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0134 : Poly :=
[
  term ((4642662710302105 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 15. -/
def ep_Q2_024_partial_15_0134 : Poly :=
[
  term ((9285325420604210 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 15. -/
theorem ep_Q2_024_partial_15_0134_valid :
    mulPoly ep_Q2_024_coefficient_15_0134
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0135 : Poly :=
[
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (3, 1), (9, 1), (13, 2)]
]

/-- Partial product 135 for generator 15. -/
def ep_Q2_024_partial_15_0135 : Poly :=
[
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 15. -/
theorem ep_Q2_024_partial_15_0135_valid :
    mulPoly ep_Q2_024_coefficient_15_0135
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0136 : Poly :=
[
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 136 for generator 15. -/
def ep_Q2_024_partial_15_0136 : Poly :=
[
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 15. -/
theorem ep_Q2_024_partial_15_0136_valid :
    mulPoly ep_Q2_024_coefficient_15_0136
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0137 : Poly :=
[
  term ((211421749004242349376825702758015465398717522887434210923 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 137 for generator 15. -/
def ep_Q2_024_partial_15_0137 : Poly :=
[
  term ((211421749004242349376825702758015465398717522887434210923 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-211421749004242349376825702758015465398717522887434210923 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 15. -/
theorem ep_Q2_024_partial_15_0137_valid :
    mulPoly ep_Q2_024_coefficient_15_0137
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0138 : Poly :=
[
  term ((-26165309254392841 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 15. -/
def ep_Q2_024_partial_15_0138 : Poly :=
[
  term ((-52330618508785682 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((26165309254392841 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 15. -/
theorem ep_Q2_024_partial_15_0138_valid :
    mulPoly ep_Q2_024_coefficient_15_0138
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0139 : Poly :=
[
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)]
]

/-- Partial product 139 for generator 15. -/
def ep_Q2_024_partial_15_0139 : Poly :=
[
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 2), (11, 1)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 15. -/
theorem ep_Q2_024_partial_15_0139_valid :
    mulPoly ep_Q2_024_coefficient_15_0139
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0140 : Poly :=
[
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

/-- Partial product 140 for generator 15. -/
def ep_Q2_024_partial_15_0140 : Poly :=
[
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 15. -/
theorem ep_Q2_024_partial_15_0140_valid :
    mulPoly ep_Q2_024_coefficient_15_0140
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0141 : Poly :=
[
  term ((4318523504943423910425624034102692560252463855713978699 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (9, 2), (15, 1)]
]

/-- Partial product 141 for generator 15. -/
def ep_Q2_024_partial_15_0141 : Poly :=
[
  term ((4318523504943423910425624034102692560252463855713978699 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-4318523504943423910425624034102692560252463855713978699 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 15. -/
theorem ep_Q2_024_partial_15_0141_valid :
    mulPoly ep_Q2_024_coefficient_15_0141
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0142 : Poly :=
[
  term ((-4859232461021042 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 15. -/
def ep_Q2_024_partial_15_0142 : Poly :=
[
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 15. -/
theorem ep_Q2_024_partial_15_0142_valid :
    mulPoly ep_Q2_024_coefficient_15_0142
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0143 : Poly :=
[
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)]
]

/-- Partial product 143 for generator 15. -/
def ep_Q2_024_partial_15_0143 : Poly :=
[
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 3)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 15. -/
theorem ep_Q2_024_partial_15_0143_valid :
    mulPoly ep_Q2_024_coefficient_15_0143
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0144 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 144 for generator 15. -/
def ep_Q2_024_partial_15_0144 : Poly :=
[
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 15. -/
theorem ep_Q2_024_partial_15_0144_valid :
    mulPoly ep_Q2_024_coefficient_15_0144
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0145 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 145 for generator 15. -/
def ep_Q2_024_partial_15_0145 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 15. -/
theorem ep_Q2_024_partial_15_0145_valid :
    mulPoly ep_Q2_024_coefficient_15_0145
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0146 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 15. -/
def ep_Q2_024_partial_15_0146 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 15. -/
theorem ep_Q2_024_partial_15_0146_valid :
    mulPoly ep_Q2_024_coefficient_15_0146
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0147 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 147 for generator 15. -/
def ep_Q2_024_partial_15_0147 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 15. -/
theorem ep_Q2_024_partial_15_0147_valid :
    mulPoly ep_Q2_024_coefficient_15_0147
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0148 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 15. -/
def ep_Q2_024_partial_15_0148 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 15. -/
theorem ep_Q2_024_partial_15_0148_valid :
    mulPoly ep_Q2_024_coefficient_15_0148
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0149 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 149 for generator 15. -/
def ep_Q2_024_partial_15_0149 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 15. -/
theorem ep_Q2_024_partial_15_0149_valid :
    mulPoly ep_Q2_024_coefficient_15_0149
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0150 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 15. -/
def ep_Q2_024_partial_15_0150 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 15. -/
theorem ep_Q2_024_partial_15_0150_valid :
    mulPoly ep_Q2_024_coefficient_15_0150
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0151 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)]
]

/-- Partial product 151 for generator 15. -/
def ep_Q2_024_partial_15_0151 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 15. -/
theorem ep_Q2_024_partial_15_0151_valid :
    mulPoly ep_Q2_024_coefficient_15_0151
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0152 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 152 for generator 15. -/
def ep_Q2_024_partial_15_0152 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 15. -/
theorem ep_Q2_024_partial_15_0152_valid :
    mulPoly ep_Q2_024_coefficient_15_0152
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0153 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

/-- Partial product 153 for generator 15. -/
def ep_Q2_024_partial_15_0153 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 15. -/
theorem ep_Q2_024_partial_15_0153_valid :
    mulPoly ep_Q2_024_coefficient_15_0153
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0154 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 15. -/
def ep_Q2_024_partial_15_0154 : Poly :=
[
  term ((2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 15. -/
theorem ep_Q2_024_partial_15_0154_valid :
    mulPoly ep_Q2_024_coefficient_15_0154
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0155 : Poly :=
[
  term ((4799113465801491294005860539804267252938 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 155 for generator 15. -/
def ep_Q2_024_partial_15_0155 : Poly :=
[
  term ((9598226931602982588011721079608534505876 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-4799113465801491294005860539804267252938 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 15. -/
theorem ep_Q2_024_partial_15_0155_valid :
    mulPoly ep_Q2_024_coefficient_15_0155
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0156 : Poly :=
[
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 156 for generator 15. -/
def ep_Q2_024_partial_15_0156 : Poly :=
[
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 15. -/
theorem ep_Q2_024_partial_15_0156_valid :
    mulPoly ep_Q2_024_coefficient_15_0156
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0157 : Poly :=
[
  term ((280974502237714127156424154923047284233991045314466540943 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 157 for generator 15. -/
def ep_Q2_024_partial_15_0157 : Poly :=
[
  term ((280974502237714127156424154923047284233991045314466540943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-280974502237714127156424154923047284233991045314466540943 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 15. -/
theorem ep_Q2_024_partial_15_0157_valid :
    mulPoly ep_Q2_024_coefficient_15_0157
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0158 : Poly :=
[
  term ((128615541817159787 : Rat) / 6976681326919158) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 15. -/
def ep_Q2_024_partial_15_0158 : Poly :=
[
  term ((128615541817159787 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128615541817159787 : Rat) / 6976681326919158) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 15. -/
theorem ep_Q2_024_partial_15_0158_valid :
    mulPoly ep_Q2_024_coefficient_15_0158
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0159 : Poly :=
[
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (12, 1), (15, 3)]
]

/-- Partial product 159 for generator 15. -/
def ep_Q2_024_partial_15_0159 : Poly :=
[
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 15. -/
theorem ep_Q2_024_partial_15_0159_valid :
    mulPoly ep_Q2_024_coefficient_15_0159
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0160 : Poly :=
[
  term ((-1443384088015008 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 160 for generator 15. -/
def ep_Q2_024_partial_15_0160 : Poly :=
[
  term ((-2886768176030016 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 15. -/
theorem ep_Q2_024_partial_15_0160_valid :
    mulPoly ep_Q2_024_coefficient_15_0160
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0161 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 2), (13, 1)]
]

/-- Partial product 161 for generator 15. -/
def ep_Q2_024_partial_15_0161 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (12, 2), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 15. -/
theorem ep_Q2_024_partial_15_0161_valid :
    mulPoly ep_Q2_024_coefficient_15_0161
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0162 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 1), (12, 2), (15, 1)]
]

/-- Partial product 162 for generator 15. -/
def ep_Q2_024_partial_15_0162 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 15. -/
theorem ep_Q2_024_partial_15_0162_valid :
    mulPoly ep_Q2_024_coefficient_15_0162
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0163 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 15. -/
def ep_Q2_024_partial_15_0163 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 15. -/
theorem ep_Q2_024_partial_15_0163_valid :
    mulPoly ep_Q2_024_coefficient_15_0163
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0164 : Poly :=
[
  term ((-337800951830142992672716427109078429256 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 164 for generator 15. -/
def ep_Q2_024_partial_15_0164 : Poly :=
[
  term ((-675601903660285985345432854218156858512 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((337800951830142992672716427109078429256 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 15. -/
theorem ep_Q2_024_partial_15_0164_valid :
    mulPoly ep_Q2_024_coefficient_15_0164
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0165 : Poly :=
[
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 1), (13, 1), (15, 2)]
]

/-- Partial product 165 for generator 15. -/
def ep_Q2_024_partial_15_0165 : Poly :=
[
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 15. -/
theorem ep_Q2_024_partial_15_0165_valid :
    mulPoly ep_Q2_024_coefficient_15_0165
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0166 : Poly :=
[
  term ((-513905188349430 : Rat) / 1162780221153193) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 15. -/
def ep_Q2_024_partial_15_0166 : Poly :=
[
  term ((-1027810376698860 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((513905188349430 : Rat) / 1162780221153193) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 15. -/
theorem ep_Q2_024_partial_15_0166_valid :
    mulPoly ep_Q2_024_coefficient_15_0166
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0167 : Poly :=
[
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 2), (15, 1)]
]

/-- Partial product 167 for generator 15. -/
def ep_Q2_024_partial_15_0167 : Poly :=
[
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 15. -/
theorem ep_Q2_024_partial_15_0167_valid :
    mulPoly ep_Q2_024_coefficient_15_0167
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0168 : Poly :=
[
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 168 for generator 15. -/
def ep_Q2_024_partial_15_0168 : Poly :=
[
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 15. -/
theorem ep_Q2_024_partial_15_0168_valid :
    mulPoly ep_Q2_024_coefficient_15_0168
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0169 : Poly :=
[
  term ((-670808968411057593395196877965516759209678308415858952469 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 169 for generator 15. -/
def ep_Q2_024_partial_15_0169 : Poly :=
[
  term ((-670808968411057593395196877965516759209678308415858952469 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((670808968411057593395196877965516759209678308415858952469 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 15. -/
theorem ep_Q2_024_partial_15_0169_valid :
    mulPoly ep_Q2_024_coefficient_15_0169
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0170 : Poly :=
[
  term ((-104756162150604395 : Rat) / 13953362653838316) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 15. -/
def ep_Q2_024_partial_15_0170 : Poly :=
[
  term ((-104756162150604395 : Rat) / 6976681326919158) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((104756162150604395 : Rat) / 13953362653838316) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 15. -/
theorem ep_Q2_024_partial_15_0170_valid :
    mulPoly ep_Q2_024_coefficient_15_0170
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0171 : Poly :=
[
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (15, 3)]
]

/-- Partial product 171 for generator 15. -/
def ep_Q2_024_partial_15_0171 : Poly :=
[
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 15. -/
theorem ep_Q2_024_partial_15_0171_valid :
    mulPoly ep_Q2_024_coefficient_15_0171
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0172 : Poly :=
[
  term ((735047170265332 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 172 for generator 15. -/
def ep_Q2_024_partial_15_0172 : Poly :=
[
  term ((1470094340530664 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 15. -/
theorem ep_Q2_024_partial_15_0172_valid :
    mulPoly ep_Q2_024_coefficient_15_0172
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0173 : Poly :=
[
  term ((-4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 2)]
]

/-- Partial product 173 for generator 15. -/
def ep_Q2_024_partial_15_0173 : Poly :=
[
  term ((4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 2)],
  term ((-8916895182462619484956223224102416319448 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 15. -/
theorem ep_Q2_024_partial_15_0173_valid :
    mulPoly ep_Q2_024_coefficient_15_0173
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0174 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (4, 1)]
]

/-- Partial product 174 for generator 15. -/
def ep_Q2_024_partial_15_0174 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (4, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 15. -/
theorem ep_Q2_024_partial_15_0174_valid :
    mulPoly ep_Q2_024_coefficient_15_0174
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0175 : Poly :=
[
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (9, 1)]
]

/-- Partial product 175 for generator 15. -/
def ep_Q2_024_partial_15_0175 : Poly :=
[
  term ((-439165574351317027328597678950990790048 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (6, 1), (9, 1)],
  term ((219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 15. -/
theorem ep_Q2_024_partial_15_0175_valid :
    mulPoly ep_Q2_024_coefficient_15_0175
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0176 : Poly :=
[
  term ((-239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (13, 1)]
]

/-- Partial product 176 for generator 15. -/
def ep_Q2_024_partial_15_0176 : Poly :=
[
  term ((-479115938187114839403973908717799367488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (6, 1), (13, 1)],
  term ((239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 15. -/
theorem ep_Q2_024_partial_15_0176_valid :
    mulPoly ep_Q2_024_coefficient_15_0176
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0177 : Poly :=
[
  term ((3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

/-- Partial product 177 for generator 15. -/
def ep_Q2_024_partial_15_0177 : Poly :=
[
  term ((6544646828116480195851509250156034762852238645975674672 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 15. -/
theorem ep_Q2_024_partial_15_0177_valid :
    mulPoly ep_Q2_024_coefficient_15_0177
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0178 : Poly :=
[
  term ((-2262672637792 : Rat) / 3488340663459579) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 15. -/
def ep_Q2_024_partial_15_0178 : Poly :=
[
  term ((-4525345275584 : Rat) / 3488340663459579) [(0, 1), (3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2262672637792 : Rat) / 3488340663459579) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 15. -/
theorem ep_Q2_024_partial_15_0178_valid :
    mulPoly ep_Q2_024_coefficient_15_0178
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0179 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (8, 1)]
]

/-- Partial product 179 for generator 15. -/
def ep_Q2_024_partial_15_0179 : Poly :=
[
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (8, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 15. -/
theorem ep_Q2_024_partial_15_0179_valid :
    mulPoly ep_Q2_024_coefficient_15_0179
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0180 : Poly :=
[
  term ((976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (13, 1)]
]

/-- Partial product 180 for generator 15. -/
def ep_Q2_024_partial_15_0180 : Poly :=
[
  term ((1952020120865172684821412275108055944672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 15. -/
theorem ep_Q2_024_partial_15_0180_valid :
    mulPoly ep_Q2_024_coefficient_15_0180
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0181 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (9, 1), (15, 1)]
]

/-- Partial product 181 for generator 15. -/
def ep_Q2_024_partial_15_0181 : Poly :=
[
  term ((-27130320051483874779001434360058490581240592138093573014 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 15. -/
theorem ep_Q2_024_partial_15_0181_valid :
    mulPoly ep_Q2_024_coefficient_15_0181
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0182 : Poly :=
[
  term ((9718464922042084 : Rat) / 3488340663459579) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 15. -/
def ep_Q2_024_partial_15_0182 : Poly :=
[
  term ((19436929844084168 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 15. -/
theorem ep_Q2_024_partial_15_0182_valid :
    mulPoly ep_Q2_024_coefficient_15_0182
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0183 : Poly :=
[
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 2)]
]

/-- Partial product 183 for generator 15. -/
def ep_Q2_024_partial_15_0183 : Poly :=
[
  term ((1640925836848218604613933742224210947456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (9, 2)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 15. -/
theorem ep_Q2_024_partial_15_0183_valid :
    mulPoly ep_Q2_024_coefficient_15_0183
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0184 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1)]
]

/-- Partial product 184 for generator 15. -/
def ep_Q2_024_partial_15_0184 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 15. -/
theorem ep_Q2_024_partial_15_0184_valid :
    mulPoly ep_Q2_024_coefficient_15_0184
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0185 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 185 for generator 15. -/
def ep_Q2_024_partial_15_0185 : Poly :=
[
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 15. -/
theorem ep_Q2_024_partial_15_0185_valid :
    mulPoly ep_Q2_024_coefficient_15_0185
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0186 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (12, 1), (15, 2)]
]

/-- Partial product 186 for generator 15. -/
def ep_Q2_024_partial_15_0186 : Poly :=
[
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (6, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 15. -/
theorem ep_Q2_024_partial_15_0186_valid :
    mulPoly ep_Q2_024_coefficient_15_0186
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0187 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 187 for generator 15. -/
def ep_Q2_024_partial_15_0187 : Poly :=
[
  term ((2108843069097728 : Rat) / 1162780221153193) [(0, 1), (3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 15. -/
theorem ep_Q2_024_partial_15_0187_valid :
    mulPoly ep_Q2_024_coefficient_15_0187
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0188 : Poly :=
[
  term ((-174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

/-- Partial product 188 for generator 15. -/
def ep_Q2_024_partial_15_0188 : Poly :=
[
  term ((-174387597396569679045385362785627677503893371381937419019 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (13, 1), (15, 1)],
  term ((174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 15. -/
theorem ep_Q2_024_partial_15_0188_valid :
    mulPoly ep_Q2_024_coefficient_15_0188
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0189 : Poly :=
[
  term ((6091495827975490 : Rat) / 3488340663459579) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 15. -/
def ep_Q2_024_partial_15_0189 : Poly :=
[
  term ((12182991655950980 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6091495827975490 : Rat) / 3488340663459579) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 15. -/
theorem ep_Q2_024_partial_15_0189_valid :
    mulPoly ep_Q2_024_coefficient_15_0189
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0190 : Poly :=
[
  term ((-499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (13, 2)]
]

/-- Partial product 190 for generator 15. -/
def ep_Q2_024_partial_15_0190 : Poly :=
[
  term ((-999388901907432442689210242412893919152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (13, 2)],
  term ((499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 15. -/
theorem ep_Q2_024_partial_15_0190_valid :
    mulPoly ep_Q2_024_coefficient_15_0190
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0191 : Poly :=
[
  term ((-950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (14, 1)]
]

/-- Partial product 191 for generator 15. -/
def ep_Q2_024_partial_15_0191 : Poly :=
[
  term ((-1900028835764127309554807391409792473748 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 15. -/
theorem ep_Q2_024_partial_15_0191_valid :
    mulPoly ep_Q2_024_coefficient_15_0191
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0192 : Poly :=
[
  term ((-70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (15, 2)]
]

/-- Partial product 192 for generator 15. -/
def ep_Q2_024_partial_15_0192 : Poly :=
[
  term ((-70401968402328451832893051496183231462484150674916090649 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (15, 2)],
  term ((70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 15. -/
theorem ep_Q2_024_partial_15_0192_valid :
    mulPoly ep_Q2_024_coefficient_15_0192
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0193 : Poly :=
[
  term ((18575363071029062 : Rat) / 3488340663459579) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

/-- Partial product 193 for generator 15. -/
def ep_Q2_024_partial_15_0193 : Poly :=
[
  term ((37150726142058124 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-18575363071029062 : Rat) / 3488340663459579) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 15. -/
theorem ep_Q2_024_partial_15_0193_valid :
    mulPoly ep_Q2_024_coefficient_15_0193
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0194 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 194 for generator 15. -/
def ep_Q2_024_partial_15_0194 : Poly :=
[
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 15. -/
theorem ep_Q2_024_partial_15_0194_valid :
    mulPoly ep_Q2_024_coefficient_15_0194
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0195 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 195 for generator 15. -/
def ep_Q2_024_partial_15_0195 : Poly :=
[
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 15. -/
theorem ep_Q2_024_partial_15_0195_valid :
    mulPoly ep_Q2_024_coefficient_15_0195
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0196 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 15. -/
def ep_Q2_024_partial_15_0196 : Poly :=
[
  term ((9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 15. -/
theorem ep_Q2_024_partial_15_0196_valid :
    mulPoly ep_Q2_024_coefficient_15_0196
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0197 : Poly :=
[
  term ((-302673093842474050030440654685856164984 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 197 for generator 15. -/
def ep_Q2_024_partial_15_0197 : Poly :=
[
  term ((-605346187684948100060881309371712329968 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((302673093842474050030440654685856164984 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 15. -/
theorem ep_Q2_024_partial_15_0197_valid :
    mulPoly ep_Q2_024_coefficient_15_0197
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0198 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 198 for generator 15. -/
def ep_Q2_024_partial_15_0198 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 15. -/
theorem ep_Q2_024_partial_15_0198_valid :
    mulPoly ep_Q2_024_coefficient_15_0198
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0199 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 199 for generator 15. -/
def ep_Q2_024_partial_15_0199 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 15. -/
theorem ep_Q2_024_partial_15_0199_valid :
    mulPoly ep_Q2_024_coefficient_15_0199
        ep_Q2_024_generator_15_0100_0199 =
      ep_Q2_024_partial_15_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_15_0100,
  ep_Q2_024_partial_15_0101,
  ep_Q2_024_partial_15_0102,
  ep_Q2_024_partial_15_0103,
  ep_Q2_024_partial_15_0104,
  ep_Q2_024_partial_15_0105,
  ep_Q2_024_partial_15_0106,
  ep_Q2_024_partial_15_0107,
  ep_Q2_024_partial_15_0108,
  ep_Q2_024_partial_15_0109,
  ep_Q2_024_partial_15_0110,
  ep_Q2_024_partial_15_0111,
  ep_Q2_024_partial_15_0112,
  ep_Q2_024_partial_15_0113,
  ep_Q2_024_partial_15_0114,
  ep_Q2_024_partial_15_0115,
  ep_Q2_024_partial_15_0116,
  ep_Q2_024_partial_15_0117,
  ep_Q2_024_partial_15_0118,
  ep_Q2_024_partial_15_0119,
  ep_Q2_024_partial_15_0120,
  ep_Q2_024_partial_15_0121,
  ep_Q2_024_partial_15_0122,
  ep_Q2_024_partial_15_0123,
  ep_Q2_024_partial_15_0124,
  ep_Q2_024_partial_15_0125,
  ep_Q2_024_partial_15_0126,
  ep_Q2_024_partial_15_0127,
  ep_Q2_024_partial_15_0128,
  ep_Q2_024_partial_15_0129,
  ep_Q2_024_partial_15_0130,
  ep_Q2_024_partial_15_0131,
  ep_Q2_024_partial_15_0132,
  ep_Q2_024_partial_15_0133,
  ep_Q2_024_partial_15_0134,
  ep_Q2_024_partial_15_0135,
  ep_Q2_024_partial_15_0136,
  ep_Q2_024_partial_15_0137,
  ep_Q2_024_partial_15_0138,
  ep_Q2_024_partial_15_0139,
  ep_Q2_024_partial_15_0140,
  ep_Q2_024_partial_15_0141,
  ep_Q2_024_partial_15_0142,
  ep_Q2_024_partial_15_0143,
  ep_Q2_024_partial_15_0144,
  ep_Q2_024_partial_15_0145,
  ep_Q2_024_partial_15_0146,
  ep_Q2_024_partial_15_0147,
  ep_Q2_024_partial_15_0148,
  ep_Q2_024_partial_15_0149,
  ep_Q2_024_partial_15_0150,
  ep_Q2_024_partial_15_0151,
  ep_Q2_024_partial_15_0152,
  ep_Q2_024_partial_15_0153,
  ep_Q2_024_partial_15_0154,
  ep_Q2_024_partial_15_0155,
  ep_Q2_024_partial_15_0156,
  ep_Q2_024_partial_15_0157,
  ep_Q2_024_partial_15_0158,
  ep_Q2_024_partial_15_0159,
  ep_Q2_024_partial_15_0160,
  ep_Q2_024_partial_15_0161,
  ep_Q2_024_partial_15_0162,
  ep_Q2_024_partial_15_0163,
  ep_Q2_024_partial_15_0164,
  ep_Q2_024_partial_15_0165,
  ep_Q2_024_partial_15_0166,
  ep_Q2_024_partial_15_0167,
  ep_Q2_024_partial_15_0168,
  ep_Q2_024_partial_15_0169,
  ep_Q2_024_partial_15_0170,
  ep_Q2_024_partial_15_0171,
  ep_Q2_024_partial_15_0172,
  ep_Q2_024_partial_15_0173,
  ep_Q2_024_partial_15_0174,
  ep_Q2_024_partial_15_0175,
  ep_Q2_024_partial_15_0176,
  ep_Q2_024_partial_15_0177,
  ep_Q2_024_partial_15_0178,
  ep_Q2_024_partial_15_0179,
  ep_Q2_024_partial_15_0180,
  ep_Q2_024_partial_15_0181,
  ep_Q2_024_partial_15_0182,
  ep_Q2_024_partial_15_0183,
  ep_Q2_024_partial_15_0184,
  ep_Q2_024_partial_15_0185,
  ep_Q2_024_partial_15_0186,
  ep_Q2_024_partial_15_0187,
  ep_Q2_024_partial_15_0188,
  ep_Q2_024_partial_15_0189,
  ep_Q2_024_partial_15_0190,
  ep_Q2_024_partial_15_0191,
  ep_Q2_024_partial_15_0192,
  ep_Q2_024_partial_15_0193,
  ep_Q2_024_partial_15_0194,
  ep_Q2_024_partial_15_0195,
  ep_Q2_024_partial_15_0196,
  ep_Q2_024_partial_15_0197,
  ep_Q2_024_partial_15_0198,
  ep_Q2_024_partial_15_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0100_0199 : Poly :=
[
  term ((-3518180533319811389642964276756815974484 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1)],
  term ((7036361066639622779285928553513631948968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (5, 1), (6, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-9426757935441815533073220006202268054429158076909601808 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4039885317228608 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((93586717957238572261605641012732785664 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3982638115398820024777961612875476607481565279701163604 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-2980073664987568 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((4713378967720907766536610003101134027214579038454800904 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((2019942658614304 : Rat) / 3488340663459579) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (5, 1), (9, 2)],
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-3263854553391488 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-46793358978619286130802820506366392832 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((1991319057699410012388980806437738303740782639850581802 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((1490036832493784 : Rat) / 1162780221153193) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((5367547246148448116488281446741599317968 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((390047578831934304138240621742973204504 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((67860484636153503368804614785667531928263748154638622262 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-4646900379760056 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((52220994861770977401644657434657564360126 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (6, 1), (9, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13801638146972724261675383399870553321388 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((116699243230878717513872100215465423301681631139135041229 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((211421749004242349376825702758015465398717522887434210923 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-52330618508785682 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (9, 2), (11, 1)],
  term ((-1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((4318523504943423910425624034102692560252463855713978699 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (9, 3)],
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1889768975959715774648590059535169521868 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((282809384668849011103821337389888454199518014916220824113 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((127312156775580821 : Rat) / 3488340663459579) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-2886768176030016 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((67830063655338494700799553145143454412 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1027810376698860 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-165737246587093767644199528152798392282162944483752768907 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-64963867085813975 : Rat) / 6976681326919158) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((1470094340530664 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((2845070871464948896538555477376801490424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (9, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-13264098354930140 : Rat) / 1162780221153193) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (7, 1)],
  term ((-2683773623074224058244140723370799658984 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 1), (13, 1)],
  term ((-33930242318076751684402307392833765964131874077319311131 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-32511906891681623718034078541426585533517 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)],
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6900819073486362130837691699935276660694 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-116699243230878717513872100215465423301681631139135041229 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((-211421749004242349376825702758015465398717522887434210923 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((26165309254392841 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)],
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((-4318523504943423910425624034102692560252463855713978699 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((4859232461021042 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)],
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4799113465801491294005860539804267252938 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-280974502237714127156424154923047284233991045314466540943 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-128615541817159787 : Rat) / 6976681326919158) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((337800951830142992672716427109078429256 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (13, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((513905188349430 : Rat) / 1162780221153193) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((670808968411057593395196877965516759209678308415858952469 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)],
  term ((104756162150604395 : Rat) / 13953362653838316) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (15, 3)],
  term ((-735047170265332 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((4458447591231309742478111612051208159724 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (4, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (4, 1), (6, 1)],
  term ((-439165574351317027328597678950990790048 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (6, 1), (9, 1)],
  term ((-479115938187114839403973908717799367488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (6, 1), (13, 1)],
  term ((6544646828116480195851509250156034762852238645975674672 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-4525345275584 : Rat) / 3488340663459579) [(0, 1), (3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((239557969093557419701986954358899683744 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-3272323414058240097925754625078017381426119322987837336 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((2262672637792 : Rat) / 3488340663459579) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8916895182462619484956223224102416319448 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 2), (6, 1)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (8, 1)],
  term ((1952020120865172684821412275108055944672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-27130320051483874779001434360058490581240592138093573014 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((19436929844084168 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1640925836848218604613933742224210947456 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (9, 2)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (6, 1), (12, 1)],
  term ((44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (6, 1), (12, 1), (15, 2)],
  term ((2108843069097728 : Rat) / 1162780221153193) [(0, 1), (3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-174387597396569679045385362785627677503893371381937419019 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (13, 1), (15, 1)],
  term ((12182991655950980 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-999388901907432442689210242412893919152 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (13, 2)],
  term ((-1900028835764127309554807391409792473748 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((-70401968402328451832893051496183231462484150674916090649 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (6, 1), (15, 2)],
  term ((37150726142058124 : Rat) / 3488340663459579) [(0, 1), (3, 2), (6, 1), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (8, 1)],
  term ((-976010060432586342410706137554027972336 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-9718464922042084 : Rat) / 3488340663459579) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((174387597396569679045385362785627677503893371381937419019 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-6091495827975490 : Rat) / 3488340663459579) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((499694450953716221344605121206446959576 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 2), (14, 1)],
  term ((70401968402328451832893051496183231462484150674916090649 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (3, 2), (15, 2)],
  term ((-18575363071029062 : Rat) / 3488340663459579) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-605346187684948100060881309371712329968 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((302673093842474050030440654685856164984 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 100 through 199. -/
theorem ep_Q2_024_block_15_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_15_0100_0199
      ep_Q2_024_block_15_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
