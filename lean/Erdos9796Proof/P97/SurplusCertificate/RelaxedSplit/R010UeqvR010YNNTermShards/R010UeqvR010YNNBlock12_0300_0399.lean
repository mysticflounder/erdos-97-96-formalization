/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 12:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_12_0300_0399 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0300 : Poly :=
[
  term ((93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 300 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0300 : Poly :=
[
  term ((186512348704522246144 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((186512348704522246144 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0300_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0300
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0301 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0301 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0301_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0301
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0302 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0302 : Poly :=
[
  term ((8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0302_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0302
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0303 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 303 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0303 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0303_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0303
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0304 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0304 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0304_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0304
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0305 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 305 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0305 : Poly :=
[
  term ((383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0305_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0305
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0306 : Poly :=
[
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0306 : Poly :=
[
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0306_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0306
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0307 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0307 : Poly :=
[
  term ((71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0307_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0307
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0308 : Poly :=
[
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0308 : Poly :=
[
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0308_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0308
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0309 : Poly :=
[
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 309 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0309 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0309_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0309
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0310 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 310 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0310 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0310_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0310
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0311 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0311 : Poly :=
[
  term ((225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0311_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0311
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0312 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0312 : Poly :=
[
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0312_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0312
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0313 : Poly :=
[
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0313 : Poly :=
[
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0313_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0313
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0314 : Poly :=
[
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0314 : Poly :=
[
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0314_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0314
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0315 : Poly :=
[
  term ((250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 315 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0315 : Poly :=
[
  term ((500319387710521995264 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((500319387710521995264 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0315_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0315
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0316 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 316 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0316 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0316_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0316
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0317 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0317 : Poly :=
[
  term ((-853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0317_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0317
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0318 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0318 : Poly :=
[
  term ((81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0318_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0318
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0319 : Poly :=
[
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0319 : Poly :=
[
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0319_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0319
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0320 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 320 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0320 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0320_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0320
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0321 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0321 : Poly :=
[
  term ((-284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0321_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0321
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0322 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 322 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0322 : Poly :=
[
  term ((214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0322_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0322
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0323 : Poly :=
[
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0323 : Poly :=
[
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0323_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0323
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0324 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0324 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0324_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0324
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0325 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 325 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0325 : Poly :=
[
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0325_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0325
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0326 : Poly :=
[
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 326 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0326 : Poly :=
[
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0326_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0326
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0327 : Poly :=
[
  term ((422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0327 : Poly :=
[
  term ((845243108130082435808 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((845243108130082435808 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0327_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0327
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0328 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0328 : Poly :=
[
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0328_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0328
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0329 : Poly :=
[
  term ((17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0329 : Poly :=
[
  term ((34181659937579187200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((34181659937579187200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0329_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0329
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0330 : Poly :=
[
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 330 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0330 : Poly :=
[
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0330_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0330
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0331 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 331 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0331 : Poly :=
[
  term ((8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0331_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0331
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0332 : Poly :=
[
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0332 : Poly :=
[
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0332_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0332
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0333 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0333 : Poly :=
[
  term ((124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0333_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0333
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0334 : Poly :=
[
  term ((13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 334 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0334 : Poly :=
[
  term ((26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0334_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0334
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0335 : Poly :=
[
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0335 : Poly :=
[
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0335_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0335
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0336 : Poly :=
[
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 336 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0336 : Poly :=
[
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0336_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0336
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0337 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 337 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0337 : Poly :=
[
  term ((3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0337_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0337
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0338 : Poly :=
[
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0338 : Poly :=
[
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0338_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0338
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0339 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0339 : Poly :=
[
  term ((10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0339_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0339
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0340 : Poly :=
[
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0340 : Poly :=
[
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0340_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0340
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0341 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0341 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0341_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0341
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0342 : Poly :=
[
  term ((12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 342 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0342 : Poly :=
[
  term ((24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0342_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0342
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0343 : Poly :=
[
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0343 : Poly :=
[
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0343_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0343
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0344 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 344 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0344 : Poly :=
[
  term ((1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0344_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0344
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0345 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 345 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0345 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0345_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0345
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0346 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0346 : Poly :=
[
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0346_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0346
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0347 : Poly :=
[
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0347 : Poly :=
[
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0347_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0347
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0348 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 348 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0348 : Poly :=
[
  term ((773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0348_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0348
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0349 : Poly :=
[
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0349 : Poly :=
[
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0349_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0349
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0350 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0350 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0350_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0350
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0351 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 351 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0351 : Poly :=
[
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0351_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0351
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0352 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 352 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0352 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0352_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0352
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0353 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 353 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0353 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0353_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0353
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0354 : Poly :=
[
  term ((1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0354 : Poly :=
[
  term ((3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0354_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0354
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0355 : Poly :=
[
  term ((-3519927064730746880 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0355 : Poly :=
[
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0355_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0355
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0356 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 356 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0356 : Poly :=
[
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0356_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0356
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0357 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0357 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 2), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0357_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0357
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0358 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 358 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0358 : Poly :=
[
  term ((11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0358_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0358
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0359 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0359 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0359_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0359
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0360 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0360 : Poly :=
[
  term ((5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0360_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0360
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0361 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 361 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0361 : Poly :=
[
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0361_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0361
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0362 : Poly :=
[
  term ((167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0362 : Poly :=
[
  term ((334154661633243096704 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((334154661633243096704 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0362_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0362
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0363 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0363 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0363_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0363
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0364 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 364 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0364 : Poly :=
[
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0364_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0364
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0365 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 365 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0365 : Poly :=
[
  term ((-519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0365_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0365
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0366 : Poly :=
[
  term ((519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0366 : Poly :=
[
  term ((1039438403794954240 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1039438403794954240 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0366_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0366
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0367 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 367 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0367 : Poly :=
[
  term ((-148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0367_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0367
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0368 : Poly :=
[
  term ((148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0368 : Poly :=
[
  term ((296982401084272640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0368_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0368
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0369 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 369 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0369 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0369_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0369
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0370 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0370 : Poly :=
[
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0370_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0370
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0371 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 371 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0371 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0371_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0371
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0372 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0372 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0372_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0372
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0373 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0373 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0373_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0373
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0374 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 374 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0374 : Poly :=
[
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0374_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0374
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0375 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 375 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0375 : Poly :=
[
  term ((72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0375_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0375
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0376 : Poly :=
[
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0376 : Poly :=
[
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0376_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0376
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0377 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0377 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0377_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0377
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0378 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0378 : Poly :=
[
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0378_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0378
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0379 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 379 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0379 : Poly :=
[
  term ((23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0379_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0379
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0380 : Poly :=
[
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0380 : Poly :=
[
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0380_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0380
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0381 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 381 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0381 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 2), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0381_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0381
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0382 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0382 : Poly :=
[
  term ((16443216260964144640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((16443216260964144640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0382_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0382
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0383 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 383 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0383 : Poly :=
[
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0383_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0383
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0384 : Poly :=
[
  term ((3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0384 : Poly :=
[
  term ((7998540966772494336 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7998540966772494336 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0384_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0384
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0385 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0385 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0385_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0385
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0386 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0386 : Poly :=
[
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0386_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0386
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0387 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 387 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0387 : Poly :=
[
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0387_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0387
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0388 : Poly :=
[
  term ((55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0388 : Poly :=
[
  term ((111642484631901977600 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((111642484631901977600 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0388_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0388
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0389 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0389 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0389_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0389
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0390 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0390 : Poly :=
[
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0390_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0390
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0391 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 391 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0391 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0391_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0391
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0392 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 392 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0392 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0392_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0392
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0393 : Poly :=
[
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 393 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0393 : Poly :=
[
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0393_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0393
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0394 : Poly :=
[
  term ((37878717490069609472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 394 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0394 : Poly :=
[
  term ((75757434980139218944 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((75757434980139218944 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0394_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0394
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0395 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 395 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0395 : Poly :=
[
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0395_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0395
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0396 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0396 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0396_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0396
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0397 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 397 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0397 : Poly :=
[
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0397_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0397
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0398 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

/-- Partial product 398 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0398 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 2), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0398_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0398
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0399 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0399 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 1), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0399_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0399
        rs_R010_ueqv_R010YNN_generator_12_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_12_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_12_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_12_0300,
  rs_R010_ueqv_R010YNN_partial_12_0301,
  rs_R010_ueqv_R010YNN_partial_12_0302,
  rs_R010_ueqv_R010YNN_partial_12_0303,
  rs_R010_ueqv_R010YNN_partial_12_0304,
  rs_R010_ueqv_R010YNN_partial_12_0305,
  rs_R010_ueqv_R010YNN_partial_12_0306,
  rs_R010_ueqv_R010YNN_partial_12_0307,
  rs_R010_ueqv_R010YNN_partial_12_0308,
  rs_R010_ueqv_R010YNN_partial_12_0309,
  rs_R010_ueqv_R010YNN_partial_12_0310,
  rs_R010_ueqv_R010YNN_partial_12_0311,
  rs_R010_ueqv_R010YNN_partial_12_0312,
  rs_R010_ueqv_R010YNN_partial_12_0313,
  rs_R010_ueqv_R010YNN_partial_12_0314,
  rs_R010_ueqv_R010YNN_partial_12_0315,
  rs_R010_ueqv_R010YNN_partial_12_0316,
  rs_R010_ueqv_R010YNN_partial_12_0317,
  rs_R010_ueqv_R010YNN_partial_12_0318,
  rs_R010_ueqv_R010YNN_partial_12_0319,
  rs_R010_ueqv_R010YNN_partial_12_0320,
  rs_R010_ueqv_R010YNN_partial_12_0321,
  rs_R010_ueqv_R010YNN_partial_12_0322,
  rs_R010_ueqv_R010YNN_partial_12_0323,
  rs_R010_ueqv_R010YNN_partial_12_0324,
  rs_R010_ueqv_R010YNN_partial_12_0325,
  rs_R010_ueqv_R010YNN_partial_12_0326,
  rs_R010_ueqv_R010YNN_partial_12_0327,
  rs_R010_ueqv_R010YNN_partial_12_0328,
  rs_R010_ueqv_R010YNN_partial_12_0329,
  rs_R010_ueqv_R010YNN_partial_12_0330,
  rs_R010_ueqv_R010YNN_partial_12_0331,
  rs_R010_ueqv_R010YNN_partial_12_0332,
  rs_R010_ueqv_R010YNN_partial_12_0333,
  rs_R010_ueqv_R010YNN_partial_12_0334,
  rs_R010_ueqv_R010YNN_partial_12_0335,
  rs_R010_ueqv_R010YNN_partial_12_0336,
  rs_R010_ueqv_R010YNN_partial_12_0337,
  rs_R010_ueqv_R010YNN_partial_12_0338,
  rs_R010_ueqv_R010YNN_partial_12_0339,
  rs_R010_ueqv_R010YNN_partial_12_0340,
  rs_R010_ueqv_R010YNN_partial_12_0341,
  rs_R010_ueqv_R010YNN_partial_12_0342,
  rs_R010_ueqv_R010YNN_partial_12_0343,
  rs_R010_ueqv_R010YNN_partial_12_0344,
  rs_R010_ueqv_R010YNN_partial_12_0345,
  rs_R010_ueqv_R010YNN_partial_12_0346,
  rs_R010_ueqv_R010YNN_partial_12_0347,
  rs_R010_ueqv_R010YNN_partial_12_0348,
  rs_R010_ueqv_R010YNN_partial_12_0349,
  rs_R010_ueqv_R010YNN_partial_12_0350,
  rs_R010_ueqv_R010YNN_partial_12_0351,
  rs_R010_ueqv_R010YNN_partial_12_0352,
  rs_R010_ueqv_R010YNN_partial_12_0353,
  rs_R010_ueqv_R010YNN_partial_12_0354,
  rs_R010_ueqv_R010YNN_partial_12_0355,
  rs_R010_ueqv_R010YNN_partial_12_0356,
  rs_R010_ueqv_R010YNN_partial_12_0357,
  rs_R010_ueqv_R010YNN_partial_12_0358,
  rs_R010_ueqv_R010YNN_partial_12_0359,
  rs_R010_ueqv_R010YNN_partial_12_0360,
  rs_R010_ueqv_R010YNN_partial_12_0361,
  rs_R010_ueqv_R010YNN_partial_12_0362,
  rs_R010_ueqv_R010YNN_partial_12_0363,
  rs_R010_ueqv_R010YNN_partial_12_0364,
  rs_R010_ueqv_R010YNN_partial_12_0365,
  rs_R010_ueqv_R010YNN_partial_12_0366,
  rs_R010_ueqv_R010YNN_partial_12_0367,
  rs_R010_ueqv_R010YNN_partial_12_0368,
  rs_R010_ueqv_R010YNN_partial_12_0369,
  rs_R010_ueqv_R010YNN_partial_12_0370,
  rs_R010_ueqv_R010YNN_partial_12_0371,
  rs_R010_ueqv_R010YNN_partial_12_0372,
  rs_R010_ueqv_R010YNN_partial_12_0373,
  rs_R010_ueqv_R010YNN_partial_12_0374,
  rs_R010_ueqv_R010YNN_partial_12_0375,
  rs_R010_ueqv_R010YNN_partial_12_0376,
  rs_R010_ueqv_R010YNN_partial_12_0377,
  rs_R010_ueqv_R010YNN_partial_12_0378,
  rs_R010_ueqv_R010YNN_partial_12_0379,
  rs_R010_ueqv_R010YNN_partial_12_0380,
  rs_R010_ueqv_R010YNN_partial_12_0381,
  rs_R010_ueqv_R010YNN_partial_12_0382,
  rs_R010_ueqv_R010YNN_partial_12_0383,
  rs_R010_ueqv_R010YNN_partial_12_0384,
  rs_R010_ueqv_R010YNN_partial_12_0385,
  rs_R010_ueqv_R010YNN_partial_12_0386,
  rs_R010_ueqv_R010YNN_partial_12_0387,
  rs_R010_ueqv_R010YNN_partial_12_0388,
  rs_R010_ueqv_R010YNN_partial_12_0389,
  rs_R010_ueqv_R010YNN_partial_12_0390,
  rs_R010_ueqv_R010YNN_partial_12_0391,
  rs_R010_ueqv_R010YNN_partial_12_0392,
  rs_R010_ueqv_R010YNN_partial_12_0393,
  rs_R010_ueqv_R010YNN_partial_12_0394,
  rs_R010_ueqv_R010YNN_partial_12_0395,
  rs_R010_ueqv_R010YNN_partial_12_0396,
  rs_R010_ueqv_R010YNN_partial_12_0397,
  rs_R010_ueqv_R010YNN_partial_12_0398,
  rs_R010_ueqv_R010YNN_partial_12_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_12_0300_0399 : Poly :=
[
  term ((186512348704522246144 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((500319387710521995264 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((845243108130082435808 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((34181659937579187200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((334154661633243096704 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1039438403794954240 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((16443216260964144640 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7998540966772494336 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((111642484631901977600 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((75757434980139218944 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (13, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(2, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((186512348704522246144 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-767848136780209847296 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-142229211460800031744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-2216876892613698830464 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((500319387710521995264 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-162633517282888798208 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (13, 2), (16, 1)],
  term ((-428122772863617450592 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((845243108130082435808 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((34181659937579187200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16867550749815615488 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-53282500107292457792 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-249712912714000600192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((-6621764536772403200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-20073357533413698560 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-49084669961590383616 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((9587976173677788904192 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(3, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1546687286323503960064 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(3, 1), (5, 2), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7039854129461493760 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (13, 2), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (13, 2), (15, 1), (16, 1)],
  term ((5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((334154661633243096704 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(3, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((1039438403794954240 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((16443216260964144640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 2), (16, 1)],
  term ((7998540966772494336 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((111642484631901977600 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75757434980139218944 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 2), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 1), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 3), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 3), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 3), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 3), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 2), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 3), (15, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 3), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 2), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 3), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 3), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 3), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 3), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 3), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (12, 2), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (12, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 3), (13, 2), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 300 through 399. -/
theorem rs_R010_ueqv_R010YNN_block_12_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_12_0300_0399
      rs_R010_ueqv_R010YNN_block_12_0300_0399 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
