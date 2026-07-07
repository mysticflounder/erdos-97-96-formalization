/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1200-1299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1200 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1200 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1200 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1200_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1200
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1201 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

/-- Partial product 1201 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1201 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1201_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1201
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1202 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1202 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1202 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1202_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1202
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1203 : Poly :=
[
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1203 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1203 : Poly :=
[
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1203_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1203
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1204 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1204 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1204 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1204_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1204
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1205 : Poly :=
[
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1205 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1205 : Poly :=
[
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1205_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1205
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1206 : Poly :=
[
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1206 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1206 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1206_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1206
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1207 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1207 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1207 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1207_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1207
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1208 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1208 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1208 : Poly :=
[
  term ((225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1208_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1208
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1209 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1209 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1209 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1209_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1209
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1210 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1210 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1210 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1210_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1210
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1211 : Poly :=
[
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1211 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1211 : Poly :=
[
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1211_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1211
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1212 : Poly :=
[
  term ((250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1212 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1212 : Poly :=
[
  term ((500319387710521995264 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1212_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1212
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1213 : Poly :=
[
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1213 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1213 : Poly :=
[
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1213_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1213
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1214 : Poly :=
[
  term ((62539923463815249408 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1214 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1214 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1214_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1214
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1215 : Poly :=
[
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1215 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1215 : Poly :=
[
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1215_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1215
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1216 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1216 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1216 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1216_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1216
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1217 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1217 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1217 : Poly :=
[
  term ((-853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1217_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1217
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1218 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1218 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1218 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1218_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1218
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1219 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1219 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1219 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1219_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1219
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1220 : Poly :=
[
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1220 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1220 : Poly :=
[
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1220_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1220
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1221 : Poly :=
[
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1221 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1221 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1221_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1221
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1222 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)]
]

/-- Partial product 1222 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1222 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1222_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1222
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1223 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1223 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1223 : Poly :=
[
  term ((-284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1223_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1223
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1224 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 1224 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1224 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1224_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1224
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1225 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1225 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1225 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1225_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1225
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1226 : Poly :=
[
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1226 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1226 : Poly :=
[
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1226_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1226
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1227 : Poly :=
[
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1227 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1227 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1227_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1227
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1228 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1228 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1228 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1228_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1228
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1229 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1229 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1229 : Poly :=
[
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1229_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1229
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1230 : Poly :=
[
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1230 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1230_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1230
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1231 : Poly :=
[
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1231 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1231 : Poly :=
[
  term ((211310777032520608952 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1231_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1231
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1232 : Poly :=
[
  term ((422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1232 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1232 : Poly :=
[
  term ((845243108130082435808 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1232_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1232
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1233 : Poly :=
[
  term ((55399881464987154820 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1233 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1233 : Poly :=
[
  term ((110799762929974309640 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1233_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1233
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1234 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1234 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1234 : Poly :=
[
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1234_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1234
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1235 : Poly :=
[
  term ((17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1235 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1235 : Poly :=
[
  term ((34181659937579187200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1235_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1235
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1236 : Poly :=
[
  term ((4272707492197398400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1236 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1236 : Poly :=
[
  term ((8545414984394796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4272707492197398400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1236_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1236
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1237 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1237 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1237 : Poly :=
[
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1237_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1237
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1238 : Poly :=
[
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1238 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1238 : Poly :=
[
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1238_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1238
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1239 : Poly :=
[
  term ((-2108443843726951936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1239 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1239 : Poly :=
[
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((2108443843726951936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1239_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1239
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1240 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1240 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1240 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1240_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1240
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1241 : Poly :=
[
  term ((13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1241 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1241 : Poly :=
[
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1241_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1241
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1242 : Poly :=
[
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1242 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1242 : Poly :=
[
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1242_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1242
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1243 : Poly :=
[
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1243 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1243 : Poly :=
[
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1243_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1243
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1244 : Poly :=
[
  term ((-31214114089250075024 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1244 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1244 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1244_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1244
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1245 : Poly :=
[
  term ((-6660312513411557224 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 1245 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1245 : Poly :=
[
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((6660312513411557224 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1245_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1245
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1246 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1246 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1246 : Poly :=
[
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1246_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1246
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1247 : Poly :=
[
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1247 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1247 : Poly :=
[
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1247_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1247
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1248 : Poly :=
[
  term ((-470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1248 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1248 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1248_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1248
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1249 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1249 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1249 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1249_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1249
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1250 : Poly :=
[
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1250 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1250 : Poly :=
[
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1250_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1250
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1251 : Poly :=
[
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1251 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1251 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1251_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1251
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1252 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1252 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1252 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1252_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1252
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1253 : Poly :=
[
  term ((12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1253 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1253 : Poly :=
[
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1253_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1253
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1254 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1254 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1254 : Poly :=
[
  term ((1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1254_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1254
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1255 : Poly :=
[
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1255 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1255 : Poly :=
[
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1255_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1255
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1256 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1256 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1256 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1256_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1256
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1257 : Poly :=
[
  term ((-6135583745198797952 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1257 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1257 : Poly :=
[
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((6135583745198797952 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1257_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1257
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1258 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1258 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1258 : Poly :=
[
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1258_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1258
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1259 : Poly :=
[
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1259 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1259 : Poly :=
[
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1259_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1259
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1260 : Poly :=
[
  term ((1198497021709723613024 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1260 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1260 : Poly :=
[
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1198497021709723613024 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1260_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1260
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1261 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1261 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1261 : Poly :=
[
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1261_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1261
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1262 : Poly :=
[
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1262 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1262 : Poly :=
[
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1262_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1262
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1263 : Poly :=
[
  term ((2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 1263 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1263 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1263_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1263
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1264 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1264 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1264 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1264_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1264
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1265 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1265 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1265 : Poly :=
[
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1265_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1265
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1266 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1266 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1266 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1266_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1266
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1267 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1267 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1267 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1267_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1267
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1268 : Poly :=
[
  term ((1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)]
]

/-- Partial product 1268 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1268 : Poly :=
[
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1268_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1268
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1269 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1269 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1269 : Poly :=
[
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1269_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1269
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1270 : Poly :=
[
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1270 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1270 : Poly :=
[
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1270_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1270
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1271 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1271 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1271 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1271_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1271
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1272 : Poly :=
[
  term ((-879981766182686720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (16, 1)]
]

/-- Partial product 1272 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1272 : Poly :=
[
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((879981766182686720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1272_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1272
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1273 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1273 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1273 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1273_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1273
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1274 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1274 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1274 : Poly :=
[
  term ((11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1274_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1274
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1275 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 1275 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1275 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1275_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1275
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1276 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1276 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1276 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1276_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1276
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1277 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1277 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1277 : Poly :=
[
  term ((5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1277_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1277
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1278 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1278 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1278 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1278_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1278
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1279 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1279 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1279 : Poly :=
[
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1279_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1279
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1280 : Poly :=
[
  term ((167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1280 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1280 : Poly :=
[
  term ((334154661633243096704 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1280_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1280
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1281 : Poly :=
[
  term ((41769332704155387088 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 1281 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1281 : Poly :=
[
  term ((83538665408310774176 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1281_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1281
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1282 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1282 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1282 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1282_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1282
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1283 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1283 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1283 : Poly :=
[
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1283_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1283
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1284 : Poly :=
[
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 1284 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1284 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1284_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1284
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1285 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1285 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1285 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1285_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1285
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1286 : Poly :=
[
  term ((519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1286 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1286 : Poly :=
[
  term ((1039438403794954240 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1286_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1286
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1287 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1287 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1287 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1287_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1287
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1288 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1288 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1288 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1288_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1288
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1289 : Poly :=
[
  term ((148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1289 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1289 : Poly :=
[
  term ((296982401084272640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1289_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1289
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1290 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 1290 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1290 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1290_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1290
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1291 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1291 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1291 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1291_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1291
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1292 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1292 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1292 : Poly :=
[
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1292_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1292
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1293 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1293 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1293 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1293_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1293
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1294 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1294 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1294 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1294_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1294
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1295 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1295 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1295 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1295_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1295
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1296 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1296 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1296 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1296_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1296
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1297 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1297 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1297_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1297
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1298 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1298 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1298 : Poly :=
[
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1298_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1298
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1299 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1299 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1299 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1299_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1299
        rs_R010_ueqv_R010YNN_generator_25_1200_1299 =
      rs_R010_ueqv_R010YNN_partial_25_1299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1200_1299 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1200,
  rs_R010_ueqv_R010YNN_partial_25_1201,
  rs_R010_ueqv_R010YNN_partial_25_1202,
  rs_R010_ueqv_R010YNN_partial_25_1203,
  rs_R010_ueqv_R010YNN_partial_25_1204,
  rs_R010_ueqv_R010YNN_partial_25_1205,
  rs_R010_ueqv_R010YNN_partial_25_1206,
  rs_R010_ueqv_R010YNN_partial_25_1207,
  rs_R010_ueqv_R010YNN_partial_25_1208,
  rs_R010_ueqv_R010YNN_partial_25_1209,
  rs_R010_ueqv_R010YNN_partial_25_1210,
  rs_R010_ueqv_R010YNN_partial_25_1211,
  rs_R010_ueqv_R010YNN_partial_25_1212,
  rs_R010_ueqv_R010YNN_partial_25_1213,
  rs_R010_ueqv_R010YNN_partial_25_1214,
  rs_R010_ueqv_R010YNN_partial_25_1215,
  rs_R010_ueqv_R010YNN_partial_25_1216,
  rs_R010_ueqv_R010YNN_partial_25_1217,
  rs_R010_ueqv_R010YNN_partial_25_1218,
  rs_R010_ueqv_R010YNN_partial_25_1219,
  rs_R010_ueqv_R010YNN_partial_25_1220,
  rs_R010_ueqv_R010YNN_partial_25_1221,
  rs_R010_ueqv_R010YNN_partial_25_1222,
  rs_R010_ueqv_R010YNN_partial_25_1223,
  rs_R010_ueqv_R010YNN_partial_25_1224,
  rs_R010_ueqv_R010YNN_partial_25_1225,
  rs_R010_ueqv_R010YNN_partial_25_1226,
  rs_R010_ueqv_R010YNN_partial_25_1227,
  rs_R010_ueqv_R010YNN_partial_25_1228,
  rs_R010_ueqv_R010YNN_partial_25_1229,
  rs_R010_ueqv_R010YNN_partial_25_1230,
  rs_R010_ueqv_R010YNN_partial_25_1231,
  rs_R010_ueqv_R010YNN_partial_25_1232,
  rs_R010_ueqv_R010YNN_partial_25_1233,
  rs_R010_ueqv_R010YNN_partial_25_1234,
  rs_R010_ueqv_R010YNN_partial_25_1235,
  rs_R010_ueqv_R010YNN_partial_25_1236,
  rs_R010_ueqv_R010YNN_partial_25_1237,
  rs_R010_ueqv_R010YNN_partial_25_1238,
  rs_R010_ueqv_R010YNN_partial_25_1239,
  rs_R010_ueqv_R010YNN_partial_25_1240,
  rs_R010_ueqv_R010YNN_partial_25_1241,
  rs_R010_ueqv_R010YNN_partial_25_1242,
  rs_R010_ueqv_R010YNN_partial_25_1243,
  rs_R010_ueqv_R010YNN_partial_25_1244,
  rs_R010_ueqv_R010YNN_partial_25_1245,
  rs_R010_ueqv_R010YNN_partial_25_1246,
  rs_R010_ueqv_R010YNN_partial_25_1247,
  rs_R010_ueqv_R010YNN_partial_25_1248,
  rs_R010_ueqv_R010YNN_partial_25_1249,
  rs_R010_ueqv_R010YNN_partial_25_1250,
  rs_R010_ueqv_R010YNN_partial_25_1251,
  rs_R010_ueqv_R010YNN_partial_25_1252,
  rs_R010_ueqv_R010YNN_partial_25_1253,
  rs_R010_ueqv_R010YNN_partial_25_1254,
  rs_R010_ueqv_R010YNN_partial_25_1255,
  rs_R010_ueqv_R010YNN_partial_25_1256,
  rs_R010_ueqv_R010YNN_partial_25_1257,
  rs_R010_ueqv_R010YNN_partial_25_1258,
  rs_R010_ueqv_R010YNN_partial_25_1259,
  rs_R010_ueqv_R010YNN_partial_25_1260,
  rs_R010_ueqv_R010YNN_partial_25_1261,
  rs_R010_ueqv_R010YNN_partial_25_1262,
  rs_R010_ueqv_R010YNN_partial_25_1263,
  rs_R010_ueqv_R010YNN_partial_25_1264,
  rs_R010_ueqv_R010YNN_partial_25_1265,
  rs_R010_ueqv_R010YNN_partial_25_1266,
  rs_R010_ueqv_R010YNN_partial_25_1267,
  rs_R010_ueqv_R010YNN_partial_25_1268,
  rs_R010_ueqv_R010YNN_partial_25_1269,
  rs_R010_ueqv_R010YNN_partial_25_1270,
  rs_R010_ueqv_R010YNN_partial_25_1271,
  rs_R010_ueqv_R010YNN_partial_25_1272,
  rs_R010_ueqv_R010YNN_partial_25_1273,
  rs_R010_ueqv_R010YNN_partial_25_1274,
  rs_R010_ueqv_R010YNN_partial_25_1275,
  rs_R010_ueqv_R010YNN_partial_25_1276,
  rs_R010_ueqv_R010YNN_partial_25_1277,
  rs_R010_ueqv_R010YNN_partial_25_1278,
  rs_R010_ueqv_R010YNN_partial_25_1279,
  rs_R010_ueqv_R010YNN_partial_25_1280,
  rs_R010_ueqv_R010YNN_partial_25_1281,
  rs_R010_ueqv_R010YNN_partial_25_1282,
  rs_R010_ueqv_R010YNN_partial_25_1283,
  rs_R010_ueqv_R010YNN_partial_25_1284,
  rs_R010_ueqv_R010YNN_partial_25_1285,
  rs_R010_ueqv_R010YNN_partial_25_1286,
  rs_R010_ueqv_R010YNN_partial_25_1287,
  rs_R010_ueqv_R010YNN_partial_25_1288,
  rs_R010_ueqv_R010YNN_partial_25_1289,
  rs_R010_ueqv_R010YNN_partial_25_1290,
  rs_R010_ueqv_R010YNN_partial_25_1291,
  rs_R010_ueqv_R010YNN_partial_25_1292,
  rs_R010_ueqv_R010YNN_partial_25_1293,
  rs_R010_ueqv_R010YNN_partial_25_1294,
  rs_R010_ueqv_R010YNN_partial_25_1295,
  rs_R010_ueqv_R010YNN_partial_25_1296,
  rs_R010_ueqv_R010YNN_partial_25_1297,
  rs_R010_ueqv_R010YNN_partial_25_1298,
  rs_R010_ueqv_R010YNN_partial_25_1299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1200_1299 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((500319387710521995264 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (12, 2), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)],
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((845243108130082435808 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((322110539962494918592 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((34181659937579187200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4272707492197398400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((2108443843726951936 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((6660312513411557224 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2597299518529945600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((6135583745198797952 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1198497021709723613024 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364467414353139516416 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (12, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((879981766182686720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)],
  term ((5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((334154661633243096704 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (12, 2), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((1039438403794954240 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (12, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)],
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1200 through 1299. -/
theorem rs_R010_ueqv_R010YNN_block_25_1200_1299_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1200_1299
      rs_R010_ueqv_R010YNN_block_25_1200_1299 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
