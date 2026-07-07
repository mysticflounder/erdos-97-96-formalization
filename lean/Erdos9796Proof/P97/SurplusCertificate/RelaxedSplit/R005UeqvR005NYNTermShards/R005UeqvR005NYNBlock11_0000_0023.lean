/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 11:0-23

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_11_0000_0023 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0000 : Poly :=
[
  term ((-465920 : Rat) / 52799) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0000 : Poly :=
[
  term ((-931840 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((465920 : Rat) / 52799) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((465920 : Rat) / 52799) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-931840 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0000
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0001 : Poly :=
[
  term ((-2829792 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0001 : Poly :=
[
  term ((-5659584 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2829792 : Rat) / 385571) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((2829792 : Rat) / 385571) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-5659584 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0001
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0002 : Poly :=
[
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0002 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0002
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0003 : Poly :=
[
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0003 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0003
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0004 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0004 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0004
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0005 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0005 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0005
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0006 : Poly :=
[
  term ((-10753024 : Rat) / 158397) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0006 : Poly :=
[
  term ((-21506048 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-21506048 : Rat) / 158397) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((10753024 : Rat) / 158397) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((10753024 : Rat) / 158397) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0006
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0007 : Poly :=
[
  term ((-9253904 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0007 : Poly :=
[
  term ((-18507808 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18507808 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((9253904 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((9253904 : Rat) / 385571) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0007
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0008 : Poly :=
[
  term ((199680 : Rat) / 52799) [(0, 1), (15, 2)]
]

/-- Partial product 8 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0008 : Poly :=
[
  term ((399360 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((399360 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-199680 : Rat) / 52799) [(0, 1), (4, 2), (15, 2)],
  term ((-199680 : Rat) / 52799) [(0, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0008
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0009 : Poly :=
[
  term ((1212768 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0009 : Poly :=
[
  term ((2425536 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((2425536 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1212768 : Rat) / 385571) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-1212768 : Rat) / 385571) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0009
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0010 : Poly :=
[
  term ((-3691360 : Rat) / 158397) [(3, 1), (15, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0010 : Poly :=
[
  term ((-7382720 : Rat) / 158397) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((3691360 : Rat) / 158397) [(3, 1), (4, 2), (15, 1)],
  term ((3691360 : Rat) / 158397) [(3, 1), (5, 2), (15, 1)],
  term ((-7382720 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0010
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0011 : Poly :=
[
  term ((2303780 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0011 : Poly :=
[
  term ((4607560 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2303780 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2303780 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((4607560 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0011
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0012 : Poly :=
[
  term ((14454016 : Rat) / 158397) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0012 : Poly :=
[
  term ((28908032 : Rat) / 158397) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((28908032 : Rat) / 158397) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-14454016 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-14454016 : Rat) / 158397) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0012
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0013 : Poly :=
[
  term ((-4132528 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0013 : Poly :=
[
  term ((-8265056 : Rat) / 385571) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8265056 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4132528 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((4132528 : Rat) / 385571) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0013
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0014 : Poly :=
[
  term ((-3199744 : Rat) / 52799) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0014 : Poly :=
[
  term ((-6399488 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-6399488 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((3199744 : Rat) / 52799) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((3199744 : Rat) / 52799) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0014
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0015 : Poly :=
[
  term ((11972640 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0015 : Poly :=
[
  term ((23945280 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((23945280 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11972640 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11972640 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0015
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0016 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(8, 1), (15, 2)]
]

/-- Partial product 16 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0016 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((6225920 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(5, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0016_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0016
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0017 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0017 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0017_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0017
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0018 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0018 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(5, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0018_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0018
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0019 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0019 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0019_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0019
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0020 : Poly :=
[
  term ((1405312 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0020 : Poly :=
[
  term ((2810624 : Rat) / 158397) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((2810624 : Rat) / 158397) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-1405312 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((-1405312 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0020_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0020
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0021 : Poly :=
[
  term ((1997048 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0021 : Poly :=
[
  term ((3994096 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3994096 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1997048 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1997048 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0021_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0021
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0022 : Poly :=
[
  term ((-2018752 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 22 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0022 : Poly :=
[
  term ((-4037504 : Rat) / 52799) [(2, 1), (4, 1), (15, 2)],
  term ((-4037504 : Rat) / 52799) [(3, 1), (5, 1), (15, 2)],
  term ((2018752 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((2018752 : Rat) / 52799) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0022_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0022
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NYN_coefficient_11_0023 : Poly :=
[
  term ((-3763876 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R005_ueqv_R005NYN_partial_11_0023 : Poly :=
[
  term ((-7527752 : Rat) / 385571) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-7527752 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((3763876 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((3763876 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R005_ueqv_R005NYN_partial_11_0023_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_11_0023
        rs_R005_ueqv_R005NYN_generator_11_0000_0023 =
      rs_R005_ueqv_R005NYN_partial_11_0023 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_11_0000_0023 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_11_0000,
  rs_R005_ueqv_R005NYN_partial_11_0001,
  rs_R005_ueqv_R005NYN_partial_11_0002,
  rs_R005_ueqv_R005NYN_partial_11_0003,
  rs_R005_ueqv_R005NYN_partial_11_0004,
  rs_R005_ueqv_R005NYN_partial_11_0005,
  rs_R005_ueqv_R005NYN_partial_11_0006,
  rs_R005_ueqv_R005NYN_partial_11_0007,
  rs_R005_ueqv_R005NYN_partial_11_0008,
  rs_R005_ueqv_R005NYN_partial_11_0009,
  rs_R005_ueqv_R005NYN_partial_11_0010,
  rs_R005_ueqv_R005NYN_partial_11_0011,
  rs_R005_ueqv_R005NYN_partial_11_0012,
  rs_R005_ueqv_R005NYN_partial_11_0013,
  rs_R005_ueqv_R005NYN_partial_11_0014,
  rs_R005_ueqv_R005NYN_partial_11_0015,
  rs_R005_ueqv_R005NYN_partial_11_0016,
  rs_R005_ueqv_R005NYN_partial_11_0017,
  rs_R005_ueqv_R005NYN_partial_11_0018,
  rs_R005_ueqv_R005NYN_partial_11_0019,
  rs_R005_ueqv_R005NYN_partial_11_0020,
  rs_R005_ueqv_R005NYN_partial_11_0021,
  rs_R005_ueqv_R005NYN_partial_11_0022,
  rs_R005_ueqv_R005NYN_partial_11_0023
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_11_0000_0023 : Poly :=
[
  term ((-931840 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-5659584 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21506048 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-18507808 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((399360 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((2425536 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((465920 : Rat) / 52799) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((2829792 : Rat) / 385571) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21506048 : Rat) / 158397) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-18507808 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((399360 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((2425536 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((465920 : Rat) / 52799) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((2829792 : Rat) / 385571) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-931840 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-5659584 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10753024 : Rat) / 158397) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((9253904 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-199680 : Rat) / 52799) [(0, 1), (4, 2), (15, 2)],
  term ((-1212768 : Rat) / 385571) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 3), (9, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 3), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10753024 : Rat) / 158397) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((9253904 : Rat) / 385571) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-199680 : Rat) / 52799) [(0, 1), (5, 2), (15, 2)],
  term ((-1212768 : Rat) / 385571) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-7382720 : Rat) / 158397) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((4607560 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-6399488 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((23945280 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2810624 : Rat) / 158397) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((3994096 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4037504 : Rat) / 52799) [(2, 1), (4, 1), (15, 2)],
  term ((-7527752 : Rat) / 385571) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((28908032 : Rat) / 158397) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-8265056 : Rat) / 385571) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((28908032 : Rat) / 158397) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-8265056 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3691360 : Rat) / 158397) [(3, 1), (4, 2), (15, 1)],
  term ((-2303780 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-6399488 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((23945280 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2810624 : Rat) / 158397) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((3994096 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4037504 : Rat) / 52799) [(3, 1), (5, 1), (15, 2)],
  term ((-7527752 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((3691360 : Rat) / 158397) [(3, 1), (5, 2), (15, 1)],
  term ((-2303780 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-7382720 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)],
  term ((4607560 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-14454016 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((4132528 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3199744 : Rat) / 52799) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-11972640 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1405312 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((-1997048 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((2018752 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((3763876 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-14454016 : Rat) / 158397) [(4, 3), (9, 1), (15, 1)],
  term ((4132528 : Rat) / 385571) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((3199744 : Rat) / 52799) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-11972640 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 2), (8, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1405312 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((-1997048 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2018752 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((3763876 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 23. -/
theorem rs_R005_ueqv_R005NYN_block_11_0000_0023_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_11_0000_0023
      rs_R005_ueqv_R005NYN_block_11_0000_0023 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
