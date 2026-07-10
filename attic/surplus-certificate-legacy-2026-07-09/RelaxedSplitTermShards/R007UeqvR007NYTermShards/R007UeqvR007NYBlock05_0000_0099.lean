/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 5:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_05_0000_0099 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0000 : Poly :=
[
  term ((-152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0000 : Poly :=
[
  term ((304549338756184391700 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-304549338756184391700 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0000
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0001 : Poly :=
[
  term ((91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0001 : Poly :=
[
  term ((-182729603253710635020 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((182729603253710635020 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0001
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0002 : Poly :=
[
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0002 : Poly :=
[
  term ((35501262187293538739735 : Rat) / 134970459582806311401) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 134970459582806311401) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0002
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0003 : Poly :=
[
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0003 : Poly :=
[
  term ((-7100252437458707747947 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0003
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0004 : Poly :=
[
  term ((-19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0004 : Poly :=
[
  term ((38599379348915850502900 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-38599379348915850502900 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0004
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0005 : Poly :=
[
  term ((3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0005 : Poly :=
[
  term ((-7719875869783170100580 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((7719875869783170100580 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0005
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0006 : Poly :=
[
  term ((-442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0006 : Poly :=
[
  term ((442808366376855680094475 : Rat) / 179960612777075081868) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 179960612777075081868) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0006
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0007 : Poly :=
[
  term ((88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0007 : Poly :=
[
  term ((-88561673275371136018895 : Rat) / 59986870925691693956) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((88561673275371136018895 : Rat) / 59986870925691693956) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0007
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0008 : Poly :=
[
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0008 : Poly :=
[
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0008
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0009 : Poly :=
[
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0009 : Poly :=
[
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0009
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0010 : Poly :=
[
  term ((34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0010 : Poly :=
[
  term ((-34760959411204496584085 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((34760959411204496584085 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0010
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0011 : Poly :=
[
  term ((1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0011 : Poly :=
[
  term ((-1098047939656878846686465 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 314931072359881393269) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0011
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0012 : Poly :=
[
  term ((-9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 12 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0012 : Poly :=
[
  term ((9159985890989527269101375 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0012
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0013 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 13 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0013 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0013
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0014 : Poly :=
[
  term ((-6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0014 : Poly :=
[
  term ((6952191882240899316817 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 209954048239920928846) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0014
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0015 : Poly :=
[
  term ((-72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 15 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0015 : Poly :=
[
  term ((72819740223170447910531 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 209954048239920928846) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0015
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0016 : Poly :=
[
  term ((-1 : Rat) / 2) [(0, 1), (16, 1)]
]

/-- Partial product 16 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0016 : Poly :=
[
  term (1 : Rat) [(0, 1), (6, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (6, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (7, 2), (16, 1)],
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0016
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0017 : Poly :=
[
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0017 : Poly :=
[
  term ((-35501262187293538739735 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0017
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0018 : Poly :=
[
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0018 : Poly :=
[
  term ((7100252437458707747947 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0018
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0019 : Poly :=
[
  term ((170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0019 : Poly :=
[
  term ((-341777168842191765042400 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((341777168842191765042400 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0019
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0020 : Poly :=
[
  term ((-34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0020 : Poly :=
[
  term ((68355433768438353008480 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-68355433768438353008480 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0020
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0021 : Poly :=
[
  term (-3 : Rat) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0021 : Poly :=
[
  term (6 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0021
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0022 : Poly :=
[
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0022 : Poly :=
[
  term ((70604046413259990682270 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-70604046413259990682270 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0022
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0023 : Poly :=
[
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0023 : Poly :=
[
  term ((-14120809282651998136454 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((14120809282651998136454 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0023
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0024 : Poly :=
[
  term ((10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0024 : Poly :=
[
  term ((-10477765967021812305995 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((10477765967021812305995 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0024
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0025 : Poly :=
[
  term ((-2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0025 : Poly :=
[
  term ((2095553193404362461199 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0025
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0026 : Poly :=
[
  term ((511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 26 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0026 : Poly :=
[
  term ((-511086862366821734740205 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((511086862366821734740205 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0026
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0027 : Poly :=
[
  term ((349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0027 : Poly :=
[
  term ((-349762794204218270654465 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((349762794204218270654465 : Rat) / 209954048239920928846) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0027
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0028 : Poly :=
[
  term ((-30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0028 : Poly :=
[
  term ((30948933887167328739868949 : Rat) / 7558345736637153438456) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0028
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0029 : Poly :=
[
  term ((-102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0029 : Poly :=
[
  term ((102217372473364346948041 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 629862144719762786538) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0029
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0030 : Poly :=
[
  term ((-2 : Rat) / 3) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0030 : Poly :=
[
  term ((4 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0030
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0031 : Poly :=
[
  term ((-209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0031 : Poly :=
[
  term ((209857676522530962392679 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-209857676522530962392679 : Rat) / 209954048239920928846) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0031
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0032 : Poly :=
[
  term ((6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0032 : Poly :=
[
  term ((-6193817895159672229807633 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 2519448578879051146152) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0032
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0033 : Poly :=
[
  term (2 : Rat) [(1, 2), (16, 1)]
]

/-- Partial product 33 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0033 : Poly :=
[
  term (-4 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0033
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0034 : Poly :=
[
  term ((280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0034 : Poly :=
[
  term ((-561589733267493419508640 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((561589733267493419508640 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0034
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0035 : Poly :=
[
  term ((-56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0035 : Poly :=
[
  term ((112317946653498683901728 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-112317946653498683901728 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0035
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0036 : Poly :=
[
  term ((1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0036 : Poly :=
[
  term ((-1043404632325470128958905 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0036
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0037 : Poly :=
[
  term ((-208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0037 : Poly :=
[
  term ((208680926465094025791781 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0037
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0038 : Poly :=
[
  term ((-881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0038 : Poly :=
[
  term ((881299264694850962502335 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 1889586434159288359614) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0038
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0039 : Poly :=
[
  term ((176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0039 : Poly :=
[
  term ((-176259852938970192500467 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((176259852938970192500467 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0039
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0040 : Poly :=
[
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0040 : Poly :=
[
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0040
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0041 : Poly :=
[
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0041 : Poly :=
[
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0041
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0042 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0042 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0042
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0043 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0043 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0043
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0044 : Poly :=
[
  term ((-386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0044 : Poly :=
[
  term ((386923877530963947968015 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0044
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0045 : Poly :=
[
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0045 : Poly :=
[
  term ((29672791633574867272400 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-29672791633574867272400 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0045
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0046 : Poly :=
[
  term ((9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0046 : Poly :=
[
  term ((-9347525943085638639937 : Rat) / 38562988452230374686) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((9347525943085638639937 : Rat) / 38562988452230374686) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0046
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0047 : Poly :=
[
  term ((-948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 47 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0047 : Poly :=
[
  term ((948357324383882436475315 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0047
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0048 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0048 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0048
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0049 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0049 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0049
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0050 : Poly :=
[
  term ((77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0050 : Poly :=
[
  term ((-77384775506192789593603 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((77384775506192789593603 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0050
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0051 : Poly :=
[
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0051 : Poly :=
[
  term ((-5934558326714973454480 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((5934558326714973454480 : Rat) / 104977024119960464423) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0051
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0052 : Poly :=
[
  term ((2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 52 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0052 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0052
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0053 : Poly :=
[
  term ((136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0053 : Poly :=
[
  term ((-136000003609892526082693 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((136000003609892526082693 : Rat) / 629862144719762786538) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0053
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0054 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (16, 1)]
]

/-- Partial product 54 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0054 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0054
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0055 : Poly :=
[
  term ((-1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0055 : Poly :=
[
  term ((1679658273241643596741025 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0055
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0056 : Poly :=
[
  term ((335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0056 : Poly :=
[
  term ((-335931654648328719348205 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((335931654648328719348205 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0056
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0057 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 57 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0057 : Poly :=
[
  term ((8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0057
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0058 : Poly :=
[
  term ((55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0058 : Poly :=
[
  term ((-55660614060125783387645 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((55660614060125783387645 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0058
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0059 : Poly :=
[
  term ((-11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0059 : Poly :=
[
  term ((11132122812025156677529 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0059
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0060 : Poly :=
[
  term ((381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0060 : Poly :=
[
  term ((-381577295945581842335975 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((381577295945581842335975 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0060
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0061 : Poly :=
[
  term ((-76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0061 : Poly :=
[
  term ((76315459189116368467195 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0061
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0062 : Poly :=
[
  term ((127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 62 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0062 : Poly :=
[
  term ((-127921076341247798753645 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((127921076341247798753645 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0062
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0063 : Poly :=
[
  term ((44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0063 : Poly :=
[
  term ((-89758124293800569228000 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((89758124293800569228000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0063
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0064 : Poly :=
[
  term ((2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 64 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0064 : Poly :=
[
  term ((-2174315313546901333365145 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2174315313546901333365145 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0064
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0065 : Poly :=
[
  term ((-83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 65 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0065 : Poly :=
[
  term ((167652652994873602936400 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-167652652994873602936400 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0065
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0066 : Poly :=
[
  term ((-2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0066 : Poly :=
[
  term ((2065388699830169708046625 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0066
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0067 : Poly :=
[
  term ((-25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0067 : Poly :=
[
  term ((25584215268249559750729 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0067
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0068 : Poly :=
[
  term ((-8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 68 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0068 : Poly :=
[
  term ((17951624858760113845600 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-17951624858760113845600 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0068
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0069 : Poly :=
[
  term ((-434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0069 : Poly :=
[
  term ((434863062709380266673029 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-434863062709380266673029 : Rat) / 629862144719762786538) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0069
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0070 : Poly :=
[
  term ((414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0070 : Poly :=
[
  term ((-414757372351953309040093 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((414757372351953309040093 : Rat) / 1259724289439525573076) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0070
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0071 : Poly :=
[
  term ((16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 71 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0071 : Poly :=
[
  term ((-33530530598974720587280 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((33530530598974720587280 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0071
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0072 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 72 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0072 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0072
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0073 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0073 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0073
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0074 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0074 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0074
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0075 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 75 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0075 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0075
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0076 : Poly :=
[
  term ((-1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0076 : Poly :=
[
  term ((1249546580680507412358235 : Rat) / 1889586434159288359614) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0076
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0077 : Poly :=
[
  term ((249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0077 : Poly :=
[
  term ((-249909316136101482471647 : Rat) / 629862144719762786538) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((249909316136101482471647 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0077
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0078 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0078 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0078
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0079 : Poly :=
[
  term ((89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0079 : Poly :=
[
  term ((-179787396201768595204250 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((179787396201768595204250 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0079
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0080 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0080 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0080
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0081 : Poly :=
[
  term ((260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0081 : Poly :=
[
  term ((-521346367139882408371018 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((521346367139882408371018 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0081
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0082 : Poly :=
[
  term ((-80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 82 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0082 : Poly :=
[
  term ((161879530552469192956030 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-161879530552469192956030 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0082
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0083 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0083 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0083
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0084 : Poly :=
[
  term ((-17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0084 : Poly :=
[
  term ((35957479240353719040850 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35957479240353719040850 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0084
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0085 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0085 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0085
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0086 : Poly :=
[
  term ((-42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0086 : Poly :=
[
  term ((84843729761680178519480 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-84843729761680178519480 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0086
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0087 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0087 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0087
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0088 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 88 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0088 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0088
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0089 : Poly :=
[
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 89 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0089 : Poly :=
[
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0089
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0090 : Poly :=
[
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0090 : Poly :=
[
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0090
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0091 : Poly :=
[
  term ((23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 91 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0091 : Poly :=
[
  term ((-46233757350863347661650 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((46233757350863347661650 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0091
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0092 : Poly :=
[
  term ((-13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0092 : Poly :=
[
  term ((27740254410518008596990 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-27740254410518008596990 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0092
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0093 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 93 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0093 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0093
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0094 : Poly :=
[
  term ((-95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 94 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0094 : Poly :=
[
  term ((190262590952555809296170 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-190262590952555809296170 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0094
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0095 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0095 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0095
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0096 : Poly :=
[
  term ((-2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 96 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0096 : Poly :=
[
  term ((5549791364061405166720 : Rat) / 6427164742038395781) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5549791364061405166720 : Rat) / 6427164742038395781) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0096
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0097 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0097 : Poly :=
[
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0097
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0098 : Poly :=
[
  term ((130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 98 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0098 : Poly :=
[
  term ((-130334159051280300519185 : Rat) / 1259724289439525573076) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((130334159051280300519185 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0098
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0099 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0099 : Poly :=
[
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0099
        rs_R007_ueqv_R007NY_generator_05_0000_0099 =
      rs_R007_ueqv_R007NY_partial_05_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_05_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_05_0000,
  rs_R007_ueqv_R007NY_partial_05_0001,
  rs_R007_ueqv_R007NY_partial_05_0002,
  rs_R007_ueqv_R007NY_partial_05_0003,
  rs_R007_ueqv_R007NY_partial_05_0004,
  rs_R007_ueqv_R007NY_partial_05_0005,
  rs_R007_ueqv_R007NY_partial_05_0006,
  rs_R007_ueqv_R007NY_partial_05_0007,
  rs_R007_ueqv_R007NY_partial_05_0008,
  rs_R007_ueqv_R007NY_partial_05_0009,
  rs_R007_ueqv_R007NY_partial_05_0010,
  rs_R007_ueqv_R007NY_partial_05_0011,
  rs_R007_ueqv_R007NY_partial_05_0012,
  rs_R007_ueqv_R007NY_partial_05_0013,
  rs_R007_ueqv_R007NY_partial_05_0014,
  rs_R007_ueqv_R007NY_partial_05_0015,
  rs_R007_ueqv_R007NY_partial_05_0016,
  rs_R007_ueqv_R007NY_partial_05_0017,
  rs_R007_ueqv_R007NY_partial_05_0018,
  rs_R007_ueqv_R007NY_partial_05_0019,
  rs_R007_ueqv_R007NY_partial_05_0020,
  rs_R007_ueqv_R007NY_partial_05_0021,
  rs_R007_ueqv_R007NY_partial_05_0022,
  rs_R007_ueqv_R007NY_partial_05_0023,
  rs_R007_ueqv_R007NY_partial_05_0024,
  rs_R007_ueqv_R007NY_partial_05_0025,
  rs_R007_ueqv_R007NY_partial_05_0026,
  rs_R007_ueqv_R007NY_partial_05_0027,
  rs_R007_ueqv_R007NY_partial_05_0028,
  rs_R007_ueqv_R007NY_partial_05_0029,
  rs_R007_ueqv_R007NY_partial_05_0030,
  rs_R007_ueqv_R007NY_partial_05_0031,
  rs_R007_ueqv_R007NY_partial_05_0032,
  rs_R007_ueqv_R007NY_partial_05_0033,
  rs_R007_ueqv_R007NY_partial_05_0034,
  rs_R007_ueqv_R007NY_partial_05_0035,
  rs_R007_ueqv_R007NY_partial_05_0036,
  rs_R007_ueqv_R007NY_partial_05_0037,
  rs_R007_ueqv_R007NY_partial_05_0038,
  rs_R007_ueqv_R007NY_partial_05_0039,
  rs_R007_ueqv_R007NY_partial_05_0040,
  rs_R007_ueqv_R007NY_partial_05_0041,
  rs_R007_ueqv_R007NY_partial_05_0042,
  rs_R007_ueqv_R007NY_partial_05_0043,
  rs_R007_ueqv_R007NY_partial_05_0044,
  rs_R007_ueqv_R007NY_partial_05_0045,
  rs_R007_ueqv_R007NY_partial_05_0046,
  rs_R007_ueqv_R007NY_partial_05_0047,
  rs_R007_ueqv_R007NY_partial_05_0048,
  rs_R007_ueqv_R007NY_partial_05_0049,
  rs_R007_ueqv_R007NY_partial_05_0050,
  rs_R007_ueqv_R007NY_partial_05_0051,
  rs_R007_ueqv_R007NY_partial_05_0052,
  rs_R007_ueqv_R007NY_partial_05_0053,
  rs_R007_ueqv_R007NY_partial_05_0054,
  rs_R007_ueqv_R007NY_partial_05_0055,
  rs_R007_ueqv_R007NY_partial_05_0056,
  rs_R007_ueqv_R007NY_partial_05_0057,
  rs_R007_ueqv_R007NY_partial_05_0058,
  rs_R007_ueqv_R007NY_partial_05_0059,
  rs_R007_ueqv_R007NY_partial_05_0060,
  rs_R007_ueqv_R007NY_partial_05_0061,
  rs_R007_ueqv_R007NY_partial_05_0062,
  rs_R007_ueqv_R007NY_partial_05_0063,
  rs_R007_ueqv_R007NY_partial_05_0064,
  rs_R007_ueqv_R007NY_partial_05_0065,
  rs_R007_ueqv_R007NY_partial_05_0066,
  rs_R007_ueqv_R007NY_partial_05_0067,
  rs_R007_ueqv_R007NY_partial_05_0068,
  rs_R007_ueqv_R007NY_partial_05_0069,
  rs_R007_ueqv_R007NY_partial_05_0070,
  rs_R007_ueqv_R007NY_partial_05_0071,
  rs_R007_ueqv_R007NY_partial_05_0072,
  rs_R007_ueqv_R007NY_partial_05_0073,
  rs_R007_ueqv_R007NY_partial_05_0074,
  rs_R007_ueqv_R007NY_partial_05_0075,
  rs_R007_ueqv_R007NY_partial_05_0076,
  rs_R007_ueqv_R007NY_partial_05_0077,
  rs_R007_ueqv_R007NY_partial_05_0078,
  rs_R007_ueqv_R007NY_partial_05_0079,
  rs_R007_ueqv_R007NY_partial_05_0080,
  rs_R007_ueqv_R007NY_partial_05_0081,
  rs_R007_ueqv_R007NY_partial_05_0082,
  rs_R007_ueqv_R007NY_partial_05_0083,
  rs_R007_ueqv_R007NY_partial_05_0084,
  rs_R007_ueqv_R007NY_partial_05_0085,
  rs_R007_ueqv_R007NY_partial_05_0086,
  rs_R007_ueqv_R007NY_partial_05_0087,
  rs_R007_ueqv_R007NY_partial_05_0088,
  rs_R007_ueqv_R007NY_partial_05_0089,
  rs_R007_ueqv_R007NY_partial_05_0090,
  rs_R007_ueqv_R007NY_partial_05_0091,
  rs_R007_ueqv_R007NY_partial_05_0092,
  rs_R007_ueqv_R007NY_partial_05_0093,
  rs_R007_ueqv_R007NY_partial_05_0094,
  rs_R007_ueqv_R007NY_partial_05_0095,
  rs_R007_ueqv_R007NY_partial_05_0096,
  rs_R007_ueqv_R007NY_partial_05_0097,
  rs_R007_ueqv_R007NY_partial_05_0098,
  rs_R007_ueqv_R007NY_partial_05_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_05_0000_0099 : Poly :=
[
  term ((304549338756184391700 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-182729603253710635020 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term ((91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term ((91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-304549338756184391700 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((152274669378092195850 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((182729603253710635020 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91364801626855317510 : Rat) / 2837216868107039579) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((35501262187293538739735 : Rat) / 134970459582806311401) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 134970459582806311401) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((7100252437458707747947 : Rat) / 44990153194268770467) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((38599379348915850502900 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7719875869783170100580 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-38599379348915850502900 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((19299689674457925251450 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((7719875869783170100580 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3859937934891585050290 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((442808366376855680094475 : Rat) / 179960612777075081868) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-88561673275371136018895 : Rat) / 59986870925691693956) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-34760959411204496584085 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1098047939656878846686465 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((9159985890989527269101375 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((6952191882240899316817 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((72819740223170447910531 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (6, 1), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (6, 2), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 179960612777075081868) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((88561673275371136018895 : Rat) / 59986870925691693956) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (7, 2), (16, 1)],
  term ((-442808366376855680094475 : Rat) / 359921225554150163736) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((88561673275371136018895 : Rat) / 119973741851383387912) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((34760959411204496584085 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-34760959411204496584085 : Rat) / 1259724289439525573076) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1098047939656878846686465 : Rat) / 314931072359881393269) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1098047939656878846686465 : Rat) / 629862144719762786538) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9159985890989527269101375 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((9159985890989527269101375 : Rat) / 3779172868318576719228) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6952191882240899316817 : Rat) / 209954048239920928846) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6952191882240899316817 : Rat) / 419908096479841857692) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-72819740223170447910531 : Rat) / 209954048239920928846) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (15, 2), (16, 1)],
  term ((72819740223170447910531 : Rat) / 419908096479841857692) [(0, 1), (15, 4), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((35501262187293538739735 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (11, 1), (14, 2), (16, 1)],
  term ((-35501262187293538739735 : Rat) / 269940919165612622802) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7100252437458707747947 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100252437458707747947 : Rat) / 89980306388537540934) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-341777168842191765042400 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((68355433768438353008480 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((341777168842191765042400 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-170888584421095882521200 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-68355433768438353008480 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((34177716884219176504240 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((70604046413259990682270 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-14120809282651998136454 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10477765967021812305995 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((2095553193404362461199 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-511086862366821734740205 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-349762794204218270654465 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((30948933887167328739868949 : Rat) / 7558345736637153438456) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((102217372473364346948041 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((209857676522530962392679 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6193817895159672229807633 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (7, 3), (16, 1)],
  term ((-70604046413259990682270 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((14120809282651998136454 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((10477765967021812305995 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10477765967021812305995 : Rat) / 3779172868318576719228) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2095553193404362461199 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2095553193404362461199 : Rat) / 1259724289439525573076) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((511086862366821734740205 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-511086862366821734740205 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-30948933887167328739868949 : Rat) / 7558345736637153438456) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((56131855069871044226990429 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-349762794204218270654465 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 3), (16, 1)],
  term ((30948933887167328739868949 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-102217372473364346948041 : Rat) / 629862144719762786538) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((102217372473364346948041 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((6193817895159672229807633 : Rat) / 2519448578879051146152) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11230402131700415327231929 : Rat) / 5038897157758102292304) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((209857676522530962392679 : Rat) / 419908096479841857692) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6193817895159672229807633 : Rat) / 5038897157758102292304) [(1, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (15, 2), (16, 1)],
  term ((-561589733267493419508640 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((112317946653498683901728 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((561589733267493419508640 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-280794866633746709754320 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-112317946653498683901728 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((56158973326749341950864 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1043404632325470128958905 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((208680926465094025791781 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1043404632325470128958905 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1043404632325470128958905 : Rat) / 3779172868318576719228) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-208680926465094025791781 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((208680926465094025791781 : Rat) / 1259724289439525573076) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((881299264694850962502335 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-176259852938970192500467 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((386923877530963947968015 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((29672791633574867272400 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9347525943085638639937 : Rat) / 38562988452230374686) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((948357324383882436475315 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77384775506192789593603 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5934558326714973454480 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-136000003609892526082693 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (6, 2), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 1889586434159288359614) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((176259852938970192500467 : Rat) / 629862144719762786538) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (7, 2), (16, 1)],
  term ((-881299264694850962502335 : Rat) / 3779172868318576719228) [(2, 1), (7, 3), (11, 1), (16, 1)],
  term ((176259852938970192500467 : Rat) / 1259724289439525573076) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((95711104877563916601925 : Rat) / 134970459582806311401) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-95711104877563916601925 : Rat) / 269940919165612622802) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19142220975512783320385 : Rat) / 44990153194268770467) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((19142220975512783320385 : Rat) / 89980306388537540934) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-386923877530963947968015 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((883936236067464960544015 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((386923877530963947968015 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9347525943085638639937 : Rat) / 38562988452230374686) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-814102270814094700625713 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14836395816787433636200 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-9347525943085638639937 : Rat) / 77125976904460749372) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-948357324383882436475315 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((948357324383882436475315 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((77384775506192789593603 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-176787247213492992108803 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-77384775506192789593603 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((135580095513412684225001 : Rat) / 629862144719762786538) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (14, 1), (16, 1)],
  term ((-64785303689312844628933 : Rat) / 1259724289439525573076) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 3), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 3), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((-136000003609892526082693 : Rat) / 1259724289439525573076) [(2, 1), (15, 4), (16, 1)],
  term ((1679658273241643596741025 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-335931654648328719348205 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1679658273241643596741025 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((1679658273241643596741025 : Rat) / 3779172868318576719228) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((335931654648328719348205 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-335931654648328719348205 : Rat) / 1259724289439525573076) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-55660614060125783387645 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((11132122812025156677529 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-381577295945581842335975 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((76315459189116368467195 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-127921076341247798753645 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-89758124293800569228000 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2174315313546901333365145 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((167652652994873602936400 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2065388699830169708046625 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((25584215268249559750729 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((17951624858760113845600 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((434863062709380266673029 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-414757372351953309040093 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-33530530598974720587280 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (7, 3), (16, 1)],
  term ((55660614060125783387645 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-55660614060125783387645 : Rat) / 629862144719762786538) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11132122812025156677529 : Rat) / 104977024119960464423) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((11132122812025156677529 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((381577295945581842335975 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-381577295945581842335975 : Rat) / 1889586434159288359614) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-76315459189116368467195 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((76315459189116368467195 : Rat) / 629862144719762786538) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((127921076341247798753645 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-127921076341247798753645 : Rat) / 629862144719762786538) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((89758124293800569228000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44879062146900284614000 : Rat) / 314931072359881393269) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25629963293030592298295 : Rat) / 34046602417284474948) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2065388699830169708046625 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((10762649954017775041507205 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2174315313546901333365145 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((2065388699830169708046625 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((83826326497436801468200 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-25584215268249559750729 : Rat) / 104977024119960464423) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25584215268249559750729 : Rat) / 209954048239920928846) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17951624858760113845600 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((8975812429380056922800 : Rat) / 104977024119960464423) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((414757372351953309040093 : Rat) / 1259724289439525573076) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((5125992658606118459659 : Rat) / 11348867472428158316) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-718069874396491458577403 : Rat) / 839816192959683715384) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((434863062709380266673029 : Rat) / 1259724289439525573076) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-414757372351953309040093 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)],
  term ((-16765265299487360293640 : Rat) / 314931072359881393269) [(3, 1), (15, 5), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 4), (16, 1)],
  term ((1249546580680507412358235 : Rat) / 1889586434159288359614) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-249909316136101482471647 : Rat) / 629862144719762786538) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-179787396201768595204250 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-521346367139882408371018 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((161879530552469192956030 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((35957479240353719040850 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((84843729761680178519480 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((249909316136101482471647 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1249546580680507412358235 : Rat) / 3779172868318576719228) [(4, 1), (7, 3), (11, 1), (16, 1)],
  term ((249909316136101482471647 : Rat) / 1259724289439525573076) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((179787396201768595204250 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-89893698100884297602125 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((521346367139882408371018 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-339307461664090205304709 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-260673183569941204185509 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-161879530552469192956030 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((80939765276234596478015 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((-35957479240353719040850 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17978739620176859520425 : Rat) / 104977024119960464423) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-84843729761680178519480 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((58148720499669889483580 : Rat) / 314931072359881393269) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(4, 1), (14, 3), (15, 2), (16, 1)],
  term ((42421864880840089259740 : Rat) / 314931072359881393269) [(4, 1), (15, 4), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-46233757350863347661650 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((27740254410518008596990 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((190262590952555809296170 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5549791364061405166720 : Rat) / 6427164742038395781) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-130334159051280300519185 : Rat) / 1259724289439525573076) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((46233757350863347661650 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-23116878675431673830825 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27740254410518008596990 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((13870127205259004298495 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-190262590952555809296170 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((265735316905296463664455 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((95131295476277904648085 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((167423599657164027032320 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((130334159051280300519185 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2305852373763351125873425 : Rat) / 2519448578879051146152) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((2774895682030702583360 : Rat) / 6427164742038395781) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((-130334159051280300519185 : Rat) / 2519448578879051146152) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (15, 4), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_05_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_05_0000_0099
      rs_R007_ueqv_R007NY_block_05_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
