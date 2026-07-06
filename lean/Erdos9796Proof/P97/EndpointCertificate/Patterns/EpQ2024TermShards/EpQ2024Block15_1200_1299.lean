/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1200 : Poly :=
[
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 1200 for generator 15. -/
def ep_Q2_024_partial_15_1200 : Poly :=
[
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 15. -/
theorem ep_Q2_024_partial_15_1200_valid :
    mulPoly ep_Q2_024_coefficient_15_1200
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1201 : Poly :=
[
  term ((23585081757950473 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1201 for generator 15. -/
def ep_Q2_024_partial_15_1201 : Poly :=
[
  term ((47170163515900946 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 15. -/
theorem ep_Q2_024_partial_15_1201_valid :
    mulPoly ep_Q2_024_coefficient_15_1201
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1202 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)]
]

/-- Partial product 1202 for generator 15. -/
def ep_Q2_024_partial_15_1202 : Poly :=
[
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 15. -/
theorem ep_Q2_024_partial_15_1202_valid :
    mulPoly ep_Q2_024_coefficient_15_1202
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1203 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 2), (13, 1)]
]

/-- Partial product 1203 for generator 15. -/
def ep_Q2_024_partial_15_1203 : Poly :=
[
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 15. -/
theorem ep_Q2_024_partial_15_1203_valid :
    mulPoly ep_Q2_024_coefficient_15_1203
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1204 : Poly :=
[
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (8, 1), (9, 2), (15, 1)]
]

/-- Partial product 1204 for generator 15. -/
def ep_Q2_024_partial_15_1204 : Poly :=
[
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (8, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 15. -/
theorem ep_Q2_024_partial_15_1204_valid :
    mulPoly ep_Q2_024_coefficient_15_1204
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1205 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1205 for generator 15. -/
def ep_Q2_024_partial_15_1205 : Poly :=
[
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 15. -/
theorem ep_Q2_024_partial_15_1205_valid :
    mulPoly ep_Q2_024_coefficient_15_1205
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1206 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 3)]
]

/-- Partial product 1206 for generator 15. -/
def ep_Q2_024_partial_15_1206 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 15. -/
theorem ep_Q2_024_partial_15_1206_valid :
    mulPoly ep_Q2_024_coefficient_15_1206
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1207 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 1207 for generator 15. -/
def ep_Q2_024_partial_15_1207 : Poly :=
[
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 15. -/
theorem ep_Q2_024_partial_15_1207_valid :
    mulPoly ep_Q2_024_coefficient_15_1207
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1208 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1208 for generator 15. -/
def ep_Q2_024_partial_15_1208 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 15. -/
theorem ep_Q2_024_partial_15_1208_valid :
    mulPoly ep_Q2_024_coefficient_15_1208
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1209 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1209 for generator 15. -/
def ep_Q2_024_partial_15_1209 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 15. -/
theorem ep_Q2_024_partial_15_1209_valid :
    mulPoly ep_Q2_024_coefficient_15_1209
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1210 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1210 for generator 15. -/
def ep_Q2_024_partial_15_1210 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 15. -/
theorem ep_Q2_024_partial_15_1210_valid :
    mulPoly ep_Q2_024_coefficient_15_1210
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1211 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1211 for generator 15. -/
def ep_Q2_024_partial_15_1211 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 15. -/
theorem ep_Q2_024_partial_15_1211_valid :
    mulPoly ep_Q2_024_coefficient_15_1211
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1212 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1212 for generator 15. -/
def ep_Q2_024_partial_15_1212 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 15. -/
theorem ep_Q2_024_partial_15_1212_valid :
    mulPoly ep_Q2_024_coefficient_15_1212
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1213 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1213 for generator 15. -/
def ep_Q2_024_partial_15_1213 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 15. -/
theorem ep_Q2_024_partial_15_1213_valid :
    mulPoly ep_Q2_024_coefficient_15_1213
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1214 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1214 for generator 15. -/
def ep_Q2_024_partial_15_1214 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 15. -/
theorem ep_Q2_024_partial_15_1214_valid :
    mulPoly ep_Q2_024_coefficient_15_1214
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1215 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1215 for generator 15. -/
def ep_Q2_024_partial_15_1215 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 15. -/
theorem ep_Q2_024_partial_15_1215_valid :
    mulPoly ep_Q2_024_coefficient_15_1215
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1216 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 1216 for generator 15. -/
def ep_Q2_024_partial_15_1216 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 15. -/
theorem ep_Q2_024_partial_15_1216_valid :
    mulPoly ep_Q2_024_coefficient_15_1216
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1217 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1217 for generator 15. -/
def ep_Q2_024_partial_15_1217 : Poly :=
[
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 15. -/
theorem ep_Q2_024_partial_15_1217_valid :
    mulPoly ep_Q2_024_coefficient_15_1217
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1218 : Poly :=
[
  term ((-286932460436570379076183511228423888258 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1218 for generator 15. -/
def ep_Q2_024_partial_15_1218 : Poly :=
[
  term ((-573864920873140758152367022456847776516 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((286932460436570379076183511228423888258 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 15. -/
theorem ep_Q2_024_partial_15_1218_valid :
    mulPoly ep_Q2_024_coefficient_15_1218
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1219 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1219 for generator 15. -/
def ep_Q2_024_partial_15_1219 : Poly :=
[
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 15. -/
theorem ep_Q2_024_partial_15_1219_valid :
    mulPoly ep_Q2_024_coefficient_15_1219
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1220 : Poly :=
[
  term ((-50562742388418120368929876642658354880743509400286978149 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1220 for generator 15. -/
def ep_Q2_024_partial_15_1220 : Poly :=
[
  term ((-50562742388418120368929876642658354880743509400286978149 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((50562742388418120368929876642658354880743509400286978149 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 15. -/
theorem ep_Q2_024_partial_15_1220_valid :
    mulPoly ep_Q2_024_coefficient_15_1220
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1221 : Poly :=
[
  term ((25654027359549217 : Rat) / 6976681326919158) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1221 for generator 15. -/
def ep_Q2_024_partial_15_1221 : Poly :=
[
  term ((25654027359549217 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25654027359549217 : Rat) / 6976681326919158) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 15. -/
theorem ep_Q2_024_partial_15_1221_valid :
    mulPoly ep_Q2_024_coefficient_15_1221
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1222 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1222 for generator 15. -/
def ep_Q2_024_partial_15_1222 : Poly :=
[
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 15. -/
theorem ep_Q2_024_partial_15_1222_valid :
    mulPoly ep_Q2_024_coefficient_15_1222
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1223 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1223 for generator 15. -/
def ep_Q2_024_partial_15_1223 : Poly :=
[
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 15. -/
theorem ep_Q2_024_partial_15_1223_valid :
    mulPoly ep_Q2_024_coefficient_15_1223
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1224 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 1224 for generator 15. -/
def ep_Q2_024_partial_15_1224 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (12, 2), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 15. -/
theorem ep_Q2_024_partial_15_1224_valid :
    mulPoly ep_Q2_024_coefficient_15_1224
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1225 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1225 for generator 15. -/
def ep_Q2_024_partial_15_1225 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 15. -/
theorem ep_Q2_024_partial_15_1225_valid :
    mulPoly ep_Q2_024_coefficient_15_1225
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1226 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1226 for generator 15. -/
def ep_Q2_024_partial_15_1226 : Poly :=
[
  term ((-2606770083157932 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 15. -/
theorem ep_Q2_024_partial_15_1226_valid :
    mulPoly ep_Q2_024_coefficient_15_1226
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1227 : Poly :=
[
  term ((-222974132670082364426916392616809680960 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 1227 for generator 15. -/
def ep_Q2_024_partial_15_1227 : Poly :=
[
  term ((-445948265340164728853832785233619361920 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((222974132670082364426916392616809680960 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 15. -/
theorem ep_Q2_024_partial_15_1227_valid :
    mulPoly ep_Q2_024_coefficient_15_1227
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1228 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1228 for generator 15. -/
def ep_Q2_024_partial_15_1228 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 15. -/
theorem ep_Q2_024_partial_15_1228_valid :
    mulPoly ep_Q2_024_coefficient_15_1228
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1229 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1229 for generator 15. -/
def ep_Q2_024_partial_15_1229 : Poly :=
[
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 15. -/
theorem ep_Q2_024_partial_15_1229_valid :
    mulPoly ep_Q2_024_coefficient_15_1229
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1230 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 1230 for generator 15. -/
def ep_Q2_024_partial_15_1230 : Poly :=
[
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 15. -/
theorem ep_Q2_024_partial_15_1230_valid :
    mulPoly ep_Q2_024_coefficient_15_1230
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1231 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1231 for generator 15. -/
def ep_Q2_024_partial_15_1231 : Poly :=
[
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 15. -/
theorem ep_Q2_024_partial_15_1231_valid :
    mulPoly ep_Q2_024_coefficient_15_1231
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1232 : Poly :=
[
  term ((112208185162189595500917903414467681551145270067832622813 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 1232 for generator 15. -/
def ep_Q2_024_partial_15_1232 : Poly :=
[
  term ((112208185162189595500917903414467681551145270067832622813 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-112208185162189595500917903414467681551145270067832622813 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 15. -/
theorem ep_Q2_024_partial_15_1232_valid :
    mulPoly ep_Q2_024_coefficient_15_1232
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1233 : Poly :=
[
  term ((-59676688108368445 : Rat) / 13953362653838316) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1233 for generator 15. -/
def ep_Q2_024_partial_15_1233 : Poly :=
[
  term ((-59676688108368445 : Rat) / 6976681326919158) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((59676688108368445 : Rat) / 13953362653838316) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 15. -/
theorem ep_Q2_024_partial_15_1233_valid :
    mulPoly ep_Q2_024_coefficient_15_1233
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1234 : Poly :=
[
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (15, 3)]
]

/-- Partial product 1234 for generator 15. -/
def ep_Q2_024_partial_15_1234 : Poly :=
[
  term ((-9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 15. -/
theorem ep_Q2_024_partial_15_1234_valid :
    mulPoly ep_Q2_024_coefficient_15_1234
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1235 : Poly :=
[
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 1235 for generator 15. -/
def ep_Q2_024_partial_15_1235 : Poly :=
[
  term ((15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 15. -/
theorem ep_Q2_024_partial_15_1235_valid :
    mulPoly ep_Q2_024_coefficient_15_1235
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1236 : Poly :=
[
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (9, 1)]
]

/-- Partial product 1236 for generator 15. -/
def ep_Q2_024_partial_15_1236 : Poly :=
[
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 2), (9, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 15. -/
theorem ep_Q2_024_partial_15_1236_valid :
    mulPoly ep_Q2_024_coefficient_15_1236
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1237 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)]
]

/-- Partial product 1237 for generator 15. -/
def ep_Q2_024_partial_15_1237 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 2), (11, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 15. -/
theorem ep_Q2_024_partial_15_1237_valid :
    mulPoly ep_Q2_024_coefficient_15_1237
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1238 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 1238 for generator 15. -/
def ep_Q2_024_partial_15_1238 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 15. -/
theorem ep_Q2_024_partial_15_1238_valid :
    mulPoly ep_Q2_024_coefficient_15_1238
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1239 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 1239 for generator 15. -/
def ep_Q2_024_partial_15_1239 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 15. -/
theorem ep_Q2_024_partial_15_1239_valid :
    mulPoly ep_Q2_024_coefficient_15_1239
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1240 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1240 for generator 15. -/
def ep_Q2_024_partial_15_1240 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 15. -/
theorem ep_Q2_024_partial_15_1240_valid :
    mulPoly ep_Q2_024_coefficient_15_1240
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1241 : Poly :=
[
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 2), (13, 1)]
]

/-- Partial product 1241 for generator 15. -/
def ep_Q2_024_partial_15_1241 : Poly :=
[
  term ((120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (6, 1), (8, 2), (13, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 15. -/
theorem ep_Q2_024_partial_15_1241_valid :
    mulPoly ep_Q2_024_coefficient_15_1241
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1242 : Poly :=
[
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 2), (15, 1)]
]

/-- Partial product 1242 for generator 15. -/
def ep_Q2_024_partial_15_1242 : Poly :=
[
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 15. -/
theorem ep_Q2_024_partial_15_1242_valid :
    mulPoly ep_Q2_024_coefficient_15_1242
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1243 : Poly :=
[
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 1243 for generator 15. -/
def ep_Q2_024_partial_15_1243 : Poly :=
[
  term ((-10199593906176821 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 15. -/
theorem ep_Q2_024_partial_15_1243_valid :
    mulPoly ep_Q2_024_coefficient_15_1243
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1244 : Poly :=
[
  term ((-807839099143789755163436706410303037022 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1)]
]

/-- Partial product 1244 for generator 15. -/
def ep_Q2_024_partial_15_1244 : Poly :=
[
  term ((-1615678198287579510326873412820606074044 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1)],
  term ((807839099143789755163436706410303037022 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 15. -/
theorem ep_Q2_024_partial_15_1244_valid :
    mulPoly ep_Q2_024_coefficient_15_1244
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1245 : Poly :=
[
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 1245 for generator 15. -/
def ep_Q2_024_partial_15_1245 : Poly :=
[
  term ((3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 15. -/
theorem ep_Q2_024_partial_15_1245_valid :
    mulPoly ep_Q2_024_coefficient_15_1245
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1246 : Poly :=
[
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1246 for generator 15. -/
def ep_Q2_024_partial_15_1246 : Poly :=
[
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 15. -/
theorem ep_Q2_024_partial_15_1246_valid :
    mulPoly ep_Q2_024_coefficient_15_1246
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1247 : Poly :=
[
  term ((260528276499574240558531695516207579212 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1247 for generator 15. -/
def ep_Q2_024_partial_15_1247 : Poly :=
[
  term ((521056552999148481117063391032415158424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-260528276499574240558531695516207579212 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 15. -/
theorem ep_Q2_024_partial_15_1247_valid :
    mulPoly ep_Q2_024_coefficient_15_1247
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1248 : Poly :=
[
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1248 for generator 15. -/
def ep_Q2_024_partial_15_1248 : Poly :=
[
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 15. -/
theorem ep_Q2_024_partial_15_1248_valid :
    mulPoly ep_Q2_024_coefficient_15_1248
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1249 : Poly :=
[
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1249 for generator 15. -/
def ep_Q2_024_partial_15_1249 : Poly :=
[
  term ((-2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 15. -/
theorem ep_Q2_024_partial_15_1249_valid :
    mulPoly ep_Q2_024_coefficient_15_1249
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1250 : Poly :=
[
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1250 for generator 15. -/
def ep_Q2_024_partial_15_1250 : Poly :=
[
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 15. -/
theorem ep_Q2_024_partial_15_1250_valid :
    mulPoly ep_Q2_024_coefficient_15_1250
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1251 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1251 for generator 15. -/
def ep_Q2_024_partial_15_1251 : Poly :=
[
  term ((-425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 15. -/
theorem ep_Q2_024_partial_15_1251_valid :
    mulPoly ep_Q2_024_coefficient_15_1251
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1252 : Poly :=
[
  term ((-2609578860190798095885755725586862137369522490310902473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1252 for generator 15. -/
def ep_Q2_024_partial_15_1252 : Poly :=
[
  term ((-5219157720381596191771511451173724274739044980621804946 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((2609578860190798095885755725586862137369522490310902473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 15. -/
theorem ep_Q2_024_partial_15_1252_valid :
    mulPoly ep_Q2_024_coefficient_15_1252
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1253 : Poly :=
[
  term ((37665296397180 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1253 for generator 15. -/
def ep_Q2_024_partial_15_1253 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 15. -/
theorem ep_Q2_024_partial_15_1253_valid :
    mulPoly ep_Q2_024_coefficient_15_1253
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1254 : Poly :=
[
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 1254 for generator 15. -/
def ep_Q2_024_partial_15_1254 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 15. -/
theorem ep_Q2_024_partial_15_1254_valid :
    mulPoly ep_Q2_024_coefficient_15_1254
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1255 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1255 for generator 15. -/
def ep_Q2_024_partial_15_1255 : Poly :=
[
  term ((64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 15. -/
theorem ep_Q2_024_partial_15_1255_valid :
    mulPoly ep_Q2_024_coefficient_15_1255
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1256 : Poly :=
[
  term ((-262460773637678764233656402802913076974 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1256 for generator 15. -/
def ep_Q2_024_partial_15_1256 : Poly :=
[
  term ((-524921547275357528467312805605826153948 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((262460773637678764233656402802913076974 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 15. -/
theorem ep_Q2_024_partial_15_1256_valid :
    mulPoly ep_Q2_024_coefficient_15_1256
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1257 : Poly :=
[
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1257 for generator 15. -/
def ep_Q2_024_partial_15_1257 : Poly :=
[
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 15. -/
theorem ep_Q2_024_partial_15_1257_valid :
    mulPoly ep_Q2_024_coefficient_15_1257
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1258 : Poly :=
[
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1258 for generator 15. -/
def ep_Q2_024_partial_15_1258 : Poly :=
[
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 15. -/
theorem ep_Q2_024_partial_15_1258_valid :
    mulPoly ep_Q2_024_coefficient_15_1258
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1259 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)]
]

/-- Partial product 1259 for generator 15. -/
def ep_Q2_024_partial_15_1259 : Poly :=
[
  term ((2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 15. -/
theorem ep_Q2_024_partial_15_1259_valid :
    mulPoly ep_Q2_024_coefficient_15_1259
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1260 : Poly :=
[
  term ((850931403068792381191044989633349149975155284430543596 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 1260 for generator 15. -/
def ep_Q2_024_partial_15_1260 : Poly :=
[
  term ((1701862806137584762382089979266698299950310568861087192 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-850931403068792381191044989633349149975155284430543596 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 15. -/
theorem ep_Q2_024_partial_15_1260_valid :
    mulPoly ep_Q2_024_coefficient_15_1260
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1261 : Poly :=
[
  term ((215018958036864 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1261 for generator 15. -/
def ep_Q2_024_partial_15_1261 : Poly :=
[
  term ((430037916073728 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-215018958036864 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 15. -/
theorem ep_Q2_024_partial_15_1261_valid :
    mulPoly ep_Q2_024_coefficient_15_1261
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1262 : Poly :=
[
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 1262 for generator 15. -/
def ep_Q2_024_partial_15_1262 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 15. -/
theorem ep_Q2_024_partial_15_1262_valid :
    mulPoly ep_Q2_024_coefficient_15_1262
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1263 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 1263 for generator 15. -/
def ep_Q2_024_partial_15_1263 : Poly :=
[
  term ((-469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 15. -/
theorem ep_Q2_024_partial_15_1263_valid :
    mulPoly ep_Q2_024_coefficient_15_1263
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1264 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 1264 for generator 15. -/
def ep_Q2_024_partial_15_1264 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 15. -/
theorem ep_Q2_024_partial_15_1264_valid :
    mulPoly ep_Q2_024_coefficient_15_1264
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1265 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1265 for generator 15. -/
def ep_Q2_024_partial_15_1265 : Poly :=
[
  term ((-4485445348634808 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 15. -/
theorem ep_Q2_024_partial_15_1265_valid :
    mulPoly ep_Q2_024_coefficient_15_1265
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1266 : Poly :=
[
  term ((-784194080123272474066747187140747888160160051635280743 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 1266 for generator 15. -/
def ep_Q2_024_partial_15_1266 : Poly :=
[
  term ((-784194080123272474066747187140747888160160051635280743 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 2), (15, 1)],
  term ((784194080123272474066747187140747888160160051635280743 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 15. -/
theorem ep_Q2_024_partial_15_1266_valid :
    mulPoly ep_Q2_024_coefficient_15_1266
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1267 : Poly :=
[
  term ((373787112386234 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1267 for generator 15. -/
def ep_Q2_024_partial_15_1267 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 15. -/
theorem ep_Q2_024_partial_15_1267_valid :
    mulPoly ep_Q2_024_coefficient_15_1267
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1268 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)]
]

/-- Partial product 1268 for generator 15. -/
def ep_Q2_024_partial_15_1268 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 15. -/
theorem ep_Q2_024_partial_15_1268_valid :
    mulPoly ep_Q2_024_coefficient_15_1268
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1269 : Poly :=
[
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 1)]
]

/-- Partial product 1269 for generator 15. -/
def ep_Q2_024_partial_15_1269 : Poly :=
[
  term ((-378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3), (14, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 15. -/
theorem ep_Q2_024_partial_15_1269_valid :
    mulPoly ep_Q2_024_coefficient_15_1269
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1270 : Poly :=
[
  term ((-285747653977899437327814062664220218056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 1270 for generator 15. -/
def ep_Q2_024_partial_15_1270 : Poly :=
[
  term ((-571495307955798874655628125328440436112 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((285747653977899437327814062664220218056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 15. -/
theorem ep_Q2_024_partial_15_1270_valid :
    mulPoly ep_Q2_024_coefficient_15_1270
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1271 : Poly :=
[
  term ((-22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1271 for generator 15. -/
def ep_Q2_024_partial_15_1271 : Poly :=
[
  term ((-45444434024270086280970426513704096800 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 15. -/
theorem ep_Q2_024_partial_15_1271_valid :
    mulPoly ep_Q2_024_coefficient_15_1271
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1272 : Poly :=
[
  term ((-179799196550744498319995708717418003072971523177710631 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1272 for generator 15. -/
def ep_Q2_024_partial_15_1272 : Poly :=
[
  term ((-179799196550744498319995708717418003072971523177710631 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((179799196550744498319995708717418003072971523177710631 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 15. -/
theorem ep_Q2_024_partial_15_1272_valid :
    mulPoly ep_Q2_024_coefficient_15_1272
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1273 : Poly :=
[
  term ((2000660399310798 : Rat) / 1162780221153193) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1273 for generator 15. -/
def ep_Q2_024_partial_15_1273 : Poly :=
[
  term ((4001320798621596 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2000660399310798 : Rat) / 1162780221153193) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 15. -/
theorem ep_Q2_024_partial_15_1273_valid :
    mulPoly ep_Q2_024_coefficient_15_1273
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1274 : Poly :=
[
  term ((-25470595798947090233296864615167076737618894234262938159 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 1274 for generator 15. -/
def ep_Q2_024_partial_15_1274 : Poly :=
[
  term ((-25470595798947090233296864615167076737618894234262938159 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((25470595798947090233296864615167076737618894234262938159 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 15. -/
theorem ep_Q2_024_partial_15_1274_valid :
    mulPoly ep_Q2_024_coefficient_15_1274
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1275 : Poly :=
[
  term ((-6918647491424613 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1275 for generator 15. -/
def ep_Q2_024_partial_15_1275 : Poly :=
[
  term ((-13837294982849226 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((6918647491424613 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 15. -/
theorem ep_Q2_024_partial_15_1275_valid :
    mulPoly ep_Q2_024_coefficient_15_1275
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1276 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 2), (13, 1)]
]

/-- Partial product 1276 for generator 15. -/
def ep_Q2_024_partial_15_1276 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 15. -/
theorem ep_Q2_024_partial_15_1276_valid :
    mulPoly ep_Q2_024_coefficient_15_1276
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1277 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 1277 for generator 15. -/
def ep_Q2_024_partial_15_1277 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 15. -/
theorem ep_Q2_024_partial_15_1277_valid :
    mulPoly ep_Q2_024_coefficient_15_1277
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1278 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1278 for generator 15. -/
def ep_Q2_024_partial_15_1278 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 15. -/
theorem ep_Q2_024_partial_15_1278_valid :
    mulPoly ep_Q2_024_coefficient_15_1278
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1279 : Poly :=
[
  term ((26085064534383215153301893234210573530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (13, 1)]
]

/-- Partial product 1279 for generator 15. -/
def ep_Q2_024_partial_15_1279 : Poly :=
[
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (13, 1)],
  term ((-26085064534383215153301893234210573530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 15. -/
theorem ep_Q2_024_partial_15_1279_valid :
    mulPoly ep_Q2_024_coefficient_15_1279
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1280 : Poly :=
[
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 1280 for generator 15. -/
def ep_Q2_024_partial_15_1280 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 15. -/
theorem ep_Q2_024_partial_15_1280_valid :
    mulPoly ep_Q2_024_coefficient_15_1280
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1281 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1281 for generator 15. -/
def ep_Q2_024_partial_15_1281 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 15. -/
theorem ep_Q2_024_partial_15_1281_valid :
    mulPoly ep_Q2_024_coefficient_15_1281
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1282 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 1282 for generator 15. -/
def ep_Q2_024_partial_15_1282 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 15. -/
theorem ep_Q2_024_partial_15_1282_valid :
    mulPoly ep_Q2_024_coefficient_15_1282
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1283 : Poly :=
[
  term ((-3922115932976535631234084008843898904 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 1283 for generator 15. -/
def ep_Q2_024_partial_15_1283 : Poly :=
[
  term ((-7844231865953071262468168017687797808 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3922115932976535631234084008843898904 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 15. -/
theorem ep_Q2_024_partial_15_1283_valid :
    mulPoly ep_Q2_024_coefficient_15_1283
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1284 : Poly :=
[
  term ((1882494022897015997036034945895920599361960620684755613 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (15, 1)]
]

/-- Partial product 1284 for generator 15. -/
def ep_Q2_024_partial_15_1284 : Poly :=
[
  term ((3764988045794031994072069891791841198723921241369511226 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 1)],
  term ((-1882494022897015997036034945895920599361960620684755613 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 15. -/
theorem ep_Q2_024_partial_15_1284_valid :
    mulPoly ep_Q2_024_coefficient_15_1284
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1285 : Poly :=
[
  term ((3350708325580726 : Rat) / 1162780221153193) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1285 for generator 15. -/
def ep_Q2_024_partial_15_1285 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3350708325580726 : Rat) / 1162780221153193) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 15. -/
theorem ep_Q2_024_partial_15_1285_valid :
    mulPoly ep_Q2_024_coefficient_15_1285
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1286 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (15, 3)]
]

/-- Partial product 1286 for generator 15. -/
def ep_Q2_024_partial_15_1286 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 3)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 15. -/
theorem ep_Q2_024_partial_15_1286_valid :
    mulPoly ep_Q2_024_coefficient_15_1286
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1287 : Poly :=
[
  term ((-2131658198001102 : Rat) / 1162780221153193) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 1287 for generator 15. -/
def ep_Q2_024_partial_15_1287 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 15. -/
theorem ep_Q2_024_partial_15_1287_valid :
    mulPoly ep_Q2_024_coefficient_15_1287
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1288 : Poly :=
[
  term ((28467659343525186885216599367064772409 : Rat) / 39990315246749243218889784267651308933) [(3, 2)]
]

/-- Partial product 1288 for generator 15. -/
def ep_Q2_024_partial_15_1288 : Poly :=
[
  term ((-28467659343525186885216599367064772409 : Rat) / 39990315246749243218889784267651308933) [(3, 2)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 15. -/
theorem ep_Q2_024_partial_15_1288_valid :
    mulPoly ep_Q2_024_coefficient_15_1288
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1289 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 1)]
]

/-- Partial product 1289 for generator 15. -/
def ep_Q2_024_partial_15_1289 : Poly :=
[
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (6, 1), (8, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 15. -/
theorem ep_Q2_024_partial_15_1289_valid :
    mulPoly ep_Q2_024_coefficient_15_1289
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1290 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (9, 1)]
]

/-- Partial product 1290 for generator 15. -/
def ep_Q2_024_partial_15_1290 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (9, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 15. -/
theorem ep_Q2_024_partial_15_1290_valid :
    mulPoly ep_Q2_024_coefficient_15_1290
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1291 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1291 for generator 15. -/
def ep_Q2_024_partial_15_1291 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (13, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 15. -/
theorem ep_Q2_024_partial_15_1291_valid :
    mulPoly ep_Q2_024_coefficient_15_1291
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1292 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1292 for generator 15. -/
def ep_Q2_024_partial_15_1292 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 15. -/
theorem ep_Q2_024_partial_15_1292_valid :
    mulPoly ep_Q2_024_coefficient_15_1292
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1293 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1293 for generator 15. -/
def ep_Q2_024_partial_15_1293 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 15. -/
theorem ep_Q2_024_partial_15_1293_valid :
    mulPoly ep_Q2_024_coefficient_15_1293
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1294 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 1294 for generator 15. -/
def ep_Q2_024_partial_15_1294 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 15. -/
theorem ep_Q2_024_partial_15_1294_valid :
    mulPoly ep_Q2_024_coefficient_15_1294
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1295 : Poly :=
[
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1295 for generator 15. -/
def ep_Q2_024_partial_15_1295 : Poly :=
[
  term ((-6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 15. -/
theorem ep_Q2_024_partial_15_1295_valid :
    mulPoly ep_Q2_024_coefficient_15_1295
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1296 : Poly :=
[
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 1296 for generator 15. -/
def ep_Q2_024_partial_15_1296 : Poly :=
[
  term ((-6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 15. -/
theorem ep_Q2_024_partial_15_1296_valid :
    mulPoly ep_Q2_024_coefficient_15_1296
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1297 : Poly :=
[
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 15. -/
def ep_Q2_024_partial_15_1297 : Poly :=
[
  term ((2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 15. -/
theorem ep_Q2_024_partial_15_1297_valid :
    mulPoly ep_Q2_024_coefficient_15_1297
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1298 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1)]
]

/-- Partial product 1298 for generator 15. -/
def ep_Q2_024_partial_15_1298 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 15. -/
theorem ep_Q2_024_partial_15_1298_valid :
    mulPoly ep_Q2_024_coefficient_15_1298
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1299 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (13, 1)]
]

/-- Partial product 1299 for generator 15. -/
def ep_Q2_024_partial_15_1299 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 15. -/
theorem ep_Q2_024_partial_15_1299_valid :
    mulPoly ep_Q2_024_coefficient_15_1299
        ep_Q2_024_generator_15_1200_1299 =
      ep_Q2_024_partial_15_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1200_1299 : List Poly :=
[
  ep_Q2_024_partial_15_1200,
  ep_Q2_024_partial_15_1201,
  ep_Q2_024_partial_15_1202,
  ep_Q2_024_partial_15_1203,
  ep_Q2_024_partial_15_1204,
  ep_Q2_024_partial_15_1205,
  ep_Q2_024_partial_15_1206,
  ep_Q2_024_partial_15_1207,
  ep_Q2_024_partial_15_1208,
  ep_Q2_024_partial_15_1209,
  ep_Q2_024_partial_15_1210,
  ep_Q2_024_partial_15_1211,
  ep_Q2_024_partial_15_1212,
  ep_Q2_024_partial_15_1213,
  ep_Q2_024_partial_15_1214,
  ep_Q2_024_partial_15_1215,
  ep_Q2_024_partial_15_1216,
  ep_Q2_024_partial_15_1217,
  ep_Q2_024_partial_15_1218,
  ep_Q2_024_partial_15_1219,
  ep_Q2_024_partial_15_1220,
  ep_Q2_024_partial_15_1221,
  ep_Q2_024_partial_15_1222,
  ep_Q2_024_partial_15_1223,
  ep_Q2_024_partial_15_1224,
  ep_Q2_024_partial_15_1225,
  ep_Q2_024_partial_15_1226,
  ep_Q2_024_partial_15_1227,
  ep_Q2_024_partial_15_1228,
  ep_Q2_024_partial_15_1229,
  ep_Q2_024_partial_15_1230,
  ep_Q2_024_partial_15_1231,
  ep_Q2_024_partial_15_1232,
  ep_Q2_024_partial_15_1233,
  ep_Q2_024_partial_15_1234,
  ep_Q2_024_partial_15_1235,
  ep_Q2_024_partial_15_1236,
  ep_Q2_024_partial_15_1237,
  ep_Q2_024_partial_15_1238,
  ep_Q2_024_partial_15_1239,
  ep_Q2_024_partial_15_1240,
  ep_Q2_024_partial_15_1241,
  ep_Q2_024_partial_15_1242,
  ep_Q2_024_partial_15_1243,
  ep_Q2_024_partial_15_1244,
  ep_Q2_024_partial_15_1245,
  ep_Q2_024_partial_15_1246,
  ep_Q2_024_partial_15_1247,
  ep_Q2_024_partial_15_1248,
  ep_Q2_024_partial_15_1249,
  ep_Q2_024_partial_15_1250,
  ep_Q2_024_partial_15_1251,
  ep_Q2_024_partial_15_1252,
  ep_Q2_024_partial_15_1253,
  ep_Q2_024_partial_15_1254,
  ep_Q2_024_partial_15_1255,
  ep_Q2_024_partial_15_1256,
  ep_Q2_024_partial_15_1257,
  ep_Q2_024_partial_15_1258,
  ep_Q2_024_partial_15_1259,
  ep_Q2_024_partial_15_1260,
  ep_Q2_024_partial_15_1261,
  ep_Q2_024_partial_15_1262,
  ep_Q2_024_partial_15_1263,
  ep_Q2_024_partial_15_1264,
  ep_Q2_024_partial_15_1265,
  ep_Q2_024_partial_15_1266,
  ep_Q2_024_partial_15_1267,
  ep_Q2_024_partial_15_1268,
  ep_Q2_024_partial_15_1269,
  ep_Q2_024_partial_15_1270,
  ep_Q2_024_partial_15_1271,
  ep_Q2_024_partial_15_1272,
  ep_Q2_024_partial_15_1273,
  ep_Q2_024_partial_15_1274,
  ep_Q2_024_partial_15_1275,
  ep_Q2_024_partial_15_1276,
  ep_Q2_024_partial_15_1277,
  ep_Q2_024_partial_15_1278,
  ep_Q2_024_partial_15_1279,
  ep_Q2_024_partial_15_1280,
  ep_Q2_024_partial_15_1281,
  ep_Q2_024_partial_15_1282,
  ep_Q2_024_partial_15_1283,
  ep_Q2_024_partial_15_1284,
  ep_Q2_024_partial_15_1285,
  ep_Q2_024_partial_15_1286,
  ep_Q2_024_partial_15_1287,
  ep_Q2_024_partial_15_1288,
  ep_Q2_024_partial_15_1289,
  ep_Q2_024_partial_15_1290,
  ep_Q2_024_partial_15_1291,
  ep_Q2_024_partial_15_1292,
  ep_Q2_024_partial_15_1293,
  ep_Q2_024_partial_15_1294,
  ep_Q2_024_partial_15_1295,
  ep_Q2_024_partial_15_1296,
  ep_Q2_024_partial_15_1297,
  ep_Q2_024_partial_15_1298,
  ep_Q2_024_partial_15_1299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1200_1299 : Poly :=
[
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((47170163515900946 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 3)],
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (11, 1), (13, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-573864920873140758152367022456847776516 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-50562742388418120368929876642658354880743509400286978149 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((25654027359549217 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-445948265340164728853832785233619361920 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((112208185162189595500917903414467681551145270067832622813 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-59676688108368445 : Rat) / 6976681326919158) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 2), (9, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (6, 1), (8, 2), (13, 1)],
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (6, 1), (8, 2), (15, 1)],
  term ((-10199593906176821 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1615678198287579510326873412820606074044 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1)],
  term ((3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((521056552999148481117063391032415158424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5219157720381596191771511451173724274739044980621804946 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2)],
  term ((64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-524921547275357528467312805605826153948 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((1701862806137584762382089979266698299950310568861087192 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((430037916073728 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1)],
  term ((-469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-4485445348634808 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-784194080123272474066747187140747888160160051635280743 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3)],
  term ((-378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3), (14, 1)],
  term ((-571495307955798874655628125328440436112 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-45444434024270086280970426513704096800 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-179799196550744498319995708717418003072971523177710631 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((4001320798621596 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25470595798947090233296864615167076737618894234262938159 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-13837294982849226 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (13, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-7844231865953071262468168017687797808 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3764988045794031994072069891791841198723921241369511226 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 3)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (11, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 2), (13, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 3)],
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((286932460436570379076183511228423888258 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((50562742388418120368929876642658354880743509400286978149 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-25654027359549217 : Rat) / 6976681326919158) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((222974132670082364426916392616809680960 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (13, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-112208185162189595500917903414467681551145270067832622813 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 1), (8, 1), (15, 1)],
  term ((59676688108368445 : Rat) / 13953362653838316) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 1), (15, 3)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (9, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (11, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 2), (13, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 2), (15, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((807839099143789755163436706410303037022 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1)],
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (12, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-260528276499574240558531695516207579212 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2609578860190798095885755725586862137369522490310902473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((262460773637678764233656402802913076974 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 1), (14, 1)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)],
  term ((-850931403068792381191044989633349149975155284430543596 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 2)],
  term ((-215018958036864 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 1), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((784194080123272474066747187140747888160160051635280743 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 2), (15, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 1)],
  term ((285747653977899437327814062664220218056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 1), (13, 1)],
  term ((22722217012135043140485213256852048400 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((179799196550744498319995708717418003072971523177710631 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2000660399310798 : Rat) / 1162780221153193) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25470595798947090233296864615167076737618894234262938159 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (12, 1), (15, 1)],
  term ((6918647491424613 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (12, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-26085064534383215153301893234210573530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (13, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (13, 1), (15, 2)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 2), (15, 1)],
  term ((3922115932976535631234084008843898904 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (14, 1), (15, 1)],
  term ((-1882494022897015997036034945895920599361960620684755613 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (15, 1)],
  term ((-3350708325580726 : Rat) / 1162780221153193) [(3, 1), (15, 1), (16, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (15, 3)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(3, 1), (15, 3), (16, 1)],
  term ((-28467659343525186885216599367064772409 : Rat) / 39990315246749243218889784267651308933) [(3, 2)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (6, 1), (8, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 2), (9, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (6, 2), (13, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (6, 2), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (9, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (13, 1)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1200 through 1299. -/
theorem ep_Q2_024_block_15_1200_1299_valid :
    checkProductSumEq ep_Q2_024_partials_15_1200_1299
      ep_Q2_024_block_15_1200_1299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
