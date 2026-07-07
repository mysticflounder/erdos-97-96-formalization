/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 27:100-136

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_27_0100_0136 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0100 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0100 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0100
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0101 : Poly :=
[
  term ((5964634703344195464595 : Rat) / 77125976904460749372) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0101 : Poly :=
[
  term ((-5964634703344195464595 : Rat) / 38562988452230374686) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 77125976904460749372) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 38562988452230374686) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 77125976904460749372) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 38562988452230374686) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 38562988452230374686) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 77125976904460749372) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 77125976904460749372) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0101
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0102 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0102 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0102
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0103 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0103 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0103
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0104 : Poly :=
[
  term ((-1192926940668839092919 : Rat) / 25708658968153583124) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0104 : Poly :=
[
  term ((1192926940668839092919 : Rat) / 12854329484076791562) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 25708658968153583124) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((1192926940668839092919 : Rat) / 12854329484076791562) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 25708658968153583124) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 12854329484076791562) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 12854329484076791562) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1192926940668839092919 : Rat) / 25708658968153583124) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1192926940668839092919 : Rat) / 25708658968153583124) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0104
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0105 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0105 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (10, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (10, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0105
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0106 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 106 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0106 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0106
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0107 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0107 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0107
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0108 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0108 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0108
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0109 : Poly :=
[
  term ((-248548189709469702884590 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0109 : Poly :=
[
  term ((497096379418939405769180 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-248548189709469702884590 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((497096379418939405769180 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-248548189709469702884590 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-497096379418939405769180 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((248548189709469702884590 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((248548189709469702884590 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-497096379418939405769180 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0109
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0110 : Poly :=
[
  term ((212943577132224130834385 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 110 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0110 : Poly :=
[
  term ((-425887154264448261668770 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((212943577132224130834385 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425887154264448261668770 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((212943577132224130834385 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((425887154264448261668770 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-212943577132224130834385 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-212943577132224130834385 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((425887154264448261668770 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0110
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0111 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0111 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0111
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0112 : Poly :=
[
  term ((-1143722262489382717603075 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0112 : Poly :=
[
  term ((1143722262489382717603075 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 1889586434159288359614) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0112
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0113 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0113 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0113
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0114 : Poly :=
[
  term ((-511672846800982406910467 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0114 : Poly :=
[
  term ((511672846800982406910467 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((511672846800982406910467 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((511672846800982406910467 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((511672846800982406910467 : Rat) / 3779172868318576719228) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0114
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0115 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0115 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0115
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0116 : Poly :=
[
  term ((28708767297241215887797 : Rat) / 359921225554150163736) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0116 : Poly :=
[
  term ((-28708767297241215887797 : Rat) / 179960612777075081868) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 359921225554150163736) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 179960612777075081868) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 359921225554150163736) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 179960612777075081868) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 359921225554150163736) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 359921225554150163736) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0116
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0117 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0117 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0117
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0118 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 118 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0118 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0118
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0119 : Poly :=
[
  term ((449315573094998705368045 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 119 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0119 : Poly :=
[
  term ((-449315573094998705368045 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 3779172868318576719228) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 1889586434159288359614) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 3779172868318576719228) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((449315573094998705368045 : Rat) / 1889586434159288359614) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 3779172868318576719228) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0119
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0120 : Poly :=
[
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(11, 2), (16, 1)]
]

/-- Partial product 120 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0120 : Poly :=
[
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (16, 1)],
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (16, 1)],
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(11, 2), (14, 2), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0120
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0121 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0121 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0121
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0122 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0122 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0122
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0123 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0123 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0123
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0124 : Poly :=
[
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0124 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 3), (16, 1)],
  term ((1 : Rat) / 3) [(12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0124
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0125 : Poly :=
[
  term ((52691712093112946652374 : Rat) / 314931072359881393269) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0125 : Poly :=
[
  term ((-105383424186225893304748 : Rat) / 314931072359881393269) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((52691712093112946652374 : Rat) / 314931072359881393269) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-105383424186225893304748 : Rat) / 314931072359881393269) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52691712093112946652374 : Rat) / 314931072359881393269) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((105383424186225893304748 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-52691712093112946652374 : Rat) / 314931072359881393269) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-52691712093112946652374 : Rat) / 314931072359881393269) [(12, 1), (15, 4), (16, 1)],
  term ((105383424186225893304748 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0125
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0126 : Poly :=
[
  term ((-1 : Rat) / 6) [(12, 1), (16, 1)]
]

/-- Partial product 126 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0126 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (12, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (12, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (12, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0126
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0127 : Poly :=
[
  term ((-42588715426444826166877 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0127 : Poly :=
[
  term ((85177430852889652333754 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42588715426444826166877 : Rat) / 314931072359881393269) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((85177430852889652333754 : Rat) / 314931072359881393269) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42588715426444826166877 : Rat) / 314931072359881393269) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85177430852889652333754 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((42588715426444826166877 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((42588715426444826166877 : Rat) / 314931072359881393269) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-85177430852889652333754 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0127
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0128 : Poly :=
[
  term ((76318135515372154816487 : Rat) / 419908096479841857692) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0128 : Poly :=
[
  term ((-76318135515372154816487 : Rat) / 209954048239920928846) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((76318135515372154816487 : Rat) / 419908096479841857692) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 209954048239920928846) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((76318135515372154816487 : Rat) / 419908096479841857692) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((76318135515372154816487 : Rat) / 209954048239920928846) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 419908096479841857692) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 419908096479841857692) [(13, 1), (15, 3), (16, 1)],
  term ((76318135515372154816487 : Rat) / 209954048239920928846) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0128
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0129 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0129 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 5), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0129
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0130 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0130 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 4), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0130
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0131 : Poly :=
[
  term ((1729167878171308454926 : Rat) / 44990153194268770467) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0131 : Poly :=
[
  term ((-3458335756342616909852 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1729167878171308454926 : Rat) / 44990153194268770467) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3458335756342616909852 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1729167878171308454926 : Rat) / 44990153194268770467) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((3458335756342616909852 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3458335756342616909852 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1729167878171308454926 : Rat) / 44990153194268770467) [(14, 1), (15, 4), (16, 1)],
  term ((-1729167878171308454926 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0131
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0132 : Poly :=
[
  term ((-1 : Rat) / 12) [(14, 1), (16, 1)]
]

/-- Partial product 132 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0132 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 12) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0132
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0133 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0133 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0133
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0134 : Poly :=
[
  term ((-63104292588849866443071 : Rat) / 839816192959683715384) [(15, 2), (16, 1)]
]

/-- Partial product 134 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0134 : Poly :=
[
  term ((63104292588849866443071 : Rat) / 419908096479841857692) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 839816192959683715384) [(0, 2), (15, 2), (16, 1)],
  term ((63104292588849866443071 : Rat) / 419908096479841857692) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 839816192959683715384) [(1, 2), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 419908096479841857692) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 419908096479841857692) [(13, 1), (15, 3), (16, 1)],
  term ((63104292588849866443071 : Rat) / 839816192959683715384) [(14, 2), (15, 2), (16, 1)],
  term ((63104292588849866443071 : Rat) / 839816192959683715384) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0134
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0135 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

/-- Partial product 135 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0135 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (15, 4), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(13, 1), (15, 5), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0135
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def rs_R007_ueqv_R007NY_coefficient_27_0136 : Poly :=
[
  term ((-1 : Rat) / 4) [(16, 1)]
]

/-- Partial product 136 for generator 27. -/
def rs_R007_ueqv_R007NY_partial_27_0136 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 2), (16, 1)],
  term ((1 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(14, 2), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem rs_R007_ueqv_R007NY_partial_27_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_27_0136
        rs_R007_ueqv_R007NY_generator_27_0100_0136 =
      rs_R007_ueqv_R007NY_partial_27_0136 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_27_0100_0136 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_27_0100,
  rs_R007_ueqv_R007NY_partial_27_0101,
  rs_R007_ueqv_R007NY_partial_27_0102,
  rs_R007_ueqv_R007NY_partial_27_0103,
  rs_R007_ueqv_R007NY_partial_27_0104,
  rs_R007_ueqv_R007NY_partial_27_0105,
  rs_R007_ueqv_R007NY_partial_27_0106,
  rs_R007_ueqv_R007NY_partial_27_0107,
  rs_R007_ueqv_R007NY_partial_27_0108,
  rs_R007_ueqv_R007NY_partial_27_0109,
  rs_R007_ueqv_R007NY_partial_27_0110,
  rs_R007_ueqv_R007NY_partial_27_0111,
  rs_R007_ueqv_R007NY_partial_27_0112,
  rs_R007_ueqv_R007NY_partial_27_0113,
  rs_R007_ueqv_R007NY_partial_27_0114,
  rs_R007_ueqv_R007NY_partial_27_0115,
  rs_R007_ueqv_R007NY_partial_27_0116,
  rs_R007_ueqv_R007NY_partial_27_0117,
  rs_R007_ueqv_R007NY_partial_27_0118,
  rs_R007_ueqv_R007NY_partial_27_0119,
  rs_R007_ueqv_R007NY_partial_27_0120,
  rs_R007_ueqv_R007NY_partial_27_0121,
  rs_R007_ueqv_R007NY_partial_27_0122,
  rs_R007_ueqv_R007NY_partial_27_0123,
  rs_R007_ueqv_R007NY_partial_27_0124,
  rs_R007_ueqv_R007NY_partial_27_0125,
  rs_R007_ueqv_R007NY_partial_27_0126,
  rs_R007_ueqv_R007NY_partial_27_0127,
  rs_R007_ueqv_R007NY_partial_27_0128,
  rs_R007_ueqv_R007NY_partial_27_0129,
  rs_R007_ueqv_R007NY_partial_27_0130,
  rs_R007_ueqv_R007NY_partial_27_0131,
  rs_R007_ueqv_R007NY_partial_27_0132,
  rs_R007_ueqv_R007NY_partial_27_0133,
  rs_R007_ueqv_R007NY_partial_27_0134,
  rs_R007_ueqv_R007NY_partial_27_0135,
  rs_R007_ueqv_R007NY_partial_27_0136
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_27_0100_0136 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 38562988452230374686) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1192926940668839092919 : Rat) / 12854329484076791562) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-425887154264448261668770 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((511672846800982406910467 : Rat) / 1889586434159288359614) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 179960612777075081868) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((497096379418939405769180 : Rat) / 944793217079644179807) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((85177430852889652333754 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 209954048239920928846) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3458335756342616909852 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((63104292588849866443071 : Rat) / 419908096479841857692) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (12, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-105383424186225893304748 : Rat) / 314931072359881393269) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (12, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 77125976904460749372) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 25708658968153583124) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248548189709469702884590 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((212943577132224130834385 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 359921225554150163736) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 3779172868318576719228) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((52691712093112946652374 : Rat) / 314931072359881393269) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (12, 1), (16, 1)],
  term ((-42588715426444826166877 : Rat) / 314931072359881393269) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((76318135515372154816487 : Rat) / 419908096479841857692) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((1729167878171308454926 : Rat) / 44990153194268770467) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (14, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 839816192959683715384) [(0, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 2), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 38562988452230374686) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1192926940668839092919 : Rat) / 12854329484076791562) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((497096379418939405769180 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((511672846800982406910467 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 179960612777075081868) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-425887154264448261668770 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 1889586434159288359614) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-145299655311850235539430 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105383424186225893304748 : Rat) / 314931072359881393269) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3458335756342616909852 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((63104292588849866443071 : Rat) / 419908096479841857692) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 2) [(1, 1), (13, 1), (16, 1)],
  term ((85177430852889652333754 : Rat) / 314931072359881393269) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 209954048239920928846) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 77125976904460749372) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 25708658968153583124) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248548189709469702884590 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((212943577132224130834385 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-511672846800982406910467 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 359921225554150163736) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 3779172868318576719228) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((72649827655925117769715 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((52691712093112946652374 : Rat) / 314931072359881393269) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (12, 1), (16, 1)],
  term ((-42588715426444826166877 : Rat) / 314931072359881393269) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((76318135515372154816487 : Rat) / 419908096479841857692) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((1729167878171308454926 : Rat) / 44990153194268770467) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (14, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-63104292588849866443071 : Rat) / 839816192959683715384) [(1, 2), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5964634703344195464595 : Rat) / 38562988452230374686) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((5428068830436756809885 : Rat) / 29993435462845846978) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 77125976904460749372) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5964634703344195464595 : Rat) / 77125976904460749372) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1192926940668839092919 : Rat) / 12854329484076791562) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3256841298262054085931 : Rat) / 29993435462845846978) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1192926940668839092919 : Rat) / 25708658968153583124) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (15, 2), (16, 1)],
  term ((1192926940668839092919 : Rat) / 25708658968153583124) [(10, 1), (15, 4), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((500439008044923413555170 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-422544525638464253882780 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((28708767297241215887797 : Rat) / 179960612777075081868) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26891830083661975245200 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-694117494383000054347 : Rat) / 89980306388537540934) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26891830083661975245200 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((248548189709469702884590 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-497096379418939405769180 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-312520000355143556193079 : Rat) / 629862144719762786538) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26891830083661975245200 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1143722262489382717603075 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-212943577132224130834385 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((436651593932862062811703 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26891830083661975245200 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((425887154264448261668770 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1143722262489382717603075 : Rat) / 1889586434159288359614) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((511672846800982406910467 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 359921225554150163736) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((511672846800982406910467 : Rat) / 3779172868318576719228) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (14, 4), (15, 1), (16, 1)],
  term ((-28708767297241215887797 : Rat) / 359921225554150163736) [(11, 1), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(11, 1), (15, 5), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1498548975821768188065 : Rat) / 5674433736214079158) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((449315573094998705368045 : Rat) / 1889586434159288359614) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((145299655311850235539430 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(11, 2), (14, 2), (16, 1)],
  term ((-449315573094998705368045 : Rat) / 3779172868318576719228) [(11, 2), (14, 3), (16, 1)],
  term ((-72649827655925117769715 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)],
  term ((229164360594356385378307 : Rat) / 629862144719762786538) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-100087801608984682711034 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((90473053430130862927468 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-189522831814789520258059 : Rat) / 1259724289439525573076) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5378366016732395049040 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 2) [(12, 1), (14, 1), (16, 1)],
  term ((-9494453932904876094470 : Rat) / 104977024119960464423) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((5378366016732395049040 : Rat) / 314931072359881393269) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 3), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (15, 2), (16, 1)],
  term ((-52691712093112946652374 : Rat) / 314931072359881393269) [(12, 1), (15, 4), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((105383424186225893304748 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (14, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(12, 2), (14, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22265688573614381511947 : Rat) / 104977024119960464423) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-76318135515372154816487 : Rat) / 419908096479841857692) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5378366016732395049040 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((42588715426444826166877 : Rat) / 314931072359881393269) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term ((-69711214052111010629779 : Rat) / 209954048239920928846) [(13, 1), (15, 3), (16, 1)],
  term ((5378366016732395049040 : Rat) / 314931072359881393269) [(13, 1), (15, 5), (16, 1)],
  term ((-85177430852889652333754 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((76318135515372154816487 : Rat) / 209954048239920928846) [(13, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(13, 3), (15, 3), (16, 1)],
  term ((1 : Rat) / 12) [(14, 1), (15, 2), (16, 1)],
  term ((-1729167878171308454926 : Rat) / 44990153194268770467) [(14, 1), (15, 4), (16, 1)],
  term ((63104292588849866443071 : Rat) / 839816192959683715384) [(14, 2), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 4) [(14, 2), (16, 1)],
  term ((-1729167878171308454926 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)],
  term ((1 : Rat) / 12) [(14, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(14, 4), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(15, 2), (16, 1)],
  term ((63104292588849866443071 : Rat) / 839816192959683715384) [(15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 136. -/
theorem rs_R007_ueqv_R007NY_block_27_0100_0136_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_27_0100_0136
      rs_R007_ueqv_R007NY_block_27_0100_0136 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
