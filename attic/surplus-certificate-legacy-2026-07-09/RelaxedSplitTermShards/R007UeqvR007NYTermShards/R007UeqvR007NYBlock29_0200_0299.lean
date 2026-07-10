/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 29:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_29_0200_0299 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0200 : Poly :=
[
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0200 : Poly :=
[
  term ((-30670205936977030479708 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15335102968488515239854 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((30670205936977030479708 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30670205936977030479708 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15335102968488515239854 : Rat) / 104977024119960464423) [(7, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0200_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0200
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0201 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 201 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0201 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0201_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0201
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0202 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0202 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0202_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0202
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0203 : Poly :=
[
  term ((778715144836489882248119 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 203 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0203 : Poly :=
[
  term ((778715144836489882248119 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-778715144836489882248119 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((778715144836489882248119 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-778715144836489882248119 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((778715144836489882248119 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-778715144836489882248119 : Rat) / 1889586434159288359614) [(7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0203_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0203
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0204 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 204 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0204 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 3), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0204_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0204
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0205 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 205 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0205 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 3), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0205_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0205
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0206 : Poly :=
[
  term ((-1955209371279702406638655 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0206 : Poly :=
[
  term ((-1955209371279702406638655 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1955209371279702406638655 : Rat) / 1259724289439525573076) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1955209371279702406638655 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1955209371279702406638655 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1955209371279702406638655 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((1955209371279702406638655 : Rat) / 1259724289439525573076) [(7, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0206_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0206
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0207 : Poly :=
[
  term ((1990799643133816715616893 : Rat) / 1079763676662450491208) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 207 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0207 : Poly :=
[
  term ((1990799643133816715616893 : Rat) / 539881838331225245604) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1990799643133816715616893 : Rat) / 1079763676662450491208) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1990799643133816715616893 : Rat) / 539881838331225245604) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1990799643133816715616893 : Rat) / 1079763676662450491208) [(7, 1), (11, 1), (16, 1)],
  term ((1990799643133816715616893 : Rat) / 539881838331225245604) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1990799643133816715616893 : Rat) / 1079763676662450491208) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0207_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0207
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0208 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 208 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0208 : Poly :=
[
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0208_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0208
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0209 : Poly :=
[
  term ((837656028974230594608425 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0209 : Poly :=
[
  term ((837656028974230594608425 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 419908096479841857692) [(6, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 209954048239920928846) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((837656028974230594608425 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((837656028974230594608425 : Rat) / 209954048239920928846) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 419908096479841857692) [(7, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0209_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0209
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0210 : Poly :=
[
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0210 : Poly :=
[
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0210_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0210
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0211 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 211 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0211 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0211_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0211
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0212 : Poly :=
[
  term ((-38078447389951860696793 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0212 : Poly :=
[
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((76156894779903721393586 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38078447389951860696793 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0212_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0212
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0213 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0213 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0213_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0213
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0214 : Poly :=
[
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0214 : Poly :=
[
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19546172917521990142036 : Rat) / 104977024119960464423) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0214_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0214
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0215 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0215 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0215_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0215
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0216 : Poly :=
[
  term ((-158514422404064932710391 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0216 : Poly :=
[
  term ((-158514422404064932710391 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((158514422404064932710391 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-158514422404064932710391 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((158514422404064932710391 : Rat) / 314931072359881393269) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-158514422404064932710391 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((158514422404064932710391 : Rat) / 629862144719762786538) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0216_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0216
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0217 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 217 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0217 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (14, 2), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (14, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 3), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0217_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0217
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0218 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0218 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (14, 1), (15, 4), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0218_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0218
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0219 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0219 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(7, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0219_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0219
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0220 : Poly :=
[
  term ((-395784448538105952042721 : Rat) / 359921225554150163736) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0220 : Poly :=
[
  term ((-395784448538105952042721 : Rat) / 179960612777075081868) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((395784448538105952042721 : Rat) / 359921225554150163736) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((395784448538105952042721 : Rat) / 179960612777075081868) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-395784448538105952042721 : Rat) / 359921225554150163736) [(7, 1), (15, 1), (16, 1)],
  term ((-395784448538105952042721 : Rat) / 179960612777075081868) [(7, 2), (15, 2), (16, 1)],
  term ((395784448538105952042721 : Rat) / 359921225554150163736) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0220_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0220
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0221 : Poly :=
[
  term ((44742851912608733634349 : Rat) / 209954048239920928846) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 221 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0221 : Poly :=
[
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-44742851912608733634349 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-44742851912608733634349 : Rat) / 104977024119960464423) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((44742851912608733634349 : Rat) / 209954048239920928846) [(7, 1), (15, 3), (16, 1)],
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(7, 2), (15, 4), (16, 1)],
  term ((-44742851912608733634349 : Rat) / 209954048239920928846) [(7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0221_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0221
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0222 : Poly :=
[
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0222 : Poly :=
[
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(6, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2094632070679343008483340 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(7, 3), (11, 1), (15, 2), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0222_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0222
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0223 : Poly :=
[
  term ((4 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0223 : Poly :=
[
  term ((8 : Rat) / 3) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 2), (7, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 2), (14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0223_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0223
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0224 : Poly :=
[
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0224 : Poly :=
[
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-418926414135868601696668 : Rat) / 104977024119960464423) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(7, 2), (15, 2), (16, 1)],
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(7, 3), (15, 3), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0224_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0224
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0225 : Poly :=
[
  term ((-4 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 225 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0225 : Poly :=
[
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 2), (7, 2), (16, 1)],
  term ((8 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 3), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0225_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0225
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0226 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 226 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0226 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0226_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0226
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0227 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)]
]

/-- Partial product 227 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0227 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0227_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0227
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0228 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0228 : Poly :=
[
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0228_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0228
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0229 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 229 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0229 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0229_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0229
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0230 : Poly :=
[
  term ((248922666219057072440164 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0230 : Poly :=
[
  term ((497845332438114144880328 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248922666219057072440164 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((497845332438114144880328 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248922666219057072440164 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-497845332438114144880328 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((248922666219057072440164 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0230_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0230
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0231 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 231 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0231 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0231_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0231
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0232 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 232 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0232 : Poly :=
[
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0232_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0232
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0233 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 233 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0233 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0233_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0233
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0234 : Poly :=
[
  term ((-36432478853438145834085 : Rat) / 179960612777075081868) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 234 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0234 : Poly :=
[
  term ((-36432478853438145834085 : Rat) / 89980306388537540934) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((36432478853438145834085 : Rat) / 179960612777075081868) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-36432478853438145834085 : Rat) / 89980306388537540934) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((36432478853438145834085 : Rat) / 179960612777075081868) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((36432478853438145834085 : Rat) / 89980306388537540934) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-36432478853438145834085 : Rat) / 179960612777075081868) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0234_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0234
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0235 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

/-- Partial product 235 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0235 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0235_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0235
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0236 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 1259724289439525573076) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0236 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 1259724289439525573076) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((107328286264581530450237 : Rat) / 1259724289439525573076) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 1259724289439525573076) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0236_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0236
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0237 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

/-- Partial product 237 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0237 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (8, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 3), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (8, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0237_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0237
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0238 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 238 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0238 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0238_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0238
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0239 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 239 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0239 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0239_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0239
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0240 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 240 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0240 : Poly :=
[
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0240_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0240
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0241 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0241 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0241_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0241
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0242 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 242 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0242 : Poly :=
[
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0242_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0242
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0243 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 243 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0243 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0243_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0243
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0244 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 244 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0244 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0244_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0244
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0245 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0245 : Poly :=
[
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0245_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0245
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0246 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 246 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0246 : Poly :=
[
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0246_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0246
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0247 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 247 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0247 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0247_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0247
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0248 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0248 : Poly :=
[
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0248_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0248
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0249 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 249 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0249 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0249_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0249
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0250 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0250 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0250_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0250
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0251 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0251 : Poly :=
[
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0251_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0251
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0252 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 252 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0252 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0252_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0252
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0253 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 253 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0253 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0253_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0253
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0254 : Poly :=
[
  term ((250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 254 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0254 : Poly :=
[
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-501283332760056649923520 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0254_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0254
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0255 : Poly :=
[
  term ((-25949389728127452333693 : Rat) / 419908096479841857692) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0255 : Poly :=
[
  term ((-25949389728127452333693 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25949389728127452333693 : Rat) / 419908096479841857692) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25949389728127452333693 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((25949389728127452333693 : Rat) / 419908096479841857692) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((25949389728127452333693 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25949389728127452333693 : Rat) / 419908096479841857692) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0255_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0255
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0256 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 256 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0256 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0256_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0256
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0257 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 257 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0257 : Poly :=
[
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0257_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0257
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0258 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)]
]

/-- Partial product 258 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0258 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0258_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0258
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0259 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0259 : Poly :=
[
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0259_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0259
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0260 : Poly :=
[
  term ((-346918346517583111255310 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 260 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0260 : Poly :=
[
  term ((-693836693035166222510620 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((346918346517583111255310 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((-693836693035166222510620 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((346918346517583111255310 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((693836693035166222510620 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-346918346517583111255310 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0260_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0260
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0261 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)]
]

/-- Partial product 261 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0261 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0261_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0261
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0262 : Poly :=
[
  term ((-50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0262 : Poly :=
[
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((100256666552011329984704 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0262_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0262
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0263 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 263 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0263 : Poly :=
[
  term ((4 : Rat) / 3) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0263_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0263
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0264 : Poly :=
[
  term ((73092128142793010117987 : Rat) / 419908096479841857692) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 264 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0264 : Poly :=
[
  term ((73092128142793010117987 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 419908096479841857692) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((73092128142793010117987 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 419908096479841857692) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 209954048239920928846) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((73092128142793010117987 : Rat) / 419908096479841857692) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0264_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0264
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0265 : Poly :=
[
  term ((-11 : Rat) / 24) [(10, 1), (16, 1)]
]

/-- Partial product 265 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0265 : Poly :=
[
  term ((-11 : Rat) / 12) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 24) [(6, 2), (10, 1), (16, 1)],
  term ((-11 : Rat) / 12) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 24) [(7, 2), (10, 1), (16, 1)],
  term ((11 : Rat) / 12) [(10, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 24) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0265_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0265
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0266 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 266 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0266 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0266_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0266
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0267 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 267 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0267 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0267_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0267
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0268 : Poly :=
[
  term ((-169068049342663160072294 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0268 : Poly :=
[
  term ((-338136098685326320144588 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((169068049342663160072294 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-338136098685326320144588 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((169068049342663160072294 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-169068049342663160072294 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((338136098685326320144588 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0268_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0268
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0269 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 269 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0269 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0269_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0269
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0270 : Poly :=
[
  term ((2546791149062815093567283 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0270 : Poly :=
[
  term ((2546791149062815093567283 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2546791149062815093567283 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2546791149062815093567283 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2546791149062815093567283 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2546791149062815093567283 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2546791149062815093567283 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0270_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0270
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0271 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 271 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0271 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0271_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0271
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0272 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0272 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0272_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0272
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0273 : Poly :=
[
  term ((-28000171607074640434025 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 273 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0273 : Poly :=
[
  term ((-28000171607074640434025 : Rat) / 89980306388537540934) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((28000171607074640434025 : Rat) / 179960612777075081868) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28000171607074640434025 : Rat) / 89980306388537540934) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28000171607074640434025 : Rat) / 179960612777075081868) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28000171607074640434025 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((28000171607074640434025 : Rat) / 89980306388537540934) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0273_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0273
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0274 : Poly :=
[
  term ((-178400618050380416341204 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0274 : Poly :=
[
  term ((-356801236100760832682408 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((178400618050380416341204 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-356801236100760832682408 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((178400618050380416341204 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((356801236100760832682408 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-178400618050380416341204 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0274_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0274
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0275 : Poly :=
[
  term ((23014543618594034738870 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 275 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0275 : Poly :=
[
  term ((46029087237188069477740 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23014543618594034738870 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((46029087237188069477740 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23014543618594034738870 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-46029087237188069477740 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((23014543618594034738870 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0275_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0275
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0276 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0276 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0276_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0276
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0277 : Poly :=
[
  term ((209214448228994794114217 : Rat) / 444608572743361966968) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0277 : Poly :=
[
  term ((209214448228994794114217 : Rat) / 222304286371680983484) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-209214448228994794114217 : Rat) / 444608572743361966968) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((209214448228994794114217 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-209214448228994794114217 : Rat) / 444608572743361966968) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((209214448228994794114217 : Rat) / 444608572743361966968) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209214448228994794114217 : Rat) / 222304286371680983484) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0277_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0277
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0278 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 278 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0278 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0278_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0278
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0279 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 279 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0279 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0279_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0279
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0280 : Poly :=
[
  term ((-835280326636640753187259 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0280 : Poly :=
[
  term ((-835280326636640753187259 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((835280326636640753187259 : Rat) / 1889586434159288359614) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-835280326636640753187259 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((835280326636640753187259 : Rat) / 1889586434159288359614) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-835280326636640753187259 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((835280326636640753187259 : Rat) / 944793217079644179807) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0280_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0280
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0281 : Poly :=
[
  term ((-6349108479137150795584403 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0281 : Poly :=
[
  term ((-6349108479137150795584403 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6349108479137150795584403 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6349108479137150795584403 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((6349108479137150795584403 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6349108479137150795584403 : Rat) / 1889586434159288359614) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6349108479137150795584403 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0281_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0281
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0282 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

/-- Partial product 282 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0282 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0282_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0282
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0283 : Poly :=
[
  term ((-422276240498545711307665 : Rat) / 629862144719762786538) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 283 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0283 : Poly :=
[
  term ((-422276240498545711307665 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((422276240498545711307665 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-422276240498545711307665 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((422276240498545711307665 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((422276240498545711307665 : Rat) / 314931072359881393269) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-422276240498545711307665 : Rat) / 629862144719762786538) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0283_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0283
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0284 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 284 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0284 : Poly :=
[
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0284_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0284
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0285 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 285 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0285 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0285_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0285
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0286 : Poly :=
[
  term ((-788127680585149820613170 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 286 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0286 : Poly :=
[
  term ((-1576255361170299641226340 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((788127680585149820613170 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1576255361170299641226340 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((788127680585149820613170 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((1576255361170299641226340 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-788127680585149820613170 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0286_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0286
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0287 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

/-- Partial product 287 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0287 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0287_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0287
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0288 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0288 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0288_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0288
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0289 : Poly :=
[
  term ((151778763798668021173372 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0289 : Poly :=
[
  term ((303557527597336042346744 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151778763798668021173372 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((303557527597336042346744 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-151778763798668021173372 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-303557527597336042346744 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((151778763798668021173372 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0289_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0289
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0290 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 290 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0290 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 2), (11, 2), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0290_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0290
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0291 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0291 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0291_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0291
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0292 : Poly :=
[
  term ((-5677521030574364613630199 : Rat) / 7558345736637153438456) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 292 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0292 : Poly :=
[
  term ((-5677521030574364613630199 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((5677521030574364613630199 : Rat) / 7558345736637153438456) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-5677521030574364613630199 : Rat) / 3779172868318576719228) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((5677521030574364613630199 : Rat) / 7558345736637153438456) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-5677521030574364613630199 : Rat) / 7558345736637153438456) [(11, 2), (14, 1), (16, 1)],
  term ((5677521030574364613630199 : Rat) / 3779172868318576719228) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0292_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0292
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0293 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)]
]

/-- Partial product 293 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0293 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0293_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0293
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0294 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 2), (14, 2), (16, 1)]
]

/-- Partial product 294 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0294 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (14, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 2), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0294_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0294
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0295 : Poly :=
[
  term ((1326679683727629816582065 : Rat) / 1889586434159288359614) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 295 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0295 : Poly :=
[
  term ((1326679683727629816582065 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1326679683727629816582065 : Rat) / 1889586434159288359614) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((1326679683727629816582065 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1326679683727629816582065 : Rat) / 1889586434159288359614) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1326679683727629816582065 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1326679683727629816582065 : Rat) / 1889586434159288359614) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0295_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0295
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0296 : Poly :=
[
  term ((17212096540614265895568115 : Rat) / 7558345736637153438456) [(11, 2), (16, 1)]
]

/-- Partial product 296 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0296 : Poly :=
[
  term ((17212096540614265895568115 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-17212096540614265895568115 : Rat) / 7558345736637153438456) [(6, 2), (11, 2), (16, 1)],
  term ((17212096540614265895568115 : Rat) / 3779172868318576719228) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-17212096540614265895568115 : Rat) / 7558345736637153438456) [(7, 2), (11, 2), (16, 1)],
  term ((-17212096540614265895568115 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)],
  term ((17212096540614265895568115 : Rat) / 7558345736637153438456) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0296_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0296
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0297 : Poly :=
[
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

/-- Partial product 297 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0297 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (15, 1), (16, 2)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0297_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0297
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0298 : Poly :=
[
  term ((39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)]
]

/-- Partial product 298 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0298 : Poly :=
[
  term ((79173546614755657898080 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-39586773307377828949040 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)],
  term ((79173546614755657898080 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-39586773307377828949040 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)],
  term ((-79173546614755657898080 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0298_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0298
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0299 : Poly :=
[
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0299 : Poly :=
[
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0299_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0299
        rs_R007_ueqv_R007NY_generator_29_0200_0299 =
      rs_R007_ueqv_R007NY_partial_29_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_29_0200_0299 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_29_0200,
  rs_R007_ueqv_R007NY_partial_29_0201,
  rs_R007_ueqv_R007NY_partial_29_0202,
  rs_R007_ueqv_R007NY_partial_29_0203,
  rs_R007_ueqv_R007NY_partial_29_0204,
  rs_R007_ueqv_R007NY_partial_29_0205,
  rs_R007_ueqv_R007NY_partial_29_0206,
  rs_R007_ueqv_R007NY_partial_29_0207,
  rs_R007_ueqv_R007NY_partial_29_0208,
  rs_R007_ueqv_R007NY_partial_29_0209,
  rs_R007_ueqv_R007NY_partial_29_0210,
  rs_R007_ueqv_R007NY_partial_29_0211,
  rs_R007_ueqv_R007NY_partial_29_0212,
  rs_R007_ueqv_R007NY_partial_29_0213,
  rs_R007_ueqv_R007NY_partial_29_0214,
  rs_R007_ueqv_R007NY_partial_29_0215,
  rs_R007_ueqv_R007NY_partial_29_0216,
  rs_R007_ueqv_R007NY_partial_29_0217,
  rs_R007_ueqv_R007NY_partial_29_0218,
  rs_R007_ueqv_R007NY_partial_29_0219,
  rs_R007_ueqv_R007NY_partial_29_0220,
  rs_R007_ueqv_R007NY_partial_29_0221,
  rs_R007_ueqv_R007NY_partial_29_0222,
  rs_R007_ueqv_R007NY_partial_29_0223,
  rs_R007_ueqv_R007NY_partial_29_0224,
  rs_R007_ueqv_R007NY_partial_29_0225,
  rs_R007_ueqv_R007NY_partial_29_0226,
  rs_R007_ueqv_R007NY_partial_29_0227,
  rs_R007_ueqv_R007NY_partial_29_0228,
  rs_R007_ueqv_R007NY_partial_29_0229,
  rs_R007_ueqv_R007NY_partial_29_0230,
  rs_R007_ueqv_R007NY_partial_29_0231,
  rs_R007_ueqv_R007NY_partial_29_0232,
  rs_R007_ueqv_R007NY_partial_29_0233,
  rs_R007_ueqv_R007NY_partial_29_0234,
  rs_R007_ueqv_R007NY_partial_29_0235,
  rs_R007_ueqv_R007NY_partial_29_0236,
  rs_R007_ueqv_R007NY_partial_29_0237,
  rs_R007_ueqv_R007NY_partial_29_0238,
  rs_R007_ueqv_R007NY_partial_29_0239,
  rs_R007_ueqv_R007NY_partial_29_0240,
  rs_R007_ueqv_R007NY_partial_29_0241,
  rs_R007_ueqv_R007NY_partial_29_0242,
  rs_R007_ueqv_R007NY_partial_29_0243,
  rs_R007_ueqv_R007NY_partial_29_0244,
  rs_R007_ueqv_R007NY_partial_29_0245,
  rs_R007_ueqv_R007NY_partial_29_0246,
  rs_R007_ueqv_R007NY_partial_29_0247,
  rs_R007_ueqv_R007NY_partial_29_0248,
  rs_R007_ueqv_R007NY_partial_29_0249,
  rs_R007_ueqv_R007NY_partial_29_0250,
  rs_R007_ueqv_R007NY_partial_29_0251,
  rs_R007_ueqv_R007NY_partial_29_0252,
  rs_R007_ueqv_R007NY_partial_29_0253,
  rs_R007_ueqv_R007NY_partial_29_0254,
  rs_R007_ueqv_R007NY_partial_29_0255,
  rs_R007_ueqv_R007NY_partial_29_0256,
  rs_R007_ueqv_R007NY_partial_29_0257,
  rs_R007_ueqv_R007NY_partial_29_0258,
  rs_R007_ueqv_R007NY_partial_29_0259,
  rs_R007_ueqv_R007NY_partial_29_0260,
  rs_R007_ueqv_R007NY_partial_29_0261,
  rs_R007_ueqv_R007NY_partial_29_0262,
  rs_R007_ueqv_R007NY_partial_29_0263,
  rs_R007_ueqv_R007NY_partial_29_0264,
  rs_R007_ueqv_R007NY_partial_29_0265,
  rs_R007_ueqv_R007NY_partial_29_0266,
  rs_R007_ueqv_R007NY_partial_29_0267,
  rs_R007_ueqv_R007NY_partial_29_0268,
  rs_R007_ueqv_R007NY_partial_29_0269,
  rs_R007_ueqv_R007NY_partial_29_0270,
  rs_R007_ueqv_R007NY_partial_29_0271,
  rs_R007_ueqv_R007NY_partial_29_0272,
  rs_R007_ueqv_R007NY_partial_29_0273,
  rs_R007_ueqv_R007NY_partial_29_0274,
  rs_R007_ueqv_R007NY_partial_29_0275,
  rs_R007_ueqv_R007NY_partial_29_0276,
  rs_R007_ueqv_R007NY_partial_29_0277,
  rs_R007_ueqv_R007NY_partial_29_0278,
  rs_R007_ueqv_R007NY_partial_29_0279,
  rs_R007_ueqv_R007NY_partial_29_0280,
  rs_R007_ueqv_R007NY_partial_29_0281,
  rs_R007_ueqv_R007NY_partial_29_0282,
  rs_R007_ueqv_R007NY_partial_29_0283,
  rs_R007_ueqv_R007NY_partial_29_0284,
  rs_R007_ueqv_R007NY_partial_29_0285,
  rs_R007_ueqv_R007NY_partial_29_0286,
  rs_R007_ueqv_R007NY_partial_29_0287,
  rs_R007_ueqv_R007NY_partial_29_0288,
  rs_R007_ueqv_R007NY_partial_29_0289,
  rs_R007_ueqv_R007NY_partial_29_0290,
  rs_R007_ueqv_R007NY_partial_29_0291,
  rs_R007_ueqv_R007NY_partial_29_0292,
  rs_R007_ueqv_R007NY_partial_29_0293,
  rs_R007_ueqv_R007NY_partial_29_0294,
  rs_R007_ueqv_R007NY_partial_29_0295,
  rs_R007_ueqv_R007NY_partial_29_0296,
  rs_R007_ueqv_R007NY_partial_29_0297,
  rs_R007_ueqv_R007NY_partial_29_0298,
  rs_R007_ueqv_R007NY_partial_29_0299
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_29_0200_0299 : Poly :=
[
  term ((-30670205936977030479708 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1955209371279702406638655 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1990799643133816715616893 : Rat) / 539881838331225245604) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((778715144836489882248119 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((837656028974230594608425 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-395784448538105952042721 : Rat) / 179960612777075081868) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-158514422404064932710391 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((497845332438114144880328 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-36432478853438145834085 : Rat) / 89980306388537540934) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25949389728127452333693 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-693836693035166222510620 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((73092128142793010117987 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 12) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((2546791149062815093567283 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-338136098685326320144588 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-356801236100760832682408 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((46029087237188069477740 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28000171607074640434025 : Rat) / 89980306388537540934) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6349108479137150795584403 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-422276240498545711307665 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((209214448228994794114217 : Rat) / 222304286371680983484) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-835280326636640753187259 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1576255361170299641226340 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 2)],
  term ((303557527597336042346744 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((1326679683727629816582065 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((17212096540614265895568115 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-5677521030574364613630199 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 2), (16, 2)],
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (14, 3), (16, 1)],
  term ((79173546614755657898080 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((15335102968488515239854 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778715144836489882248119 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 2)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(6, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1955209371279702406638655 : Rat) / 1259724289439525573076) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1990799643133816715616893 : Rat) / 1079763676662450491208) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 419908096479841857692) [(6, 2), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((158514422404064932710391 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 2)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((395784448538105952042721 : Rat) / 359921225554150163736) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-44742851912608733634349 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(6, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 2), (7, 2), (14, 1), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(6, 2), (7, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-248922666219057072440164 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((36432478853438145834085 : Rat) / 179960612777075081868) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 1259724289439525573076) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (8, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((25949389728127452333693 : Rat) / 419908096479841857692) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((346918346517583111255310 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (16, 2)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 419908096479841857692) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 24) [(6, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((169068049342663160072294 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-2546791149062815093567283 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28000171607074640434025 : Rat) / 179960612777075081868) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((178400618050380416341204 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23014543618594034738870 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-209214448228994794114217 : Rat) / 444608572743361966968) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((835280326636640753187259 : Rat) / 1889586434159288359614) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6349108479137150795584403 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((422276240498545711307665 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((788127680585149820613170 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151778763798668021173372 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 2), (11, 2), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((5677521030574364613630199 : Rat) / 7558345736637153438456) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (14, 1), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (14, 2), (16, 1)],
  term ((-1326679683727629816582065 : Rat) / 1889586434159288359614) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-17212096540614265895568115 : Rat) / 7558345736637153438456) [(6, 2), (11, 2), (16, 1)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((-39586773307377828949040 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((497845332438114144880328 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 2)],
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((-36432478853438145834085 : Rat) / 89980306388537540934) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 3), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 2)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25949389728127452333693 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-693836693035166222510620 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 12) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((73092128142793010117987 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-338136098685326320144588 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((2546791149062815093567283 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((-11979965627660300159927 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((184187683943919849185494 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-356801236100760832682408 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((5162235596995242114934673 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-12378167212263737244822013 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)],
  term ((-934682798343940955702459 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2049086713278696905854493 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 2), (16, 2)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-18563845072113408811084771 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (15, 2), (16, 2)],
  term ((-422276240498545711307665 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((1990799643133816715616893 : Rat) / 1079763676662450491208) [(7, 1), (11, 1), (16, 1)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-1576255361170299641226340 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((303557527597336042346744 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-20755329552110515316581849 : Rat) / 3779172868318576719228) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((883964314335083615965855 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (15, 1), (16, 2)],
  term ((1326679683727629816582065 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((79173546614755657898080 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((34088006058815164617745 : Rat) / 104977024119960464423) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-38078447389951860696793 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48698271581835950174588 : Rat) / 314931072359881393269) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2453462294958611798878265 : Rat) / 1259724289439525573076) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)],
  term ((-144168802908556221154567 : Rat) / 314931072359881393269) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((415360129529273293692433 : Rat) / 629862144719762786538) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (14, 2), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-395784448538105952042721 : Rat) / 359921225554150163736) [(7, 1), (15, 1), (16, 1)],
  term ((44742851912608733634349 : Rat) / 209954048239920928846) [(7, 1), (15, 3), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-248922666219057072440164 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((36432478853438145834085 : Rat) / 179960612777075081868) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 1259724289439525573076) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (8, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((25949389728127452333693 : Rat) / 419908096479841857692) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((346918346517583111255310 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (16, 2)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 419908096479841857692) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 24) [(7, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((169068049342663160072294 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-2546791149062815093567283 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28000171607074640434025 : Rat) / 179960612777075081868) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5743013846024285763304 : Rat) / 55576071592920245871) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23014543618594034738870 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 7939438798988606553) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5882693915011471084627047 : Rat) / 839816192959683715384) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((5680141240417154429440 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-148032520574793529529251 : Rat) / 1889586434159288359614) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3858456778498904877001307 : Rat) / 1889586434159288359614) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((-2529592625051413688665 : Rat) / 1039376476435252123) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((788127680585149820613170 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-180379997682062317528652 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((5677521030574364613630199 : Rat) / 7558345736637153438456) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (14, 1), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (14, 2), (16, 1)],
  term ((3106112288520222767446880 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-17212096540614265895568115 : Rat) / 7558345736637153438456) [(7, 2), (11, 2), (16, 1)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((-39586773307377828949040 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1415293664811670737800395 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (14, 1), (15, 2), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (14, 1), (15, 4), (16, 1)],
  term (4 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 2), (14, 2), (16, 1)],
  term ((-256932654951530054119039 : Rat) / 1259724289439525573076) [(7, 2), (15, 2), (16, 1)],
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(7, 2), (15, 4), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 2), (16, 1)],
  term ((15335102968488515239854 : Rat) / 104977024119960464423) [(7, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778715144836489882248119 : Rat) / 1889586434159288359614) [(7, 3), (11, 1), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 3), (11, 1), (14, 1), (16, 2)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 3), (11, 1), (14, 2), (16, 1)],
  term ((-6423318911437669627294705 : Rat) / 1259724289439525573076) [(7, 3), (11, 1), (15, 2), (16, 1)],
  term ((-1990799643133816715616893 : Rat) / 1079763676662450491208) [(7, 3), (11, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 3), (11, 2), (13, 1), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 419908096479841857692) [(7, 3), (11, 2), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 3), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((53398018263328100047053 : Rat) / 209954048239920928846) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 3), (14, 1), (15, 1), (16, 2)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 3), (14, 1), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(7, 3), (14, 2), (15, 1), (16, 1)],
  term ((394824658603294884939425 : Rat) / 359921225554150163736) [(7, 3), (15, 1), (16, 1)],
  term ((793109976359128469758987 : Rat) / 209954048239920928846) [(7, 3), (15, 3), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 4), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(7, 4), (14, 1), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(7, 4), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 4), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-819830191231858736231039 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 190905883426883043) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((248922666219057072440164 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)],
  term ((1838364918568016367018155 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 445447061329393767) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-36432478853438145834085 : Rat) / 179960612777075081868) [(8, 1), (11, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 1259724289439525573076) [(8, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 190905883426883043) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-501283332760056649923520 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((25949389728127452333693 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-25949389728127452333693 : Rat) / 419908096479841857692) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((693836693035166222510620 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-346918346517583111255310 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)],
  term ((100256666552011329984704 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73092128142793010117987 : Rat) / 209954048239920928846) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 12) [(10, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((73092128142793010117987 : Rat) / 419908096479841857692) [(10, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 24) [(10, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-961642415916047137903957 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 190905883426883043) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((338136098685326320144588 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((2546791149062815093567283 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)],
  term ((297159753076380711173288 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-268116863769976199213035 : Rat) / 539881838331225245604) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((28000171607074640434025 : Rat) / 89980306388537540934) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-178400618050380416341204 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23014543618594034738870 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((9651026512147171560759767 : Rat) / 2519448578879051146152) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 190905883426883043) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((147385578280001917270235 : Rat) / 104977024119960464423) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1742402091055397668772069 : Rat) / 1259724289439525573076) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((835280326636640753187259 : Rat) / 944793217079644179807) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6349108479137150795584403 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)],
  term ((-422276240498545711307665 : Rat) / 629862144719762786538) [(11, 1), (15, 3), (16, 1)],
  term ((1837326595135717365822830 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 445447061329393767) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)],
  term ((-788127680585149820613170 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)],
  term ((-204155055890035839831544 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((151778763798668021173372 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (16, 1)],
  term ((-475360718478310006365755 : Rat) / 314931072359881393269) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13367238037267632134922143 : Rat) / 2519448578879051146152) [(11, 2), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 445447061329393767) [(11, 2), (14, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((8627459572208667461779729 : Rat) / 3779172868318576719228) [(11, 2), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(11, 2), (14, 3), (16, 1)],
  term ((1326679683727629816582065 : Rat) / 1889586434159288359614) [(11, 2), (15, 2), (16, 1)],
  term ((17212096540614265895568115 : Rat) / 7558345736637153438456) [(11, 2), (16, 1)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)],
  term ((-79173546614755657898080 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 299. -/
theorem rs_R007_ueqv_R007NY_block_29_0200_0299_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_29_0200_0299
      rs_R007_ueqv_R007NY_block_29_0200_0299 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
