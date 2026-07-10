/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 11:0-34

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_11_0000_0034 : Poly :=
[
  term (2 : Rat) [(2, 1), (8, 1)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0000 : Poly :=
[
  term ((-6004086231771728403595 : Rat) / 12350238131760054638) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0000 : Poly :=
[
  term ((-6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((-6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((6004086231771728403595 : Rat) / 12350238131760054638) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((6004086231771728403595 : Rat) / 12350238131760054638) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0000
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0001 : Poly :=
[
  term ((3602451739063037042157 : Rat) / 12350238131760054638) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0001 : Poly :=
[
  term ((3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 12350238131760054638) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 12350238131760054638) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0001
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0002 : Poly :=
[
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0002 : Poly :=
[
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0002
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0003 : Poly :=
[
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0003 : Poly :=
[
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0003
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0004 : Poly :=
[
  term ((-1063743508568338481375 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0004 : Poly :=
[
  term ((-2127487017136676962750 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((1063743508568338481375 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (8, 2), (11, 1), (16, 1)],
  term ((1063743508568338481375 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2127487017136676962750 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0004
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0005 : Poly :=
[
  term ((638246105141003088825 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0005 : Poly :=
[
  term ((1276492210282006177650 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-638246105141003088825 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-638246105141003088825 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((1276492210282006177650 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0005
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0006 : Poly :=
[
  term ((-308564613762820358369285 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0006 : Poly :=
[
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0006
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0007 : Poly :=
[
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0007 : Poly :=
[
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0007
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0008 : Poly :=
[
  term ((61712922752564071673857 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0008 : Poly :=
[
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0008
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0009 : Poly :=
[
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0009 : Poly :=
[
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0009
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0010 : Poly :=
[
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0010 : Poly :=
[
  term ((-10997521498308441154235 : Rat) / 134970459582806311401) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (9, 2), (11, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(4, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(4, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0010
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0011 : Poly :=
[
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0011 : Poly :=
[
  term ((2199504299661688230847 : Rat) / 44990153194268770467) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(4, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0011
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0012 : Poly :=
[
  term ((-97692412340382747278485 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0012 : Poly :=
[
  term ((-195384824680765494556970 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-195384824680765494556970 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((97692412340382747278485 : Rat) / 944793217079644179807) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((97692412340382747278485 : Rat) / 944793217079644179807) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0012
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0013 : Poly :=
[
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0013 : Poly :=
[
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0013
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0014 : Poly :=
[
  term ((19538482468076549455697 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0014 : Poly :=
[
  term ((39076964936153098911394 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39076964936153098911394 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19538482468076549455697 : Rat) / 314931072359881393269) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19538482468076549455697 : Rat) / 314931072359881393269) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0014
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0015 : Poly :=
[
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0015 : Poly :=
[
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0015
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0016 : Poly :=
[
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0016 : Poly :=
[
  term ((10997521498308441154235 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 134970459582806311401) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0016
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0017 : Poly :=
[
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0017 : Poly :=
[
  term ((-2199504299661688230847 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 44990153194268770467) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0017
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0018 : Poly :=
[
  term ((208050597016375704618395 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0018 : Poly :=
[
  term ((416101194032751409236790 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((416101194032751409236790 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-208050597016375704618395 : Rat) / 944793217079644179807) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-208050597016375704618395 : Rat) / 944793217079644179807) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0018
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0019 : Poly :=
[
  term ((-41610119403275140923679 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0019 : Poly :=
[
  term ((-83220238806550281847358 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83220238806550281847358 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((41610119403275140923679 : Rat) / 314931072359881393269) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((41610119403275140923679 : Rat) / 314931072359881393269) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0019
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0020 : Poly :=
[
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0020 : Poly :=
[
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0020
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0021 : Poly :=
[
  term ((134800413715859650985 : Rat) / 381811766853766086) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0021 : Poly :=
[
  term ((134800413715859650985 : Rat) / 190905883426883043) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((134800413715859650985 : Rat) / 190905883426883043) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-134800413715859650985 : Rat) / 381811766853766086) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-134800413715859650985 : Rat) / 381811766853766086) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0021
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0022 : Poly :=
[
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0022 : Poly :=
[
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0022
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0023 : Poly :=
[
  term ((-26960082743171930197 : Rat) / 127270588951255362) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0023 : Poly :=
[
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((26960082743171930197 : Rat) / 127270588951255362) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((26960082743171930197 : Rat) / 127270588951255362) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0023
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0024 : Poly :=
[
  term ((-17844114622614003555035 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0024 : Poly :=
[
  term ((-35688229245228007110070 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35688229245228007110070 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((17844114622614003555035 : Rat) / 314931072359881393269) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((17844114622614003555035 : Rat) / 314931072359881393269) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0024
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0025 : Poly :=
[
  term ((76932215320372771359995 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0025 : Poly :=
[
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0025
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0026 : Poly :=
[
  term ((228338901502138650999590 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0026 : Poly :=
[
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0026
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0027 : Poly :=
[
  term ((1974639146540871569912 : Rat) / 14996717731422923489) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0027 : Poly :=
[
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0027
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0028 : Poly :=
[
  term ((1830277555731415537997 : Rat) / 29993435462845846978) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0028 : Poly :=
[
  term ((1830277555731415537997 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1830277555731415537997 : Rat) / 14996717731422923489) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1830277555731415537997 : Rat) / 29993435462845846978) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1830277555731415537997 : Rat) / 29993435462845846978) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0028
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0029 : Poly :=
[
  term ((-9873195732704357849560 : Rat) / 44990153194268770467) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0029 : Poly :=
[
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0029
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0030 : Poly :=
[
  term ((-100784493098877911007535 : Rat) / 1889586434159288359614) [(11, 2), (16, 1)]
]

/-- Partial product 30 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0030 : Poly :=
[
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 2), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((100784493098877911007535 : Rat) / 1889586434159288359614) [(8, 2), (11, 2), (16, 1)],
  term ((100784493098877911007535 : Rat) / 1889586434159288359614) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0030
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0031 : Poly :=
[
  term ((3568822924522800711007 : Rat) / 104977024119960464423) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0031 : Poly :=
[
  term ((7137645849045601422014 : Rat) / 104977024119960464423) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7137645849045601422014 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3568822924522800711007 : Rat) / 104977024119960464423) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3568822924522800711007 : Rat) / 104977024119960464423) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0031
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0032 : Poly :=
[
  term ((-15386443064074554271999 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0032 : Poly :=
[
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0032
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0033 : Poly :=
[
  term ((-45667780300427730199918 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0033 : Poly :=
[
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0033
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def rs_R007_ueqv_R007NY_coefficient_11_0034 : Poly :=
[
  term ((-1827893005058414409643 : Rat) / 104977024119960464423) [(15, 2), (16, 1)]
]

/-- Partial product 34 for generator 11. -/
def rs_R007_ueqv_R007NY_partial_11_0034 : Poly :=
[
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(8, 2), (15, 2), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem rs_R007_ueqv_R007NY_partial_11_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_11_0034
        rs_R007_ueqv_R007NY_generator_11_0000_0034 =
      rs_R007_ueqv_R007NY_partial_11_0034 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_11_0000_0034 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_11_0000,
  rs_R007_ueqv_R007NY_partial_11_0001,
  rs_R007_ueqv_R007NY_partial_11_0002,
  rs_R007_ueqv_R007NY_partial_11_0003,
  rs_R007_ueqv_R007NY_partial_11_0004,
  rs_R007_ueqv_R007NY_partial_11_0005,
  rs_R007_ueqv_R007NY_partial_11_0006,
  rs_R007_ueqv_R007NY_partial_11_0007,
  rs_R007_ueqv_R007NY_partial_11_0008,
  rs_R007_ueqv_R007NY_partial_11_0009,
  rs_R007_ueqv_R007NY_partial_11_0010,
  rs_R007_ueqv_R007NY_partial_11_0011,
  rs_R007_ueqv_R007NY_partial_11_0012,
  rs_R007_ueqv_R007NY_partial_11_0013,
  rs_R007_ueqv_R007NY_partial_11_0014,
  rs_R007_ueqv_R007NY_partial_11_0015,
  rs_R007_ueqv_R007NY_partial_11_0016,
  rs_R007_ueqv_R007NY_partial_11_0017,
  rs_R007_ueqv_R007NY_partial_11_0018,
  rs_R007_ueqv_R007NY_partial_11_0019,
  rs_R007_ueqv_R007NY_partial_11_0020,
  rs_R007_ueqv_R007NY_partial_11_0021,
  rs_R007_ueqv_R007NY_partial_11_0022,
  rs_R007_ueqv_R007NY_partial_11_0023,
  rs_R007_ueqv_R007NY_partial_11_0024,
  rs_R007_ueqv_R007NY_partial_11_0025,
  rs_R007_ueqv_R007NY_partial_11_0026,
  rs_R007_ueqv_R007NY_partial_11_0027,
  rs_R007_ueqv_R007NY_partial_11_0028,
  rs_R007_ueqv_R007NY_partial_11_0029,
  rs_R007_ueqv_R007NY_partial_11_0030,
  rs_R007_ueqv_R007NY_partial_11_0031,
  rs_R007_ueqv_R007NY_partial_11_0032,
  rs_R007_ueqv_R007NY_partial_11_0033,
  rs_R007_ueqv_R007NY_partial_11_0034
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_11_0000_0034 : Poly :=
[
  term ((-6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((6004086231771728403595 : Rat) / 12350238131760054638) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 12350238131760054638) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((6004086231771728403595 : Rat) / 12350238131760054638) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 12350238131760054638) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2127487017136676962750 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((1276492210282006177650 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 134970459582806311401) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 44990153194268770467) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-195384824680765494556970 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39076964936153098911394 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((416101194032751409236790 : Rat) / 944793217079644179807) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-83220238806550281847358 : Rat) / 314931072359881393269) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 134970459582806311401) [(2, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 44990153194268770467) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((134800413715859650985 : Rat) / 190905883426883043) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35688229245228007110070 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1830277555731415537997 : Rat) / 14996717731422923489) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(2, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(2, 1), (8, 1), (11, 2), (16, 1)],
  term ((7137645849045601422014 : Rat) / 104977024119960464423) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 209954048239920928846) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 209954048239920928846) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((40434055637604245090465 : Rat) / 104977024119960464423) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 104977024119960464423) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((1063743508568338481375 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (8, 2), (11, 1), (16, 1)],
  term ((-638246105141003088825 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-195384824680765494556970 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39076964936153098911394 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-67408958911044041747270 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (9, 2), (11, 1), (16, 1)],
  term ((13481791782208808349454 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 134970459582806311401) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 44990153194268770467) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((416101194032751409236790 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-83220238806550281847358 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11552511886354317511240 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((134800413715859650985 : Rat) / 190905883426883043) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35688229245228007110070 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((153864430640745542719990 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((456677803004277301999180 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3949278293081743139824 : Rat) / 14996717731422923489) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1830277555731415537997 : Rat) / 14996717731422923489) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19746391465408715699120 : Rat) / 44990153194268770467) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((7137645849045601422014 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30772886128149108543998 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-91335560600855460399836 : Rat) / 314931072359881393269) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3655786010116828819286 : Rat) / 104977024119960464423) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((308564613762820358369285 : Rat) / 944793217079644179807) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((40434055637604245090465 : Rat) / 209954048239920928846) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-61712922752564071673857 : Rat) / 314931072359881393269) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-24260433382562547054279 : Rat) / 209954048239920928846) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2127487017136676962750 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((1276492210282006177650 : Rat) / 104977024119960464423) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-617129227525640716738570 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-40434055637604245090465 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((123425845505128143347714 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24260433382562547054279 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(4, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((97692412340382747278485 : Rat) / 944793217079644179807) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19538482468076549455697 : Rat) / 314931072359881393269) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((97692412340382747278485 : Rat) / 944793217079644179807) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19538482468076549455697 : Rat) / 314931072359881393269) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((10997521498308441154235 : Rat) / 269940919165612622802) [(4, 1), (9, 3), (11, 1), (16, 1)],
  term ((-2199504299661688230847 : Rat) / 89980306388537540934) [(4, 1), (9, 3), (15, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-208050597016375704618395 : Rat) / 944793217079644179807) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((41610119403275140923679 : Rat) / 314931072359881393269) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10997521498308441154235 : Rat) / 269940919165612622802) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((2199504299661688230847 : Rat) / 89980306388537540934) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((-208050597016375704618395 : Rat) / 944793217079644179807) [(5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((41610119403275140923679 : Rat) / 314931072359881393269) [(5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-134800413715859650985 : Rat) / 381811766853766086) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((26960082743171930197 : Rat) / 127270588951255362) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-134800413715859650985 : Rat) / 381811766853766086) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((26960082743171930197 : Rat) / 127270588951255362) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((17844114622614003555035 : Rat) / 314931072359881393269) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1830277555731415537997 : Rat) / 29993435462845846978) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 1889586434159288359614) [(8, 2), (11, 2), (16, 1)],
  term ((-3568822924522800711007 : Rat) / 104977024119960464423) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(8, 2), (15, 2), (16, 1)],
  term ((17844114622614003555035 : Rat) / 314931072359881393269) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-76932215320372771359995 : Rat) / 944793217079644179807) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-228338901502138650999590 : Rat) / 944793217079644179807) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1974639146540871569912 : Rat) / 14996717731422923489) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1830277555731415537997 : Rat) / 29993435462845846978) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((9873195732704357849560 : Rat) / 44990153194268770467) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((100784493098877911007535 : Rat) / 1889586434159288359614) [(9, 2), (11, 2), (16, 1)],
  term ((-3568822924522800711007 : Rat) / 104977024119960464423) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15386443064074554271999 : Rat) / 314931072359881393269) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((45667780300427730199918 : Rat) / 314931072359881393269) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1827893005058414409643 : Rat) / 104977024119960464423) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 34. -/
theorem rs_R007_ueqv_R007NY_block_11_0000_0034_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_11_0000_0034
      rs_R007_ueqv_R007NY_block_11_0000_0034 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
