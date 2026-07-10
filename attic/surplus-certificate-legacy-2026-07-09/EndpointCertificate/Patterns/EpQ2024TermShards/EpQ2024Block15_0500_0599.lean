/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0500 : Poly :=
[
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

/-- Partial product 500 for generator 15. -/
def ep_Q2_024_partial_15_0500 : Poly :=
[
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 15. -/
theorem ep_Q2_024_partial_15_0500_valid :
    mulPoly ep_Q2_024_coefficient_15_0500
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0501 : Poly :=
[
  term ((-4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 15. -/
def ep_Q2_024_partial_15_0501 : Poly :=
[
  term ((-9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 15. -/
theorem ep_Q2_024_partial_15_0501_valid :
    mulPoly ep_Q2_024_coefficient_15_0501
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0502 : Poly :=
[
  term ((138025294597998158352295779033728413996477741740968784001 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 502 for generator 15. -/
def ep_Q2_024_partial_15_0502 : Poly :=
[
  term ((138025294597998158352295779033728413996477741740968784001 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-138025294597998158352295779033728413996477741740968784001 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 15. -/
theorem ep_Q2_024_partial_15_0502_valid :
    mulPoly ep_Q2_024_coefficient_15_0502
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0503 : Poly :=
[
  term ((102735088155671195 : Rat) / 13953362653838316) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 15. -/
def ep_Q2_024_partial_15_0503 : Poly :=
[
  term ((102735088155671195 : Rat) / 6976681326919158) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-102735088155671195 : Rat) / 13953362653838316) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 15. -/
theorem ep_Q2_024_partial_15_0503_valid :
    mulPoly ep_Q2_024_coefficient_15_0503
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0504 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1)]
]

/-- Partial product 504 for generator 15. -/
def ep_Q2_024_partial_15_0504 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 15. -/
theorem ep_Q2_024_partial_15_0504_valid :
    mulPoly ep_Q2_024_coefficient_15_0504
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0505 : Poly :=
[
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1)]
]

/-- Partial product 505 for generator 15. -/
def ep_Q2_024_partial_15_0505 : Poly :=
[
  term ((82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 15. -/
theorem ep_Q2_024_partial_15_0505_valid :
    mulPoly ep_Q2_024_coefficient_15_0505
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0506 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 1), (13, 1)]
]

/-- Partial product 506 for generator 15. -/
def ep_Q2_024_partial_15_0506 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (6, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 15. -/
theorem ep_Q2_024_partial_15_0506_valid :
    mulPoly ep_Q2_024_coefficient_15_0506
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0507 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

/-- Partial product 507 for generator 15. -/
def ep_Q2_024_partial_15_0507 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 15. -/
theorem ep_Q2_024_partial_15_0507_valid :
    mulPoly ep_Q2_024_coefficient_15_0507
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0508 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 15. -/
def ep_Q2_024_partial_15_0508 : Poly :=
[
  term ((-2606770083157932 : Rat) / 1162780221153193) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 15. -/
theorem ep_Q2_024_partial_15_0508_valid :
    mulPoly ep_Q2_024_coefficient_15_0508
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0509 : Poly :=
[
  term ((-4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (13, 1)]
]

/-- Partial product 509 for generator 15. -/
def ep_Q2_024_partial_15_0509 : Poly :=
[
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 15. -/
theorem ep_Q2_024_partial_15_0509_valid :
    mulPoly ep_Q2_024_coefficient_15_0509
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0510 : Poly :=
[
  term ((-70247848985732086734752137923063562785282156438099684283 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (15, 1)]
]

/-- Partial product 510 for generator 15. -/
def ep_Q2_024_partial_15_0510 : Poly :=
[
  term ((-70247848985732086734752137923063562785282156438099684283 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((70247848985732086734752137923063562785282156438099684283 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 15. -/
theorem ep_Q2_024_partial_15_0510_valid :
    mulPoly ep_Q2_024_coefficient_15_0510
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0511 : Poly :=
[
  term ((29914930724491025 : Rat) / 3488340663459579) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 15. -/
def ep_Q2_024_partial_15_0511 : Poly :=
[
  term ((59829861448982050 : Rat) / 3488340663459579) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 15. -/
theorem ep_Q2_024_partial_15_0511_valid :
    mulPoly ep_Q2_024_coefficient_15_0511
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0512 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)]
]

/-- Partial product 512 for generator 15. -/
def ep_Q2_024_partial_15_0512 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (6, 1), (8, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 15. -/
theorem ep_Q2_024_partial_15_0512_valid :
    mulPoly ep_Q2_024_coefficient_15_0512
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0513 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 1)]
]

/-- Partial product 513 for generator 15. -/
def ep_Q2_024_partial_15_0513 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (6, 1), (14, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 15. -/
theorem ep_Q2_024_partial_15_0513_valid :
    mulPoly ep_Q2_024_coefficient_15_0513
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0514 : Poly :=
[
  term ((-109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 514 for generator 15. -/
def ep_Q2_024_partial_15_0514 : Poly :=
[
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 15. -/
theorem ep_Q2_024_partial_15_0514_valid :
    mulPoly ep_Q2_024_coefficient_15_0514
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0515 : Poly :=
[
  term ((-154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 515 for generator 15. -/
def ep_Q2_024_partial_15_0515 : Poly :=
[
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 15. -/
theorem ep_Q2_024_partial_15_0515_valid :
    mulPoly ep_Q2_024_coefficient_15_0515
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0516 : Poly :=
[
  term ((4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 516 for generator 15. -/
def ep_Q2_024_partial_15_0516 : Poly :=
[
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 15. -/
theorem ep_Q2_024_partial_15_0516_valid :
    mulPoly ep_Q2_024_coefficient_15_0516
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0517 : Poly :=
[
  term ((2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 15. -/
def ep_Q2_024_partial_15_0517 : Poly :=
[
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 15. -/
theorem ep_Q2_024_partial_15_0517_valid :
    mulPoly ep_Q2_024_coefficient_15_0517
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0518 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 518 for generator 15. -/
def ep_Q2_024_partial_15_0518 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 15. -/
theorem ep_Q2_024_partial_15_0518_valid :
    mulPoly ep_Q2_024_coefficient_15_0518
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0519 : Poly :=
[
  term ((-9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 519 for generator 15. -/
def ep_Q2_024_partial_15_0519 : Poly :=
[
  term ((-18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 15. -/
theorem ep_Q2_024_partial_15_0519_valid :
    mulPoly ep_Q2_024_coefficient_15_0519
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0520 : Poly :=
[
  term ((14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 520 for generator 15. -/
def ep_Q2_024_partial_15_0520 : Poly :=
[
  term ((29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 15. -/
theorem ep_Q2_024_partial_15_0520_valid :
    mulPoly ep_Q2_024_coefficient_15_0520
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0521 : Poly :=
[
  term ((-306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 15. -/
def ep_Q2_024_partial_15_0521 : Poly :=
[
  term ((-612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 15. -/
theorem ep_Q2_024_partial_15_0521_valid :
    mulPoly ep_Q2_024_coefficient_15_0521
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0522 : Poly :=
[
  term ((-6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 522 for generator 15. -/
def ep_Q2_024_partial_15_0522 : Poly :=
[
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 15. -/
theorem ep_Q2_024_partial_15_0522_valid :
    mulPoly ep_Q2_024_coefficient_15_0522
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0523 : Poly :=
[
  term ((550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 523 for generator 15. -/
def ep_Q2_024_partial_15_0523 : Poly :=
[
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 15. -/
theorem ep_Q2_024_partial_15_0523_valid :
    mulPoly ep_Q2_024_coefficient_15_0523
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0524 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 524 for generator 15. -/
def ep_Q2_024_partial_15_0524 : Poly :=
[
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 15. -/
theorem ep_Q2_024_partial_15_0524_valid :
    mulPoly ep_Q2_024_coefficient_15_0524
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0525 : Poly :=
[
  term ((4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 15. -/
def ep_Q2_024_partial_15_0525 : Poly :=
[
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 15. -/
theorem ep_Q2_024_partial_15_0525_valid :
    mulPoly ep_Q2_024_coefficient_15_0525
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0526 : Poly :=
[
  term ((410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)]
]

/-- Partial product 526 for generator 15. -/
def ep_Q2_024_partial_15_0526 : Poly :=
[
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 2)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 15. -/
theorem ep_Q2_024_partial_15_0526_valid :
    mulPoly ep_Q2_024_coefficient_15_0526
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0527 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)]
]

/-- Partial product 527 for generator 15. -/
def ep_Q2_024_partial_15_0527 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 15. -/
theorem ep_Q2_024_partial_15_0527_valid :
    mulPoly ep_Q2_024_coefficient_15_0527
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0528 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 528 for generator 15. -/
def ep_Q2_024_partial_15_0528 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 15. -/
theorem ep_Q2_024_partial_15_0528_valid :
    mulPoly ep_Q2_024_coefficient_15_0528
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0529 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 529 for generator 15. -/
def ep_Q2_024_partial_15_0529 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 15. -/
theorem ep_Q2_024_partial_15_0529_valid :
    mulPoly ep_Q2_024_coefficient_15_0529
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0530 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 530 for generator 15. -/
def ep_Q2_024_partial_15_0530 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 15. -/
theorem ep_Q2_024_partial_15_0530_valid :
    mulPoly ep_Q2_024_coefficient_15_0530
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0531 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 531 for generator 15. -/
def ep_Q2_024_partial_15_0531 : Poly :=
[
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 15. -/
theorem ep_Q2_024_partial_15_0531_valid :
    mulPoly ep_Q2_024_coefficient_15_0531
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0532 : Poly :=
[
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 15. -/
def ep_Q2_024_partial_15_0532 : Poly :=
[
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 15. -/
theorem ep_Q2_024_partial_15_0532_valid :
    mulPoly ep_Q2_024_coefficient_15_0532
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0533 : Poly :=
[
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (8, 1), (13, 2)]
]

/-- Partial product 533 for generator 15. -/
def ep_Q2_024_partial_15_0533 : Poly :=
[
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 2)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 15. -/
theorem ep_Q2_024_partial_15_0533_valid :
    mulPoly ep_Q2_024_coefficient_15_0533
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0534 : Poly :=
[
  term ((-5433092593842467784513923562473658967621 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

/-- Partial product 534 for generator 15. -/
def ep_Q2_024_partial_15_0534 : Poly :=
[
  term ((-10866185187684935569027847124947317935242 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term ((5433092593842467784513923562473658967621 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 15. -/
theorem ep_Q2_024_partial_15_0534_valid :
    mulPoly ep_Q2_024_coefficient_15_0534
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0535 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (15, 2)]
]

/-- Partial product 535 for generator 15. -/
def ep_Q2_024_partial_15_0535 : Poly :=
[
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 15. -/
theorem ep_Q2_024_partial_15_0535_valid :
    mulPoly ep_Q2_024_coefficient_15_0535
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0536 : Poly :=
[
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 536 for generator 15. -/
def ep_Q2_024_partial_15_0536 : Poly :=
[
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 15. -/
theorem ep_Q2_024_partial_15_0536_valid :
    mulPoly ep_Q2_024_coefficient_15_0536
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0537 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)]
]

/-- Partial product 537 for generator 15. -/
def ep_Q2_024_partial_15_0537 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 1), (8, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 15. -/
theorem ep_Q2_024_partial_15_0537_valid :
    mulPoly ep_Q2_024_coefficient_15_0537
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0538 : Poly :=
[
  term ((547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 538 for generator 15. -/
def ep_Q2_024_partial_15_0538 : Poly :=
[
  term ((1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 15. -/
theorem ep_Q2_024_partial_15_0538_valid :
    mulPoly ep_Q2_024_coefficient_15_0538
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0539 : Poly :=
[
  term ((-8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 539 for generator 15. -/
def ep_Q2_024_partial_15_0539 : Poly :=
[
  term ((-17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 15. -/
theorem ep_Q2_024_partial_15_0539_valid :
    mulPoly ep_Q2_024_coefficient_15_0539
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0540 : Poly :=
[
  term ((5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 15. -/
def ep_Q2_024_partial_15_0540 : Poly :=
[
  term ((10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 15. -/
theorem ep_Q2_024_partial_15_0540_valid :
    mulPoly ep_Q2_024_coefficient_15_0540
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0541 : Poly :=
[
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 1)]
]

/-- Partial product 541 for generator 15. -/
def ep_Q2_024_partial_15_0541 : Poly :=
[
  term ((883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 2), (14, 1)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 15. -/
theorem ep_Q2_024_partial_15_0541_valid :
    mulPoly ep_Q2_024_coefficient_15_0541
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0542 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 542 for generator 15. -/
def ep_Q2_024_partial_15_0542 : Poly :=
[
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 15. -/
theorem ep_Q2_024_partial_15_0542_valid :
    mulPoly ep_Q2_024_coefficient_15_0542
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0543 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

/-- Partial product 543 for generator 15. -/
def ep_Q2_024_partial_15_0543 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 15. -/
theorem ep_Q2_024_partial_15_0543_valid :
    mulPoly ep_Q2_024_coefficient_15_0543
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0544 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 544 for generator 15. -/
def ep_Q2_024_partial_15_0544 : Poly :=
[
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 15. -/
theorem ep_Q2_024_partial_15_0544_valid :
    mulPoly ep_Q2_024_coefficient_15_0544
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0545 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 545 for generator 15. -/
def ep_Q2_024_partial_15_0545 : Poly :=
[
  term ((2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 15. -/
theorem ep_Q2_024_partial_15_0545_valid :
    mulPoly ep_Q2_024_coefficient_15_0545
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0546 : Poly :=
[
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 546 for generator 15. -/
def ep_Q2_024_partial_15_0546 : Poly :=
[
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 15. -/
theorem ep_Q2_024_partial_15_0546_valid :
    mulPoly ep_Q2_024_coefficient_15_0546
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0547 : Poly :=
[
  term ((513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 15. -/
def ep_Q2_024_partial_15_0547 : Poly :=
[
  term ((1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 15. -/
theorem ep_Q2_024_partial_15_0547_valid :
    mulPoly ep_Q2_024_coefficient_15_0547
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0548 : Poly :=
[
  term ((43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 1)]
]

/-- Partial product 548 for generator 15. -/
def ep_Q2_024_partial_15_0548 : Poly :=
[
  term ((86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (13, 2), (14, 1)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 15. -/
theorem ep_Q2_024_partial_15_0548_valid :
    mulPoly ep_Q2_024_coefficient_15_0548
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0549 : Poly :=
[
  term ((-318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 549 for generator 15. -/
def ep_Q2_024_partial_15_0549 : Poly :=
[
  term ((-636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 15. -/
theorem ep_Q2_024_partial_15_0549_valid :
    mulPoly ep_Q2_024_coefficient_15_0549
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0550 : Poly :=
[
  term ((42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

/-- Partial product 550 for generator 15. -/
def ep_Q2_024_partial_15_0550 : Poly :=
[
  term ((84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 15. -/
theorem ep_Q2_024_partial_15_0550_valid :
    mulPoly ep_Q2_024_coefficient_15_0550
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0551 : Poly :=
[
  term ((-735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 15. -/
def ep_Q2_024_partial_15_0551 : Poly :=
[
  term ((-1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 15. -/
theorem ep_Q2_024_partial_15_0551_valid :
    mulPoly ep_Q2_024_coefficient_15_0551
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0552 : Poly :=
[
  term ((-1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)]
]

/-- Partial product 552 for generator 15. -/
def ep_Q2_024_partial_15_0552 : Poly :=
[
  term ((-2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 15. -/
theorem ep_Q2_024_partial_15_0552_valid :
    mulPoly ep_Q2_024_coefficient_15_0552
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0553 : Poly :=
[
  term ((13619109877931593101754218480323078608 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (8, 1), (9, 1)]
]

/-- Partial product 553 for generator 15. -/
def ep_Q2_024_partial_15_0553 : Poly :=
[
  term ((27238219755863186203508436960646157216 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((-13619109877931593101754218480323078608 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 15. -/
theorem ep_Q2_024_partial_15_0553_valid :
    mulPoly ep_Q2_024_coefficient_15_0553
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0554 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 554 for generator 15. -/
def ep_Q2_024_partial_15_0554 : Poly :=
[
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 15. -/
theorem ep_Q2_024_partial_15_0554_valid :
    mulPoly ep_Q2_024_coefficient_15_0554
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0555 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 555 for generator 15. -/
def ep_Q2_024_partial_15_0555 : Poly :=
[
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 15. -/
theorem ep_Q2_024_partial_15_0555_valid :
    mulPoly ep_Q2_024_coefficient_15_0555
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0556 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 15. -/
def ep_Q2_024_partial_15_0556 : Poly :=
[
  term ((-9572621512797280 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 15. -/
theorem ep_Q2_024_partial_15_0556_valid :
    mulPoly ep_Q2_024_coefficient_15_0556
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0557 : Poly :=
[
  term ((1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

/-- Partial product 557 for generator 15. -/
def ep_Q2_024_partial_15_0557 : Poly :=
[
  term ((2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 15. -/
theorem ep_Q2_024_partial_15_0557_valid :
    mulPoly ep_Q2_024_coefficient_15_0557
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0558 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 558 for generator 15. -/
def ep_Q2_024_partial_15_0558 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 15. -/
theorem ep_Q2_024_partial_15_0558_valid :
    mulPoly ep_Q2_024_coefficient_15_0558
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0559 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 559 for generator 15. -/
def ep_Q2_024_partial_15_0559 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 15. -/
theorem ep_Q2_024_partial_15_0559_valid :
    mulPoly ep_Q2_024_coefficient_15_0559
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0560 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 15. -/
def ep_Q2_024_partial_15_0560 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 15. -/
theorem ep_Q2_024_partial_15_0560_valid :
    mulPoly ep_Q2_024_coefficient_15_0560
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0561 : Poly :=
[
  term ((-8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 561 for generator 15. -/
def ep_Q2_024_partial_15_0561 : Poly :=
[
  term ((-16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 15. -/
theorem ep_Q2_024_partial_15_0561_valid :
    mulPoly ep_Q2_024_coefficient_15_0561
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0562 : Poly :=
[
  term ((2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 15. -/
def ep_Q2_024_partial_15_0562 : Poly :=
[
  term ((4414197889054120 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 15. -/
theorem ep_Q2_024_partial_15_0562_valid :
    mulPoly ep_Q2_024_coefficient_15_0562
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0563 : Poly :=
[
  term ((-433945256163848213003791909370480325138 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 563 for generator 15. -/
def ep_Q2_024_partial_15_0563 : Poly :=
[
  term ((-867890512327696426007583818740960650276 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((433945256163848213003791909370480325138 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 15. -/
theorem ep_Q2_024_partial_15_0563_valid :
    mulPoly ep_Q2_024_coefficient_15_0563
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0564 : Poly :=
[
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1), (12, 1)]
]

/-- Partial product 564 for generator 15. -/
def ep_Q2_024_partial_15_0564 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 15. -/
theorem ep_Q2_024_partial_15_0564_valid :
    mulPoly ep_Q2_024_coefficient_15_0564
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0565 : Poly :=
[
  term ((-143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 1)]
]

/-- Partial product 565 for generator 15. -/
def ep_Q2_024_partial_15_0565 : Poly :=
[
  term ((-287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 15. -/
theorem ep_Q2_024_partial_15_0565_valid :
    mulPoly ep_Q2_024_coefficient_15_0565
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0566 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 566 for generator 15. -/
def ep_Q2_024_partial_15_0566 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 15. -/
theorem ep_Q2_024_partial_15_0566_valid :
    mulPoly ep_Q2_024_coefficient_15_0566
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0567 : Poly :=
[
  term ((954046443115749453583926101653488081616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 567 for generator 15. -/
def ep_Q2_024_partial_15_0567 : Poly :=
[
  term ((1908092886231498907167852203306976163232 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-954046443115749453583926101653488081616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 15. -/
theorem ep_Q2_024_partial_15_0567_valid :
    mulPoly ep_Q2_024_coefficient_15_0567
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0568 : Poly :=
[
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 568 for generator 15. -/
def ep_Q2_024_partial_15_0568 : Poly :=
[
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 15. -/
theorem ep_Q2_024_partial_15_0568_valid :
    mulPoly ep_Q2_024_coefficient_15_0568
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0569 : Poly :=
[
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 569 for generator 15. -/
def ep_Q2_024_partial_15_0569 : Poly :=
[
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 15. -/
theorem ep_Q2_024_partial_15_0569_valid :
    mulPoly ep_Q2_024_coefficient_15_0569
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0570 : Poly :=
[
  term ((3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 15. -/
def ep_Q2_024_partial_15_0570 : Poly :=
[
  term ((7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 15. -/
theorem ep_Q2_024_partial_15_0570_valid :
    mulPoly ep_Q2_024_coefficient_15_0570
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0571 : Poly :=
[
  term ((-16549442266609437905275798927626706249703149164555050974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 571 for generator 15. -/
def ep_Q2_024_partial_15_0571 : Poly :=
[
  term ((-33098884533218875810551597855253412499406298329110101948 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((16549442266609437905275798927626706249703149164555050974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 15. -/
theorem ep_Q2_024_partial_15_0571_valid :
    mulPoly ep_Q2_024_coefficient_15_0571
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0572 : Poly :=
[
  term ((5422991476204008 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 15. -/
def ep_Q2_024_partial_15_0572 : Poly :=
[
  term ((10845982952408016 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5422991476204008 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 15. -/
theorem ep_Q2_024_partial_15_0572_valid :
    mulPoly ep_Q2_024_coefficient_15_0572
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0573 : Poly :=
[
  term ((-740631854846765770783901916642650711458 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 573 for generator 15. -/
def ep_Q2_024_partial_15_0573 : Poly :=
[
  term ((-1481263709693531541567803833285301422916 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((740631854846765770783901916642650711458 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 15. -/
theorem ep_Q2_024_partial_15_0573_valid :
    mulPoly ep_Q2_024_coefficient_15_0573
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0574 : Poly :=
[
  term ((-72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 574 for generator 15. -/
def ep_Q2_024_partial_15_0574 : Poly :=
[
  term ((-145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 15. -/
theorem ep_Q2_024_partial_15_0574_valid :
    mulPoly ep_Q2_024_coefficient_15_0574
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0575 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 2)]
]

/-- Partial product 575 for generator 15. -/
def ep_Q2_024_partial_15_0575 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 15. -/
theorem ep_Q2_024_partial_15_0575_valid :
    mulPoly ep_Q2_024_coefficient_15_0575
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0576 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

/-- Partial product 576 for generator 15. -/
def ep_Q2_024_partial_15_0576 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 15. -/
theorem ep_Q2_024_partial_15_0576_valid :
    mulPoly ep_Q2_024_coefficient_15_0576
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0577 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 577 for generator 15. -/
def ep_Q2_024_partial_15_0577 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 15. -/
theorem ep_Q2_024_partial_15_0577_valid :
    mulPoly ep_Q2_024_coefficient_15_0577
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0578 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

/-- Partial product 578 for generator 15. -/
def ep_Q2_024_partial_15_0578 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 15. -/
theorem ep_Q2_024_partial_15_0578_valid :
    mulPoly ep_Q2_024_coefficient_15_0578
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0579 : Poly :=
[
  term ((66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 579 for generator 15. -/
def ep_Q2_024_partial_15_0579 : Poly :=
[
  term ((132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 15. -/
theorem ep_Q2_024_partial_15_0579_valid :
    mulPoly ep_Q2_024_coefficient_15_0579
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0580 : Poly :=
[
  term ((-6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 15. -/
def ep_Q2_024_partial_15_0580 : Poly :=
[
  term ((-13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 15. -/
theorem ep_Q2_024_partial_15_0580_valid :
    mulPoly ep_Q2_024_coefficient_15_0580
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0581 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 2), (15, 1)]
]

/-- Partial product 581 for generator 15. -/
def ep_Q2_024_partial_15_0581 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 15. -/
theorem ep_Q2_024_partial_15_0581_valid :
    mulPoly ep_Q2_024_coefficient_15_0581
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0582 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 15. -/
def ep_Q2_024_partial_15_0582 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 15. -/
theorem ep_Q2_024_partial_15_0582_valid :
    mulPoly ep_Q2_024_coefficient_15_0582
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0583 : Poly :=
[
  term ((29860222001127543818785333178438498415009303321814011158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 583 for generator 15. -/
def ep_Q2_024_partial_15_0583 : Poly :=
[
  term ((59720444002255087637570666356876996830018606643628022316 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-29860222001127543818785333178438498415009303321814011158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 15. -/
theorem ep_Q2_024_partial_15_0583_valid :
    mulPoly ep_Q2_024_coefficient_15_0583
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0584 : Poly :=
[
  term ((-4628106147380416 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 584 for generator 15. -/
def ep_Q2_024_partial_15_0584 : Poly :=
[
  term ((-9256212294760832 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 15. -/
theorem ep_Q2_024_partial_15_0584_valid :
    mulPoly ep_Q2_024_coefficient_15_0584
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0585 : Poly :=
[
  term ((-132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 585 for generator 15. -/
def ep_Q2_024_partial_15_0585 : Poly :=
[
  term ((-264300985337348201566420963209114072280 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (8, 1)],
  term ((132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 15. -/
theorem ep_Q2_024_partial_15_0585_valid :
    mulPoly ep_Q2_024_coefficient_15_0585
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0586 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 586 for generator 15. -/
def ep_Q2_024_partial_15_0586 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 15. -/
theorem ep_Q2_024_partial_15_0586_valid :
    mulPoly ep_Q2_024_coefficient_15_0586
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0587 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

/-- Partial product 587 for generator 15. -/
def ep_Q2_024_partial_15_0587 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 15. -/
theorem ep_Q2_024_partial_15_0587_valid :
    mulPoly ep_Q2_024_coefficient_15_0587
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0588 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 588 for generator 15. -/
def ep_Q2_024_partial_15_0588 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 15. -/
theorem ep_Q2_024_partial_15_0588_valid :
    mulPoly ep_Q2_024_coefficient_15_0588
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0589 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 589 for generator 15. -/
def ep_Q2_024_partial_15_0589 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 15. -/
theorem ep_Q2_024_partial_15_0589_valid :
    mulPoly ep_Q2_024_coefficient_15_0589
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0590 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 590 for generator 15. -/
def ep_Q2_024_partial_15_0590 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 15. -/
theorem ep_Q2_024_partial_15_0590_valid :
    mulPoly ep_Q2_024_coefficient_15_0590
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0591 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 591 for generator 15. -/
def ep_Q2_024_partial_15_0591 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 15. -/
theorem ep_Q2_024_partial_15_0591_valid :
    mulPoly ep_Q2_024_coefficient_15_0591
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0592 : Poly :=
[
  term ((-1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 592 for generator 15. -/
def ep_Q2_024_partial_15_0592 : Poly :=
[
  term ((-3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 15. -/
theorem ep_Q2_024_partial_15_0592_valid :
    mulPoly ep_Q2_024_coefficient_15_0592
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0593 : Poly :=
[
  term ((-60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 593 for generator 15. -/
def ep_Q2_024_partial_15_0593 : Poly :=
[
  term ((-120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 15. -/
theorem ep_Q2_024_partial_15_0593_valid :
    mulPoly ep_Q2_024_coefficient_15_0593
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0594 : Poly :=
[
  term ((13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 15. -/
def ep_Q2_024_partial_15_0594 : Poly :=
[
  term ((26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 15. -/
theorem ep_Q2_024_partial_15_0594_valid :
    mulPoly ep_Q2_024_coefficient_15_0594
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0595 : Poly :=
[
  term ((636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 1)]
]

/-- Partial product 595 for generator 15. -/
def ep_Q2_024_partial_15_0595 : Poly :=
[
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 15. -/
theorem ep_Q2_024_partial_15_0595_valid :
    mulPoly ep_Q2_024_coefficient_15_0595
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0596 : Poly :=
[
  term ((132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 596 for generator 15. -/
def ep_Q2_024_partial_15_0596 : Poly :=
[
  term ((264300985337348201566420963209114072280 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (12, 1)],
  term ((-132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 15. -/
theorem ep_Q2_024_partial_15_0596_valid :
    mulPoly ep_Q2_024_coefficient_15_0596
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0597 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 597 for generator 15. -/
def ep_Q2_024_partial_15_0597 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 15. -/
theorem ep_Q2_024_partial_15_0597_valid :
    mulPoly ep_Q2_024_coefficient_15_0597
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0598 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 15. -/
def ep_Q2_024_partial_15_0598 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 15. -/
theorem ep_Q2_024_partial_15_0598_valid :
    mulPoly ep_Q2_024_coefficient_15_0598
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0599 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 599 for generator 15. -/
def ep_Q2_024_partial_15_0599 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 15. -/
theorem ep_Q2_024_partial_15_0599_valid :
    mulPoly ep_Q2_024_coefficient_15_0599
        ep_Q2_024_generator_15_0500_0599 =
      ep_Q2_024_partial_15_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0500_0599 : List Poly :=
[
  ep_Q2_024_partial_15_0500,
  ep_Q2_024_partial_15_0501,
  ep_Q2_024_partial_15_0502,
  ep_Q2_024_partial_15_0503,
  ep_Q2_024_partial_15_0504,
  ep_Q2_024_partial_15_0505,
  ep_Q2_024_partial_15_0506,
  ep_Q2_024_partial_15_0507,
  ep_Q2_024_partial_15_0508,
  ep_Q2_024_partial_15_0509,
  ep_Q2_024_partial_15_0510,
  ep_Q2_024_partial_15_0511,
  ep_Q2_024_partial_15_0512,
  ep_Q2_024_partial_15_0513,
  ep_Q2_024_partial_15_0514,
  ep_Q2_024_partial_15_0515,
  ep_Q2_024_partial_15_0516,
  ep_Q2_024_partial_15_0517,
  ep_Q2_024_partial_15_0518,
  ep_Q2_024_partial_15_0519,
  ep_Q2_024_partial_15_0520,
  ep_Q2_024_partial_15_0521,
  ep_Q2_024_partial_15_0522,
  ep_Q2_024_partial_15_0523,
  ep_Q2_024_partial_15_0524,
  ep_Q2_024_partial_15_0525,
  ep_Q2_024_partial_15_0526,
  ep_Q2_024_partial_15_0527,
  ep_Q2_024_partial_15_0528,
  ep_Q2_024_partial_15_0529,
  ep_Q2_024_partial_15_0530,
  ep_Q2_024_partial_15_0531,
  ep_Q2_024_partial_15_0532,
  ep_Q2_024_partial_15_0533,
  ep_Q2_024_partial_15_0534,
  ep_Q2_024_partial_15_0535,
  ep_Q2_024_partial_15_0536,
  ep_Q2_024_partial_15_0537,
  ep_Q2_024_partial_15_0538,
  ep_Q2_024_partial_15_0539,
  ep_Q2_024_partial_15_0540,
  ep_Q2_024_partial_15_0541,
  ep_Q2_024_partial_15_0542,
  ep_Q2_024_partial_15_0543,
  ep_Q2_024_partial_15_0544,
  ep_Q2_024_partial_15_0545,
  ep_Q2_024_partial_15_0546,
  ep_Q2_024_partial_15_0547,
  ep_Q2_024_partial_15_0548,
  ep_Q2_024_partial_15_0549,
  ep_Q2_024_partial_15_0550,
  ep_Q2_024_partial_15_0551,
  ep_Q2_024_partial_15_0552,
  ep_Q2_024_partial_15_0553,
  ep_Q2_024_partial_15_0554,
  ep_Q2_024_partial_15_0555,
  ep_Q2_024_partial_15_0556,
  ep_Q2_024_partial_15_0557,
  ep_Q2_024_partial_15_0558,
  ep_Q2_024_partial_15_0559,
  ep_Q2_024_partial_15_0560,
  ep_Q2_024_partial_15_0561,
  ep_Q2_024_partial_15_0562,
  ep_Q2_024_partial_15_0563,
  ep_Q2_024_partial_15_0564,
  ep_Q2_024_partial_15_0565,
  ep_Q2_024_partial_15_0566,
  ep_Q2_024_partial_15_0567,
  ep_Q2_024_partial_15_0568,
  ep_Q2_024_partial_15_0569,
  ep_Q2_024_partial_15_0570,
  ep_Q2_024_partial_15_0571,
  ep_Q2_024_partial_15_0572,
  ep_Q2_024_partial_15_0573,
  ep_Q2_024_partial_15_0574,
  ep_Q2_024_partial_15_0575,
  ep_Q2_024_partial_15_0576,
  ep_Q2_024_partial_15_0577,
  ep_Q2_024_partial_15_0578,
  ep_Q2_024_partial_15_0579,
  ep_Q2_024_partial_15_0580,
  ep_Q2_024_partial_15_0581,
  ep_Q2_024_partial_15_0582,
  ep_Q2_024_partial_15_0583,
  ep_Q2_024_partial_15_0584,
  ep_Q2_024_partial_15_0585,
  ep_Q2_024_partial_15_0586,
  ep_Q2_024_partial_15_0587,
  ep_Q2_024_partial_15_0588,
  ep_Q2_024_partial_15_0589,
  ep_Q2_024_partial_15_0590,
  ep_Q2_024_partial_15_0591,
  ep_Q2_024_partial_15_0592,
  ep_Q2_024_partial_15_0593,
  ep_Q2_024_partial_15_0594,
  ep_Q2_024_partial_15_0595,
  ep_Q2_024_partial_15_0596,
  ep_Q2_024_partial_15_0597,
  ep_Q2_024_partial_15_0598,
  ep_Q2_024_partial_15_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0500_0599 : Poly :=
[
  term ((16551881807840695243945107203620484577447518201439407849 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-9853920515259372 : Rat) / 1162780221153193) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((138025294597998158352295779033728413996477741740968784001 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((102735088155671195 : Rat) / 6976681326919158) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16551881807840695243945107203620484577447518201439407849 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((4926960257629686 : Rat) / 1162780221153193) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138025294597998158352295779033728413996477741740968784001 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (2, 1), (15, 1)],
  term ((-102735088155671195 : Rat) / 13953362653838316) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((82552269285510432535849056485952497072 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (6, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9808144233333802513510553771038467760312 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-70247848985732086734752137923063562785282156438099684283 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((59829861448982050 : Rat) / 3488340663459579) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((4904072116666901256755276885519233880156 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (13, 1)],
  term ((70247848985732086734752137923063562785282156438099684283 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (15, 1)],
  term ((-29914930724491025 : Rat) / 3488340663459579) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (6, 1), (8, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (6, 1), (14, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((-219582787175658513664298839475495395024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-309466978915851774772299512840231952416 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((9662443955595858657616209771487623431314935233543981776 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((4039885317228608 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-18867225535786153986130020084262461440 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((29812375985384038293034053782366332424619792856157370556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-612946770449232 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((109791393587829256832149419737747697512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((154733489457925887386149756420115976208 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((-4831221977797929328808104885743811715657467616771990888 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((-2019942658614304 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1)],
  term ((9433612767893076993065010042131230720 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-14906187992692019146517026891183166212309896428078685278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((306473385224616 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12305116862399971548042985016316149380366 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((1100697137389097009300529751523727035584 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-13565160025741937389500717180029245290620296069046786507 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((9718464922042084 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((820462918424109302306966871112105473728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-9285325420604210 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 2)],
  term ((-10866185187684935569027847124947317935242 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((8133929093983298 : Rat) / 3488340663459579) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (6, 1), (8, 2)],
  term ((1095847220911789120966850983919101582656 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-17143141468924823622984522717254838921154128865115802274 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((10466039146814552 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((883575450610579248638272015043805894784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (9, 2), (14, 1)],
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((2886768176030016 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-89155624704474210792214183886281336272739806907090888169 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((1027810376698860 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((86344729982277853207195076548175130704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (6, 1), (13, 2), (14, 1)],
  term ((-636315255654262883116815433053133839812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((84677471183513453217725562104914471139368693899305927278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1470094340530664 : Rat) / 1162780221153193) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2221190290767160817290944193223214570484 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((6152558431199985774021492508158074690183 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)],
  term ((-550348568694548504650264875761863517792 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term ((13565160025741937389500717180029245290620296069046786507 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-4859232461021042 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-410231459212054651153483435556052736864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (3, 1), (8, 1), (13, 2)],
  term ((5433092593842467784513923562473658967621 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-547923610455894560483425491959550791328 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((8571570734462411811492261358627419460577064432557901137 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5233019573407276 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((89155624704474210792214183886281336272739806907090888169 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-513905188349430 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43172364991138926603597538274087565352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((318157627827131441558407716526566919906 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)],
  term ((-42338735591756726608862781052457235569684346949652963639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((735047170265332 : Rat) / 1162780221153193) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((1110595145383580408645472096611607285242 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 2)],
  term ((27238219755863186203508436960646157216 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((4414197889054120 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-867890512327696426007583818740960650276 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((-287612470330683155372994372664118975024 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((1908092886231498907167852203306976163232 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((759886289914525899007685491084977254144 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21345026074172901101018040882151725630681379579515467272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((7729311995353440 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33098884533218875810551597855253412499406298329110101948 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((10845982952408016 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1481263709693531541567803833285301422916 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-145153109869463189975919474455917890592 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((132789732493524402272879711775683099030665493595063237718 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-13945670321865496 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((59720444002255087637570666356876996830018606643628022316 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-9256212294760832 : Rat) / 1162780221153193) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-13619109877931593101754218480323078608 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (8, 1), (9, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((433945256163848213003791909370480325138 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1)],
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (9, 1), (12, 1)],
  term ((143806235165341577686497186332059487512 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (11, 1)],
  term ((-954046443115749453583926101653488081616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16549442266609437905275798927626706249703149164555050974 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-5422991476204008 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((740631854846765770783901916642650711458 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)],
  term ((72576554934731594987959737227958945296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-66394866246762201136439855887841549515332746797531618859 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((6972835160932748 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29860222001127543818785333178438498415009303321814011158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-264300985337348201566420963209114072280 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (8, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3066392024279743640502916991466610950064 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-120028819079139927871489164710751599418819419451255313634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((26514202651178280 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1273793431828874394730618290516784853552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((264300985337348201566420963209114072280 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (8, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1533196012139871820251458495733305475032 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((60014409539569963935744582355375799709409709725627656817 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-13257101325589140 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-636896715914437197365309145258392426776 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (14, 1)],
  term ((-132150492668674100783210481604557036140 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 500 through 599. -/
theorem ep_Q2_024_block_15_0500_0599_valid :
    checkProductSumEq ep_Q2_024_partials_15_0500_0599
      ep_Q2_024_block_15_0500_0599 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
