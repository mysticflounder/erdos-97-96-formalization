/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0400 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 400 for generator 21. -/
def ep_Q2_002_partial_21_0400 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem ep_Q2_002_partial_21_0400_valid :
    mulPoly ep_Q2_002_coefficient_21_0400
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0401 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 21. -/
def ep_Q2_002_partial_21_0401 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem ep_Q2_002_partial_21_0401_valid :
    mulPoly ep_Q2_002_coefficient_21_0401
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0402 : Poly :=
[
  term ((126542579082196935477284539630416 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 402 for generator 21. -/
def ep_Q2_002_partial_21_0402 : Poly :=
[
  term ((253085158164393870954569079260832 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-126542579082196935477284539630416 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem ep_Q2_002_partial_21_0402_valid :
    mulPoly ep_Q2_002_coefficient_21_0402
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0403 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 403 for generator 21. -/
def ep_Q2_002_partial_21_0403 : Poly :=
[
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem ep_Q2_002_partial_21_0403_valid :
    mulPoly ep_Q2_002_coefficient_21_0403
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0404 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 21. -/
def ep_Q2_002_partial_21_0404 : Poly :=
[
  term ((38126575709 : Rat) / 3171993105) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem ep_Q2_002_partial_21_0404_valid :
    mulPoly ep_Q2_002_coefficient_21_0404
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0405 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)]
]

/-- Partial product 405 for generator 21. -/
def ep_Q2_002_partial_21_0405 : Poly :=
[
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 2)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem ep_Q2_002_partial_21_0405_valid :
    mulPoly ep_Q2_002_coefficient_21_0405
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0406 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)]
]

/-- Partial product 406 for generator 21. -/
def ep_Q2_002_partial_21_0406 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 2), (12, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem ep_Q2_002_partial_21_0406_valid :
    mulPoly ep_Q2_002_coefficient_21_0406
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0407 : Poly :=
[
  term ((14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 407 for generator 21. -/
def ep_Q2_002_partial_21_0407 : Poly :=
[
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem ep_Q2_002_partial_21_0407_valid :
    mulPoly ep_Q2_002_coefficient_21_0407
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0408 : Poly :=
[
  term ((-521212696 : Rat) / 211466207) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 21. -/
def ep_Q2_002_partial_21_0408 : Poly :=
[
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem ep_Q2_002_partial_21_0408_valid :
    mulPoly ep_Q2_002_coefficient_21_0408
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0409 : Poly :=
[
  term ((-131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2)]
]

/-- Partial product 409 for generator 21. -/
def ep_Q2_002_partial_21_0409 : Poly :=
[
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem ep_Q2_002_partial_21_0409_valid :
    mulPoly ep_Q2_002_coefficient_21_0409
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0410 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 410 for generator 21. -/
def ep_Q2_002_partial_21_0410 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem ep_Q2_002_partial_21_0410_valid :
    mulPoly ep_Q2_002_coefficient_21_0410
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0411 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 411 for generator 21. -/
def ep_Q2_002_partial_21_0411 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem ep_Q2_002_partial_21_0411_valid :
    mulPoly ep_Q2_002_coefficient_21_0411
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0412 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 412 for generator 21. -/
def ep_Q2_002_partial_21_0412 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem ep_Q2_002_partial_21_0412_valid :
    mulPoly ep_Q2_002_coefficient_21_0412
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0413 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 413 for generator 21. -/
def ep_Q2_002_partial_21_0413 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem ep_Q2_002_partial_21_0413_valid :
    mulPoly ep_Q2_002_coefficient_21_0413
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0414 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 21. -/
def ep_Q2_002_partial_21_0414 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem ep_Q2_002_partial_21_0414_valid :
    mulPoly ep_Q2_002_coefficient_21_0414
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0415 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 415 for generator 21. -/
def ep_Q2_002_partial_21_0415 : Poly :=
[
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem ep_Q2_002_partial_21_0415_valid :
    mulPoly ep_Q2_002_coefficient_21_0415
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0416 : Poly :=
[
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 416 for generator 21. -/
def ep_Q2_002_partial_21_0416 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem ep_Q2_002_partial_21_0416_valid :
    mulPoly ep_Q2_002_coefficient_21_0416
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0417 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 21. -/
def ep_Q2_002_partial_21_0417 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem ep_Q2_002_partial_21_0417_valid :
    mulPoly ep_Q2_002_coefficient_21_0417
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0418 : Poly :=
[
  term ((15072546543577735066348598773830 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 418 for generator 21. -/
def ep_Q2_002_partial_21_0418 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-15072546543577735066348598773830 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem ep_Q2_002_partial_21_0418_valid :
    mulPoly ep_Q2_002_coefficient_21_0418
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0419 : Poly :=
[
  term ((-108603737153270495894694982609368 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 419 for generator 21. -/
def ep_Q2_002_partial_21_0419 : Poly :=
[
  term ((-217207474306540991789389965218736 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((108603737153270495894694982609368 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem ep_Q2_002_partial_21_0419_valid :
    mulPoly ep_Q2_002_coefficient_21_0419
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0420 : Poly :=
[
  term ((204521175477120657158728770005856 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 420 for generator 21. -/
def ep_Q2_002_partial_21_0420 : Poly :=
[
  term ((409042350954241314317457540011712 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-204521175477120657158728770005856 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem ep_Q2_002_partial_21_0420_valid :
    mulPoly ep_Q2_002_coefficient_21_0420
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0421 : Poly :=
[
  term ((-487128489683780543568757820210714653480356 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 421 for generator 21. -/
def ep_Q2_002_partial_21_0421 : Poly :=
[
  term ((-974256979367561087137515640421429306960712 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((487128489683780543568757820210714653480356 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem ep_Q2_002_partial_21_0421_valid :
    mulPoly ep_Q2_002_coefficient_21_0421
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0422 : Poly :=
[
  term ((55755003337 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 21. -/
def ep_Q2_002_partial_21_0422 : Poly :=
[
  term ((111510006674 : Rat) / 7401317245) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55755003337 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem ep_Q2_002_partial_21_0422_valid :
    mulPoly ep_Q2_002_coefficient_21_0422
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0423 : Poly :=
[
  term ((-28384427804502114565840821582360 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 423 for generator 21. -/
def ep_Q2_002_partial_21_0423 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((28384427804502114565840821582360 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem ep_Q2_002_partial_21_0423_valid :
    mulPoly ep_Q2_002_coefficient_21_0423
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0424 : Poly :=
[
  term ((-469126057245949958549290073335566595877823 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 424 for generator 21. -/
def ep_Q2_002_partial_21_0424 : Poly :=
[
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((469126057245949958549290073335566595877823 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem ep_Q2_002_partial_21_0424_valid :
    mulPoly ep_Q2_002_coefficient_21_0424
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0425 : Poly :=
[
  term ((-38126575709 : Rat) / 12687972420) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 21. -/
def ep_Q2_002_partial_21_0425 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((38126575709 : Rat) / 12687972420) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem ep_Q2_002_partial_21_0425_valid :
    mulPoly ep_Q2_002_coefficient_21_0425
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0426 : Poly :=
[
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 426 for generator 21. -/
def ep_Q2_002_partial_21_0426 : Poly :=
[
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem ep_Q2_002_partial_21_0426_valid :
    mulPoly ep_Q2_002_coefficient_21_0426
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0427 : Poly :=
[
  term ((-1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 427 for generator 21. -/
def ep_Q2_002_partial_21_0427 : Poly :=
[
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem ep_Q2_002_partial_21_0427_valid :
    mulPoly ep_Q2_002_coefficient_21_0427
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0428 : Poly :=
[
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 21. -/
def ep_Q2_002_partial_21_0428 : Poly :=
[
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem ep_Q2_002_partial_21_0428_valid :
    mulPoly ep_Q2_002_coefficient_21_0428
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0429 : Poly :=
[
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 429 for generator 21. -/
def ep_Q2_002_partial_21_0429 : Poly :=
[
  term ((637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem ep_Q2_002_partial_21_0429_valid :
    mulPoly ep_Q2_002_coefficient_21_0429
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0430 : Poly :=
[
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 430 for generator 21. -/
def ep_Q2_002_partial_21_0430 : Poly :=
[
  term ((338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem ep_Q2_002_partial_21_0430_valid :
    mulPoly ep_Q2_002_coefficient_21_0430
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0431 : Poly :=
[
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 431 for generator 21. -/
def ep_Q2_002_partial_21_0431 : Poly :=
[
  term ((-637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem ep_Q2_002_partial_21_0431_valid :
    mulPoly ep_Q2_002_coefficient_21_0431
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0432 : Poly :=
[
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 432 for generator 21. -/
def ep_Q2_002_partial_21_0432 : Poly :=
[
  term ((2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem ep_Q2_002_partial_21_0432_valid :
    mulPoly ep_Q2_002_coefficient_21_0432
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0433 : Poly :=
[
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 21. -/
def ep_Q2_002_partial_21_0433 : Poly :=
[
  term ((-149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem ep_Q2_002_partial_21_0433_valid :
    mulPoly ep_Q2_002_coefficient_21_0433
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0434 : Poly :=
[
  term ((2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 434 for generator 21. -/
def ep_Q2_002_partial_21_0434 : Poly :=
[
  term ((-2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem ep_Q2_002_partial_21_0434_valid :
    mulPoly ep_Q2_002_coefficient_21_0434
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0435 : Poly :=
[
  term ((-197237093984478261764487410571104634607032 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 435 for generator 21. -/
def ep_Q2_002_partial_21_0435 : Poly :=
[
  term ((197237093984478261764487410571104634607032 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-394474187968956523528974821142209269214064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem ep_Q2_002_partial_21_0435_valid :
    mulPoly ep_Q2_002_coefficient_21_0435
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0436 : Poly :=
[
  term ((-23376236546 : Rat) / 7401317245) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 21. -/
def ep_Q2_002_partial_21_0436 : Poly :=
[
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem ep_Q2_002_partial_21_0436_valid :
    mulPoly ep_Q2_002_coefficient_21_0436
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0437 : Poly :=
[
  term ((-4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 437 for generator 21. -/
def ep_Q2_002_partial_21_0437 : Poly :=
[
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (13, 2)],
  term ((-8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem ep_Q2_002_partial_21_0437_valid :
    mulPoly ep_Q2_002_coefficient_21_0437
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0438 : Poly :=
[
  term ((4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 438 for generator 21. -/
def ep_Q2_002_partial_21_0438 : Poly :=
[
  term ((8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem ep_Q2_002_partial_21_0438_valid :
    mulPoly ep_Q2_002_coefficient_21_0438
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0439 : Poly :=
[
  term ((174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 21. -/
def ep_Q2_002_partial_21_0439 : Poly :=
[
  term ((349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem ep_Q2_002_partial_21_0439_valid :
    mulPoly ep_Q2_002_coefficient_21_0439
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0440 : Poly :=
[
  term ((23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 21. -/
def ep_Q2_002_partial_21_0440 : Poly :=
[
  term ((46752473092 : Rat) / 7401317245) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem ep_Q2_002_partial_21_0440_valid :
    mulPoly ep_Q2_002_coefficient_21_0440
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0441 : Poly :=
[
  term ((1086690892813513945710757075512 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 441 for generator 21. -/
def ep_Q2_002_partial_21_0441 : Poly :=
[
  term ((2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1086690892813513945710757075512 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem ep_Q2_002_partial_21_0441_valid :
    mulPoly ep_Q2_002_coefficient_21_0441
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0442 : Poly :=
[
  term ((-2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (12, 1)]
]

/-- Partial product 442 for generator 21. -/
def ep_Q2_002_partial_21_0442 : Poly :=
[
  term ((-4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 2), (12, 1)],
  term ((2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem ep_Q2_002_partial_21_0442_valid :
    mulPoly ep_Q2_002_coefficient_21_0442
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0443 : Poly :=
[
  term ((40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 443 for generator 21. -/
def ep_Q2_002_partial_21_0443 : Poly :=
[
  term ((80033692872202936892551497694464 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem ep_Q2_002_partial_21_0443_valid :
    mulPoly ep_Q2_002_coefficient_21_0443
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0444 : Poly :=
[
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 444 for generator 21. -/
def ep_Q2_002_partial_21_0444 : Poly :=
[
  term ((-624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem ep_Q2_002_partial_21_0444_valid :
    mulPoly ep_Q2_002_coefficient_21_0444
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0445 : Poly :=
[
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 445 for generator 21. -/
def ep_Q2_002_partial_21_0445 : Poly :=
[
  term ((10261853432 : Rat) / 7401317245) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem ep_Q2_002_partial_21_0445_valid :
    mulPoly ep_Q2_002_coefficient_21_0445
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0446 : Poly :=
[
  term ((-98618546992239130882243705285552317303516 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 446 for generator 21. -/
def ep_Q2_002_partial_21_0446 : Poly :=
[
  term ((-197237093984478261764487410571104634607032 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((98618546992239130882243705285552317303516 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem ep_Q2_002_partial_21_0446_valid :
    mulPoly ep_Q2_002_coefficient_21_0446
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0447 : Poly :=
[
  term ((-11688118273 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 21. -/
def ep_Q2_002_partial_21_0447 : Poly :=
[
  term ((-23376236546 : Rat) / 7401317245) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11688118273 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem ep_Q2_002_partial_21_0447_valid :
    mulPoly ep_Q2_002_coefficient_21_0447
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0448 : Poly :=
[
  term ((-2046442457729077505382210043104 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)]
]

/-- Partial product 448 for generator 21. -/
def ep_Q2_002_partial_21_0448 : Poly :=
[
  term ((-4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (13, 2)],
  term ((2046442457729077505382210043104 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem ep_Q2_002_partial_21_0448_valid :
    mulPoly ep_Q2_002_coefficient_21_0448
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0449 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 449 for generator 21. -/
def ep_Q2_002_partial_21_0449 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem ep_Q2_002_partial_21_0449_valid :
    mulPoly ep_Q2_002_coefficient_21_0449
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0450 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 450 for generator 21. -/
def ep_Q2_002_partial_21_0450 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem ep_Q2_002_partial_21_0450_valid :
    mulPoly ep_Q2_002_coefficient_21_0450
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0451 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 21. -/
def ep_Q2_002_partial_21_0451 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem ep_Q2_002_partial_21_0451_valid :
    mulPoly ep_Q2_002_coefficient_21_0451
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0452 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

/-- Partial product 452 for generator 21. -/
def ep_Q2_002_partial_21_0452 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem ep_Q2_002_partial_21_0452_valid :
    mulPoly ep_Q2_002_coefficient_21_0452
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0453 : Poly :=
[
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 453 for generator 21. -/
def ep_Q2_002_partial_21_0453 : Poly :=
[
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem ep_Q2_002_partial_21_0453_valid :
    mulPoly ep_Q2_002_coefficient_21_0453
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0454 : Poly :=
[
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 454 for generator 21. -/
def ep_Q2_002_partial_21_0454 : Poly :=
[
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem ep_Q2_002_partial_21_0454_valid :
    mulPoly ep_Q2_002_coefficient_21_0454
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0455 : Poly :=
[
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 455 for generator 21. -/
def ep_Q2_002_partial_21_0455 : Poly :=
[
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem ep_Q2_002_partial_21_0455_valid :
    mulPoly ep_Q2_002_coefficient_21_0455
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0456 : Poly :=
[
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 21. -/
def ep_Q2_002_partial_21_0456 : Poly :=
[
  term ((-15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem ep_Q2_002_partial_21_0456_valid :
    mulPoly ep_Q2_002_coefficient_21_0456
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0457 : Poly :=
[
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 457 for generator 21. -/
def ep_Q2_002_partial_21_0457 : Poly :=
[
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem ep_Q2_002_partial_21_0457_valid :
    mulPoly ep_Q2_002_coefficient_21_0457
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0458 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 458 for generator 21. -/
def ep_Q2_002_partial_21_0458 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem ep_Q2_002_partial_21_0458_valid :
    mulPoly ep_Q2_002_coefficient_21_0458
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0459 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 459 for generator 21. -/
def ep_Q2_002_partial_21_0459 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem ep_Q2_002_partial_21_0459_valid :
    mulPoly ep_Q2_002_coefficient_21_0459
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0460 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 460 for generator 21. -/
def ep_Q2_002_partial_21_0460 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem ep_Q2_002_partial_21_0460_valid :
    mulPoly ep_Q2_002_coefficient_21_0460
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0461 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 461 for generator 21. -/
def ep_Q2_002_partial_21_0461 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem ep_Q2_002_partial_21_0461_valid :
    mulPoly ep_Q2_002_coefficient_21_0461
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0462 : Poly :=
[
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 462 for generator 21. -/
def ep_Q2_002_partial_21_0462 : Poly :=
[
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem ep_Q2_002_partial_21_0462_valid :
    mulPoly ep_Q2_002_coefficient_21_0462
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0463 : Poly :=
[
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 463 for generator 21. -/
def ep_Q2_002_partial_21_0463 : Poly :=
[
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem ep_Q2_002_partial_21_0463_valid :
    mulPoly ep_Q2_002_coefficient_21_0463
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0464 : Poly :=
[
  term ((7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 21. -/
def ep_Q2_002_partial_21_0464 : Poly :=
[
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem ep_Q2_002_partial_21_0464_valid :
    mulPoly ep_Q2_002_coefficient_21_0464
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0465 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 465 for generator 21. -/
def ep_Q2_002_partial_21_0465 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem ep_Q2_002_partial_21_0465_valid :
    mulPoly ep_Q2_002_coefficient_21_0465
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0466 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 466 for generator 21. -/
def ep_Q2_002_partial_21_0466 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 21. -/
theorem ep_Q2_002_partial_21_0466_valid :
    mulPoly ep_Q2_002_coefficient_21_0466
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0467 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 1), (15, 2)]
]

/-- Partial product 467 for generator 21. -/
def ep_Q2_002_partial_21_0467 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 21. -/
theorem ep_Q2_002_partial_21_0467_valid :
    mulPoly ep_Q2_002_coefficient_21_0467
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0468 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 21. -/
def ep_Q2_002_partial_21_0468 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 21. -/
theorem ep_Q2_002_partial_21_0468_valid :
    mulPoly ep_Q2_002_coefficient_21_0468
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0469 : Poly :=
[
  term ((-14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 469 for generator 21. -/
def ep_Q2_002_partial_21_0469 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 21. -/
theorem ep_Q2_002_partial_21_0469_valid :
    mulPoly ep_Q2_002_coefficient_21_0469
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0470 : Poly :=
[
  term ((27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 470 for generator 21. -/
def ep_Q2_002_partial_21_0470 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 21. -/
theorem ep_Q2_002_partial_21_0470_valid :
    mulPoly ep_Q2_002_coefficient_21_0470
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0471 : Poly :=
[
  term ((-119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 471 for generator 21. -/
def ep_Q2_002_partial_21_0471 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term ((119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 21. -/
theorem ep_Q2_002_partial_21_0471_valid :
    mulPoly ep_Q2_002_coefficient_21_0471
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0472 : Poly :=
[
  term ((-7782778567 : Rat) / 8881580694) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 472 for generator 21. -/
def ep_Q2_002_partial_21_0472 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 8881580694) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 21. -/
theorem ep_Q2_002_partial_21_0472_valid :
    mulPoly ep_Q2_002_coefficient_21_0472
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0473 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (11, 1)]
]

/-- Partial product 473 for generator 21. -/
def ep_Q2_002_partial_21_0473 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 21. -/
theorem ep_Q2_002_partial_21_0473_valid :
    mulPoly ep_Q2_002_coefficient_21_0473
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0474 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (13, 1)]
]

/-- Partial product 474 for generator 21. -/
def ep_Q2_002_partial_21_0474 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 21. -/
theorem ep_Q2_002_partial_21_0474_valid :
    mulPoly ep_Q2_002_coefficient_21_0474
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0475 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 1), (15, 1)]
]

/-- Partial product 475 for generator 21. -/
def ep_Q2_002_partial_21_0475 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 21. -/
theorem ep_Q2_002_partial_21_0475_valid :
    mulPoly ep_Q2_002_coefficient_21_0475
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0476 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 21. -/
def ep_Q2_002_partial_21_0476 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 21. -/
theorem ep_Q2_002_partial_21_0476_valid :
    mulPoly ep_Q2_002_coefficient_21_0476
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0477 : Poly :=
[
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 477 for generator 21. -/
def ep_Q2_002_partial_21_0477 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (11, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 21. -/
theorem ep_Q2_002_partial_21_0477_valid :
    mulPoly ep_Q2_002_coefficient_21_0477
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0478 : Poly :=
[
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 478 for generator 21. -/
def ep_Q2_002_partial_21_0478 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 21. -/
theorem ep_Q2_002_partial_21_0478_valid :
    mulPoly ep_Q2_002_coefficient_21_0478
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0479 : Poly :=
[
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 479 for generator 21. -/
def ep_Q2_002_partial_21_0479 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 21. -/
theorem ep_Q2_002_partial_21_0479_valid :
    mulPoly ep_Q2_002_coefficient_21_0479
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0480 : Poly :=
[
  term ((190895317587 : Rat) / 14802634490) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 21. -/
def ep_Q2_002_partial_21_0480 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 21. -/
theorem ep_Q2_002_partial_21_0480_valid :
    mulPoly ep_Q2_002_coefficient_21_0480
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0481 : Poly :=
[
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 481 for generator 21. -/
def ep_Q2_002_partial_21_0481 : Poly :=
[
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 21. -/
theorem ep_Q2_002_partial_21_0481_valid :
    mulPoly ep_Q2_002_coefficient_21_0481
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0482 : Poly :=
[
  term ((-6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 482 for generator 21. -/
def ep_Q2_002_partial_21_0482 : Poly :=
[
  term ((-13190657464854546693661712273472 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 21. -/
theorem ep_Q2_002_partial_21_0482_valid :
    mulPoly ep_Q2_002_coefficient_21_0482
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0483 : Poly :=
[
  term ((-50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 483 for generator 21. -/
def ep_Q2_002_partial_21_0483 : Poly :=
[
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 21. -/
theorem ep_Q2_002_partial_21_0483_valid :
    mulPoly ep_Q2_002_coefficient_21_0483
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0484 : Poly :=
[
  term ((-1824530983 : Rat) / 1480263449) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 21. -/
def ep_Q2_002_partial_21_0484 : Poly :=
[
  term ((-3649061966 : Rat) / 1480263449) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1824530983 : Rat) / 1480263449) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 21. -/
theorem ep_Q2_002_partial_21_0484_valid :
    mulPoly ep_Q2_002_coefficient_21_0484
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0485 : Poly :=
[
  term ((-2289757678563528015948 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 485 for generator 21. -/
def ep_Q2_002_partial_21_0485 : Poly :=
[
  term ((2289757678563528015948 : Rat) / 253528477699481291099) [(6, 1)],
  term ((-4579515357127056031896 : Rat) / 253528477699481291099) [(6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 21. -/
theorem ep_Q2_002_partial_21_0485_valid :
    mulPoly ep_Q2_002_coefficient_21_0485
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0486 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 486 for generator 21. -/
def ep_Q2_002_partial_21_0486 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 21. -/
theorem ep_Q2_002_partial_21_0486_valid :
    mulPoly ep_Q2_002_coefficient_21_0486
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0487 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 487 for generator 21. -/
def ep_Q2_002_partial_21_0487 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 21. -/
theorem ep_Q2_002_partial_21_0487_valid :
    mulPoly ep_Q2_002_coefficient_21_0487
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0488 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 21. -/
def ep_Q2_002_partial_21_0488 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 21. -/
theorem ep_Q2_002_partial_21_0488_valid :
    mulPoly ep_Q2_002_coefficient_21_0488
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0489 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

/-- Partial product 489 for generator 21. -/
def ep_Q2_002_partial_21_0489 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 21. -/
theorem ep_Q2_002_partial_21_0489_valid :
    mulPoly ep_Q2_002_coefficient_21_0489
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0490 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 490 for generator 21. -/
def ep_Q2_002_partial_21_0490 : Poly :=
[
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 21. -/
theorem ep_Q2_002_partial_21_0490_valid :
    mulPoly ep_Q2_002_coefficient_21_0490
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0491 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 491 for generator 21. -/
def ep_Q2_002_partial_21_0491 : Poly :=
[
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 21. -/
theorem ep_Q2_002_partial_21_0491_valid :
    mulPoly ep_Q2_002_coefficient_21_0491
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0492 : Poly :=
[
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 492 for generator 21. -/
def ep_Q2_002_partial_21_0492 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 21. -/
theorem ep_Q2_002_partial_21_0492_valid :
    mulPoly ep_Q2_002_coefficient_21_0492
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0493 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 493 for generator 21. -/
def ep_Q2_002_partial_21_0493 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 21. -/
theorem ep_Q2_002_partial_21_0493_valid :
    mulPoly ep_Q2_002_coefficient_21_0493
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0494 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 494 for generator 21. -/
def ep_Q2_002_partial_21_0494 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 21. -/
theorem ep_Q2_002_partial_21_0494_valid :
    mulPoly ep_Q2_002_coefficient_21_0494
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0495 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 495 for generator 21. -/
def ep_Q2_002_partial_21_0495 : Poly :=
[
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 21. -/
theorem ep_Q2_002_partial_21_0495_valid :
    mulPoly ep_Q2_002_coefficient_21_0495
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0496 : Poly :=
[
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 496 for generator 21. -/
def ep_Q2_002_partial_21_0496 : Poly :=
[
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 21. -/
theorem ep_Q2_002_partial_21_0496_valid :
    mulPoly ep_Q2_002_coefficient_21_0496
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0497 : Poly :=
[
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 21. -/
def ep_Q2_002_partial_21_0497 : Poly :=
[
  term ((-25096887488 : Rat) / 7401317245) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 21. -/
theorem ep_Q2_002_partial_21_0497_valid :
    mulPoly ep_Q2_002_coefficient_21_0497
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0498 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 498 for generator 21. -/
def ep_Q2_002_partial_21_0498 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 21. -/
theorem ep_Q2_002_partial_21_0498_valid :
    mulPoly ep_Q2_002_coefficient_21_0498
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0499 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 499 for generator 21. -/
def ep_Q2_002_partial_21_0499 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 21. -/
theorem ep_Q2_002_partial_21_0499_valid :
    mulPoly ep_Q2_002_coefficient_21_0499
        ep_Q2_002_generator_21_0400_0499 =
      ep_Q2_002_partial_21_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0400_0499 : List Poly :=
[
  ep_Q2_002_partial_21_0400,
  ep_Q2_002_partial_21_0401,
  ep_Q2_002_partial_21_0402,
  ep_Q2_002_partial_21_0403,
  ep_Q2_002_partial_21_0404,
  ep_Q2_002_partial_21_0405,
  ep_Q2_002_partial_21_0406,
  ep_Q2_002_partial_21_0407,
  ep_Q2_002_partial_21_0408,
  ep_Q2_002_partial_21_0409,
  ep_Q2_002_partial_21_0410,
  ep_Q2_002_partial_21_0411,
  ep_Q2_002_partial_21_0412,
  ep_Q2_002_partial_21_0413,
  ep_Q2_002_partial_21_0414,
  ep_Q2_002_partial_21_0415,
  ep_Q2_002_partial_21_0416,
  ep_Q2_002_partial_21_0417,
  ep_Q2_002_partial_21_0418,
  ep_Q2_002_partial_21_0419,
  ep_Q2_002_partial_21_0420,
  ep_Q2_002_partial_21_0421,
  ep_Q2_002_partial_21_0422,
  ep_Q2_002_partial_21_0423,
  ep_Q2_002_partial_21_0424,
  ep_Q2_002_partial_21_0425,
  ep_Q2_002_partial_21_0426,
  ep_Q2_002_partial_21_0427,
  ep_Q2_002_partial_21_0428,
  ep_Q2_002_partial_21_0429,
  ep_Q2_002_partial_21_0430,
  ep_Q2_002_partial_21_0431,
  ep_Q2_002_partial_21_0432,
  ep_Q2_002_partial_21_0433,
  ep_Q2_002_partial_21_0434,
  ep_Q2_002_partial_21_0435,
  ep_Q2_002_partial_21_0436,
  ep_Q2_002_partial_21_0437,
  ep_Q2_002_partial_21_0438,
  ep_Q2_002_partial_21_0439,
  ep_Q2_002_partial_21_0440,
  ep_Q2_002_partial_21_0441,
  ep_Q2_002_partial_21_0442,
  ep_Q2_002_partial_21_0443,
  ep_Q2_002_partial_21_0444,
  ep_Q2_002_partial_21_0445,
  ep_Q2_002_partial_21_0446,
  ep_Q2_002_partial_21_0447,
  ep_Q2_002_partial_21_0448,
  ep_Q2_002_partial_21_0449,
  ep_Q2_002_partial_21_0450,
  ep_Q2_002_partial_21_0451,
  ep_Q2_002_partial_21_0452,
  ep_Q2_002_partial_21_0453,
  ep_Q2_002_partial_21_0454,
  ep_Q2_002_partial_21_0455,
  ep_Q2_002_partial_21_0456,
  ep_Q2_002_partial_21_0457,
  ep_Q2_002_partial_21_0458,
  ep_Q2_002_partial_21_0459,
  ep_Q2_002_partial_21_0460,
  ep_Q2_002_partial_21_0461,
  ep_Q2_002_partial_21_0462,
  ep_Q2_002_partial_21_0463,
  ep_Q2_002_partial_21_0464,
  ep_Q2_002_partial_21_0465,
  ep_Q2_002_partial_21_0466,
  ep_Q2_002_partial_21_0467,
  ep_Q2_002_partial_21_0468,
  ep_Q2_002_partial_21_0469,
  ep_Q2_002_partial_21_0470,
  ep_Q2_002_partial_21_0471,
  ep_Q2_002_partial_21_0472,
  ep_Q2_002_partial_21_0473,
  ep_Q2_002_partial_21_0474,
  ep_Q2_002_partial_21_0475,
  ep_Q2_002_partial_21_0476,
  ep_Q2_002_partial_21_0477,
  ep_Q2_002_partial_21_0478,
  ep_Q2_002_partial_21_0479,
  ep_Q2_002_partial_21_0480,
  ep_Q2_002_partial_21_0481,
  ep_Q2_002_partial_21_0482,
  ep_Q2_002_partial_21_0483,
  ep_Q2_002_partial_21_0484,
  ep_Q2_002_partial_21_0485,
  ep_Q2_002_partial_21_0486,
  ep_Q2_002_partial_21_0487,
  ep_Q2_002_partial_21_0488,
  ep_Q2_002_partial_21_0489,
  ep_Q2_002_partial_21_0490,
  ep_Q2_002_partial_21_0491,
  ep_Q2_002_partial_21_0492,
  ep_Q2_002_partial_21_0493,
  ep_Q2_002_partial_21_0494,
  ep_Q2_002_partial_21_0495,
  ep_Q2_002_partial_21_0496,
  ep_Q2_002_partial_21_0497,
  ep_Q2_002_partial_21_0498,
  ep_Q2_002_partial_21_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0400_0499 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((253085158164393870954569079260832 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((38126575709 : Rat) / 3171993105) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 2)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (11, 2), (12, 1)],
  term ((29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1042425392 : Rat) / 211466207) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126542579082196935477284539630416 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)],
  term ((-14627876544464773848291636365666342162304 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((521212696 : Rat) / 211466207) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((131396987950917900706007340412032 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2)],
  term ((-139547446946385412691205792931392 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((262793975901835801412014680824064 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-29255753088929547696583272731332684324608 : Rat) / 20720280269543423485940727223906556423) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((1042425392 : Rat) / 211466207) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (11, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (11, 1), (12, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15072546543577735066348598773830 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)],
  term ((108603737153270495894694982609368 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-204521175477120657158728770005856 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((487128489683780543568757820210714653480356 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-55755003337 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((28384427804502114565840821582360 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)],
  term ((469126057245949958549290073335566595877823 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)],
  term ((38126575709 : Rat) / 12687972420) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((149259858532 : Rat) / 7401317245) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-74629929266 : Rat) / 7401317245) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 2)],
  term ((338680522729997958906834581023776 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-637798849612229438420645984395392 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((2477913165278133887925500974999207767905616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-149259858532 : Rat) / 7401317245) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-169340261364998979453417290511888 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((318899424806114719210322992197696 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1238956582639066943962750487499603883952808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((74629929266 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((349538610617435591762078401781936804071344 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((46752473092 : Rat) / 7401317245) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 1), (11, 2), (12, 1)],
  term ((80033692872202936892551497694464 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((10261853432 : Rat) / 7401317245) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((4346763571254055782843028302048 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-394474187968956523528974821142209269214064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((-46752473092 : Rat) / 7401317245) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8185769830916310021528840172416 : Rat) / 97983883872014706756151952089) [(4, 1), (10, 2), (13, 2)],
  term ((-4092884915458155010764420086208 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-174769305308717795881039200890968402035672 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-23376236546 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1086690892813513945710757075512 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)],
  term ((2173381785627027891421514151024 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 2), (12, 1)],
  term ((-40016846436101468446275748847232 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((98618546992239130882243705285552317303516 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)],
  term ((11688118273 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2046442457729077505382210043104 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((159989129439973440448059311304960 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((154567616930976171897595590284548713713184 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-79994564719986720224029655652480 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)],
  term ((-77283808465488085948797795142274356856592 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (15, 2)],
  term ((7782778567 : Rat) / 8881580694) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 2), (15, 1), (16, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 1)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (13, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (15, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-13190657464854546693661712273472 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-101929518266445380750817348534094409933064 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3649061966 : Rat) / 1480263449) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)],
  term ((6595328732427273346830856136736 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)],
  term ((50964759133222690375408674267047204966532 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (12, 1), (15, 1)],
  term ((1824530983 : Rat) / 1480263449) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2289757678563528015948 : Rat) / 253528477699481291099) [(6, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-25096887488 : Rat) / 7401317245) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (11, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(6, 1), (7, 1), (13, 1)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (7, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-4579515357127056031896 : Rat) / 253528477699481291099) [(6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 499. -/
theorem ep_Q2_002_block_21_0400_0499_valid :
    checkProductSumEq ep_Q2_002_partials_21_0400_0499
      ep_Q2_002_block_21_0400_0499 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
