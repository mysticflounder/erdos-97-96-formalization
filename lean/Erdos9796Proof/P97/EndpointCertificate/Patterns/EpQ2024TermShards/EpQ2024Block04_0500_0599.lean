/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 4:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_04_0500_0599 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0500 : Poly :=
[
  term ((-596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 4. -/
def ep_Q2_024_partial_04_0500 : Poly :=
[
  term ((-596913039183748 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 4. -/
theorem ep_Q2_024_partial_04_0500_valid :
    mulPoly ep_Q2_024_coefficient_04_0500
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0501 : Poly :=
[
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 501 for generator 4. -/
def ep_Q2_024_partial_04_0501 : Poly :=
[
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 4. -/
theorem ep_Q2_024_partial_04_0501_valid :
    mulPoly ep_Q2_024_coefficient_04_0501
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0502 : Poly :=
[
  term ((1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 502 for generator 4. -/
def ep_Q2_024_partial_04_0502 : Poly :=
[
  term ((1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 4. -/
theorem ep_Q2_024_partial_04_0502_valid :
    mulPoly ep_Q2_024_coefficient_04_0502
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0503 : Poly :=
[
  term ((19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 503 for generator 4. -/
def ep_Q2_024_partial_04_0503 : Poly :=
[
  term ((19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 4. -/
theorem ep_Q2_024_partial_04_0503_valid :
    mulPoly ep_Q2_024_coefficient_04_0503
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0504 : Poly :=
[
  term ((-4210968274145470 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 504 for generator 4. -/
def ep_Q2_024_partial_04_0504 : Poly :=
[
  term ((-4210968274145470 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4210968274145470 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4210968274145470 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((4210968274145470 : Rat) / 1162780221153193) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 4. -/
theorem ep_Q2_024_partial_04_0504_valid :
    mulPoly ep_Q2_024_coefficient_04_0504
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0505 : Poly :=
[
  term ((-10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 505 for generator 4. -/
def ep_Q2_024_partial_04_0505 : Poly :=
[
  term ((-10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 4. -/
theorem ep_Q2_024_partial_04_0505_valid :
    mulPoly ep_Q2_024_coefficient_04_0505
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0506 : Poly :=
[
  term ((233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 506 for generator 4. -/
def ep_Q2_024_partial_04_0506 : Poly :=
[
  term ((233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 4. -/
theorem ep_Q2_024_partial_04_0506_valid :
    mulPoly ep_Q2_024_coefficient_04_0506
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0507 : Poly :=
[
  term ((-82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 507 for generator 4. -/
def ep_Q2_024_partial_04_0507 : Poly :=
[
  term ((-82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 4. -/
theorem ep_Q2_024_partial_04_0507_valid :
    mulPoly ep_Q2_024_coefficient_04_0507
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0508 : Poly :=
[
  term ((18460353099665251 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 4. -/
def ep_Q2_024_partial_04_0508 : Poly :=
[
  term ((18460353099665251 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18460353099665251 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18460353099665251 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18460353099665251 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 4. -/
theorem ep_Q2_024_partial_04_0508_valid :
    mulPoly ep_Q2_024_coefficient_04_0508
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0509 : Poly :=
[
  term ((-16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 509 for generator 4. -/
def ep_Q2_024_partial_04_0509 : Poly :=
[
  term ((-16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 4. -/
theorem ep_Q2_024_partial_04_0509_valid :
    mulPoly ep_Q2_024_coefficient_04_0509
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0510 : Poly :=
[
  term ((-53087443225567315 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 4. -/
def ep_Q2_024_partial_04_0510 : Poly :=
[
  term ((-53087443225567315 : Rat) / 13953362653838316) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53087443225567315 : Rat) / 13953362653838316) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((53087443225567315 : Rat) / 13953362653838316) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((53087443225567315 : Rat) / 13953362653838316) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 4. -/
theorem ep_Q2_024_partial_04_0510_valid :
    mulPoly ep_Q2_024_coefficient_04_0510
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0511 : Poly :=
[
  term ((-548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 511 for generator 4. -/
def ep_Q2_024_partial_04_0511 : Poly :=
[
  term ((-548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((-548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (12, 2), (13, 1)],
  term ((548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 4. -/
theorem ep_Q2_024_partial_04_0511_valid :
    mulPoly ep_Q2_024_coefficient_04_0511
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0512 : Poly :=
[
  term ((39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 512 for generator 4. -/
def ep_Q2_024_partial_04_0512 : Poly :=
[
  term ((39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((-39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 4. -/
theorem ep_Q2_024_partial_04_0512_valid :
    mulPoly ep_Q2_024_coefficient_04_0512
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0513 : Poly :=
[
  term ((-8044773360346055 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 4. -/
def ep_Q2_024_partial_04_0513 : Poly :=
[
  term ((-8044773360346055 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8044773360346055 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((8044773360346055 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((8044773360346055 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 4. -/
theorem ep_Q2_024_partial_04_0513_valid :
    mulPoly ep_Q2_024_coefficient_04_0513
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0514 : Poly :=
[
  term ((93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1)]
]

/-- Partial product 514 for generator 4. -/
def ep_Q2_024_partial_04_0514 : Poly :=
[
  term ((93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 1), (13, 1)],
  term ((93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (9, 1), (13, 1)],
  term ((-93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (10, 2), (13, 1)],
  term ((-93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 4. -/
theorem ep_Q2_024_partial_04_0514_valid :
    mulPoly ep_Q2_024_coefficient_04_0514
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0515 : Poly :=
[
  term ((13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 515 for generator 4. -/
def ep_Q2_024_partial_04_0515 : Poly :=
[
  term ((13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 4. -/
theorem ep_Q2_024_partial_04_0515_valid :
    mulPoly ep_Q2_024_coefficient_04_0515
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0516 : Poly :=
[
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 516 for generator 4. -/
def ep_Q2_024_partial_04_0516 : Poly :=
[
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 2)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 4. -/
theorem ep_Q2_024_partial_04_0516_valid :
    mulPoly ep_Q2_024_coefficient_04_0516
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0517 : Poly :=
[
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 517 for generator 4. -/
def ep_Q2_024_partial_04_0517 : Poly :=
[
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 4. -/
theorem ep_Q2_024_partial_04_0517_valid :
    mulPoly ep_Q2_024_coefficient_04_0517
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0518 : Poly :=
[
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 518 for generator 4. -/
def ep_Q2_024_partial_04_0518 : Poly :=
[
  term ((2498215589172928 : Rat) / 1162780221153193) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 4. -/
theorem ep_Q2_024_partial_04_0518_valid :
    mulPoly ep_Q2_024_coefficient_04_0518
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0519 : Poly :=
[
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 519 for generator 4. -/
def ep_Q2_024_partial_04_0519 : Poly :=
[
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 4. -/
theorem ep_Q2_024_partial_04_0519_valid :
    mulPoly ep_Q2_024_coefficient_04_0519
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0520 : Poly :=
[
  term ((81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 520 for generator 4. -/
def ep_Q2_024_partial_04_0520 : Poly :=
[
  term ((81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 4. -/
theorem ep_Q2_024_partial_04_0520_valid :
    mulPoly ep_Q2_024_coefficient_04_0520
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0521 : Poly :=
[
  term ((4904292593952373 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 4. -/
def ep_Q2_024_partial_04_0521 : Poly :=
[
  term ((4904292593952373 : Rat) / 13953362653838316) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4904292593952373 : Rat) / 13953362653838316) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4904292593952373 : Rat) / 13953362653838316) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4904292593952373 : Rat) / 13953362653838316) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 4. -/
theorem ep_Q2_024_partial_04_0521_valid :
    mulPoly ep_Q2_024_coefficient_04_0521
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0522 : Poly :=
[
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 522 for generator 4. -/
def ep_Q2_024_partial_04_0522 : Poly :=
[
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 4. -/
theorem ep_Q2_024_partial_04_0522_valid :
    mulPoly ep_Q2_024_coefficient_04_0522
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0523 : Poly :=
[
  term ((-1041537767813708 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 523 for generator 4. -/
def ep_Q2_024_partial_04_0523 : Poly :=
[
  term ((-1041537767813708 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 4. -/
theorem ep_Q2_024_partial_04_0523_valid :
    mulPoly ep_Q2_024_coefficient_04_0523
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0524 : Poly :=
[
  term ((-377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 1), (15, 1)]
]

/-- Partial product 524 for generator 4. -/
def ep_Q2_024_partial_04_0524 : Poly :=
[
  term ((-377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (9, 1), (15, 1)],
  term ((-377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (9, 1), (15, 1)],
  term ((377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 1), (10, 2), (15, 1)],
  term ((377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 4. -/
theorem ep_Q2_024_partial_04_0524_valid :
    mulPoly ep_Q2_024_coefficient_04_0524
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0525 : Poly :=
[
  term ((9845467292678887 : Rat) / 4651120884612772) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 4. -/
def ep_Q2_024_partial_04_0525 : Poly :=
[
  term ((9845467292678887 : Rat) / 4651120884612772) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((9845467292678887 : Rat) / 4651120884612772) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9845467292678887 : Rat) / 4651120884612772) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9845467292678887 : Rat) / 4651120884612772) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 4. -/
theorem ep_Q2_024_partial_04_0525_valid :
    mulPoly ep_Q2_024_coefficient_04_0525
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0526 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 3)]
]

/-- Partial product 526 for generator 4. -/
def ep_Q2_024_partial_04_0526 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (15, 3)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 4. -/
theorem ep_Q2_024_partial_04_0526_valid :
    mulPoly ep_Q2_024_coefficient_04_0526
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0527 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 527 for generator 4. -/
def ep_Q2_024_partial_04_0527 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 4. -/
theorem ep_Q2_024_partial_04_0527_valid :
    mulPoly ep_Q2_024_coefficient_04_0527
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0528 : Poly :=
[
  term ((18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(9, 2)]
]

/-- Partial product 528 for generator 4. -/
def ep_Q2_024_partial_04_0528 : Poly :=
[
  term ((18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (9, 2)],
  term ((18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)],
  term ((-18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (10, 2)],
  term ((-18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 4. -/
theorem ep_Q2_024_partial_04_0528_valid :
    mulPoly ep_Q2_024_coefficient_04_0528
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0529 : Poly :=
[
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 529 for generator 4. -/
def ep_Q2_024_partial_04_0529 : Poly :=
[
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 4. -/
theorem ep_Q2_024_partial_04_0529_valid :
    mulPoly ep_Q2_024_coefficient_04_0529
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0530 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 530 for generator 4. -/
def ep_Q2_024_partial_04_0530 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 4. -/
theorem ep_Q2_024_partial_04_0530_valid :
    mulPoly ep_Q2_024_coefficient_04_0530
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0531 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 531 for generator 4. -/
def ep_Q2_024_partial_04_0531 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 4. -/
theorem ep_Q2_024_partial_04_0531_valid :
    mulPoly ep_Q2_024_coefficient_04_0531
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0532 : Poly :=
[
  term ((-1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)]
]

/-- Partial product 532 for generator 4. -/
def ep_Q2_024_partial_04_0532 : Poly :=
[
  term ((-1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 2), (12, 1)],
  term ((-1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)],
  term ((1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)],
  term ((1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 4. -/
theorem ep_Q2_024_partial_04_0532_valid :
    mulPoly ep_Q2_024_coefficient_04_0532
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0533 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 533 for generator 4. -/
def ep_Q2_024_partial_04_0533 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 4. -/
theorem ep_Q2_024_partial_04_0533_valid :
    mulPoly ep_Q2_024_coefficient_04_0533
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0534 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 534 for generator 4. -/
def ep_Q2_024_partial_04_0534 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 4. -/
theorem ep_Q2_024_partial_04_0534_valid :
    mulPoly ep_Q2_024_coefficient_04_0534
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0535 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 4. -/
def ep_Q2_024_partial_04_0535 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(9, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 4. -/
theorem ep_Q2_024_partial_04_0535_valid :
    mulPoly ep_Q2_024_coefficient_04_0535
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0536 : Poly :=
[
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 536 for generator 4. -/
def ep_Q2_024_partial_04_0536 : Poly :=
[
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (13, 1), (15, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 4. -/
theorem ep_Q2_024_partial_04_0536_valid :
    mulPoly ep_Q2_024_coefficient_04_0536
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0537 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 4. -/
def ep_Q2_024_partial_04_0537 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 4. -/
theorem ep_Q2_024_partial_04_0537_valid :
    mulPoly ep_Q2_024_coefficient_04_0537
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0538 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (13, 2)]
]

/-- Partial product 538 for generator 4. -/
def ep_Q2_024_partial_04_0538 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (13, 2)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 4. -/
theorem ep_Q2_024_partial_04_0538_valid :
    mulPoly ep_Q2_024_coefficient_04_0538
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0539 : Poly :=
[
  term ((11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (14, 1)]
]

/-- Partial product 539 for generator 4. -/
def ep_Q2_024_partial_04_0539 : Poly :=
[
  term ((11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (14, 1)],
  term ((11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (14, 1)],
  term ((-11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (14, 1)],
  term ((-11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 4. -/
theorem ep_Q2_024_partial_04_0539_valid :
    mulPoly ep_Q2_024_coefficient_04_0539
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0540 : Poly :=
[
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (15, 2)]
]

/-- Partial product 540 for generator 4. -/
def ep_Q2_024_partial_04_0540 : Poly :=
[
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (15, 2)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (15, 2)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (10, 2), (15, 2)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 4. -/
theorem ep_Q2_024_partial_04_0540_valid :
    mulPoly ep_Q2_024_coefficient_04_0540
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0541 : Poly :=
[
  term ((16856913734998261 : Rat) / 3488340663459579) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 4. -/
def ep_Q2_024_partial_04_0541 : Poly :=
[
  term ((16856913734998261 : Rat) / 3488340663459579) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((16856913734998261 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 4. -/
theorem ep_Q2_024_partial_04_0541_valid :
    mulPoly ep_Q2_024_coefficient_04_0541
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0542 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 542 for generator 4. -/
def ep_Q2_024_partial_04_0542 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (11, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 4. -/
theorem ep_Q2_024_partial_04_0542_valid :
    mulPoly ep_Q2_024_coefficient_04_0542
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0543 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (13, 1)]
]

/-- Partial product 543 for generator 4. -/
def ep_Q2_024_partial_04_0543 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 3), (13, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (10, 2), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 4. -/
theorem ep_Q2_024_partial_04_0543_valid :
    mulPoly ep_Q2_024_coefficient_04_0543
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0544 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (15, 1)]
]

/-- Partial product 544 for generator 4. -/
def ep_Q2_024_partial_04_0544 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 2), (9, 3), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 2), (9, 3), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (10, 2), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 4. -/
theorem ep_Q2_024_partial_04_0544_valid :
    mulPoly ep_Q2_024_coefficient_04_0544
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0545 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 4. -/
def ep_Q2_024_partial_04_0545 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 2), (9, 3), (15, 1), (16, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 4. -/
theorem ep_Q2_024_partial_04_0545_valid :
    mulPoly ep_Q2_024_coefficient_04_0545
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0546 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4)]
]

/-- Partial product 546 for generator 4. -/
def ep_Q2_024_partial_04_0546 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 4)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (10, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 4. -/
theorem ep_Q2_024_partial_04_0546_valid :
    mulPoly ep_Q2_024_coefficient_04_0546
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0547 : Poly :=
[
  term ((-578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 547 for generator 4. -/
def ep_Q2_024_partial_04_0547 : Poly :=
[
  term ((-578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 4. -/
theorem ep_Q2_024_partial_04_0547_valid :
    mulPoly ep_Q2_024_coefficient_04_0547
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0548 : Poly :=
[
  term ((244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 548 for generator 4. -/
def ep_Q2_024_partial_04_0548 : Poly :=
[
  term ((244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 4. -/
theorem ep_Q2_024_partial_04_0548_valid :
    mulPoly ep_Q2_024_coefficient_04_0548
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0549 : Poly :=
[
  term ((-6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 549 for generator 4. -/
def ep_Q2_024_partial_04_0549 : Poly :=
[
  term ((-6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 4. -/
theorem ep_Q2_024_partial_04_0549_valid :
    mulPoly ep_Q2_024_coefficient_04_0549
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0550 : Poly :=
[
  term ((-405858213657278 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 4. -/
def ep_Q2_024_partial_04_0550 : Poly :=
[
  term ((-405858213657278 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-405858213657278 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((405858213657278 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((405858213657278 : Rat) / 1162780221153193) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 4. -/
theorem ep_Q2_024_partial_04_0550_valid :
    mulPoly ep_Q2_024_coefficient_04_0550
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0551 : Poly :=
[
  term ((86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 551 for generator 4. -/
def ep_Q2_024_partial_04_0551 : Poly :=
[
  term ((86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 4. -/
theorem ep_Q2_024_partial_04_0551_valid :
    mulPoly ep_Q2_024_coefficient_04_0551
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0552 : Poly :=
[
  term ((-26989621831268111 : Rat) / 4651120884612772) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 4. -/
def ep_Q2_024_partial_04_0552 : Poly :=
[
  term ((-26989621831268111 : Rat) / 4651120884612772) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26989621831268111 : Rat) / 4651120884612772) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((26989621831268111 : Rat) / 4651120884612772) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((26989621831268111 : Rat) / 4651120884612772) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 4. -/
theorem ep_Q2_024_partial_04_0552_valid :
    mulPoly ep_Q2_024_coefficient_04_0552
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0553 : Poly :=
[
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 553 for generator 4. -/
def ep_Q2_024_partial_04_0553 : Poly :=
[
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 2), (13, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 4. -/
theorem ep_Q2_024_partial_04_0553_valid :
    mulPoly ep_Q2_024_coefficient_04_0553
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0554 : Poly :=
[
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 554 for generator 4. -/
def ep_Q2_024_partial_04_0554 : Poly :=
[
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(10, 2), (11, 1), (12, 2), (15, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 4. -/
theorem ep_Q2_024_partial_04_0554_valid :
    mulPoly ep_Q2_024_coefficient_04_0554
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0555 : Poly :=
[
  term ((1823186202855382 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 4. -/
def ep_Q2_024_partial_04_0555 : Poly :=
[
  term ((1823186202855382 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 4. -/
theorem ep_Q2_024_partial_04_0555_valid :
    mulPoly ep_Q2_024_coefficient_04_0555
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0556 : Poly :=
[
  term ((3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)]
]

/-- Partial product 556 for generator 4. -/
def ep_Q2_024_partial_04_0556 : Poly :=
[
  term ((3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (11, 1), (13, 1)],
  term ((3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (11, 1), (13, 1)],
  term ((-3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 1), (13, 1)],
  term ((-3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 4. -/
theorem ep_Q2_024_partial_04_0556_valid :
    mulPoly ep_Q2_024_coefficient_04_0556
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0557 : Poly :=
[
  term ((2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 557 for generator 4. -/
def ep_Q2_024_partial_04_0557 : Poly :=
[
  term ((2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 4. -/
theorem ep_Q2_024_partial_04_0557_valid :
    mulPoly ep_Q2_024_coefficient_04_0557
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0558 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 558 for generator 4. -/
def ep_Q2_024_partial_04_0558 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 4. -/
theorem ep_Q2_024_partial_04_0558_valid :
    mulPoly ep_Q2_024_coefficient_04_0558
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0559 : Poly :=
[
  term ((-39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 559 for generator 4. -/
def ep_Q2_024_partial_04_0559 : Poly :=
[
  term ((-39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 4. -/
theorem ep_Q2_024_partial_04_0559_valid :
    mulPoly ep_Q2_024_coefficient_04_0559
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0560 : Poly :=
[
  term ((9715564539961919 : Rat) / 2325560442306386) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 560 for generator 4. -/
def ep_Q2_024_partial_04_0560 : Poly :=
[
  term ((9715564539961919 : Rat) / 2325560442306386) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9715564539961919 : Rat) / 2325560442306386) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9715564539961919 : Rat) / 2325560442306386) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9715564539961919 : Rat) / 2325560442306386) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 4. -/
theorem ep_Q2_024_partial_04_0560_valid :
    mulPoly ep_Q2_024_coefficient_04_0560
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0561 : Poly :=
[
  term ((1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 561 for generator 4. -/
def ep_Q2_024_partial_04_0561 : Poly :=
[
  term ((1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 4. -/
theorem ep_Q2_024_partial_04_0561_valid :
    mulPoly ep_Q2_024_coefficient_04_0561
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0562 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 4. -/
def ep_Q2_024_partial_04_0562 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 4. -/
theorem ep_Q2_024_partial_04_0562_valid :
    mulPoly ep_Q2_024_coefficient_04_0562
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0563 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3)]
]

/-- Partial product 563 for generator 4. -/
def ep_Q2_024_partial_04_0563 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 4. -/
theorem ep_Q2_024_partial_04_0563_valid :
    mulPoly ep_Q2_024_coefficient_04_0563
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0564 : Poly :=
[
  term ((84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 564 for generator 4. -/
def ep_Q2_024_partial_04_0564 : Poly :=
[
  term ((84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 4. -/
theorem ep_Q2_024_partial_04_0564_valid :
    mulPoly ep_Q2_024_coefficient_04_0564
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0565 : Poly :=
[
  term ((8288217294931485 : Rat) / 2325560442306386) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 4. -/
def ep_Q2_024_partial_04_0565 : Poly :=
[
  term ((8288217294931485 : Rat) / 2325560442306386) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8288217294931485 : Rat) / 2325560442306386) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8288217294931485 : Rat) / 2325560442306386) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8288217294931485 : Rat) / 2325560442306386) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 4. -/
theorem ep_Q2_024_partial_04_0565_valid :
    mulPoly ep_Q2_024_coefficient_04_0565
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0566 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 566 for generator 4. -/
def ep_Q2_024_partial_04_0566 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 4. -/
theorem ep_Q2_024_partial_04_0566_valid :
    mulPoly ep_Q2_024_coefficient_04_0566
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0567 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 4. -/
def ep_Q2_024_partial_04_0567 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 4. -/
theorem ep_Q2_024_partial_04_0567_valid :
    mulPoly ep_Q2_024_coefficient_04_0567
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0568 : Poly :=
[
  term ((-79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(11, 1), (15, 1)]
]

/-- Partial product 568 for generator 4. -/
def ep_Q2_024_partial_04_0568 : Poly :=
[
  term ((-79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (11, 1), (15, 1)],
  term ((-79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (11, 1), (15, 1)],
  term ((79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(10, 2), (11, 1), (15, 1)],
  term ((79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 4. -/
theorem ep_Q2_024_partial_04_0568_valid :
    mulPoly ep_Q2_024_coefficient_04_0568
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0569 : Poly :=
[
  term ((10917590486353150 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 569 for generator 4. -/
def ep_Q2_024_partial_04_0569 : Poly :=
[
  term ((10917590486353150 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((10917590486353150 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10917590486353150 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10917590486353150 : Rat) / 1162780221153193) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 4. -/
theorem ep_Q2_024_partial_04_0569_valid :
    mulPoly ep_Q2_024_coefficient_04_0569
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0570 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 3)]
]

/-- Partial product 570 for generator 4. -/
def ep_Q2_024_partial_04_0570 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 4. -/
theorem ep_Q2_024_partial_04_0570_valid :
    mulPoly ep_Q2_024_coefficient_04_0570
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0571 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 571 for generator 4. -/
def ep_Q2_024_partial_04_0571 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 4. -/
theorem ep_Q2_024_partial_04_0571_valid :
    mulPoly ep_Q2_024_coefficient_04_0571
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0572 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 572 for generator 4. -/
def ep_Q2_024_partial_04_0572 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 4. -/
theorem ep_Q2_024_partial_04_0572_valid :
    mulPoly ep_Q2_024_coefficient_04_0572
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0573 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (15, 2)]
]

/-- Partial product 573 for generator 4. -/
def ep_Q2_024_partial_04_0573 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 2), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 4. -/
theorem ep_Q2_024_partial_04_0573_valid :
    mulPoly ep_Q2_024_coefficient_04_0573
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0574 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 574 for generator 4. -/
def ep_Q2_024_partial_04_0574 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 4. -/
theorem ep_Q2_024_partial_04_0574_valid :
    mulPoly ep_Q2_024_coefficient_04_0574
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0575 : Poly :=
[
  term ((-2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

/-- Partial product 575 for generator 4. -/
def ep_Q2_024_partial_04_0575 : Poly :=
[
  term ((-2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (12, 1)],
  term ((-2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (12, 1)],
  term ((2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(10, 2), (12, 1)],
  term ((2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 4. -/
theorem ep_Q2_024_partial_04_0575_valid :
    mulPoly ep_Q2_024_coefficient_04_0575
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0576 : Poly :=
[
  term ((-110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 576 for generator 4. -/
def ep_Q2_024_partial_04_0576 : Poly :=
[
  term ((-110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 4. -/
theorem ep_Q2_024_partial_04_0576_valid :
    mulPoly ep_Q2_024_coefficient_04_0576
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0577 : Poly :=
[
  term ((6741388318767089 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 4. -/
def ep_Q2_024_partial_04_0577 : Poly :=
[
  term ((6741388318767089 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 4. -/
theorem ep_Q2_024_partial_04_0577_valid :
    mulPoly ep_Q2_024_coefficient_04_0577
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0578 : Poly :=
[
  term ((211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 578 for generator 4. -/
def ep_Q2_024_partial_04_0578 : Poly :=
[
  term ((211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 4. -/
theorem ep_Q2_024_partial_04_0578_valid :
    mulPoly ep_Q2_024_coefficient_04_0578
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0579 : Poly :=
[
  term ((-1947809393403387 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 4. -/
def ep_Q2_024_partial_04_0579 : Poly :=
[
  term ((-1947809393403387 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1947809393403387 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1947809393403387 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1947809393403387 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 4. -/
theorem ep_Q2_024_partial_04_0579_valid :
    mulPoly ep_Q2_024_coefficient_04_0579
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0580 : Poly :=
[
  term ((-101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 580 for generator 4. -/
def ep_Q2_024_partial_04_0580 : Poly :=
[
  term ((-101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((-101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2)],
  term ((101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 4. -/
theorem ep_Q2_024_partial_04_0580_valid :
    mulPoly ep_Q2_024_coefficient_04_0580
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0581 : Poly :=
[
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 581 for generator 4. -/
def ep_Q2_024_partial_04_0581 : Poly :=
[
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 4. -/
theorem ep_Q2_024_partial_04_0581_valid :
    mulPoly ep_Q2_024_coefficient_04_0581
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0582 : Poly :=
[
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (14, 1)]
]

/-- Partial product 582 for generator 4. -/
def ep_Q2_024_partial_04_0582 : Poly :=
[
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 1), (14, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (14, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 1), (14, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 4. -/
theorem ep_Q2_024_partial_04_0582_valid :
    mulPoly ep_Q2_024_coefficient_04_0582
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0583 : Poly :=
[
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 583 for generator 4. -/
def ep_Q2_024_partial_04_0583 : Poly :=
[
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 4. -/
theorem ep_Q2_024_partial_04_0583_valid :
    mulPoly ep_Q2_024_coefficient_04_0583
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0584 : Poly :=
[
  term ((-12175775460650663 : Rat) / 2325560442306386) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 584 for generator 4. -/
def ep_Q2_024_partial_04_0584 : Poly :=
[
  term ((-12175775460650663 : Rat) / 2325560442306386) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12175775460650663 : Rat) / 2325560442306386) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 4. -/
theorem ep_Q2_024_partial_04_0584_valid :
    mulPoly ep_Q2_024_coefficient_04_0584
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0585 : Poly :=
[
  term ((489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (15, 2)]
]

/-- Partial product 585 for generator 4. -/
def ep_Q2_024_partial_04_0585 : Poly :=
[
  term ((489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (12, 1), (15, 2)],
  term ((489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (12, 1), (15, 2)],
  term ((-489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (12, 1), (15, 2)],
  term ((-489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 4. -/
theorem ep_Q2_024_partial_04_0585_valid :
    mulPoly ep_Q2_024_coefficient_04_0585
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0586 : Poly :=
[
  term ((-40028895951462071 : Rat) / 13953362653838316) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 586 for generator 4. -/
def ep_Q2_024_partial_04_0586 : Poly :=
[
  term ((-40028895951462071 : Rat) / 13953362653838316) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-40028895951462071 : Rat) / 13953362653838316) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((40028895951462071 : Rat) / 13953362653838316) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((40028895951462071 : Rat) / 13953362653838316) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 4. -/
theorem ep_Q2_024_partial_04_0586_valid :
    mulPoly ep_Q2_024_coefficient_04_0586
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0587 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 587 for generator 4. -/
def ep_Q2_024_partial_04_0587 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (12, 2), (13, 1), (15, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 4. -/
theorem ep_Q2_024_partial_04_0587_valid :
    mulPoly ep_Q2_024_coefficient_04_0587
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0588 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(12, 2), (15, 2)]
]

/-- Partial product 588 for generator 4. -/
def ep_Q2_024_partial_04_0588 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (12, 2), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 2), (12, 2), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 4. -/
theorem ep_Q2_024_partial_04_0588_valid :
    mulPoly ep_Q2_024_coefficient_04_0588
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0589 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 589 for generator 4. -/
def ep_Q2_024_partial_04_0589 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 4. -/
theorem ep_Q2_024_partial_04_0589_valid :
    mulPoly ep_Q2_024_coefficient_04_0589
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0590 : Poly :=
[
  term ((1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 590 for generator 4. -/
def ep_Q2_024_partial_04_0590 : Poly :=
[
  term ((1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 4. -/
theorem ep_Q2_024_partial_04_0590_valid :
    mulPoly ep_Q2_024_coefficient_04_0590
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0591 : Poly :=
[
  term ((-29793132376209631 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 591 for generator 4. -/
def ep_Q2_024_partial_04_0591 : Poly :=
[
  term ((-29793132376209631 : Rat) / 13953362653838316) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29793132376209631 : Rat) / 13953362653838316) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29793132376209631 : Rat) / 13953362653838316) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29793132376209631 : Rat) / 13953362653838316) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 4. -/
theorem ep_Q2_024_partial_04_0591_valid :
    mulPoly ep_Q2_024_coefficient_04_0591
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0592 : Poly :=
[
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 592 for generator 4. -/
def ep_Q2_024_partial_04_0592 : Poly :=
[
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 4. -/
theorem ep_Q2_024_partial_04_0592_valid :
    mulPoly ep_Q2_024_coefficient_04_0592
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0593 : Poly :=
[
  term ((2084919352602380 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 4. -/
def ep_Q2_024_partial_04_0593 : Poly :=
[
  term ((2084919352602380 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2084919352602380 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 4. -/
theorem ep_Q2_024_partial_04_0593_valid :
    mulPoly ep_Q2_024_coefficient_04_0593
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0594 : Poly :=
[
  term ((-273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(13, 1), (15, 1)]
]

/-- Partial product 594 for generator 4. -/
def ep_Q2_024_partial_04_0594 : Poly :=
[
  term ((-273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(2, 2), (13, 1), (15, 1)],
  term ((-273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(3, 2), (13, 1), (15, 1)],
  term ((273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(10, 2), (13, 1), (15, 1)],
  term ((273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 4. -/
theorem ep_Q2_024_partial_04_0594_valid :
    mulPoly ep_Q2_024_coefficient_04_0594
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0595 : Poly :=
[
  term ((-144491522708316947 : Rat) / 27906725307676632) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 4. -/
def ep_Q2_024_partial_04_0595 : Poly :=
[
  term ((-144491522708316947 : Rat) / 27906725307676632) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-144491522708316947 : Rat) / 27906725307676632) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((144491522708316947 : Rat) / 27906725307676632) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((144491522708316947 : Rat) / 27906725307676632) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 4. -/
theorem ep_Q2_024_partial_04_0595_valid :
    mulPoly ep_Q2_024_coefficient_04_0595
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0596 : Poly :=
[
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (15, 3)]
]

/-- Partial product 596 for generator 4. -/
def ep_Q2_024_partial_04_0596 : Poly :=
[
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (13, 1), (15, 3)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (13, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (13, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 4. -/
theorem ep_Q2_024_partial_04_0596_valid :
    mulPoly ep_Q2_024_coefficient_04_0596
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0597 : Poly :=
[
  term ((3223595267130360 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 597 for generator 4. -/
def ep_Q2_024_partial_04_0597 : Poly :=
[
  term ((3223595267130360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 4. -/
theorem ep_Q2_024_partial_04_0597_valid :
    mulPoly ep_Q2_024_coefficient_04_0597
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0598 : Poly :=
[
  term ((-3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(13, 2)]
]

/-- Partial product 598 for generator 4. -/
def ep_Q2_024_partial_04_0598 : Poly :=
[
  term ((-3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (13, 2)],
  term ((-3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (13, 2)],
  term ((3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2)],
  term ((3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 4. -/
theorem ep_Q2_024_partial_04_0598_valid :
    mulPoly ep_Q2_024_coefficient_04_0598
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0599 : Poly :=
[
  term ((2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(13, 2), (14, 1)]
]

/-- Partial product 599 for generator 4. -/
def ep_Q2_024_partial_04_0599 : Poly :=
[
  term ((2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (13, 2), (14, 1)],
  term ((2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (13, 2), (14, 1)],
  term ((-2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(10, 2), (13, 2), (14, 1)],
  term ((-2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 4. -/
theorem ep_Q2_024_partial_04_0599_valid :
    mulPoly ep_Q2_024_coefficient_04_0599
        ep_Q2_024_generator_04_0500_0599 =
      ep_Q2_024_partial_04_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_04_0500_0599 : List Poly :=
[
  ep_Q2_024_partial_04_0500,
  ep_Q2_024_partial_04_0501,
  ep_Q2_024_partial_04_0502,
  ep_Q2_024_partial_04_0503,
  ep_Q2_024_partial_04_0504,
  ep_Q2_024_partial_04_0505,
  ep_Q2_024_partial_04_0506,
  ep_Q2_024_partial_04_0507,
  ep_Q2_024_partial_04_0508,
  ep_Q2_024_partial_04_0509,
  ep_Q2_024_partial_04_0510,
  ep_Q2_024_partial_04_0511,
  ep_Q2_024_partial_04_0512,
  ep_Q2_024_partial_04_0513,
  ep_Q2_024_partial_04_0514,
  ep_Q2_024_partial_04_0515,
  ep_Q2_024_partial_04_0516,
  ep_Q2_024_partial_04_0517,
  ep_Q2_024_partial_04_0518,
  ep_Q2_024_partial_04_0519,
  ep_Q2_024_partial_04_0520,
  ep_Q2_024_partial_04_0521,
  ep_Q2_024_partial_04_0522,
  ep_Q2_024_partial_04_0523,
  ep_Q2_024_partial_04_0524,
  ep_Q2_024_partial_04_0525,
  ep_Q2_024_partial_04_0526,
  ep_Q2_024_partial_04_0527,
  ep_Q2_024_partial_04_0528,
  ep_Q2_024_partial_04_0529,
  ep_Q2_024_partial_04_0530,
  ep_Q2_024_partial_04_0531,
  ep_Q2_024_partial_04_0532,
  ep_Q2_024_partial_04_0533,
  ep_Q2_024_partial_04_0534,
  ep_Q2_024_partial_04_0535,
  ep_Q2_024_partial_04_0536,
  ep_Q2_024_partial_04_0537,
  ep_Q2_024_partial_04_0538,
  ep_Q2_024_partial_04_0539,
  ep_Q2_024_partial_04_0540,
  ep_Q2_024_partial_04_0541,
  ep_Q2_024_partial_04_0542,
  ep_Q2_024_partial_04_0543,
  ep_Q2_024_partial_04_0544,
  ep_Q2_024_partial_04_0545,
  ep_Q2_024_partial_04_0546,
  ep_Q2_024_partial_04_0547,
  ep_Q2_024_partial_04_0548,
  ep_Q2_024_partial_04_0549,
  ep_Q2_024_partial_04_0550,
  ep_Q2_024_partial_04_0551,
  ep_Q2_024_partial_04_0552,
  ep_Q2_024_partial_04_0553,
  ep_Q2_024_partial_04_0554,
  ep_Q2_024_partial_04_0555,
  ep_Q2_024_partial_04_0556,
  ep_Q2_024_partial_04_0557,
  ep_Q2_024_partial_04_0558,
  ep_Q2_024_partial_04_0559,
  ep_Q2_024_partial_04_0560,
  ep_Q2_024_partial_04_0561,
  ep_Q2_024_partial_04_0562,
  ep_Q2_024_partial_04_0563,
  ep_Q2_024_partial_04_0564,
  ep_Q2_024_partial_04_0565,
  ep_Q2_024_partial_04_0566,
  ep_Q2_024_partial_04_0567,
  ep_Q2_024_partial_04_0568,
  ep_Q2_024_partial_04_0569,
  ep_Q2_024_partial_04_0570,
  ep_Q2_024_partial_04_0571,
  ep_Q2_024_partial_04_0572,
  ep_Q2_024_partial_04_0573,
  ep_Q2_024_partial_04_0574,
  ep_Q2_024_partial_04_0575,
  ep_Q2_024_partial_04_0576,
  ep_Q2_024_partial_04_0577,
  ep_Q2_024_partial_04_0578,
  ep_Q2_024_partial_04_0579,
  ep_Q2_024_partial_04_0580,
  ep_Q2_024_partial_04_0581,
  ep_Q2_024_partial_04_0582,
  ep_Q2_024_partial_04_0583,
  ep_Q2_024_partial_04_0584,
  ep_Q2_024_partial_04_0585,
  ep_Q2_024_partial_04_0586,
  ep_Q2_024_partial_04_0587,
  ep_Q2_024_partial_04_0588,
  ep_Q2_024_partial_04_0589,
  ep_Q2_024_partial_04_0590,
  ep_Q2_024_partial_04_0591,
  ep_Q2_024_partial_04_0592,
  ep_Q2_024_partial_04_0593,
  ep_Q2_024_partial_04_0594,
  ep_Q2_024_partial_04_0595,
  ep_Q2_024_partial_04_0596,
  ep_Q2_024_partial_04_0597,
  ep_Q2_024_partial_04_0598,
  ep_Q2_024_partial_04_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_04_0500_0599 : Poly :=
[
  term ((-596913039183748 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-4210968274145470 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((18460353099665251 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-53087443225567315 : Rat) / 13953362653838316) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((-8044773360346055 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 1), (13, 1)],
  term ((13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((4904292593952373 : Rat) / 13953362653838316) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (9, 1), (15, 1)],
  term ((9845467292678887 : Rat) / 4651120884612772) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (9, 2)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (13, 1), (15, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (13, 2)],
  term ((11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (14, 1)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (15, 2)],
  term ((16856913734998261 : Rat) / 3488340663459579) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 2), (9, 3), (15, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 2), (9, 3), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 4)],
  term ((-578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-405858213657278 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-26989621831268111 : Rat) / 4651120884612772) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (11, 1), (13, 1)],
  term ((2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 2)],
  term ((-39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((9715564539961919 : Rat) / 2325560442306386) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 3)],
  term ((84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((8288217294931485 : Rat) / 2325560442306386) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (11, 1), (15, 1)],
  term ((10917590486353150 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (15, 3)],
  term ((312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 2), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (12, 1)],
  term ((-110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1947809393403387 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 1), (14, 1)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((-12175775460650663 : Rat) / 2325560442306386) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (12, 1), (15, 2)],
  term ((-40028895951462071 : Rat) / 13953362653838316) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (12, 2), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-29793132376209631 : Rat) / 13953362653838316) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((2084919352602380 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(2, 2), (13, 1), (15, 1)],
  term ((-144491522708316947 : Rat) / 27906725307676632) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (13, 1), (15, 3)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (13, 2)],
  term ((2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (13, 2), (14, 1)],
  term ((-596913039183748 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-4210968274145470 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((18460353099665251 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-53087443225567315 : Rat) / 13953362653838316) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-8044773360346055 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (9, 1), (13, 1)],
  term ((13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((4904292593952373 : Rat) / 13953362653838316) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (9, 1), (15, 1)],
  term ((9845467292678887 : Rat) / 4651120884612772) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)],
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (13, 2)],
  term ((11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (14, 1)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (15, 2)],
  term ((16856913734998261 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 2), (9, 3), (15, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)],
  term ((-578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-405858213657278 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-26989621831268111 : Rat) / 4651120884612772) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((-7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((1823186202855382 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (11, 1), (13, 1)],
  term ((2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((-39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((9715564539961919 : Rat) / 2325560442306386) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 3)],
  term ((84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((8288217294931485 : Rat) / 2325560442306386) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (11, 1), (15, 1)],
  term ((10917590486353150 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (15, 3)],
  term ((312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 2), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (12, 1)],
  term ((-110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1947809393403387 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((-35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (14, 1)],
  term ((60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((-12175775460650663 : Rat) / 2325560442306386) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (12, 1), (15, 2)],
  term ((-40028895951462071 : Rat) / 13953362653838316) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (12, 2), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-29793132376209631 : Rat) / 13953362653838316) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((2084919352602380 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(3, 2), (13, 1), (15, 1)],
  term ((-144491522708316947 : Rat) / 27906725307676632) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (13, 1), (15, 3)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (13, 2)],
  term ((2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (13, 2), (14, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((4210968274145470 : Rat) / 1162780221153193) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18460353099665251 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((53087443225567315 : Rat) / 13953362653838316) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (12, 2), (13, 1)],
  term ((-39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 2), (12, 2), (15, 1)],
  term ((8044773360346055 : Rat) / 2325560442306386) [(9, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (10, 2), (13, 1)],
  term ((-13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-4904292593952373 : Rat) / 13953362653838316) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 1), (10, 2), (15, 1)],
  term ((-9845467292678887 : Rat) / 4651120884612772) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 2), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((10935396835334355971320625757951179448086 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-233376020339864422790844499431712947394 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((82828560080361698731146118865144083365461336552690823659 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18460353099665251 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16128945550755460243197452901251611039337394657328547503 : Rat) / 189152329247190471560292901187037131688273848796093840) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((53087443225567315 : Rat) / 13953362653838316) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((548975551261050428691353282261661126526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-39818387901613100151620094635054415434254130238350891503 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((8044773360346055 : Rat) / 2325560442306386) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-93498447866324715656928678306506949350 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 2), (13, 1)],
  term ((-13254767698364836158259024528898095920848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-81414481012604907376671209791557712901071549742421560567 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4904292593952373 : Rat) / 13953362653838316) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((377668557295464537444341246872148769804157177400651918791 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 1), (11, 2), (15, 1)],
  term ((-9845467292678887 : Rat) / 4651120884612772) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((596913039183748 : Rat) / 1162780221153193) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3), (13, 2)],
  term ((-1233731710410614904471599431703296248472 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 3), (14, 1)],
  term ((-19856992775978868275814578212768706473507200376347146701 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 3), (15, 2)],
  term ((4210968274145470 : Rat) / 1162780221153193) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (10, 2)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (10, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(9, 2), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (13, 2)],
  term ((-11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (10, 2), (14, 1)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (10, 2), (15, 2)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-18669474980209783691086366834186674465781 : Rat) / 5398692558311147834550120876132926705955) [(9, 2), (11, 2)],
  term ((1417607417542275677006428000747227840614 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (13, 2)],
  term ((-11500247697301077832402763921124153918251 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 2), (14, 1)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (11, 2), (15, 2)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 3), (13, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 3), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (10, 2), (11, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (10, 2), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (10, 2), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 2), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (11, 2), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (10, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4), (11, 2)],
  term ((578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((405858213657278 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((26989621831268111 : Rat) / 4651120884612772) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (12, 2), (13, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(10, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(10, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 1), (13, 1)],
  term ((-2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-9715564539961919 : Rat) / 2325560442306386) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 3)],
  term ((-84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8288217294931485 : Rat) / 2325560442306386) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(10, 2), (11, 1), (15, 1)],
  term ((-10917590486353150 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(10, 2), (12, 1)],
  term ((110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((1947809393403387 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 1), (14, 1)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (12, 1), (15, 2)],
  term ((40028895951462071 : Rat) / 13953362653838316) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(10, 2), (12, 2), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(10, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((29793132376209631 : Rat) / 13953362653838316) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(10, 2), (13, 1), (15, 1)],
  term ((144491522708316947 : Rat) / 27906725307676632) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(10, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2)],
  term ((-2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(10, 2), (13, 2), (14, 1)],
  term ((2999396959319904932789950336498123697677 : Rat) / 3599128372207431889700080584088617803970) [(11, 2), (12, 1)],
  term ((110659176277872735450066210431507235127493443147752576011 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211553004310812927923379464897790960993243159924457682443 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1947809393403387 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101475514902920377565153660463989585438 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 2), (14, 1)],
  term ((35731514272175629887903381532973527627 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 1), (14, 1)],
  term ((-60186302460203371214279437569291915642762937757964908047 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((12175775460650663 : Rat) / 2325560442306386) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-489454868202781602073942201433872022946024583464106075703 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (12, 1), (15, 2)],
  term ((40028895951462071 : Rat) / 13953362653838316) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(11, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1424947362424042493731978276165873549053546244461351060133 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((29793132376209631 : Rat) / 13953362653838316) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4217820368178369180215307824269664173457433907055549671 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2084919352602380 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((273823751608015219638550700228402015729196144030792661133 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(11, 2), (13, 1), (15, 1)],
  term ((144491522708316947 : Rat) / 27906725307676632) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((3757121596212572550271968597792069333101 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2)],
  term ((-2257402130155810795899494267165550051338 : Rat) / 359912837220743188970008058408861780397) [(11, 2), (13, 2), (14, 1)],
  term ((578227980071456663406787923908767450754 : Rat) / 119970945740247729656669352802953926799) [(11, 3), (12, 1), (13, 1)],
  term ((-244903303923915825207609718305021027496 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 1), (13, 1), (14, 1)],
  term ((6343059266724089094725265145907451046706273210159163947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((405858213657278 : Rat) / 1162780221153193) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86134098888060359478761233250241094770781749376426175389 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 3), (12, 1), (15, 1)],
  term ((26989621831268111 : Rat) / 4651120884612772) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-425614990140027707616836521453923643144 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (12, 2), (13, 1)],
  term ((7447450673837930684587196385856047254765527347108502499 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 3), (12, 2), (15, 1)],
  term ((-1823186202855382 : Rat) / 1162780221153193) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-3339414854233764733235929366473737140108 : Rat) / 1799564186103715944850040292044308901985) [(11, 3), (13, 1)],
  term ((-2667998347385545381516557851590809670916 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 2)],
  term ((39960001496718180812178820514455768876073264538707089887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 3), (13, 1), (15, 2)],
  term ((-9715564539961919 : Rat) / 2325560442306386) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1868846521839759610015393012132074063518051520790313854 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 3), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 3)],
  term ((-84920107909749686691528164432143538106420714885028250881 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 3), (14, 1), (15, 1)],
  term ((-8288217294931485 : Rat) / 2325560442306386) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((79016461253599908678100058085053609647885711619793624302 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(11, 3), (15, 1)],
  term ((-10917590486353150 : Rat) / 1162780221153193) [(11, 3), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 3), (15, 3), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 4), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 4), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 500 through 599. -/
theorem ep_Q2_024_block_04_0500_0599_valid :
    checkProductSumEq ep_Q2_024_partials_04_0500_0599
      ep_Q2_024_block_04_0500_0599 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
