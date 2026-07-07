/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 18:200-239

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_18_0200_0239 : Poly :=
[
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0200 : Poly :=
[
  term ((15 : Rat) / 8) [(10, 1), (16, 1)]
]

/-- Partial product 200 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0200 : Poly :=
[
  term ((15 : Rat) / 4) [(6, 1), (10, 2), (16, 1)],
  term ((15 : Rat) / 4) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-15 : Rat) / 8) [(10, 1), (11, 2), (16, 1)],
  term ((-15 : Rat) / 8) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0200_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0200
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0201 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0201 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0201_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0201
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0202 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 202 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0202 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0202_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0202
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0203 : Poly :=
[
  term ((29775925214570236274203 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0203 : Poly :=
[
  term ((59551850429140472548406 : Rat) / 55576071592920245871) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((59551850429140472548406 : Rat) / 55576071592920245871) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-29775925214570236274203 : Rat) / 55576071592920245871) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29775925214570236274203 : Rat) / 55576071592920245871) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0203_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0203
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0204 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 204 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0204 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0204_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0204
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0205 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0205 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0205_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0205
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0206 : Poly :=
[
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0206 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0206_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0206
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0207 : Poly :=
[
  term ((-375434325140093476832572 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0207 : Poly :=
[
  term ((-750868650280186953665144 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-750868650280186953665144 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((375434325140093476832572 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((375434325140093476832572 : Rat) / 944793217079644179807) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0207_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0207
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0208 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0208 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0208_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0208
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0209 : Poly :=
[
  term ((12368624742275498193999623 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0209 : Poly :=
[
  term ((12368624742275498193999623 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12368624742275498193999623 : Rat) / 3779172868318576719228) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12368624742275498193999623 : Rat) / 7558345736637153438456) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12368624742275498193999623 : Rat) / 7558345736637153438456) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0209_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0209
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0210 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 210 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0210 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 3), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0210_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0210
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0211 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 211 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0211 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0211_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0211
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0212 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0212 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0212_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0212
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0213 : Poly :=
[
  term ((-28982411086416665658511 : Rat) / 18125529344453605368) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0213 : Poly :=
[
  term ((-28982411086416665658511 : Rat) / 9062764672226802684) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28982411086416665658511 : Rat) / 9062764672226802684) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((28982411086416665658511 : Rat) / 18125529344453605368) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((28982411086416665658511 : Rat) / 18125529344453605368) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0213_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0213
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0214 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

/-- Partial product 214 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0214 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 3), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0214_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0214
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0215 : Poly :=
[
  term ((-141886494208219968369385 : Rat) / 209954048239920928846) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 215 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0215 : Poly :=
[
  term ((-141886494208219968369385 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-141886494208219968369385 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((141886494208219968369385 : Rat) / 209954048239920928846) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((141886494208219968369385 : Rat) / 209954048239920928846) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0215_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0215
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0216 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 216 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0216 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0216_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0216
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0217 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

/-- Partial product 217 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0217 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 4), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0217_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0217
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0218 : Poly :=
[
  term ((-7278777310358073785680 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0218 : Poly :=
[
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0218_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0218
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0219 : Poly :=
[
  term ((264754697483138245449965 : Rat) / 1889586434159288359614) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0219 : Poly :=
[
  term ((264754697483138245449965 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((264754697483138245449965 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((-264754697483138245449965 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((-264754697483138245449965 : Rat) / 1889586434159288359614) [(11, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0219_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0219
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0220 : Poly :=
[
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0220 : Poly :=
[
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0220_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0220
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0221 : Poly :=
[
  term ((26201472532488154898035 : Rat) / 1259724289439525573076) [(11, 2), (16, 1)]
]

/-- Partial product 221 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0221 : Poly :=
[
  term ((26201472532488154898035 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((26201472532488154898035 : Rat) / 629862144719762786538) [(7, 1), (11, 3), (16, 1)],
  term ((-26201472532488154898035 : Rat) / 1259724289439525573076) [(10, 2), (11, 2), (16, 1)],
  term ((-26201472532488154898035 : Rat) / 1259724289439525573076) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0221_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0221
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0222 : Poly :=
[
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

/-- Partial product 222 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0222 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (16, 2)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (16, 2)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0222_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0222
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0223 : Poly :=
[
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0223 : Poly :=
[
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0223_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0223
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0224 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 224 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0224 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0224_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0224
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0225 : Poly :=
[
  term ((-186812017421152543188791 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 225 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0225 : Poly :=
[
  term ((-186812017421152543188791 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-186812017421152543188791 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((186812017421152543188791 : Rat) / 629862144719762786538) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((186812017421152543188791 : Rat) / 629862144719762786538) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0225_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0225
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0226 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

/-- Partial product 226 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0226 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(11, 2), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0226_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0226
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0227 : Poly :=
[
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0227 : Poly :=
[
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0227_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0227
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0228 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 228 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0228 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0228_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0228
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0229 : Poly :=
[
  term ((93429383850121041306428 : Rat) / 314931072359881393269) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 229 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0229 : Poly :=
[
  term ((186858767700242082612856 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((186858767700242082612856 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-93429383850121041306428 : Rat) / 314931072359881393269) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-93429383850121041306428 : Rat) / 314931072359881393269) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0229_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0229
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0230 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0230 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0230_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0230
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0231 : Poly :=
[
  term ((-2604838320973212478449751 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0231 : Poly :=
[
  term ((-2604838320973212478449751 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2604838320973212478449751 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2604838320973212478449751 : Rat) / 2519448578879051146152) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((2604838320973212478449751 : Rat) / 2519448578879051146152) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0231_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0231
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0232 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)]
]

/-- Partial product 232 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0232 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 2), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0232_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0232
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0233 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(14, 1), (15, 4), (16, 1)]
]

/-- Partial product 233 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0233 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (14, 1), (15, 4), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (14, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0233_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0233
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0234 : Poly :=
[
  term ((-53 : Rat) / 24) [(14, 1), (16, 1)]
]

/-- Partial product 234 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0234 : Poly :=
[
  term ((-53 : Rat) / 12) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-53 : Rat) / 12) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((53 : Rat) / 24) [(10, 2), (14, 1), (16, 1)],
  term ((53 : Rat) / 24) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0234_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0234
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0235 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 209954048239920928846) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0235 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((98331284721143428271651 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0235_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0235
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0236 : Poly :=
[
  term ((2427829554375939311174749 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

/-- Partial product 236 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0236 : Poly :=
[
  term ((2427829554375939311174749 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((2427829554375939311174749 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2427829554375939311174749 : Rat) / 2519448578879051146152) [(10, 2), (15, 2), (16, 1)],
  term ((-2427829554375939311174749 : Rat) / 2519448578879051146152) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0236_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0236
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0237 : Poly :=
[
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

/-- Partial product 237 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0237 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (11, 1), (15, 2), (16, 2)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(11, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0237_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0237
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0238 : Poly :=
[
  term ((3714738678628970189695 : Rat) / 5674433736214079158) [(15, 4), (16, 1)]
]

/-- Partial product 238 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0238 : Poly :=
[
  term ((3714738678628970189695 : Rat) / 2837216868107039579) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((3714738678628970189695 : Rat) / 2837216868107039579) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-3714738678628970189695 : Rat) / 5674433736214079158) [(10, 2), (15, 4), (16, 1)],
  term ((-3714738678628970189695 : Rat) / 5674433736214079158) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0238_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0238
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0239 : Poly :=
[
  term ((1 : Rat) / 4) [(16, 1)]
]

/-- Partial product 239 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0239 : Poly :=
[
  term ((1 : Rat) / 2) [(6, 1), (10, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(10, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0239_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0239
        rs_R007_ueqv_R007NY_generator_18_0200_0239 =
      rs_R007_ueqv_R007NY_partial_18_0239 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_18_0200_0239 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_18_0200,
  rs_R007_ueqv_R007NY_partial_18_0201,
  rs_R007_ueqv_R007NY_partial_18_0202,
  rs_R007_ueqv_R007NY_partial_18_0203,
  rs_R007_ueqv_R007NY_partial_18_0204,
  rs_R007_ueqv_R007NY_partial_18_0205,
  rs_R007_ueqv_R007NY_partial_18_0206,
  rs_R007_ueqv_R007NY_partial_18_0207,
  rs_R007_ueqv_R007NY_partial_18_0208,
  rs_R007_ueqv_R007NY_partial_18_0209,
  rs_R007_ueqv_R007NY_partial_18_0210,
  rs_R007_ueqv_R007NY_partial_18_0211,
  rs_R007_ueqv_R007NY_partial_18_0212,
  rs_R007_ueqv_R007NY_partial_18_0213,
  rs_R007_ueqv_R007NY_partial_18_0214,
  rs_R007_ueqv_R007NY_partial_18_0215,
  rs_R007_ueqv_R007NY_partial_18_0216,
  rs_R007_ueqv_R007NY_partial_18_0217,
  rs_R007_ueqv_R007NY_partial_18_0218,
  rs_R007_ueqv_R007NY_partial_18_0219,
  rs_R007_ueqv_R007NY_partial_18_0220,
  rs_R007_ueqv_R007NY_partial_18_0221,
  rs_R007_ueqv_R007NY_partial_18_0222,
  rs_R007_ueqv_R007NY_partial_18_0223,
  rs_R007_ueqv_R007NY_partial_18_0224,
  rs_R007_ueqv_R007NY_partial_18_0225,
  rs_R007_ueqv_R007NY_partial_18_0226,
  rs_R007_ueqv_R007NY_partial_18_0227,
  rs_R007_ueqv_R007NY_partial_18_0228,
  rs_R007_ueqv_R007NY_partial_18_0229,
  rs_R007_ueqv_R007NY_partial_18_0230,
  rs_R007_ueqv_R007NY_partial_18_0231,
  rs_R007_ueqv_R007NY_partial_18_0232,
  rs_R007_ueqv_R007NY_partial_18_0233,
  rs_R007_ueqv_R007NY_partial_18_0234,
  rs_R007_ueqv_R007NY_partial_18_0235,
  rs_R007_ueqv_R007NY_partial_18_0236,
  rs_R007_ueqv_R007NY_partial_18_0237,
  rs_R007_ueqv_R007NY_partial_18_0238,
  rs_R007_ueqv_R007NY_partial_18_0239
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_18_0200_0239 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((59551850429140472548406 : Rat) / 55576071592920245871) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-750868650280186953665144 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((12368624742275498193999623 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28982411086416665658511 : Rat) / 9062764672226802684) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-141886494208219968369385 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((264754697483138245449965 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((26201472532488154898035 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-186812017421152543188791 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((186858767700242082612856 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2604838320973212478449751 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-53 : Rat) / 12) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((2427829554375939311174749 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((3714738678628970189695 : Rat) / 2837216868107039579) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 2) [(6, 1), (10, 1), (16, 1)],
  term ((15 : Rat) / 4) [(6, 1), (10, 2), (16, 1)],
  term ((15 : Rat) / 4) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-186812017421152543188791 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((186858767700242082612856 : Rat) / 314931072359881393269) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2604838320973212478449751 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-53 : Rat) / 12) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((2427829554375939311174749 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (11, 1), (15, 2), (16, 2)],
  term ((3714738678628970189695 : Rat) / 2837216868107039579) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((59551850429140472548406 : Rat) / 55576071592920245871) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-750868650280186953665144 : Rat) / 944793217079644179807) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((12368624742275498193999623 : Rat) / 3779172868318576719228) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-28982411086416665658511 : Rat) / 9062764672226802684) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(7, 1), (11, 2), (15, 1), (16, 2)],
  term ((-141886494208219968369385 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (12, 1), (16, 2)],
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((264754697483138245449965 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((26201472532488154898035 : Rat) / 629862144719762786538) [(7, 1), (11, 3), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (16, 2)],
  term ((-15 : Rat) / 8) [(10, 1), (11, 2), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-29775925214570236274203 : Rat) / 55576071592920245871) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((375434325140093476832572 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12368624742275498193999623 : Rat) / 7558345736637153438456) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((28982411086416665658511 : Rat) / 18125529344453605368) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((141886494208219968369385 : Rat) / 209954048239920928846) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (12, 1), (16, 2)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-264754697483138245449965 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-26201472532488154898035 : Rat) / 1259724289439525573076) [(10, 2), (11, 2), (16, 1)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((186812017421152543188791 : Rat) / 629862144719762786538) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-93429383850121041306428 : Rat) / 314931072359881393269) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((2604838320973212478449751 : Rat) / 2519448578879051146152) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (14, 1), (15, 2), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (14, 1), (15, 4), (16, 1)],
  term ((53 : Rat) / 24) [(10, 2), (14, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2427829554375939311174749 : Rat) / 2519448578879051146152) [(10, 2), (15, 2), (16, 1)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)],
  term ((-3714738678628970189695 : Rat) / 5674433736214079158) [(10, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 4) [(10, 2), (16, 1)],
  term ((-15 : Rat) / 8) [(10, 3), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((186812017421152543188791 : Rat) / 629862144719762786538) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(11, 2), (12, 1), (15, 2), (16, 2)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-93429383850121041306428 : Rat) / 314931072359881393269) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2604838320973212478449751 : Rat) / 2519448578879051146152) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 2), (14, 1), (15, 2), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((53 : Rat) / 24) [(11, 2), (14, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2427829554375939311174749 : Rat) / 2519448578879051146152) [(11, 2), (15, 2), (16, 1)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(11, 2), (15, 2), (16, 2)],
  term ((-3714738678628970189695 : Rat) / 5674433736214079158) [(11, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 4) [(11, 2), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-29775925214570236274203 : Rat) / 55576071592920245871) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((375434325140093476832572 : Rat) / 944793217079644179807) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-12368624742275498193999623 : Rat) / 7558345736637153438456) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 3), (14, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((28982411086416665658511 : Rat) / 18125529344453605368) [(11, 3), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 3), (15, 1), (16, 2)],
  term ((141886494208219968369385 : Rat) / 209954048239920928846) [(11, 3), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 4), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 4), (12, 1), (16, 2)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(11, 4), (13, 1), (15, 1), (16, 1)],
  term ((-264754697483138245449965 : Rat) / 1889586434159288359614) [(11, 4), (14, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 4), (15, 2), (16, 1)],
  term ((-26201472532488154898035 : Rat) / 1259724289439525573076) [(11, 4), (16, 1)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 200 through 239. -/
theorem rs_R007_ueqv_R007NY_block_18_0200_0239_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_18_0200_0239
      rs_R007_ueqv_R007NY_block_18_0200_0239 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
