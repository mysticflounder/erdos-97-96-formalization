/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 7:0-94

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0000 : Poly :=
[
  term ((-237490966335395 : Rat) / 1450535630922) []
]

/-- Partial product 0 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0000 : Poly :=
[
  term ((237490966335395 : Rat) / 725267815461) [(0, 1), (2, 1)],
  term ((-237490966335395 : Rat) / 725267815461) [(0, 1), (6, 1)],
  term ((237490966335395 : Rat) / 725267815461) [(1, 1), (3, 1)],
  term ((-237490966335395 : Rat) / 725267815461) [(1, 1), (7, 1)],
  term ((-237490966335395 : Rat) / 1450535630922) [(2, 2)],
  term ((-237490966335395 : Rat) / 1450535630922) [(3, 2)],
  term ((237490966335395 : Rat) / 1450535630922) [(6, 2)],
  term ((237490966335395 : Rat) / 1450535630922) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0000
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0001 : Poly :=
[
  term ((56691391963933 : Rat) / 483511876974) [(0, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0001 : Poly :=
[
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (1, 1), (3, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (2, 2)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (3, 2)],
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1), (6, 2)],
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1), (7, 2)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 2), (2, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0001
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0002 : Poly :=
[
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0002 : Poly :=
[
  term ((2438918030895347 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((-2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 3)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 3), (3, 1)],
  term ((2438918030895347 : Rat) / 6527410339149) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(1, 2), (2, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0002
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0003 : Poly :=
[
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0003 : Poly :=
[
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 3)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 3), (7, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 2), (2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0003
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0004 : Poly :=
[
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0004 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (6, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 3), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 2), (2, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0004
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0005 : Poly :=
[
  term ((861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0005 : Poly :=
[
  term ((861129574574653 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 3), (11, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((861129574574653 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0005
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0006 : Poly :=
[
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0006 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 3), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 2), (2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0006
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0007 : Poly :=
[
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0007 : Poly :=
[
  term ((985 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0007
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0008 : Poly :=
[
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0008 : Poly :=
[
  term ((-3479580527781145 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 3), (15, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-3479580527781145 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0008
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0009 : Poly :=
[
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0009 : Poly :=
[
  term ((-410 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0009
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0010 : Poly :=
[
  term ((-42040522999549 : Rat) / 207219375846) [(1, 1), (3, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0010 : Poly :=
[
  term ((42040522999549 : Rat) / 103609687923) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-42040522999549 : Rat) / 103609687923) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((-42040522999549 : Rat) / 207219375846) [(1, 1), (2, 2), (3, 1)],
  term ((42040522999549 : Rat) / 207219375846) [(1, 1), (3, 1), (6, 2)],
  term ((42040522999549 : Rat) / 207219375846) [(1, 1), (3, 1), (7, 2)],
  term ((-42040522999549 : Rat) / 207219375846) [(1, 1), (3, 3)],
  term ((-42040522999549 : Rat) / 103609687923) [(1, 2), (3, 1), (7, 1)],
  term ((42040522999549 : Rat) / 103609687923) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0010
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0011 : Poly :=
[
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0011 : Poly :=
[
  term ((-209634918076240 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((209634918076240 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2), (10, 1)],
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 3), (10, 1)],
  term ((209634918076240 : Rat) / 6527410339149) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-209634918076240 : Rat) / 6527410339149) [(1, 2), (3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0011
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0012 : Poly :=
[
  term ((974580364564039 : Rat) / 4351606892766) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0012 : Poly :=
[
  term ((-974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 1), (3, 3), (14, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0012
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0013 : Poly :=
[
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0013 : Poly :=
[
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (6, 2), (7, 1), (10, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (7, 3), (10, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 2), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0013
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0014 : Poly :=
[
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0014 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (6, 2), (9, 1), (10, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (7, 2), (9, 1), (10, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0014
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0015 : Poly :=
[
  term ((-407632441893949 : Rat) / 4351606892766) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0015 : Poly :=
[
  term ((407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(1, 1), (6, 2), (10, 1), (11, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((407632441893949 : Rat) / 2175803446383) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(1, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0015
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0016 : Poly :=
[
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0016 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (6, 2), (10, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0016
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0017 : Poly :=
[
  term ((-985 : Rat) / 84) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0017 : Poly :=
[
  term ((985 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0017
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0018 : Poly :=
[
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 18 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0018 : Poly :=
[
  term ((186438119844128 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(1, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0018
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0019 : Poly :=
[
  term ((205 : Rat) / 21) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0019 : Poly :=
[
  term ((-410 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0019
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0020 : Poly :=
[
  term ((974580364564039 : Rat) / 8703213785532) [(1, 1), (11, 1)]
]

/-- Partial product 20 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0020 : Poly :=
[
  term ((-974580364564039 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((974580364564039 : Rat) / 8703213785532) [(1, 1), (2, 2), (11, 1)],
  term ((974580364564039 : Rat) / 8703213785532) [(1, 1), (3, 2), (11, 1)],
  term ((-974580364564039 : Rat) / 8703213785532) [(1, 1), (6, 2), (11, 1)],
  term ((-974580364564039 : Rat) / 8703213785532) [(1, 1), (7, 2), (11, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0020
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0021 : Poly :=
[
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 21 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0021 : Poly :=
[
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0021
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0022 : Poly :=
[
  term ((8679493899502841 : Rat) / 26109641356596) [(1, 1), (15, 1)]
]

/-- Partial product 22 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0022 : Poly :=
[
  term ((-8679493899502841 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((8679493899502841 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((8679493899502841 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((8679493899502841 : Rat) / 26109641356596) [(1, 1), (3, 2), (15, 1)],
  term ((-8679493899502841 : Rat) / 26109641356596) [(1, 1), (6, 2), (15, 1)],
  term ((-8679493899502841 : Rat) / 26109641356596) [(1, 1), (7, 2), (15, 1)],
  term ((-8679493899502841 : Rat) / 13054820678298) [(1, 2), (3, 1), (15, 1)],
  term ((8679493899502841 : Rat) / 13054820678298) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0022
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0023 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1)]
]

/-- Partial product 23 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0023 : Poly :=
[
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (3, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (6, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (7, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 3)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 3), (2, 1), (3, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0023
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0024 : Poly :=
[
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (10, 1)]
]

/-- Partial product 24 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0024 : Poly :=
[
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 2), (10, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (3, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (6, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (7, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 3), (3, 1), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0024
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0025 : Poly :=
[
  term ((4596599348427 : Rat) / 53723541886) [(2, 1)]
]

/-- Partial product 25 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0025 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(0, 1), (2, 1), (6, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 1), (2, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1)],
  term ((4596599348427 : Rat) / 53723541886) [(2, 1), (3, 2)],
  term ((-4596599348427 : Rat) / 53723541886) [(2, 1), (6, 2)],
  term ((-4596599348427 : Rat) / 53723541886) [(2, 1), (7, 2)],
  term ((4596599348427 : Rat) / 53723541886) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0025
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0026 : Poly :=
[
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 26 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0026 : Poly :=
[
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (6, 2), (7, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 3)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 3), (7, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 3), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0026
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0027 : Poly :=
[
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 27 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0027 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 3), (9, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0027
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0028 : Poly :=
[
  term ((-611427414825223 : Rat) / 621658127538) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 28 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0028 : Poly :=
[
  term ((-611427414825223 : Rat) / 310829063769) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((611427414825223 : Rat) / 310829063769) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-611427414825223 : Rat) / 310829063769) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((611427414825223 : Rat) / 310829063769) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((611427414825223 : Rat) / 621658127538) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((611427414825223 : Rat) / 621658127538) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((-611427414825223 : Rat) / 621658127538) [(2, 1), (3, 3), (11, 1)],
  term ((-611427414825223 : Rat) / 621658127538) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0028
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0029 : Poly :=
[
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 29 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0029 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 3), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0029
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0030 : Poly :=
[
  term ((985 : Rat) / 84) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0030 : Poly :=
[
  term ((985 : Rat) / 42) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 3), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0030
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0031 : Poly :=
[
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 31 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0031 : Poly :=
[
  term ((55420968674520529 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((55420968674520529 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 3), (15, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0031
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0032 : Poly :=
[
  term ((-205 : Rat) / 21) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0032 : Poly :=
[
  term ((-410 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0032
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0033 : Poly :=
[
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2)]
]

/-- Partial product 33 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0033 : Poly :=
[
  term ((-2817638222726165 : Rat) / 1864974382614) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((2817638222726165 : Rat) / 1864974382614) [(0, 1), (2, 2), (3, 2)],
  term ((-2817638222726165 : Rat) / 1864974382614) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((2817638222726165 : Rat) / 1864974382614) [(1, 1), (2, 1), (3, 3)],
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (6, 2)],
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (7, 2)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 4)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0033
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0034 : Poly :=
[
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 34 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0034 : Poly :=
[
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 3), (15, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0034
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0035 : Poly :=
[
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0035 : Poly :=
[
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0035
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0036 : Poly :=
[
  term ((23700942062664205 : Rat) / 8703213785532) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0036 : Poly :=
[
  term ((23700942062664205 : Rat) / 4351606892766) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 4351606892766) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 8703213785532) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 8703213785532) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 8703213785532) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 8703213785532) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0036
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0037 : Poly :=
[
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0037 : Poly :=
[
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0037
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0038 : Poly :=
[
  term ((-2615 : Rat) / 84) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0038 : Poly :=
[
  term ((-2615 : Rat) / 42) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0038
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0039 : Poly :=
[
  term ((-5645253284836502 : Rat) / 2175803446383) [(2, 1), (15, 2)]
]

/-- Partial product 39 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0039 : Poly :=
[
  term ((-11290506569673004 : Rat) / 2175803446383) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((11290506569673004 : Rat) / 2175803446383) [(0, 1), (2, 2), (15, 2)],
  term ((11290506569673004 : Rat) / 2175803446383) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-11290506569673004 : Rat) / 2175803446383) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-5645253284836502 : Rat) / 2175803446383) [(2, 1), (3, 2), (15, 2)],
  term ((5645253284836502 : Rat) / 2175803446383) [(2, 1), (6, 2), (15, 2)],
  term ((5645253284836502 : Rat) / 2175803446383) [(2, 1), (7, 2), (15, 2)],
  term ((-5645253284836502 : Rat) / 2175803446383) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0039
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0040 : Poly :=
[
  term ((503 : Rat) / 21) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0040 : Poly :=
[
  term ((1006 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-1006 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((1006 : Rat) / 21) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((503 : Rat) / 21) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-503 : Rat) / 21) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-503 : Rat) / 21) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((503 : Rat) / 21) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0040
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0041 : Poly :=
[
  term ((-168541976108990 : Rat) / 103609687923) [(3, 1), (7, 1)]
]

/-- Partial product 41 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0041 : Poly :=
[
  term ((337083952217980 : Rat) / 103609687923) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((-337083952217980 : Rat) / 103609687923) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((-337083952217980 : Rat) / 103609687923) [(1, 1), (3, 1), (7, 2)],
  term ((337083952217980 : Rat) / 103609687923) [(1, 1), (3, 2), (7, 1)],
  term ((-168541976108990 : Rat) / 103609687923) [(2, 2), (3, 1), (7, 1)],
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (6, 2), (7, 1)],
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (7, 3)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0041
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0042 : Poly :=
[
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 42 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0042 : Poly :=
[
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (6, 2), (7, 1), (10, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 3), (10, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0042
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0043 : Poly :=
[
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 43 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0043 : Poly :=
[
  term ((-2479099248584962 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 3), (14, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0043
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0044 : Poly :=
[
  term ((-955768762520 : Rat) / 562077873) [(3, 1), (9, 1)]
]

/-- Partial product 44 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0044 : Poly :=
[
  term ((1911537525040 : Rat) / 562077873) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((-1911537525040 : Rat) / 562077873) [(0, 1), (3, 1), (6, 1), (9, 1)],
  term ((-1911537525040 : Rat) / 562077873) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((1911537525040 : Rat) / 562077873) [(1, 1), (3, 2), (9, 1)],
  term ((-955768762520 : Rat) / 562077873) [(2, 2), (3, 1), (9, 1)],
  term ((955768762520 : Rat) / 562077873) [(3, 1), (6, 2), (9, 1)],
  term ((955768762520 : Rat) / 562077873) [(3, 1), (7, 2), (9, 1)],
  term ((-955768762520 : Rat) / 562077873) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0044
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0045 : Poly :=
[
  term ((41195805866345 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 45 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0045 : Poly :=
[
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (7, 2), (9, 1), (10, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0045
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0046 : Poly :=
[
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 46 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0046 : Poly :=
[
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0046
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0047 : Poly :=
[
  term ((-3564803755736920 : Rat) / 6527410339149) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 47 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0047 : Poly :=
[
  term ((7129607511473840 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-7129607511473840 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-7129607511473840 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((7129607511473840 : Rat) / 6527410339149) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-3564803755736920 : Rat) / 6527410339149) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((3564803755736920 : Rat) / 6527410339149) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((3564803755736920 : Rat) / 6527410339149) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((-3564803755736920 : Rat) / 6527410339149) [(3, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0047
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0048 : Poly :=
[
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 48 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0048 : Poly :=
[
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (7, 2), (10, 1), (13, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0048
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0049 : Poly :=
[
  term ((2615 : Rat) / 84) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0049 : Poly :=
[
  term ((-2615 : Rat) / 42) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 42) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 42) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((2615 : Rat) / 84) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0049
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0050 : Poly :=
[
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 50 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0050 : Poly :=
[
  term ((-7579467735333952 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-7579467735333952 : Rat) / 2175803446383) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0050
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0051 : Poly :=
[
  term ((-503 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0051 : Poly :=
[
  term ((1006 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1006 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1006 : Rat) / 21) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((503 : Rat) / 21) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-503 : Rat) / 21) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0051
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0052 : Poly :=
[
  term ((19969583222803523 : Rat) / 13054820678298) [(3, 1), (11, 1)]
]

/-- Partial product 52 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0052 : Poly :=
[
  term ((-19969583222803523 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((19969583222803523 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((19969583222803523 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-19969583222803523 : Rat) / 6527410339149) [(1, 1), (3, 2), (11, 1)],
  term ((19969583222803523 : Rat) / 13054820678298) [(2, 2), (3, 1), (11, 1)],
  term ((-19969583222803523 : Rat) / 13054820678298) [(3, 1), (6, 2), (11, 1)],
  term ((-19969583222803523 : Rat) / 13054820678298) [(3, 1), (7, 2), (11, 1)],
  term ((19969583222803523 : Rat) / 13054820678298) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0052
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0053 : Poly :=
[
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 53 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0053 : Poly :=
[
  term ((22450012487789473 : Rat) / 5594923147842) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 5594923147842) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 5594923147842) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((22450012487789473 : Rat) / 5594923147842) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0053
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0054 : Poly :=
[
  term ((77747603088688 : Rat) / 44404151967) [(3, 1), (13, 1)]
]

/-- Partial product 54 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0054 : Poly :=
[
  term ((-155495206177376 : Rat) / 44404151967) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((155495206177376 : Rat) / 44404151967) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((155495206177376 : Rat) / 44404151967) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-155495206177376 : Rat) / 44404151967) [(1, 1), (3, 2), (13, 1)],
  term ((77747603088688 : Rat) / 44404151967) [(2, 2), (3, 1), (13, 1)],
  term ((-77747603088688 : Rat) / 44404151967) [(3, 1), (6, 2), (13, 1)],
  term ((-77747603088688 : Rat) / 44404151967) [(3, 1), (7, 2), (13, 1)],
  term ((77747603088688 : Rat) / 44404151967) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0054
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0055 : Poly :=
[
  term ((-280381883026811 : Rat) / 266424911802) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 55 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0055 : Poly :=
[
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0055
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0056 : Poly :=
[
  term ((-85 : Rat) / 21) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 56 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0056 : Poly :=
[
  term ((170 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0056
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0057 : Poly :=
[
  term ((-300 : Rat) / 7) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0057 : Poly :=
[
  term ((600 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((600 : Rat) / 7) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0057
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0058 : Poly :=
[
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 58 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0058 : Poly :=
[
  term ((-9073250124389974 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0058
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0059 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0059 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0059
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0060 : Poly :=
[
  term ((-134374289309783099 : Rat) / 39164462034894) [(3, 1), (15, 1)]
]

/-- Partial product 60 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0060 : Poly :=
[
  term ((134374289309783099 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-134374289309783099 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-134374289309783099 : Rat) / 19582231017447) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((134374289309783099 : Rat) / 19582231017447) [(1, 1), (3, 2), (15, 1)],
  term ((-134374289309783099 : Rat) / 39164462034894) [(2, 2), (3, 1), (15, 1)],
  term ((134374289309783099 : Rat) / 39164462034894) [(3, 1), (6, 2), (15, 1)],
  term ((134374289309783099 : Rat) / 39164462034894) [(3, 1), (7, 2), (15, 1)],
  term ((-134374289309783099 : Rat) / 39164462034894) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0060
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0061 : Poly :=
[
  term ((236 : Rat) / 7) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0061 : Poly :=
[
  term ((-472 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 7) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-472 : Rat) / 7) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 7) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 7) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0061
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0062 : Poly :=
[
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 2)]
]

/-- Partial product 62 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0062 : Poly :=
[
  term ((-4342565158683470 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 2)],
  term ((4342565158683470 : Rat) / 2175803446383) [(0, 1), (3, 2), (6, 1)],
  term ((4342565158683470 : Rat) / 2175803446383) [(1, 1), (3, 2), (7, 1)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(1, 1), (3, 3)],
  term ((2171282579341735 : Rat) / 2175803446383) [(2, 2), (3, 2)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (6, 2)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (7, 2)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0062
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0063 : Poly :=
[
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 2), (10, 1)]
]

/-- Partial product 63 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0063 : Poly :=
[
  term ((6331923393017665 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(1, 1), (3, 3), (10, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(2, 2), (3, 2), (10, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (6, 2), (10, 1)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (7, 2), (10, 1)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0063
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0064 : Poly :=
[
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (14, 1)]
]

/-- Partial product 64 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0064 : Poly :=
[
  term ((10813215080142800 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 3), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(2, 2), (3, 2), (14, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 2), (14, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (7, 2), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0064
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0065 : Poly :=
[
  term ((-29111795873371 : Rat) / 110167263108) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 65 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0065 : Poly :=
[
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(7, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0065
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0066 : Poly :=
[
  term ((29111795873371 : Rat) / 110167263108) [(7, 1), (11, 1)]
]

/-- Partial product 66 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0066 : Poly :=
[
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(1, 1), (7, 2), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 2), (7, 1), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(3, 2), (7, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(6, 2), (7, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0066
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0067 : Poly :=
[
  term ((-8192672238679723 : Rat) / 6527410339149) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 67 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0067 : Poly :=
[
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0067
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0068 : Poly :=
[
  term ((908594471205737 : Rat) / 532849823604) [(7, 1), (15, 1)]
]

/-- Partial product 68 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0068 : Poly :=
[
  term ((-908594471205737 : Rat) / 266424911802) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((908594471205737 : Rat) / 266424911802) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-908594471205737 : Rat) / 266424911802) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((908594471205737 : Rat) / 266424911802) [(1, 1), (7, 2), (15, 1)],
  term ((908594471205737 : Rat) / 532849823604) [(2, 2), (7, 1), (15, 1)],
  term ((908594471205737 : Rat) / 532849823604) [(3, 2), (7, 1), (15, 1)],
  term ((-908594471205737 : Rat) / 532849823604) [(6, 2), (7, 1), (15, 1)],
  term ((-908594471205737 : Rat) / 532849823604) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0068
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0069 : Poly :=
[
  term ((-4681094734615 : Rat) / 26979737904) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 69 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0069 : Poly :=
[
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0069
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0070 : Poly :=
[
  term ((4681094734615 : Rat) / 26979737904) [(9, 1), (11, 1)]
]

/-- Partial product 70 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0070 : Poly :=
[
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 2), (9, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(3, 2), (9, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(6, 2), (9, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0070
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0071 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 71 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0071 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0071
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0072 : Poly :=
[
  term ((69282374274035 : Rat) / 80939213712) [(9, 1), (15, 1)]
]

/-- Partial product 72 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0072 : Poly :=
[
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(2, 2), (9, 1), (15, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(3, 2), (9, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(6, 2), (9, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0072
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0073 : Poly :=
[
  term ((26586247929331 : Rat) / 152242806744) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 73 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0073 : Poly :=
[
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(7, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0073
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0074 : Poly :=
[
  term ((-985 : Rat) / 84) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 74 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0074 : Poly :=
[
  term ((985 : Rat) / 42) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0074
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0075 : Poly :=
[
  term ((-27359949449104 : Rat) / 2175803446383) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 75 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0075 : Poly :=
[
  term ((54719898898208 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54719898898208 : Rat) / 2175803446383) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((54719898898208 : Rat) / 2175803446383) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54719898898208 : Rat) / 2175803446383) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27359949449104 : Rat) / 2175803446383) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-27359949449104 : Rat) / 2175803446383) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((27359949449104 : Rat) / 2175803446383) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((27359949449104 : Rat) / 2175803446383) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0075
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0076 : Poly :=
[
  term ((205 : Rat) / 21) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0076 : Poly :=
[
  term ((-410 : Rat) / 21) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0076
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0077 : Poly :=
[
  term ((-861129574574653 : Rat) / 8703213785532) [(10, 1), (11, 2)]
]

/-- Partial product 77 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0077 : Poly :=
[
  term ((861129574574653 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-861129574574653 : Rat) / 4351606892766) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term ((861129574574653 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-861129574574653 : Rat) / 4351606892766) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-861129574574653 : Rat) / 8703213785532) [(2, 2), (10, 1), (11, 2)],
  term ((-861129574574653 : Rat) / 8703213785532) [(3, 2), (10, 1), (11, 2)],
  term ((861129574574653 : Rat) / 8703213785532) [(6, 2), (10, 1), (11, 2)],
  term ((861129574574653 : Rat) / 8703213785532) [(7, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0077
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0078 : Poly :=
[
  term ((-26586247929331 : Rat) / 152242806744) [(11, 1), (13, 1)]
]

/-- Partial product 78 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0078 : Poly :=
[
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 2), (11, 1), (13, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(3, 2), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(6, 2), (11, 1), (13, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0078
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0079 : Poly :=
[
  term ((-280381883026811 : Rat) / 799274735406) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 79 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0079 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0079
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0080 : Poly :=
[
  term ((-85 : Rat) / 63) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 80 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0080 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0080
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0081 : Poly :=
[
  term ((985 : Rat) / 84) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0081 : Poly :=
[
  term ((-985 : Rat) / 42) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((985 : Rat) / 84) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0081
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0082 : Poly :=
[
  term ((-24463746389447899 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 82 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0082 : Poly :=
[
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0082
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0083 : Poly :=
[
  term ((16 : Rat) / 9) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0083 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0083
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0084 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 84 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0084 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0084
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0085 : Poly :=
[
  term ((-11550541025189197 : Rat) / 6527410339149) [(11, 1), (15, 1)]
]

/-- Partial product 85 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0085 : Poly :=
[
  term ((23101082050378394 : Rat) / 6527410339149) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-23101082050378394 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((23101082050378394 : Rat) / 6527410339149) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-23101082050378394 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-11550541025189197 : Rat) / 6527410339149) [(2, 2), (11, 1), (15, 1)],
  term ((-11550541025189197 : Rat) / 6527410339149) [(3, 2), (11, 1), (15, 1)],
  term ((11550541025189197 : Rat) / 6527410339149) [(6, 2), (11, 1), (15, 1)],
  term ((11550541025189197 : Rat) / 6527410339149) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0085
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0086 : Poly :=
[
  term ((-205 : Rat) / 21) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0086 : Poly :=
[
  term ((410 : Rat) / 21) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((410 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 21) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((205 : Rat) / 21) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0086
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0087 : Poly :=
[
  term ((-5317815770493283 : Rat) / 17406427571064) [(11, 2)]
]

/-- Partial product 87 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0087 : Poly :=
[
  term ((5317815770493283 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2)],
  term ((-5317815770493283 : Rat) / 8703213785532) [(0, 1), (6, 1), (11, 2)],
  term ((5317815770493283 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2)],
  term ((-5317815770493283 : Rat) / 8703213785532) [(1, 1), (7, 1), (11, 2)],
  term ((-5317815770493283 : Rat) / 17406427571064) [(2, 2), (11, 2)],
  term ((-5317815770493283 : Rat) / 17406427571064) [(3, 2), (11, 2)],
  term ((5317815770493283 : Rat) / 17406427571064) [(6, 2), (11, 2)],
  term ((5317815770493283 : Rat) / 17406427571064) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0087
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0088 : Poly :=
[
  term ((33885160769843255 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 88 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0088 : Poly :=
[
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((33885160769843255 : Rat) / 26109641356596) [(3, 2), (11, 2), (14, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(6, 2), (11, 2), (14, 1)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0088
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0089 : Poly :=
[
  term ((-2796461151655097 : Rat) / 3197098941624) [(13, 1), (15, 1)]
]

/-- Partial product 89 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0089 : Poly :=
[
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(2, 2), (13, 1), (15, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(3, 2), (13, 1), (15, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(6, 2), (13, 1), (15, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0089
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0090 : Poly :=
[
  term ((8525 : Rat) / 252) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0090 : Poly :=
[
  term ((-8525 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525 : Rat) / 126) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8525 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525 : Rat) / 126) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525 : Rat) / 252) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((8525 : Rat) / 252) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8525 : Rat) / 252) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8525 : Rat) / 252) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0090
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0091 : Poly :=
[
  term ((148623378932473 : Rat) / 5802142523688) [(14, 1)]
]

/-- Partial product 91 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0091 : Poly :=
[
  term ((-148623378932473 : Rat) / 2901071261844) [(0, 1), (2, 1), (14, 1)],
  term ((148623378932473 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 1)],
  term ((-148623378932473 : Rat) / 2901071261844) [(1, 1), (3, 1), (14, 1)],
  term ((148623378932473 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1)],
  term ((148623378932473 : Rat) / 5802142523688) [(2, 2), (14, 1)],
  term ((148623378932473 : Rat) / 5802142523688) [(3, 2), (14, 1)],
  term ((-148623378932473 : Rat) / 5802142523688) [(6, 2), (14, 1)],
  term ((-148623378932473 : Rat) / 5802142523688) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0091
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0092 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(14, 1), (15, 2)]
]

/-- Partial product 92 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0092 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 2), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 2), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0092
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0093 : Poly :=
[
  term ((107744271762519625 : Rat) / 52219282713192) [(15, 2)]
]

/-- Partial product 93 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0093 : Poly :=
[
  term ((-107744271762519625 : Rat) / 26109641356596) [(0, 1), (2, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 26109641356596) [(0, 1), (6, 1), (15, 2)],
  term ((-107744271762519625 : Rat) / 26109641356596) [(1, 1), (3, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 26109641356596) [(1, 1), (7, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 52219282713192) [(2, 2), (15, 2)],
  term ((107744271762519625 : Rat) / 52219282713192) [(3, 2), (15, 2)],
  term ((-107744271762519625 : Rat) / 52219282713192) [(6, 2), (15, 2)],
  term ((-107744271762519625 : Rat) / 52219282713192) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0093
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009YNNNN_coefficient_07_0094 : Poly :=
[
  term ((-1733 : Rat) / 63) [(15, 2), (16, 1)]
]

/-- Partial product 94 for generator 7. -/
def rs_R009_ueqv_R009YNNNN_partial_07_0094 : Poly :=
[
  term ((3466 : Rat) / 63) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-3466 : Rat) / 63) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((3466 : Rat) / 63) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3466 : Rat) / 63) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1733 : Rat) / 63) [(2, 2), (15, 2), (16, 1)],
  term ((-1733 : Rat) / 63) [(3, 2), (15, 2), (16, 1)],
  term ((1733 : Rat) / 63) [(6, 2), (15, 2), (16, 1)],
  term ((1733 : Rat) / 63) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 7. -/
theorem rs_R009_ueqv_R009YNNNN_partial_07_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_07_0094
        rs_R009_ueqv_R009YNNNN_generator_07_0000_0094 =
      rs_R009_ueqv_R009YNNNN_partial_07_0094 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_07_0000_0094 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_07_0000,
  rs_R009_ueqv_R009YNNNN_partial_07_0001,
  rs_R009_ueqv_R009YNNNN_partial_07_0002,
  rs_R009_ueqv_R009YNNNN_partial_07_0003,
  rs_R009_ueqv_R009YNNNN_partial_07_0004,
  rs_R009_ueqv_R009YNNNN_partial_07_0005,
  rs_R009_ueqv_R009YNNNN_partial_07_0006,
  rs_R009_ueqv_R009YNNNN_partial_07_0007,
  rs_R009_ueqv_R009YNNNN_partial_07_0008,
  rs_R009_ueqv_R009YNNNN_partial_07_0009,
  rs_R009_ueqv_R009YNNNN_partial_07_0010,
  rs_R009_ueqv_R009YNNNN_partial_07_0011,
  rs_R009_ueqv_R009YNNNN_partial_07_0012,
  rs_R009_ueqv_R009YNNNN_partial_07_0013,
  rs_R009_ueqv_R009YNNNN_partial_07_0014,
  rs_R009_ueqv_R009YNNNN_partial_07_0015,
  rs_R009_ueqv_R009YNNNN_partial_07_0016,
  rs_R009_ueqv_R009YNNNN_partial_07_0017,
  rs_R009_ueqv_R009YNNNN_partial_07_0018,
  rs_R009_ueqv_R009YNNNN_partial_07_0019,
  rs_R009_ueqv_R009YNNNN_partial_07_0020,
  rs_R009_ueqv_R009YNNNN_partial_07_0021,
  rs_R009_ueqv_R009YNNNN_partial_07_0022,
  rs_R009_ueqv_R009YNNNN_partial_07_0023,
  rs_R009_ueqv_R009YNNNN_partial_07_0024,
  rs_R009_ueqv_R009YNNNN_partial_07_0025,
  rs_R009_ueqv_R009YNNNN_partial_07_0026,
  rs_R009_ueqv_R009YNNNN_partial_07_0027,
  rs_R009_ueqv_R009YNNNN_partial_07_0028,
  rs_R009_ueqv_R009YNNNN_partial_07_0029,
  rs_R009_ueqv_R009YNNNN_partial_07_0030,
  rs_R009_ueqv_R009YNNNN_partial_07_0031,
  rs_R009_ueqv_R009YNNNN_partial_07_0032,
  rs_R009_ueqv_R009YNNNN_partial_07_0033,
  rs_R009_ueqv_R009YNNNN_partial_07_0034,
  rs_R009_ueqv_R009YNNNN_partial_07_0035,
  rs_R009_ueqv_R009YNNNN_partial_07_0036,
  rs_R009_ueqv_R009YNNNN_partial_07_0037,
  rs_R009_ueqv_R009YNNNN_partial_07_0038,
  rs_R009_ueqv_R009YNNNN_partial_07_0039,
  rs_R009_ueqv_R009YNNNN_partial_07_0040,
  rs_R009_ueqv_R009YNNNN_partial_07_0041,
  rs_R009_ueqv_R009YNNNN_partial_07_0042,
  rs_R009_ueqv_R009YNNNN_partial_07_0043,
  rs_R009_ueqv_R009YNNNN_partial_07_0044,
  rs_R009_ueqv_R009YNNNN_partial_07_0045,
  rs_R009_ueqv_R009YNNNN_partial_07_0046,
  rs_R009_ueqv_R009YNNNN_partial_07_0047,
  rs_R009_ueqv_R009YNNNN_partial_07_0048,
  rs_R009_ueqv_R009YNNNN_partial_07_0049,
  rs_R009_ueqv_R009YNNNN_partial_07_0050,
  rs_R009_ueqv_R009YNNNN_partial_07_0051,
  rs_R009_ueqv_R009YNNNN_partial_07_0052,
  rs_R009_ueqv_R009YNNNN_partial_07_0053,
  rs_R009_ueqv_R009YNNNN_partial_07_0054,
  rs_R009_ueqv_R009YNNNN_partial_07_0055,
  rs_R009_ueqv_R009YNNNN_partial_07_0056,
  rs_R009_ueqv_R009YNNNN_partial_07_0057,
  rs_R009_ueqv_R009YNNNN_partial_07_0058,
  rs_R009_ueqv_R009YNNNN_partial_07_0059,
  rs_R009_ueqv_R009YNNNN_partial_07_0060,
  rs_R009_ueqv_R009YNNNN_partial_07_0061,
  rs_R009_ueqv_R009YNNNN_partial_07_0062,
  rs_R009_ueqv_R009YNNNN_partial_07_0063,
  rs_R009_ueqv_R009YNNNN_partial_07_0064,
  rs_R009_ueqv_R009YNNNN_partial_07_0065,
  rs_R009_ueqv_R009YNNNN_partial_07_0066,
  rs_R009_ueqv_R009YNNNN_partial_07_0067,
  rs_R009_ueqv_R009YNNNN_partial_07_0068,
  rs_R009_ueqv_R009YNNNN_partial_07_0069,
  rs_R009_ueqv_R009YNNNN_partial_07_0070,
  rs_R009_ueqv_R009YNNNN_partial_07_0071,
  rs_R009_ueqv_R009YNNNN_partial_07_0072,
  rs_R009_ueqv_R009YNNNN_partial_07_0073,
  rs_R009_ueqv_R009YNNNN_partial_07_0074,
  rs_R009_ueqv_R009YNNNN_partial_07_0075,
  rs_R009_ueqv_R009YNNNN_partial_07_0076,
  rs_R009_ueqv_R009YNNNN_partial_07_0077,
  rs_R009_ueqv_R009YNNNN_partial_07_0078,
  rs_R009_ueqv_R009YNNNN_partial_07_0079,
  rs_R009_ueqv_R009YNNNN_partial_07_0080,
  rs_R009_ueqv_R009YNNNN_partial_07_0081,
  rs_R009_ueqv_R009YNNNN_partial_07_0082,
  rs_R009_ueqv_R009YNNNN_partial_07_0083,
  rs_R009_ueqv_R009YNNNN_partial_07_0084,
  rs_R009_ueqv_R009YNNNN_partial_07_0085,
  rs_R009_ueqv_R009YNNNN_partial_07_0086,
  rs_R009_ueqv_R009YNNNN_partial_07_0087,
  rs_R009_ueqv_R009YNNNN_partial_07_0088,
  rs_R009_ueqv_R009YNNNN_partial_07_0089,
  rs_R009_ueqv_R009YNNNN_partial_07_0090,
  rs_R009_ueqv_R009YNNNN_partial_07_0091,
  rs_R009_ueqv_R009YNNNN_partial_07_0092,
  rs_R009_ueqv_R009YNNNN_partial_07_0093,
  rs_R009_ueqv_R009YNNNN_partial_07_0094
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_07_0000_0094 : Poly :=
[
  term ((42040522999549 : Rat) / 103609687923) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((2438918030895347 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-209634918076240 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (6, 1), (9, 1)],
  term ((861129574574653 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1)],
  term ((985 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 1), (7, 1), (10, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 1), (9, 1), (10, 1)],
  term ((407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-8679493899502841 : Rat) / 13054820678298) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-2438918030895347 : Rat) / 6527410339149) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (1, 1), (2, 2), (13, 1), (16, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((410 : Rat) / 21) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 1), (1, 1), (3, 1)],
  term ((-42040522999549 : Rat) / 103609687923) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term ((209634918076240 : Rat) / 6527410339149) [(0, 1), (1, 1), (3, 1), (6, 1), (10, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (1, 1), (6, 1), (7, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (1, 1), (6, 1), (9, 1), (10, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1)],
  term ((410 : Rat) / 21) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((8679493899502841 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 1), (1, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (6, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 1), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (2, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 2), (6, 1), (10, 1)],
  term ((237490966335395 : Rat) / 725267815461) [(0, 1), (2, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-611427414825223 : Rat) / 310829063769) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((985 : Rat) / 42) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((55420968674520529 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((337083952217980 : Rat) / 103609687923) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((1911537525040 : Rat) / 562077873) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((7129607511473840 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 42) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7579467735333952 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((1006 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19969583222803523 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((22450012487789473 : Rat) / 5594923147842) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-155495206177376 : Rat) / 44404151967) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((600 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((134374289309783099 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-472 : Rat) / 7) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-4342565158683470 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 2)],
  term ((-2817638222726165 : Rat) / 1864974382614) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((6331923393017665 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 1), (2, 1), (6, 1)],
  term ((-11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 4351606892766) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 42) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11290506569673004 : Rat) / 2175803446383) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((1006 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-908594471205737 : Rat) / 266424911802) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((985 : Rat) / 42) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((54719898898208 : Rat) / 2175803446383) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((861129574574653 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((23101082050378394 : Rat) / 6527410339149) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((410 : Rat) / 21) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((5317815770493283 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-8525 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148623378932473 : Rat) / 2901071261844) [(0, 1), (2, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-107744271762519625 : Rat) / 26109641356596) [(0, 1), (2, 1), (15, 2)],
  term ((3466 : Rat) / 63) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-26047396307753 : Rat) / 483511876974) [(0, 1), (2, 2)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (2, 2), (3, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((611427414825223 : Rat) / 310829063769) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-55420968674520529 : Rat) / 13054820678298) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((410 : Rat) / 21) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((2817638222726165 : Rat) / 1864974382614) [(0, 1), (2, 2), (3, 2)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 4351606892766) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((11290506569673004 : Rat) / 2175803446383) [(0, 1), (2, 2), (15, 2)],
  term ((-1006 : Rat) / 21) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-337083952217980 : Rat) / 103609687923) [(0, 1), (3, 1), (6, 1), (7, 1)],
  term ((11857694119158851 : Rat) / 4351606892766) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-1911537525040 : Rat) / 562077873) [(0, 1), (3, 1), (6, 1), (9, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-7129607511473840 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((19969583222803523 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((-22450012487789473 : Rat) / 5594923147842) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((155495206177376 : Rat) / 44404151967) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134374289309783099 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((472 : Rat) / 7) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((56691391963933 : Rat) / 483511876974) [(0, 1), (3, 2)],
  term ((4342565158683470 : Rat) / 2175803446383) [(0, 1), (3, 2), (6, 1)],
  term ((-6331923393017665 : Rat) / 13054820678298) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((-237490966335395 : Rat) / 725267815461) [(0, 1), (6, 1)],
  term ((-29111795873371 : Rat) / 55083631554) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 55083631554) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-16385344477359446 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((908594471205737 : Rat) / 266424911802) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-54719898898208 : Rat) / 2175803446383) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((410 : Rat) / 21) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(0, 1), (6, 1), (10, 1), (11, 2)],
  term ((-26586247929331 : Rat) / 76121403372) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 42) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-23101082050378394 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5317815770493283 : Rat) / 8703213785532) [(0, 1), (6, 1), (11, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((8525 : Rat) / 126) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((148623378932473 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 26109641356596) [(0, 1), (6, 1), (15, 2)],
  term ((-3466 : Rat) / 63) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1), (6, 2)],
  term ((-56691391963933 : Rat) / 483511876974) [(0, 1), (7, 2)],
  term ((-56691391963933 : Rat) / 241755938487) [(0, 2), (2, 1)],
  term ((56691391963933 : Rat) / 241755938487) [(0, 2), (6, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1)],
  term ((-2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-611427414825223 : Rat) / 310829063769) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((45497025515998541 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2230288795546790 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((41195805866345 : Rat) / 13489868952) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((2615 : Rat) / 42) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((11290506569673004 : Rat) / 2175803446383) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-1006 : Rat) / 21) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-46346430740155237 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (7, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((17981097189680897 : Rat) / 8703213785532) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-121280678932384493 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((11081192794989251 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 3)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (6, 2), (7, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (6, 2), (9, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (6, 2), (13, 1), (16, 1)],
  term ((3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 1), (2, 1), (7, 1)],
  term ((-41195805866345 : Rat) / 13489868952) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 532849823604) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 42) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11290506569673004 : Rat) / 2175803446383) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((1006 : Rat) / 21) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6745269236845519 : Rat) / 2901071261844) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 1), (7, 3)],
  term ((-42040522999549 : Rat) / 207219375846) [(1, 1), (2, 2), (3, 1)],
  term ((104817459038120 : Rat) / 6527410339149) [(1, 1), (2, 2), (3, 1), (10, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(1, 1), (2, 2), (7, 1), (10, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(1, 1), (2, 2), (9, 1), (10, 1)],
  term ((-407632441893949 : Rat) / 4351606892766) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(1, 1), (2, 2), (10, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-93219059922064 : Rat) / 2175803446383) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((205 : Rat) / 21) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((974580364564039 : Rat) / 8703213785532) [(1, 1), (2, 2), (11, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((8679493899502841 : Rat) / 26109641356596) [(1, 1), (2, 2), (15, 1)],
  term ((2438918030895347 : Rat) / 13054820678298) [(1, 1), (2, 3), (3, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (2, 3), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (2, 3), (9, 1)],
  term ((861129574574653 : Rat) / 8703213785532) [(1, 1), (2, 3), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (2, 3), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 8703213785532) [(1, 1), (2, 3), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((237490966335395 : Rat) / 725267815461) [(1, 1), (3, 1)],
  term ((42040522999549 : Rat) / 207219375846) [(1, 1), (3, 1), (6, 2)],
  term ((-104817459038120 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 2), (10, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term ((-1911537525040 : Rat) / 562077873) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((41195805866345 : Rat) / 13489868952) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((-7359719400958753 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 532849823604) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((2615 : Rat) / 42) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((7579467735333952 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1006 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((33039670823618119 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-58838020550369635 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((155495206177376 : Rat) / 44404151967) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-600 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((9073250124389974 : Rat) / 2175803446383) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-402311965886809537 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((472 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-90303911633773 : Rat) / 29602767978) [(1, 1), (3, 1), (7, 2)],
  term ((35363447439400313 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((3983618132605885 : Rat) / 4351606892766) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((54719898898208 : Rat) / 2175803446383) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((861129574574653 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((24463746389447899 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((23101082050378394 : Rat) / 6527410339149) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((5317815770493283 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2)],
  term ((-33885160769843255 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-8525 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148623378932473 : Rat) / 2901071261844) [(1, 1), (3, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-107744271762519625 : Rat) / 26109641356596) [(1, 1), (3, 1), (15, 2)],
  term ((3466 : Rat) / 63) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((11421328155261050 : Rat) / 2175803446383) [(1, 1), (3, 2), (7, 1)],
  term ((-90709507122977363 : Rat) / 26109641356596) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-18250512825897686 : Rat) / 6527410339149) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((1911537525040 : Rat) / 562077873) [(1, 1), (3, 2), (9, 1)],
  term ((-87072706467305 : Rat) / 26979737904) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((13036317697265833 : Rat) / 13054820678298) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((3545781212751707 : Rat) / 1065699647208) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((-6215 : Rat) / 84) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7672686795256016 : Rat) / 2175803446383) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((173 : Rat) / 3) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-76954591797521975 : Rat) / 26109641356596) [(1, 1), (3, 2), (11, 1)],
  term ((78506246671083023 : Rat) / 19582231017447) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-155495206177376 : Rat) / 44404151967) [(1, 1), (3, 2), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((170 : Rat) / 21) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((600 : Rat) / 7) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-9073250124389974 : Rat) / 2175803446383) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((563535638937640919 : Rat) / 78328924069788) [(1, 1), (3, 2), (15, 1)],
  term ((-472 : Rat) / 7) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-9567981300357469 : Rat) / 4351606892766) [(1, 1), (3, 3)],
  term ((6541558311093905 : Rat) / 13054820678298) [(1, 1), (3, 3), (10, 1)],
  term ((24550171253977717 : Rat) / 13054820678298) [(1, 1), (3, 3), (14, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (6, 2), (7, 1), (10, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (6, 2), (9, 1), (10, 1)],
  term ((407632441893949 : Rat) / 4351606892766) [(1, 1), (6, 2), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (6, 2), (10, 1), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-974580364564039 : Rat) / 8703213785532) [(1, 1), (6, 2), (11, 1)],
  term ((45864690786755 : Rat) / 13054820678298) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-8679493899502841 : Rat) / 26109641356596) [(1, 1), (6, 2), (15, 1)],
  term ((-237490966335395 : Rat) / 725267815461) [(1, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-54719898898208 : Rat) / 2175803446383) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 42) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-24463746389447899 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-23101082050378394 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5317815770493283 : Rat) / 8703213785532) [(1, 1), (7, 1), (11, 2)],
  term ((33885160769843255 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((8525 : Rat) / 126) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((148623378932473 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 26109641356596) [(1, 1), (7, 1), (15, 2)],
  term ((-3466 : Rat) / 63) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(1, 1), (7, 2), (9, 1), (10, 1)],
  term ((-315366572017060 : Rat) / 725267815461) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((985 : Rat) / 84) [(1, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((93219059922064 : Rat) / 2175803446383) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((3625083383428579 : Rat) / 8703213785532) [(1, 1), (7, 2), (11, 1)],
  term ((-32724824263932137 : Rat) / 13054820678298) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((80362764278659385 : Rat) / 26109641356596) [(1, 1), (7, 2), (15, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(1, 1), (7, 3), (10, 1)],
  term ((-2021659560198233 : Rat) / 13054820678298) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-861129574574653 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((3479580527781145 : Rat) / 4351606892766) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-1413323742277379 : Rat) / 3729948765228) [(1, 2), (2, 1), (3, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (6, 2)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((861129574574653 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3479580527781145 : Rat) / 4351606892766) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((4645528438779373 : Rat) / 8703213785532) [(1, 2), (2, 1), (7, 2)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 2), (10, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 3)],
  term ((-42040522999549 : Rat) / 103609687923) [(1, 2), (3, 1), (7, 1)],
  term ((7318765458141407 : Rat) / 13054820678298) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((4681094734615 : Rat) / 13489868952) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((407632441893949 : Rat) / 2175803446383) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 76121403372) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((985 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((186438119844128 : Rat) / 2175803446383) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-410 : Rat) / 21) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-974580364564039 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-8679493899502841 : Rat) / 13054820678298) [(1, 2), (3, 1), (15, 1)],
  term ((42040522999549 : Rat) / 103609687923) [(1, 2), (3, 2)],
  term ((-100135085706385 : Rat) / 3729948765228) [(1, 2), (3, 2), (10, 1)],
  term ((-974580364564039 : Rat) / 2175803446383) [(1, 2), (3, 2), (14, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 2), (6, 2), (10, 1)],
  term ((-4681094734615 : Rat) / 13489868952) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((-407632441893949 : Rat) / 2175803446383) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((26586247929331 : Rat) / 76121403372) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-985 : Rat) / 42) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-186438119844128 : Rat) / 2175803446383) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((410 : Rat) / 21) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((974580364564039 : Rat) / 4351606892766) [(1, 2), (7, 1), (11, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((8679493899502841 : Rat) / 13054820678298) [(1, 2), (7, 1), (15, 1)],
  term ((-4645528438779373 : Rat) / 8703213785532) [(1, 2), (7, 2), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 3), (2, 1), (3, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 3), (2, 1), (7, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(1, 3), (3, 1), (10, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(1, 3), (7, 1), (10, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (6, 2), (7, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((611427414825223 : Rat) / 621658127538) [(2, 1), (3, 1), (6, 2), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((611427414825223 : Rat) / 621658127538) [(2, 1), (3, 1), (7, 2), (11, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((-985 : Rat) / 84) [(2, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((205 : Rat) / 21) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 1), (3, 1), (7, 3)],
  term ((4596599348427 : Rat) / 53723541886) [(2, 1), (3, 2)],
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (6, 2)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 2), (7, 2)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 8703213785532) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 84) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5645253284836502 : Rat) / 2175803446383) [(2, 1), (3, 2), (15, 2)],
  term ((503 : Rat) / 21) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 1), (3, 3), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 1), (3, 3), (9, 1)],
  term ((-611427414825223 : Rat) / 621658127538) [(2, 1), (3, 3), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 1), (3, 3), (13, 1)],
  term ((985 : Rat) / 84) [(2, 1), (3, 3), (13, 1), (16, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 1), (3, 3), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 1), (3, 4)],
  term ((-4596599348427 : Rat) / 53723541886) [(2, 1), (6, 2)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 8703213785532) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((5645253284836502 : Rat) / 2175803446383) [(2, 1), (6, 2), (15, 2)],
  term ((-503 : Rat) / 21) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-4596599348427 : Rat) / 53723541886) [(2, 1), (7, 2)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-23700942062664205 : Rat) / 8703213785532) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((2615 : Rat) / 84) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((5645253284836502 : Rat) / 2175803446383) [(2, 1), (7, 2), (15, 2)],
  term ((-503 : Rat) / 21) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 1), (7, 3), (15, 1)],
  term ((-237490966335395 : Rat) / 1450535630922) [(2, 2)],
  term ((-168541976108990 : Rat) / 103609687923) [(2, 2), (3, 1), (7, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-955768762520 : Rat) / 562077873) [(2, 2), (3, 1), (9, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-3564803755736920 : Rat) / 6527410339149) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((19969583222803523 : Rat) / 13054820678298) [(2, 2), (3, 1), (11, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((77747603088688 : Rat) / 44404151967) [(2, 2), (3, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 21) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134374289309783099 : Rat) / 39164462034894) [(2, 2), (3, 1), (15, 1)],
  term ((236 : Rat) / 7) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((2171282579341735 : Rat) / 2175803446383) [(2, 2), (3, 2)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(2, 2), (3, 2), (10, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(2, 2), (3, 2), (14, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 2), (7, 1), (11, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((908594471205737 : Rat) / 532849823604) [(2, 2), (7, 1), (15, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 2), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(2, 2), (9, 1), (15, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-27359949449104 : Rat) / 2175803446383) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((205 : Rat) / 21) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(2, 2), (10, 1), (11, 2)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 2), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 84) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 9) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-11550541025189197 : Rat) / 6527410339149) [(2, 2), (11, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5317815770493283 : Rat) / 17406427571064) [(2, 2), (11, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(2, 2), (13, 1), (15, 1)],
  term ((8525 : Rat) / 252) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((148623378932473 : Rat) / 5802142523688) [(2, 2), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (14, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 52219282713192) [(2, 2), (15, 2)],
  term ((-1733 : Rat) / 63) [(2, 2), (15, 2), (16, 1)],
  term ((4596599348427 : Rat) / 53723541886) [(2, 3)],
  term ((29111795873371 : Rat) / 110167263108) [(2, 3), (3, 1), (7, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(2, 3), (3, 1), (9, 1)],
  term ((-611427414825223 : Rat) / 621658127538) [(2, 3), (3, 1), (11, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(2, 3), (3, 1), (13, 1)],
  term ((985 : Rat) / 84) [(2, 3), (3, 1), (13, 1), (16, 1)],
  term ((55420968674520529 : Rat) / 26109641356596) [(2, 3), (3, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((-2817638222726165 : Rat) / 3729948765228) [(2, 3), (3, 2)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(2, 3), (7, 1), (15, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(2, 3), (9, 1), (15, 1)],
  term ((23700942062664205 : Rat) / 8703213785532) [(2, 3), (11, 1), (15, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(2, 3), (13, 1), (15, 1)],
  term ((-2615 : Rat) / 84) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5645253284836502 : Rat) / 2175803446383) [(2, 3), (15, 2)],
  term ((503 : Rat) / 21) [(2, 3), (15, 2), (16, 1)],
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (6, 2), (7, 1)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (6, 2), (7, 1), (10, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term ((955768762520 : Rat) / 562077873) [(3, 1), (6, 2), (9, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((3564803755736920 : Rat) / 6527410339149) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((503 : Rat) / 21) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-19969583222803523 : Rat) / 13054820678298) [(3, 1), (6, 2), (11, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-77747603088688 : Rat) / 44404151967) [(3, 1), (6, 2), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((134374289309783099 : Rat) / 39164462034894) [(3, 1), (6, 2), (15, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((955768762520 : Rat) / 562077873) [(3, 1), (7, 2), (9, 1)],
  term ((-41195805866345 : Rat) / 26979737904) [(3, 1), (7, 2), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((3564803755736920 : Rat) / 6527410339149) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((1679838738623195 : Rat) / 1065699647208) [(3, 1), (7, 2), (10, 1), (13, 1)],
  term ((-2615 : Rat) / 84) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-3789733867666976 : Rat) / 2175803446383) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((503 : Rat) / 21) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-19969583222803523 : Rat) / 13054820678298) [(3, 1), (7, 2), (11, 1)],
  term ((22450012487789473 : Rat) / 11189846295684) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-77747603088688 : Rat) / 44404151967) [(3, 1), (7, 2), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((85 : Rat) / 21) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((300 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4536625062194987 : Rat) / 2175803446383) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((134374289309783099 : Rat) / 39164462034894) [(3, 1), (7, 2), (15, 1)],
  term ((-236 : Rat) / 7) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((168541976108990 : Rat) / 103609687923) [(3, 1), (7, 3)],
  term ((-11857694119158851 : Rat) / 8703213785532) [(3, 1), (7, 3), (10, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (7, 3), (14, 1)],
  term ((-237490966335395 : Rat) / 1450535630922) [(3, 2)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (6, 2)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (6, 2), (10, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 2), (14, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(3, 2), (7, 1), (11, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((908594471205737 : Rat) / 532849823604) [(3, 2), (7, 1), (15, 1)],
  term ((-2171282579341735 : Rat) / 2175803446383) [(3, 2), (7, 2)],
  term ((6331923393017665 : Rat) / 26109641356596) [(3, 2), (7, 2), (10, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (7, 2), (14, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(3, 2), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(3, 2), (9, 1), (15, 1)],
  term ((26586247929331 : Rat) / 152242806744) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-985 : Rat) / 84) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-27359949449104 : Rat) / 2175803446383) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((205 : Rat) / 21) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-861129574574653 : Rat) / 8703213785532) [(3, 2), (10, 1), (11, 2)],
  term ((-26586247929331 : Rat) / 152242806744) [(3, 2), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-85 : Rat) / 63) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 84) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24463746389447899 : Rat) / 26109641356596) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 9) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-11550541025189197 : Rat) / 6527410339149) [(3, 2), (11, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5317815770493283 : Rat) / 17406427571064) [(3, 2), (11, 2)],
  term ((33885160769843255 : Rat) / 26109641356596) [(3, 2), (11, 2), (14, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(3, 2), (13, 1), (15, 1)],
  term ((8525 : Rat) / 252) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((148623378932473 : Rat) / 5802142523688) [(3, 2), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 2), (14, 1), (15, 2)],
  term ((107744271762519625 : Rat) / 52219282713192) [(3, 2), (15, 2)],
  term ((-1733 : Rat) / 63) [(3, 2), (15, 2), (16, 1)],
  term ((-168541976108990 : Rat) / 103609687923) [(3, 3), (7, 1)],
  term ((11857694119158851 : Rat) / 8703213785532) [(3, 3), (7, 1), (10, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 3), (7, 1), (14, 1)],
  term ((-955768762520 : Rat) / 562077873) [(3, 3), (9, 1)],
  term ((41195805866345 : Rat) / 26979737904) [(3, 3), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 3), (9, 1), (14, 1)],
  term ((-3564803755736920 : Rat) / 6527410339149) [(3, 3), (10, 1), (11, 1)],
  term ((-1679838738623195 : Rat) / 1065699647208) [(3, 3), (10, 1), (13, 1)],
  term ((2615 : Rat) / 84) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((3789733867666976 : Rat) / 2175803446383) [(3, 3), (10, 1), (15, 1)],
  term ((-503 : Rat) / 21) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((19969583222803523 : Rat) / 13054820678298) [(3, 3), (11, 1)],
  term ((-22450012487789473 : Rat) / 11189846295684) [(3, 3), (11, 1), (14, 1)],
  term ((77747603088688 : Rat) / 44404151967) [(3, 3), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(3, 3), (13, 1), (14, 1)],
  term ((-85 : Rat) / 21) [(3, 3), (13, 1), (14, 1), (16, 1)],
  term ((-300 : Rat) / 7) [(3, 3), (13, 1), (16, 1)],
  term ((4536625062194987 : Rat) / 2175803446383) [(3, 3), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-134374289309783099 : Rat) / 39164462034894) [(3, 3), (15, 1)],
  term ((236 : Rat) / 7) [(3, 3), (15, 1), (16, 1)],
  term ((2171282579341735 : Rat) / 2175803446383) [(3, 4)],
  term ((-6331923393017665 : Rat) / 26109641356596) [(3, 4), (10, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 4), (14, 1)],
  term ((237490966335395 : Rat) / 1450535630922) [(6, 2)],
  term ((29111795873371 : Rat) / 110167263108) [(6, 2), (7, 1), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(6, 2), (7, 1), (11, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((-908594471205737 : Rat) / 532849823604) [(6, 2), (7, 1), (15, 1)],
  term ((4681094734615 : Rat) / 26979737904) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(6, 2), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(6, 2), (9, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((985 : Rat) / 84) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((27359949449104 : Rat) / 2175803446383) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((861129574574653 : Rat) / 8703213785532) [(6, 2), (10, 1), (11, 2)],
  term ((26586247929331 : Rat) / 152242806744) [(6, 2), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((11550541025189197 : Rat) / 6527410339149) [(6, 2), (11, 1), (15, 1)],
  term ((205 : Rat) / 21) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((5317815770493283 : Rat) / 17406427571064) [(6, 2), (11, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(6, 2), (11, 2), (14, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(6, 2), (13, 1), (15, 1)],
  term ((-8525 : Rat) / 252) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-148623378932473 : Rat) / 5802142523688) [(6, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 2), (14, 1), (15, 2)],
  term ((-107744271762519625 : Rat) / 52219282713192) [(6, 2), (15, 2)],
  term ((1733 : Rat) / 63) [(6, 2), (15, 2), (16, 1)],
  term ((237490966335395 : Rat) / 1450535630922) [(7, 2)],
  term ((4681094734615 : Rat) / 26979737904) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4681094734615 : Rat) / 26979737904) [(7, 2), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 2), (9, 1), (15, 1)],
  term ((-26586247929331 : Rat) / 152242806744) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((985 : Rat) / 84) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((27359949449104 : Rat) / 2175803446383) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-205 : Rat) / 21) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((861129574574653 : Rat) / 8703213785532) [(7, 2), (10, 1), (11, 2)],
  term ((26586247929331 : Rat) / 152242806744) [(7, 2), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((85 : Rat) / 63) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-985 : Rat) / 84) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((24463746389447899 : Rat) / 26109641356596) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((11550541025189197 : Rat) / 6527410339149) [(7, 2), (11, 1), (15, 1)],
  term ((205 : Rat) / 21) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((5317815770493283 : Rat) / 17406427571064) [(7, 2), (11, 2)],
  term ((-33885160769843255 : Rat) / 26109641356596) [(7, 2), (11, 2), (14, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(7, 2), (13, 1), (15, 1)],
  term ((-8525 : Rat) / 252) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-148623378932473 : Rat) / 5802142523688) [(7, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 2), (14, 1), (15, 2)],
  term ((-107744271762519625 : Rat) / 52219282713192) [(7, 2), (15, 2)],
  term ((1733 : Rat) / 63) [(7, 2), (15, 2), (16, 1)],
  term ((29111795873371 : Rat) / 110167263108) [(7, 3), (10, 1), (11, 1)],
  term ((-29111795873371 : Rat) / 110167263108) [(7, 3), (11, 1)],
  term ((8192672238679723 : Rat) / 6527410339149) [(7, 3), (11, 1), (14, 1)],
  term ((-908594471205737 : Rat) / 532849823604) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 94. -/
theorem rs_R009_ueqv_R009YNNNN_block_07_0000_0094_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_07_0000_0094
      rs_R009_ueqv_R009YNNNN_block_07_0000_0094 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
