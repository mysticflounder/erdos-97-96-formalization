/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 22:500-560

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_22_0500_0560 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0500 : Poly :=
[
  term ((236061362231245469101216048483190328244 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)]
]

/-- Partial product 500 for generator 22. -/
def ep_Q2_024_partial_22_0500 : Poly :=
[
  term ((472122724462490938202432096966380656488 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-236061362231245469101216048483190328244 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2), (14, 1)],
  term ((472122724462490938202432096966380656488 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (14, 1)],
  term ((-236061362231245469101216048483190328244 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 22. -/
theorem ep_Q2_024_partial_22_0500_valid :
    mulPoly ep_Q2_024_coefficient_22_0500
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0501 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 501 for generator 22. -/
def ep_Q2_024_partial_22_0501 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (10, 1), (11, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 3), (11, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 5), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 22. -/
theorem ep_Q2_024_partial_22_0501_valid :
    mulPoly ep_Q2_024_coefficient_22_0501
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0502 : Poly :=
[
  term ((-1750220012102690579959627798527691902106 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 502 for generator 22. -/
def ep_Q2_024_partial_22_0502 : Poly :=
[
  term ((-3500440024205381159919255597055383804212 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1750220012102690579959627798527691902106 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3500440024205381159919255597055383804212 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((1750220012102690579959627798527691902106 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 22. -/
theorem ep_Q2_024_partial_22_0502_valid :
    mulPoly ep_Q2_024_coefficient_22_0502
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0503 : Poly :=
[
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 503 for generator 22. -/
def ep_Q2_024_partial_22_0503 : Poly :=
[
  term ((150089606959221244157688554506938110928 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((150089606959221244157688554506938110928 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 22. -/
theorem ep_Q2_024_partial_22_0503_valid :
    mulPoly ep_Q2_024_coefficient_22_0503
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0504 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 504 for generator 22. -/
def ep_Q2_024_partial_22_0504 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 22. -/
theorem ep_Q2_024_partial_22_0504_valid :
    mulPoly ep_Q2_024_coefficient_22_0504
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0505 : Poly :=
[
  term ((2163325299394758 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 22. -/
def ep_Q2_024_partial_22_0505 : Poly :=
[
  term ((4326650598789516 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4326650598789516 : Rat) / 1162780221153193) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 22. -/
theorem ep_Q2_024_partial_22_0505_valid :
    mulPoly ep_Q2_024_coefficient_22_0505
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0506 : Poly :=
[
  term ((-92667918956702265745131518388946240614916093889770136303 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 506 for generator 22. -/
def ep_Q2_024_partial_22_0506 : Poly :=
[
  term ((-92667918956702265745131518388946240614916093889770136303 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((92667918956702265745131518388946240614916093889770136303 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-92667918956702265745131518388946240614916093889770136303 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((92667918956702265745131518388946240614916093889770136303 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 22. -/
theorem ep_Q2_024_partial_22_0506_valid :
    mulPoly ep_Q2_024_coefficient_22_0506
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0507 : Poly :=
[
  term ((-2322182256822711 : Rat) / 4651120884612772) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 22. -/
def ep_Q2_024_partial_22_0507 : Poly :=
[
  term ((-2322182256822711 : Rat) / 2325560442306386) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2322182256822711 : Rat) / 4651120884612772) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2322182256822711 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((2322182256822711 : Rat) / 4651120884612772) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 22. -/
theorem ep_Q2_024_partial_22_0507_valid :
    mulPoly ep_Q2_024_coefficient_22_0507
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0508 : Poly :=
[
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 508 for generator 22. -/
def ep_Q2_024_partial_22_0508 : Poly :=
[
  term ((27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 2), (13, 1)],
  term ((27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 22. -/
theorem ep_Q2_024_partial_22_0508_valid :
    mulPoly ep_Q2_024_coefficient_22_0508
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0509 : Poly :=
[
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 509 for generator 22. -/
def ep_Q2_024_partial_22_0509 : Poly :=
[
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 22. -/
theorem ep_Q2_024_partial_22_0509_valid :
    mulPoly ep_Q2_024_coefficient_22_0509
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0510 : Poly :=
[
  term ((64632555285718 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 22. -/
def ep_Q2_024_partial_22_0510 : Poly :=
[
  term ((129265110571436 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((129265110571436 : Rat) / 1162780221153193) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 22. -/
theorem ep_Q2_024_partial_22_0510_valid :
    mulPoly ep_Q2_024_coefficient_22_0510
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0511 : Poly :=
[
  term ((1826203471194279968715232938578247814864 : Rat) / 359912837220743188970008058408861780397) [(11, 1), (13, 1)]
]

/-- Partial product 511 for generator 22. -/
def ep_Q2_024_partial_22_0511 : Poly :=
[
  term ((3652406942388559937430465877156495629728 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1826203471194279968715232938578247814864 : Rat) / 359912837220743188970008058408861780397) [(8, 2), (11, 1), (13, 1)],
  term ((3652406942388559937430465877156495629728 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 2), (13, 1)],
  term ((-1826203471194279968715232938578247814864 : Rat) / 359912837220743188970008058408861780397) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 22. -/
theorem ep_Q2_024_partial_22_0511_valid :
    mulPoly ep_Q2_024_coefficient_22_0511
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0512 : Poly :=
[
  term ((177381245863517116063699934265782607340 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 512 for generator 22. -/
def ep_Q2_024_partial_22_0512 : Poly :=
[
  term ((354762491727034232127399868531565214680 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-177381245863517116063699934265782607340 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((354762491727034232127399868531565214680 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-177381245863517116063699934265782607340 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 22. -/
theorem ep_Q2_024_partial_22_0512_valid :
    mulPoly ep_Q2_024_coefficient_22_0512
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0513 : Poly :=
[
  term ((-59145891243844021339636824685971397767429298457101381023 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 513 for generator 22. -/
def ep_Q2_024_partial_22_0513 : Poly :=
[
  term ((-59145891243844021339636824685971397767429298457101381023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((59145891243844021339636824685971397767429298457101381023 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-59145891243844021339636824685971397767429298457101381023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((59145891243844021339636824685971397767429298457101381023 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 22. -/
theorem ep_Q2_024_partial_22_0513_valid :
    mulPoly ep_Q2_024_coefficient_22_0513
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0514 : Poly :=
[
  term ((13112035237994047 : Rat) / 2325560442306386) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 514 for generator 22. -/
def ep_Q2_024_partial_22_0514 : Poly :=
[
  term ((13112035237994047 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13112035237994047 : Rat) / 2325560442306386) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((13112035237994047 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13112035237994047 : Rat) / 2325560442306386) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 22. -/
theorem ep_Q2_024_partial_22_0514_valid :
    mulPoly ep_Q2_024_coefficient_22_0514
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0515 : Poly :=
[
  term ((5519007305863414318899926466366498869196709093440553306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 515 for generator 22. -/
def ep_Q2_024_partial_22_0515 : Poly :=
[
  term ((11038014611726828637799852932732997738393418186881106612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5519007305863414318899926466366498869196709093440553306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((11038014611726828637799852932732997738393418186881106612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5519007305863414318899926466366498869196709093440553306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 22. -/
theorem ep_Q2_024_partial_22_0515_valid :
    mulPoly ep_Q2_024_coefficient_22_0515
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0516 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 22. -/
def ep_Q2_024_partial_22_0516 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 22. -/
theorem ep_Q2_024_partial_22_0516_valid :
    mulPoly ep_Q2_024_coefficient_22_0516
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0517 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3)]
]

/-- Partial product 517 for generator 22. -/
def ep_Q2_024_partial_22_0517 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 3)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 22. -/
theorem ep_Q2_024_partial_22_0517_valid :
    mulPoly ep_Q2_024_coefficient_22_0517
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0518 : Poly :=
[
  term ((86543207681254955570323631880852403956354999971495200013 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 518 for generator 22. -/
def ep_Q2_024_partial_22_0518 : Poly :=
[
  term ((86543207681254955570323631880852403956354999971495200013 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-86543207681254955570323631880852403956354999971495200013 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((86543207681254955570323631880852403956354999971495200013 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-86543207681254955570323631880852403956354999971495200013 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 22. -/
theorem ep_Q2_024_partial_22_0518_valid :
    mulPoly ep_Q2_024_coefficient_22_0518
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0519 : Poly :=
[
  term ((3981974192893401 : Rat) / 2325560442306386) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 22. -/
def ep_Q2_024_partial_22_0519 : Poly :=
[
  term ((3981974192893401 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3981974192893401 : Rat) / 2325560442306386) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3981974192893401 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3981974192893401 : Rat) / 2325560442306386) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 22. -/
theorem ep_Q2_024_partial_22_0519_valid :
    mulPoly ep_Q2_024_coefficient_22_0519
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0520 : Poly :=
[
  term ((28642642987341836526615481746488103824164283314478612656 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(11, 1), (15, 1)]
]

/-- Partial product 520 for generator 22. -/
def ep_Q2_024_partial_22_0520 : Poly :=
[
  term ((57285285974683673053230963492976207648328566628957225312 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-28642642987341836526615481746488103824164283314478612656 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(8, 2), (11, 1), (15, 1)],
  term ((57285285974683673053230963492976207648328566628957225312 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 1), (11, 2), (15, 1)],
  term ((-28642642987341836526615481746488103824164283314478612656 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 22. -/
theorem ep_Q2_024_partial_22_0520_valid :
    mulPoly ep_Q2_024_coefficient_22_0520
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0521 : Poly :=
[
  term ((5279018806522570 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 22. -/
def ep_Q2_024_partial_22_0521 : Poly :=
[
  term ((10558037613045140 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5279018806522570 : Rat) / 1162780221153193) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((10558037613045140 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5279018806522570 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 22. -/
theorem ep_Q2_024_partial_22_0521_valid :
    mulPoly ep_Q2_024_coefficient_22_0521
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0522 : Poly :=
[
  term ((-2950628491186340656573489279275386023087 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

/-- Partial product 522 for generator 22. -/
def ep_Q2_024_partial_22_0522 : Poly :=
[
  term ((-2950628491186340656573489279275386023087 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((2950628491186340656573489279275386023087 : Rat) / 3599128372207431889700080584088617803970) [(8, 2), (12, 1)],
  term ((-2950628491186340656573489279275386023087 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (12, 1)],
  term ((2950628491186340656573489279275386023087 : Rat) / 3599128372207431889700080584088617803970) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 22. -/
theorem ep_Q2_024_partial_22_0522_valid :
    mulPoly ep_Q2_024_coefficient_22_0522
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0523 : Poly :=
[
  term ((-6997937946375477648295978288901838316399917656765270821 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 523 for generator 22. -/
def ep_Q2_024_partial_22_0523 : Poly :=
[
  term ((-6997937946375477648295978288901838316399917656765270821 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6997937946375477648295978288901838316399917656765270821 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6997937946375477648295978288901838316399917656765270821 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6997937946375477648295978288901838316399917656765270821 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 22. -/
theorem ep_Q2_024_partial_22_0523_valid :
    mulPoly ep_Q2_024_coefficient_22_0523
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0524 : Poly :=
[
  term ((10630252138164049 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 22. -/
def ep_Q2_024_partial_22_0524 : Poly :=
[
  term ((10630252138164049 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10630252138164049 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10630252138164049 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10630252138164049 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 22. -/
theorem ep_Q2_024_partial_22_0524_valid :
    mulPoly ep_Q2_024_coefficient_22_0524
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0525 : Poly :=
[
  term ((-375150165717257700173463709557355822697078659287194403893 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 525 for generator 22. -/
def ep_Q2_024_partial_22_0525 : Poly :=
[
  term ((-375150165717257700173463709557355822697078659287194403893 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((375150165717257700173463709557355822697078659287194403893 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-375150165717257700173463709557355822697078659287194403893 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((375150165717257700173463709557355822697078659287194403893 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 22. -/
theorem ep_Q2_024_partial_22_0525_valid :
    mulPoly ep_Q2_024_coefficient_22_0525
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0526 : Poly :=
[
  term ((1969462760627685 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 22. -/
def ep_Q2_024_partial_22_0526 : Poly :=
[
  term ((1969462760627685 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1969462760627685 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1969462760627685 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1969462760627685 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 22. -/
theorem ep_Q2_024_partial_22_0526_valid :
    mulPoly ep_Q2_024_coefficient_22_0526
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0527 : Poly :=
[
  term ((98124049453458878359426452206896362122 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 527 for generator 22. -/
def ep_Q2_024_partial_22_0527 : Poly :=
[
  term ((196248098906917756718852904413792724244 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-98124049453458878359426452206896362122 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((196248098906917756718852904413792724244 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-98124049453458878359426452206896362122 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 22. -/
theorem ep_Q2_024_partial_22_0527_valid :
    mulPoly ep_Q2_024_coefficient_22_0527
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0528 : Poly :=
[
  term ((195379041340540417038491082493874615846 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 528 for generator 22. -/
def ep_Q2_024_partial_22_0528 : Poly :=
[
  term ((390758082681080834076982164987749231692 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-195379041340540417038491082493874615846 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((390758082681080834076982164987749231692 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-195379041340540417038491082493874615846 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 22. -/
theorem ep_Q2_024_partial_22_0528_valid :
    mulPoly ep_Q2_024_coefficient_22_0528
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0529 : Poly :=
[
  term ((-31270938508244608947123703730009331839 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (14, 1)]
]

/-- Partial product 529 for generator 22. -/
def ep_Q2_024_partial_22_0529 : Poly :=
[
  term ((-62541877016489217894247407460018663678 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((31270938508244608947123703730009331839 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (14, 1)],
  term ((-62541877016489217894247407460018663678 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((31270938508244608947123703730009331839 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 22. -/
theorem ep_Q2_024_partial_22_0529_valid :
    mulPoly ep_Q2_024_coefficient_22_0529
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0530 : Poly :=
[
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 530 for generator 22. -/
def ep_Q2_024_partial_22_0530 : Poly :=
[
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 22. -/
theorem ep_Q2_024_partial_22_0530_valid :
    mulPoly ep_Q2_024_coefficient_22_0530
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0531 : Poly :=
[
  term ((-12175775460650663 : Rat) / 2325560442306386) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 22. -/
def ep_Q2_024_partial_22_0531 : Poly :=
[
  term ((-12175775460650663 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12175775460650663 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 22. -/
theorem ep_Q2_024_partial_22_0531_valid :
    mulPoly ep_Q2_024_coefficient_22_0531
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0532 : Poly :=
[
  term ((549891737228854863368808958327421169483293898676904513767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (15, 2)]
]

/-- Partial product 532 for generator 22. -/
def ep_Q2_024_partial_22_0532 : Poly :=
[
  term ((549891737228854863368808958327421169483293898676904513767 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-549891737228854863368808958327421169483293898676904513767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (12, 1), (15, 2)],
  term ((549891737228854863368808958327421169483293898676904513767 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-549891737228854863368808958327421169483293898676904513767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 22. -/
theorem ep_Q2_024_partial_22_0532_valid :
    mulPoly ep_Q2_024_coefficient_22_0532
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0533 : Poly :=
[
  term ((-46419559152289319 : Rat) / 13953362653838316) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 533 for generator 22. -/
def ep_Q2_024_partial_22_0533 : Poly :=
[
  term ((-46419559152289319 : Rat) / 6976681326919158) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((46419559152289319 : Rat) / 13953362653838316) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-46419559152289319 : Rat) / 6976681326919158) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((46419559152289319 : Rat) / 13953362653838316) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 22. -/
theorem ep_Q2_024_partial_22_0533_valid :
    mulPoly ep_Q2_024_coefficient_22_0533
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0534 : Poly :=
[
  term ((442098118291363955042810747162911368405761605153167520 : Rat) / 139499842819802972775716014625439884620101963487119207) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 534 for generator 22. -/
def ep_Q2_024_partial_22_0534 : Poly :=
[
  term ((884196236582727910085621494325822736811523210306335040 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-442098118291363955042810747162911368405761605153167520 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (12, 2), (13, 1), (15, 1)],
  term ((884196236582727910085621494325822736811523210306335040 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-442098118291363955042810747162911368405761605153167520 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 22. -/
theorem ep_Q2_024_partial_22_0534_valid :
    mulPoly ep_Q2_024_coefficient_22_0534
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0535 : Poly :=
[
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 22. -/
def ep_Q2_024_partial_22_0535 : Poly :=
[
  term ((2538406922518624 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2538406922518624 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 22. -/
theorem ep_Q2_024_partial_22_0535_valid :
    mulPoly ep_Q2_024_coefficient_22_0535
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0536 : Poly :=
[
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

/-- Partial product 536 for generator 22. -/
def ep_Q2_024_partial_22_0536 : Poly :=
[
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 2), (13, 2)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 2), (13, 2)],
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 22. -/
theorem ep_Q2_024_partial_22_0536_valid :
    mulPoly ep_Q2_024_coefficient_22_0536
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0537 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(12, 2), (15, 2)]
]

/-- Partial product 537 for generator 22. -/
def ep_Q2_024_partial_22_0537 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 2), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 22. -/
theorem ep_Q2_024_partial_22_0537_valid :
    mulPoly ep_Q2_024_coefficient_22_0537
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0538 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 538 for generator 22. -/
def ep_Q2_024_partial_22_0538 : Poly :=
[
  term ((2172308402631610 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 22. -/
theorem ep_Q2_024_partial_22_0538_valid :
    mulPoly ep_Q2_024_coefficient_22_0538
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0539 : Poly :=
[
  term ((3253160032603818284005323829787192802970547866131257031949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 539 for generator 22. -/
def ep_Q2_024_partial_22_0539 : Poly :=
[
  term ((3253160032603818284005323829787192802970547866131257031949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3253160032603818284005323829787192802970547866131257031949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((3253160032603818284005323829787192802970547866131257031949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3253160032603818284005323829787192802970547866131257031949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 22. -/
theorem ep_Q2_024_partial_22_0539_valid :
    mulPoly ep_Q2_024_coefficient_22_0539
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0540 : Poly :=
[
  term ((-111390889380899671 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 22. -/
def ep_Q2_024_partial_22_0540 : Poly :=
[
  term ((-111390889380899671 : Rat) / 6976681326919158) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((111390889380899671 : Rat) / 13953362653838316) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-111390889380899671 : Rat) / 6976681326919158) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((111390889380899671 : Rat) / 13953362653838316) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 22. -/
theorem ep_Q2_024_partial_22_0540_valid :
    mulPoly ep_Q2_024_coefficient_22_0540
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0541 : Poly :=
[
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 541 for generator 22. -/
def ep_Q2_024_partial_22_0541 : Poly :=
[
  term ((8435640736356738360430615648539328346914867814111099342 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((8435640736356738360430615648539328346914867814111099342 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 22. -/
theorem ep_Q2_024_partial_22_0541_valid :
    mulPoly ep_Q2_024_coefficient_22_0541
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0542 : Poly :=
[
  term ((2084919352602380 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 22. -/
def ep_Q2_024_partial_22_0542 : Poly :=
[
  term ((4169838705204760 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4169838705204760 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 22. -/
theorem ep_Q2_024_partial_22_0542_valid :
    mulPoly ep_Q2_024_coefficient_22_0542
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0543 : Poly :=
[
  term ((-1495751187422282330491992605935756036639415596546902220327 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(13, 1), (15, 1)]
]

/-- Partial product 543 for generator 22. -/
def ep_Q2_024_partial_22_0543 : Poly :=
[
  term ((-1495751187422282330491992605935756036639415596546902220327 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1495751187422282330491992605935756036639415596546902220327 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(8, 2), (13, 1), (15, 1)],
  term ((-1495751187422282330491992605935756036639415596546902220327 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1495751187422282330491992605935756036639415596546902220327 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 22. -/
theorem ep_Q2_024_partial_22_0543_valid :
    mulPoly ep_Q2_024_coefficient_22_0543
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0544 : Poly :=
[
  term ((-74536632969598889 : Rat) / 27906725307676632) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 22. -/
def ep_Q2_024_partial_22_0544 : Poly :=
[
  term ((-74536632969598889 : Rat) / 13953362653838316) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((74536632969598889 : Rat) / 27906725307676632) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74536632969598889 : Rat) / 13953362653838316) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((74536632969598889 : Rat) / 27906725307676632) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 22. -/
theorem ep_Q2_024_partial_22_0544_valid :
    mulPoly ep_Q2_024_coefficient_22_0544
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0545 : Poly :=
[
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (15, 3)]
]

/-- Partial product 545 for generator 22. -/
def ep_Q2_024_partial_22_0545 : Poly :=
[
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (13, 1), (15, 3)],
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 22. -/
theorem ep_Q2_024_partial_22_0545_valid :
    mulPoly ep_Q2_024_coefficient_22_0545
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0546 : Poly :=
[
  term ((3223595267130360 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 546 for generator 22. -/
def ep_Q2_024_partial_22_0546 : Poly :=
[
  term ((6447190534260720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((6447190534260720 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 22. -/
theorem ep_Q2_024_partial_22_0546_valid :
    mulPoly ep_Q2_024_coefficient_22_0546
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0547 : Poly :=
[
  term ((-5340140917553409598932185416485625780316 : Rat) / 1799564186103715944850040292044308901985) [(13, 2)]
]

/-- Partial product 547 for generator 22. -/
def ep_Q2_024_partial_22_0547 : Poly :=
[
  term ((-10680281835106819197864370832971251560632 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2)],
  term ((5340140917553409598932185416485625780316 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (13, 2)],
  term ((-10680281835106819197864370832971251560632 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (13, 2)],
  term ((5340140917553409598932185416485625780316 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 22. -/
theorem ep_Q2_024_partial_22_0547_valid :
    mulPoly ep_Q2_024_coefficient_22_0547
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0548 : Poly :=
[
  term ((2173465449412589431104101899803330215786 : Rat) / 359912837220743188970008058408861780397) [(13, 2), (14, 1)]
]

/-- Partial product 548 for generator 22. -/
def ep_Q2_024_partial_22_0548 : Poly :=
[
  term ((4346930898825178862208203799606660431572 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2173465449412589431104101899803330215786 : Rat) / 359912837220743188970008058408861780397) [(8, 2), (13, 2), (14, 1)],
  term ((4346930898825178862208203799606660431572 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2173465449412589431104101899803330215786 : Rat) / 359912837220743188970008058408861780397) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 22. -/
theorem ep_Q2_024_partial_22_0548_valid :
    mulPoly ep_Q2_024_coefficient_22_0548
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0549 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 119970945740247729656669352802953926799) [(13, 2), (14, 2)]
]

/-- Partial product 549 for generator 22. -/
def ep_Q2_024_partial_22_0549 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 22. -/
theorem ep_Q2_024_partial_22_0549_valid :
    mulPoly ep_Q2_024_coefficient_22_0549
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0550 : Poly :=
[
  term ((-884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(13, 2), (15, 2)]
]

/-- Partial product 550 for generator 22. -/
def ep_Q2_024_partial_22_0550 : Poly :=
[
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (13, 2), (15, 2)],
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 22. -/
theorem ep_Q2_024_partial_22_0550_valid :
    mulPoly ep_Q2_024_coefficient_22_0550
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0551 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 22. -/
def ep_Q2_024_partial_22_0551 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 22. -/
theorem ep_Q2_024_partial_22_0551_valid :
    mulPoly ep_Q2_024_coefficient_22_0551
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0552 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)]
]

/-- Partial product 552 for generator 22. -/
def ep_Q2_024_partial_22_0552 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (13, 3), (15, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 22. -/
theorem ep_Q2_024_partial_22_0552_valid :
    mulPoly ep_Q2_024_coefficient_22_0552
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0553 : Poly :=
[
  term ((6333577109483578672450754547761183910947 : Rat) / 1799564186103715944850040292044308901985) [(14, 1)]
]

/-- Partial product 553 for generator 22. -/
def ep_Q2_024_partial_22_0553 : Poly :=
[
  term ((12667154218967157344901509095522367821894 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (14, 1)],
  term ((-6333577109483578672450754547761183910947 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (14, 1)],
  term ((12667154218967157344901509095522367821894 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (14, 1)],
  term ((-6333577109483578672450754547761183910947 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 22. -/
theorem ep_Q2_024_partial_22_0553_valid :
    mulPoly ep_Q2_024_coefficient_22_0553
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0554 : Poly :=
[
  term ((862994342573874305208576606975667845130683823124150173859 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(14, 1), (15, 2)]
]

/-- Partial product 554 for generator 22. -/
def ep_Q2_024_partial_22_0554 : Poly :=
[
  term ((862994342573874305208576606975667845130683823124150173859 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-862994342573874305208576606975667845130683823124150173859 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (14, 1), (15, 2)],
  term ((862994342573874305208576606975667845130683823124150173859 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-862994342573874305208576606975667845130683823124150173859 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 22. -/
theorem ep_Q2_024_partial_22_0554_valid :
    mulPoly ep_Q2_024_coefficient_22_0554
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0555 : Poly :=
[
  term ((-192497510997879931 : Rat) / 13953362653838316) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 555 for generator 22. -/
def ep_Q2_024_partial_22_0555 : Poly :=
[
  term ((-192497510997879931 : Rat) / 6976681326919158) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((192497510997879931 : Rat) / 13953362653838316) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-192497510997879931 : Rat) / 6976681326919158) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((192497510997879931 : Rat) / 13953362653838316) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 22. -/
theorem ep_Q2_024_partial_22_0555_valid :
    mulPoly ep_Q2_024_coefficient_22_0555
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0556 : Poly :=
[
  term ((-448243754357445701744023781034662943709 : Rat) / 1199709457402477296566693528029539267990) [(14, 2)]
]

/-- Partial product 556 for generator 22. -/
def ep_Q2_024_partial_22_0556 : Poly :=
[
  term ((-448243754357445701744023781034662943709 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (14, 2)],
  term ((448243754357445701744023781034662943709 : Rat) / 1199709457402477296566693528029539267990) [(8, 2), (14, 2)],
  term ((-448243754357445701744023781034662943709 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (14, 2)],
  term ((448243754357445701744023781034662943709 : Rat) / 1199709457402477296566693528029539267990) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 22. -/
theorem ep_Q2_024_partial_22_0556_valid :
    mulPoly ep_Q2_024_coefficient_22_0556
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0557 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(14, 2), (15, 2)]
]

/-- Partial product 557 for generator 22. -/
def ep_Q2_024_partial_22_0557 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 22. -/
theorem ep_Q2_024_partial_22_0557_valid :
    mulPoly ep_Q2_024_coefficient_22_0557
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0558 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 22. -/
def ep_Q2_024_partial_22_0558 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(8, 2), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 22. -/
theorem ep_Q2_024_partial_22_0558_valid :
    mulPoly ep_Q2_024_coefficient_22_0558
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0559 : Poly :=
[
  term ((-616751483520784460559751139092334785995242594584463076647 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(15, 2)]
]

/-- Partial product 559 for generator 22. -/
def ep_Q2_024_partial_22_0559 : Poly :=
[
  term ((-616751483520784460559751139092334785995242594584463076647 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (10, 1), (15, 2)],
  term ((616751483520784460559751139092334785995242594584463076647 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (15, 2)],
  term ((-616751483520784460559751139092334785995242594584463076647 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 1), (11, 1), (15, 2)],
  term ((616751483520784460559751139092334785995242594584463076647 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 22. -/
theorem ep_Q2_024_partial_22_0559_valid :
    mulPoly ep_Q2_024_coefficient_22_0559
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0560 : Poly :=
[
  term ((33261225816631559 : Rat) / 4651120884612772) [(15, 2), (16, 1)]
]

/-- Partial product 560 for generator 22. -/
def ep_Q2_024_partial_22_0560 : Poly :=
[
  term ((33261225816631559 : Rat) / 2325560442306386) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-33261225816631559 : Rat) / 4651120884612772) [(8, 2), (15, 2), (16, 1)],
  term ((33261225816631559 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-33261225816631559 : Rat) / 4651120884612772) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 22. -/
theorem ep_Q2_024_partial_22_0560_valid :
    mulPoly ep_Q2_024_coefficient_22_0560
        ep_Q2_024_generator_22_0500_0560 =
      ep_Q2_024_partial_22_0560 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_22_0500_0560 : List Poly :=
[
  ep_Q2_024_partial_22_0500,
  ep_Q2_024_partial_22_0501,
  ep_Q2_024_partial_22_0502,
  ep_Q2_024_partial_22_0503,
  ep_Q2_024_partial_22_0504,
  ep_Q2_024_partial_22_0505,
  ep_Q2_024_partial_22_0506,
  ep_Q2_024_partial_22_0507,
  ep_Q2_024_partial_22_0508,
  ep_Q2_024_partial_22_0509,
  ep_Q2_024_partial_22_0510,
  ep_Q2_024_partial_22_0511,
  ep_Q2_024_partial_22_0512,
  ep_Q2_024_partial_22_0513,
  ep_Q2_024_partial_22_0514,
  ep_Q2_024_partial_22_0515,
  ep_Q2_024_partial_22_0516,
  ep_Q2_024_partial_22_0517,
  ep_Q2_024_partial_22_0518,
  ep_Q2_024_partial_22_0519,
  ep_Q2_024_partial_22_0520,
  ep_Q2_024_partial_22_0521,
  ep_Q2_024_partial_22_0522,
  ep_Q2_024_partial_22_0523,
  ep_Q2_024_partial_22_0524,
  ep_Q2_024_partial_22_0525,
  ep_Q2_024_partial_22_0526,
  ep_Q2_024_partial_22_0527,
  ep_Q2_024_partial_22_0528,
  ep_Q2_024_partial_22_0529,
  ep_Q2_024_partial_22_0530,
  ep_Q2_024_partial_22_0531,
  ep_Q2_024_partial_22_0532,
  ep_Q2_024_partial_22_0533,
  ep_Q2_024_partial_22_0534,
  ep_Q2_024_partial_22_0535,
  ep_Q2_024_partial_22_0536,
  ep_Q2_024_partial_22_0537,
  ep_Q2_024_partial_22_0538,
  ep_Q2_024_partial_22_0539,
  ep_Q2_024_partial_22_0540,
  ep_Q2_024_partial_22_0541,
  ep_Q2_024_partial_22_0542,
  ep_Q2_024_partial_22_0543,
  ep_Q2_024_partial_22_0544,
  ep_Q2_024_partial_22_0545,
  ep_Q2_024_partial_22_0546,
  ep_Q2_024_partial_22_0547,
  ep_Q2_024_partial_22_0548,
  ep_Q2_024_partial_22_0549,
  ep_Q2_024_partial_22_0550,
  ep_Q2_024_partial_22_0551,
  ep_Q2_024_partial_22_0552,
  ep_Q2_024_partial_22_0553,
  ep_Q2_024_partial_22_0554,
  ep_Q2_024_partial_22_0555,
  ep_Q2_024_partial_22_0556,
  ep_Q2_024_partial_22_0557,
  ep_Q2_024_partial_22_0558,
  ep_Q2_024_partial_22_0559,
  ep_Q2_024_partial_22_0560
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_22_0500_0560 : Poly :=
[
  term ((472122724462490938202432096966380656488 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (10, 1), (11, 1)],
  term ((-3500440024205381159919255597055383804212 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((150089606959221244157688554506938110928 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4326650598789516 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92667918956702265745131518388946240614916093889770136303 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2322182256822711 : Rat) / 2325560442306386) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((129265110571436 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3652406942388559937430465877156495629728 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((354762491727034232127399868531565214680 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-59145891243844021339636824685971397767429298457101381023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((13112035237994047 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11038014611726828637799852932732997738393418186881106612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 3)],
  term ((86543207681254955570323631880852403956354999971495200013 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3981974192893401 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((57285285974683673053230963492976207648328566628957225312 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((10558037613045140 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2950628491186340656573489279275386023087 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((-6997937946375477648295978288901838316399917656765270821 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10630252138164049 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-375150165717257700173463709557355822697078659287194403893 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1969462760627685 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((196248098906917756718852904413792724244 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((390758082681080834076982164987749231692 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-62541877016489217894247407460018663678 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12175775460650663 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((549891737228854863368808958327421169483293898676904513767 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-46419559152289319 : Rat) / 6976681326919158) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((884196236582727910085621494325822736811523210306335040 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((2538406922518624 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 2), (13, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((3253160032603818284005323829787192802970547866131257031949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-111390889380899671 : Rat) / 6976681326919158) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8435640736356738360430615648539328346914867814111099342 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((4169838705204760 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1495751187422282330491992605935756036639415596546902220327 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-74536632969598889 : Rat) / 13953362653838316) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((6447190534260720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10680281835106819197864370832971251560632 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (13, 2)],
  term ((4346930898825178862208203799606660431572 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (13, 3), (15, 1)],
  term ((12667154218967157344901509095522367821894 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (14, 1)],
  term ((862994342573874305208576606975667845130683823124150173859 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-192497510997879931 : Rat) / 6976681326919158) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-448243754357445701744023781034662943709 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (14, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-616751483520784460559751139092334785995242594584463076647 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (10, 1), (15, 2)],
  term ((33261225816631559 : Rat) / 2325560442306386) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-236061362231245469101216048483190328244 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 3), (11, 1)],
  term ((1750220012102690579959627798527691902106 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((92667918956702265745131518388946240614916093889770136303 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((2322182256822711 : Rat) / 4651120884612772) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 2), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1826203471194279968715232938578247814864 : Rat) / 359912837220743188970008058408861780397) [(8, 2), (11, 1), (13, 1)],
  term ((-177381245863517116063699934265782607340 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((59145891243844021339636824685971397767429298457101381023 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-13112035237994047 : Rat) / 2325560442306386) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5519007305863414318899926466366498869196709093440553306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 3)],
  term ((-86543207681254955570323631880852403956354999971495200013 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3981974192893401 : Rat) / 2325560442306386) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28642642987341836526615481746488103824164283314478612656 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(8, 2), (11, 1), (15, 1)],
  term ((-5279018806522570 : Rat) / 1162780221153193) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((2950628491186340656573489279275386023087 : Rat) / 3599128372207431889700080584088617803970) [(8, 2), (12, 1)],
  term ((6997937946375477648295978288901838316399917656765270821 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10630252138164049 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((375150165717257700173463709557355822697078659287194403893 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1969462760627685 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98124049453458878359426452206896362122 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((-195379041340540417038491082493874615846 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((31270938508244608947123703730009331839 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (14, 1)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-549891737228854863368808958327421169483293898676904513767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (12, 1), (15, 2)],
  term ((46419559152289319 : Rat) / 13953362653838316) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-442098118291363955042810747162911368405761605153167520 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 2), (13, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3253160032603818284005323829787192802970547866131257031949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((111390889380899671 : Rat) / 13953362653838316) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1495751187422282330491992605935756036639415596546902220327 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(8, 2), (13, 1), (15, 1)],
  term ((74536632969598889 : Rat) / 27906725307676632) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((5340140917553409598932185416485625780316 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (13, 2)],
  term ((-2173465449412589431104101899803330215786 : Rat) / 359912837220743188970008058408861780397) [(8, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (13, 2), (14, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (13, 2), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (13, 3), (15, 1)],
  term ((-6333577109483578672450754547761183910947 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (14, 1)],
  term ((-862994342573874305208576606975667845130683823124150173859 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (14, 1), (15, 2)],
  term ((192497510997879931 : Rat) / 13953362653838316) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((448243754357445701744023781034662943709 : Rat) / 1199709457402477296566693528029539267990) [(8, 2), (14, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 2), (14, 2), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(8, 2), (14, 2), (15, 2), (16, 1)],
  term ((616751483520784460559751139092334785995242594584463076647 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (15, 2)],
  term ((-33261225816631559 : Rat) / 4651120884612772) [(8, 2), (15, 2), (16, 1)],
  term ((-2950628491186340656573489279275386023087 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (12, 1)],
  term ((-6997937946375477648295978288901838316399917656765270821 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10630252138164049 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-375150165717257700173463709557355822697078659287194403893 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1969462760627685 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((196248098906917756718852904413792724244 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((390758082681080834076982164987749231692 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-62541877016489217894247407460018663678 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12175775460650663 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((549891737228854863368808958327421169483293898676904513767 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-46419559152289319 : Rat) / 6976681326919158) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((884196236582727910085621494325822736811523210306335040 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((2538406922518624 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((3253160032603818284005323829787192802970547866131257031949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-111390889380899671 : Rat) / 6976681326919158) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8435640736356738360430615648539328346914867814111099342 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((4169838705204760 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1495751187422282330491992605935756036639415596546902220327 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-74536632969598889 : Rat) / 13953362653838316) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((6447190534260720 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10680281835106819197864370832971251560632 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (13, 2)],
  term ((4346930898825178862208203799606660431572 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((12667154218967157344901509095522367821894 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (14, 1)],
  term ((862994342573874305208576606975667845130683823124150173859 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-192497510997879931 : Rat) / 6976681326919158) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-448243754357445701744023781034662943709 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (14, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-616751483520784460559751139092334785995242594584463076647 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 1), (11, 1), (15, 2)],
  term ((33261225816631559 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3500440024205381159919255597055383804212 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((150089606959221244157688554506938110928 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4326650598789516 : Rat) / 1162780221153193) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92667918956702265745131518388946240614916093889770136303 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2322182256822711 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((129265110571436 : Rat) / 1162780221153193) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((3652406942388559937430465877156495629728 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 2), (13, 1)],
  term ((354762491727034232127399868531565214680 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-59145891243844021339636824685971397767429298457101381023 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((13112035237994047 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((11038014611726828637799852932732997738393418186881106612 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 3)],
  term ((86543207681254955570323631880852403956354999971495200013 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((3981974192893401 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((57285285974683673053230963492976207648328566628957225312 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 1), (11, 2), (15, 1)],
  term ((10558037613045140 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1750220012102690579959627798527691902106 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((92667918956702265745131518388946240614916093889770136303 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2322182256822711 : Rat) / 4651120884612772) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1826203471194279968715232938578247814864 : Rat) / 359912837220743188970008058408861780397) [(9, 2), (11, 1), (13, 1)],
  term ((-177381245863517116063699934265782607340 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((59145891243844021339636824685971397767429298457101381023 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-13112035237994047 : Rat) / 2325560442306386) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5519007305863414318899926466366498869196709093440553306 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 3)],
  term ((-86543207681254955570323631880852403956354999971495200013 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3981974192893401 : Rat) / 2325560442306386) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28642642987341836526615481746488103824164283314478612656 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(9, 2), (11, 1), (15, 1)],
  term ((-5279018806522570 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2950628491186340656573489279275386023087 : Rat) / 3599128372207431889700080584088617803970) [(9, 2), (12, 1)],
  term ((6997937946375477648295978288901838316399917656765270821 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10630252138164049 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((375150165717257700173463709557355822697078659287194403893 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1969462760627685 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98124049453458878359426452206896362122 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)],
  term ((-195379041340540417038491082493874615846 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (13, 2), (14, 1)],
  term ((31270938508244608947123703730009331839 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-549891737228854863368808958327421169483293898676904513767 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (12, 1), (15, 2)],
  term ((46419559152289319 : Rat) / 13953362653838316) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-442098118291363955042810747162911368405761605153167520 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2), (13, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3253160032603818284005323829787192802970547866131257031949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((111390889380899671 : Rat) / 13953362653838316) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1495751187422282330491992605935756036639415596546902220327 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(9, 2), (13, 1), (15, 1)],
  term ((74536632969598889 : Rat) / 27906725307676632) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((5340140917553409598932185416485625780316 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (13, 2)],
  term ((-2173465449412589431104101899803330215786 : Rat) / 359912837220743188970008058408861780397) [(9, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (13, 2), (14, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (13, 2), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 3), (15, 1)],
  term ((-6333577109483578672450754547761183910947 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (14, 1)],
  term ((-862994342573874305208576606975667845130683823124150173859 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (14, 1), (15, 2)],
  term ((192497510997879931 : Rat) / 13953362653838316) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((448243754357445701744023781034662943709 : Rat) / 1199709457402477296566693528029539267990) [(9, 2), (14, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (14, 2), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((616751483520784460559751139092334785995242594584463076647 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (15, 2)],
  term ((-33261225816631559 : Rat) / 4651120884612772) [(9, 2), (15, 2), (16, 1)],
  term ((472122724462490938202432096966380656488 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (14, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 2)],
  term ((-236061362231245469101216048483190328244 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 5), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 500 through 560. -/
theorem ep_Q2_024_block_22_0500_0560_valid :
    checkProductSumEq ep_Q2_024_partials_22_0500_0560
      ep_Q2_024_block_22_0500_0560 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
