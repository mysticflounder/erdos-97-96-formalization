/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 21:0-89

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_21_0000_0089 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0000 : Poly :=
[
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0000 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0000
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0001 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0001 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (10, 2), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0001
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0002 : Poly :=
[
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0002 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0002
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0003 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0003 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0003
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0004 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0004 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (10, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0004
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0005 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0005 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0005
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0006 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0006 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0006
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0007 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0007 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0007
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0008 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0008 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0008
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0009 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0009 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0009
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0010 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0010 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0010
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0011 : Poly :=
[
  term ((-11215336445624068029 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0011 : Poly :=
[
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0011
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0012 : Poly :=
[
  term ((1005499290326003722623 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0012 : Poly :=
[
  term ((1005499290326003722623 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1005499290326003722623 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1005499290326003722623 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1005499290326003722623 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0012
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0013 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0013 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0013
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0014 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0014 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0014
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0015 : Poly :=
[
  term ((1104993165499089067 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0015 : Poly :=
[
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 8423534011830651392) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 8423534011830651392) [(0, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0015
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0016 : Poly :=
[
  term ((-39103115000790843005329 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0016 : Poly :=
[
  term ((-39103115000790843005329 : Rat) / 151623612212951725056) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39103115000790843005329 : Rat) / 151623612212951725056) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((39103115000790843005329 : Rat) / 303247224425903450112) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((39103115000790843005329 : Rat) / 303247224425903450112) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0016
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0017 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0017 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0017
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0018 : Poly :=
[
  term ((13825011908841381 : Rat) / 11931351291544832) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0018 : Poly :=
[
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 11931351291544832) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 11931351291544832) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0018
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0019 : Poly :=
[
  term ((-1463919936997099097 : Rat) / 47725405166179328) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0019 : Poly :=
[
  term ((-1463919936997099097 : Rat) / 23862702583089664) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1463919936997099097 : Rat) / 23862702583089664) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1463919936997099097 : Rat) / 47725405166179328) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((1463919936997099097 : Rat) / 47725405166179328) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0019
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0020 : Poly :=
[
  term ((-8230060845926393 : Rat) / 2556718133902464) [(0, 1), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0020 : Poly :=
[
  term ((-8230060845926393 : Rat) / 1278359066951232) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-8230060845926393 : Rat) / 1278359066951232) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((8230060845926393 : Rat) / 2556718133902464) [(0, 1), (10, 2), (16, 1)],
  term ((8230060845926393 : Rat) / 2556718133902464) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0020
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0021 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0021 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0021
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0022 : Poly :=
[
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0022 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0022
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0023 : Poly :=
[
  term ((-35120229148929916557 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0023 : Poly :=
[
  term ((-35120229148929916557 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-35120229148929916557 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((35120229148929916557 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((35120229148929916557 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0023
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0024 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0024 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0024
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0025 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0025 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0025
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0026 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0026 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0026
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0027 : Poly :=
[
  term ((64291182930229263979 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0027 : Poly :=
[
  term ((64291182930229263979 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((64291182930229263979 : Rat) / 2105883502957662848) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-64291182930229263979 : Rat) / 4211767005915325696) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-64291182930229263979 : Rat) / 4211767005915325696) [(1, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0027
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0028 : Poly :=
[
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0028 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0028
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0029 : Poly :=
[
  term ((108973109346439617 : Rat) / 11931351291544832) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0029 : Poly :=
[
  term ((108973109346439617 : Rat) / 5965675645772416) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((108973109346439617 : Rat) / 5965675645772416) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108973109346439617 : Rat) / 11931351291544832) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-108973109346439617 : Rat) / 11931351291544832) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0029
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0030 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 263235437869707856) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0030 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 263235437869707856) [(2, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 263235437869707856) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0030
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0031 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0031 : Poly :=
[
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0031
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0032 : Poly :=
[
  term ((1240187014626620444 : Rat) / 16452214866856741) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0032 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1240187014626620444 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1240187014626620444 : Rat) / 16452214866856741) [(2, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0032
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0033 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0033 : Poly :=
[
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0033
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0034 : Poly :=
[
  term ((49648418573141559 : Rat) / 2982837822886208) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0034 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 2982837822886208) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 2982837822886208) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0034
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0035 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0035 : Poly :=
[
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0035
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0036 : Poly :=
[
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0036 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0036
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0037 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0037 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0037
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0038 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0038 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0038
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0039 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0039 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0039
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0040 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0040 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0040
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0041 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0041 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0041
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0042 : Poly :=
[
  term ((47418999924570507099 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0042 : Poly :=
[
  term ((47418999924570507099 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((47418999924570507099 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47418999924570507099 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((-47418999924570507099 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0042_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0042
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0043 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0043 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 3), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0043_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0043
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0044 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0044 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 3), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0044_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0044
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0045 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0045 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0045_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0045
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0046 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0046 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (11, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0046_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0046
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0047 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0047 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0047_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0047
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0048 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0048 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0048_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0048
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0049 : Poly :=
[
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0049 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0049_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0049
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0050 : Poly :=
[
  term ((-633364519242188879101 : Rat) / 33694136047322605568) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0050 : Poly :=
[
  term ((-633364519242188879101 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-633364519242188879101 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((633364519242188879101 : Rat) / 33694136047322605568) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((633364519242188879101 : Rat) / 33694136047322605568) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0050_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0050
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0051 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0051 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0051_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0051
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0052 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0052 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0052_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0052
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0053 : Poly :=
[
  term ((-13980830005567959 : Rat) / 2511863429798912) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0053 : Poly :=
[
  term ((-13980830005567959 : Rat) / 1255931714899456) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13980830005567959 : Rat) / 1255931714899456) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((13980830005567959 : Rat) / 2511863429798912) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((13980830005567959 : Rat) / 2511863429798912) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0053_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0053
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0054 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 54 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0054 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0054_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0054
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0055 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0055 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0055_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0055
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0056 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 56 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0056 : Poly :=
[
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 3), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0056_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0056
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0057 : Poly :=
[
  term ((-1659810741619 : Rat) / 6407814871936) [(4, 1), (16, 1)]
]

/-- Partial product 57 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0057 : Poly :=
[
  term ((-1659810741619 : Rat) / 3203907435968) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1659810741619 : Rat) / 3203907435968) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((1659810741619 : Rat) / 6407814871936) [(4, 1), (10, 2), (16, 1)],
  term ((1659810741619 : Rat) / 6407814871936) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0057_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0057
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0058 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 58 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0058 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0058_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0058
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0059 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0059 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0059_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0059
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0060 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0060 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0060_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0060
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0061 : Poly :=
[
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0061 : Poly :=
[
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0061_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0061
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0062 : Poly :=
[
  term ((281787930259682151447 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 62 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0062 : Poly :=
[
  term ((281787930259682151447 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-281787930259682151447 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-281787930259682151447 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((281787930259682151447 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0062_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0062
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0063 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0063 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0063_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0063
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0064 : Poly :=
[
  term ((11708371984843365499 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0064 : Poly :=
[
  term ((11708371984843365499 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((11708371984843365499 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-11708371984843365499 : Rat) / 8423534011830651392) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-11708371984843365499 : Rat) / 8423534011830651392) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0064_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0064
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0065 : Poly :=
[
  term ((889378207816553547 : Rat) / 263235437869707856) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0065 : Poly :=
[
  term ((889378207816553547 : Rat) / 131617718934853928) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((889378207816553547 : Rat) / 131617718934853928) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-889378207816553547 : Rat) / 263235437869707856) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-889378207816553547 : Rat) / 263235437869707856) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0065_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0065
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0066 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0066 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0066_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0066
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0067 : Poly :=
[
  term ((-32014951853529923127 : Rat) / 2750541718148784128) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0067 : Poly :=
[
  term ((-32014951853529923127 : Rat) / 1375270859074392064) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32014951853529923127 : Rat) / 1375270859074392064) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32014951853529923127 : Rat) / 2750541718148784128) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((32014951853529923127 : Rat) / 2750541718148784128) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0067_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0067
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0068 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0068 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0068_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0068
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0069 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0069 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0069_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0069
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0070 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0070 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0070_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0070
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0071 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 71 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0071 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 4), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0071_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0071
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0072 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0072 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0072_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0072
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0073 : Poly :=
[
  term ((15082161751961557 : Rat) / 5113436267804928) [(8, 1), (16, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0073 : Poly :=
[
  term ((15082161751961557 : Rat) / 2556718133902464) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15082161751961557 : Rat) / 5113436267804928) [(8, 1), (10, 2), (16, 1)],
  term ((-15082161751961557 : Rat) / 5113436267804928) [(8, 1), (11, 2), (16, 1)],
  term ((15082161751961557 : Rat) / 2556718133902464) [(8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0073_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0073
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0074 : Poly :=
[
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 74 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0074 : Poly :=
[
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0074_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0074
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0075 : Poly :=
[
  term ((-4038485035637750589323 : Rat) / 50541204070983908352) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0075 : Poly :=
[
  term ((-4038485035637750589323 : Rat) / 25270602035491954176) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4038485035637750589323 : Rat) / 50541204070983908352) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((4038485035637750589323 : Rat) / 50541204070983908352) [(9, 1), (11, 3), (16, 1)],
  term ((-4038485035637750589323 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0075_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0075
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0076 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0076 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0076_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0076
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0077 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0077 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0077_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0077
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0078 : Poly :=
[
  term ((-519348125927886109 : Rat) / 23862702583089664) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0078 : Poly :=
[
  term ((-519348125927886109 : Rat) / 11931351291544832) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((519348125927886109 : Rat) / 23862702583089664) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((519348125927886109 : Rat) / 23862702583089664) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-519348125927886109 : Rat) / 11931351291544832) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0078_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0078
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0079 : Poly :=
[
  term ((-4024766526635 : Rat) / 106529922245936) [(10, 1), (16, 1)]
]

/-- Partial product 79 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0079 : Poly :=
[
  term ((-4024766526635 : Rat) / 53264961122968) [(8, 1), (10, 2), (16, 1)],
  term ((-4024766526635 : Rat) / 53264961122968) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4024766526635 : Rat) / 106529922245936) [(10, 1), (11, 2), (16, 1)],
  term ((4024766526635 : Rat) / 106529922245936) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0079_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0079
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0080 : Poly :=
[
  term ((-2129790407030491316 : Rat) / 49356644600570223) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0080 : Poly :=
[
  term ((-4259580814060982632 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4259580814060982632 : Rat) / 49356644600570223) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2129790407030491316 : Rat) / 49356644600570223) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2129790407030491316 : Rat) / 49356644600570223) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0080_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0080
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0081 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0081 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0081_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0081
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0082 : Poly :=
[
  term ((89593066888142169670345 : Rat) / 606494448851806900224) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0082 : Poly :=
[
  term ((89593066888142169670345 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((89593066888142169670345 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89593066888142169670345 : Rat) / 606494448851806900224) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89593066888142169670345 : Rat) / 606494448851806900224) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0082_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0082
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0083 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 83 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0083 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0083_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0083
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0084 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 12635301017745977088) [(11, 2), (16, 1)]
]

/-- Partial product 84 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0084 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 12635301017745977088) [(10, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 12635301017745977088) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0084_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0084
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0085 : Poly :=
[
  term ((-20675455600252955 : Rat) / 1934813722953216) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0085 : Poly :=
[
  term ((-20675455600252955 : Rat) / 967406861476608) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20675455600252955 : Rat) / 967406861476608) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20675455600252955 : Rat) / 1934813722953216) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((20675455600252955 : Rat) / 1934813722953216) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0085_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0085
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0086 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0086 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0086_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0086
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0087 : Poly :=
[
  term ((-1642627417236931 : Rat) / 269128224621312) [(14, 1), (16, 1)]
]

/-- Partial product 87 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0087 : Poly :=
[
  term ((-1642627417236931 : Rat) / 134564112310656) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1642627417236931 : Rat) / 134564112310656) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1642627417236931 : Rat) / 269128224621312) [(10, 2), (14, 1), (16, 1)],
  term ((1642627417236931 : Rat) / 269128224621312) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0087_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0087
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0088 : Poly :=
[
  term ((1341738254995411561 : Rat) / 40907490142439424) [(15, 2), (16, 1)]
]

/-- Partial product 88 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0088 : Poly :=
[
  term ((1341738254995411561 : Rat) / 20453745071219712) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1341738254995411561 : Rat) / 20453745071219712) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1341738254995411561 : Rat) / 40907490142439424) [(10, 2), (15, 2), (16, 1)],
  term ((-1341738254995411561 : Rat) / 40907490142439424) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0088_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0088
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010NYY_coefficient_21_0089 : Poly :=
[
  term ((17125807512653851 : Rat) / 5113436267804928) [(16, 1)]
]

/-- Partial product 89 for generator 21. -/
def rs_R010_ueqv_R010NYY_partial_21_0089 : Poly :=
[
  term ((17125807512653851 : Rat) / 2556718133902464) [(8, 1), (10, 1), (16, 1)],
  term ((17125807512653851 : Rat) / 2556718133902464) [(9, 1), (11, 1), (16, 1)],
  term ((-17125807512653851 : Rat) / 5113436267804928) [(10, 2), (16, 1)],
  term ((-17125807512653851 : Rat) / 5113436267804928) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem rs_R010_ueqv_R010NYY_partial_21_0089_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_21_0089
        rs_R010_ueqv_R010NYY_generator_21_0000_0089 =
      rs_R010_ueqv_R010NYY_partial_21_0089 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_21_0000_0089 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_21_0000,
  rs_R010_ueqv_R010NYY_partial_21_0001,
  rs_R010_ueqv_R010NYY_partial_21_0002,
  rs_R010_ueqv_R010NYY_partial_21_0003,
  rs_R010_ueqv_R010NYY_partial_21_0004,
  rs_R010_ueqv_R010NYY_partial_21_0005,
  rs_R010_ueqv_R010NYY_partial_21_0006,
  rs_R010_ueqv_R010NYY_partial_21_0007,
  rs_R010_ueqv_R010NYY_partial_21_0008,
  rs_R010_ueqv_R010NYY_partial_21_0009,
  rs_R010_ueqv_R010NYY_partial_21_0010,
  rs_R010_ueqv_R010NYY_partial_21_0011,
  rs_R010_ueqv_R010NYY_partial_21_0012,
  rs_R010_ueqv_R010NYY_partial_21_0013,
  rs_R010_ueqv_R010NYY_partial_21_0014,
  rs_R010_ueqv_R010NYY_partial_21_0015,
  rs_R010_ueqv_R010NYY_partial_21_0016,
  rs_R010_ueqv_R010NYY_partial_21_0017,
  rs_R010_ueqv_R010NYY_partial_21_0018,
  rs_R010_ueqv_R010NYY_partial_21_0019,
  rs_R010_ueqv_R010NYY_partial_21_0020,
  rs_R010_ueqv_R010NYY_partial_21_0021,
  rs_R010_ueqv_R010NYY_partial_21_0022,
  rs_R010_ueqv_R010NYY_partial_21_0023,
  rs_R010_ueqv_R010NYY_partial_21_0024,
  rs_R010_ueqv_R010NYY_partial_21_0025,
  rs_R010_ueqv_R010NYY_partial_21_0026,
  rs_R010_ueqv_R010NYY_partial_21_0027,
  rs_R010_ueqv_R010NYY_partial_21_0028,
  rs_R010_ueqv_R010NYY_partial_21_0029,
  rs_R010_ueqv_R010NYY_partial_21_0030,
  rs_R010_ueqv_R010NYY_partial_21_0031,
  rs_R010_ueqv_R010NYY_partial_21_0032,
  rs_R010_ueqv_R010NYY_partial_21_0033,
  rs_R010_ueqv_R010NYY_partial_21_0034,
  rs_R010_ueqv_R010NYY_partial_21_0035,
  rs_R010_ueqv_R010NYY_partial_21_0036,
  rs_R010_ueqv_R010NYY_partial_21_0037,
  rs_R010_ueqv_R010NYY_partial_21_0038,
  rs_R010_ueqv_R010NYY_partial_21_0039,
  rs_R010_ueqv_R010NYY_partial_21_0040,
  rs_R010_ueqv_R010NYY_partial_21_0041,
  rs_R010_ueqv_R010NYY_partial_21_0042,
  rs_R010_ueqv_R010NYY_partial_21_0043,
  rs_R010_ueqv_R010NYY_partial_21_0044,
  rs_R010_ueqv_R010NYY_partial_21_0045,
  rs_R010_ueqv_R010NYY_partial_21_0046,
  rs_R010_ueqv_R010NYY_partial_21_0047,
  rs_R010_ueqv_R010NYY_partial_21_0048,
  rs_R010_ueqv_R010NYY_partial_21_0049,
  rs_R010_ueqv_R010NYY_partial_21_0050,
  rs_R010_ueqv_R010NYY_partial_21_0051,
  rs_R010_ueqv_R010NYY_partial_21_0052,
  rs_R010_ueqv_R010NYY_partial_21_0053,
  rs_R010_ueqv_R010NYY_partial_21_0054,
  rs_R010_ueqv_R010NYY_partial_21_0055,
  rs_R010_ueqv_R010NYY_partial_21_0056,
  rs_R010_ueqv_R010NYY_partial_21_0057,
  rs_R010_ueqv_R010NYY_partial_21_0058,
  rs_R010_ueqv_R010NYY_partial_21_0059,
  rs_R010_ueqv_R010NYY_partial_21_0060,
  rs_R010_ueqv_R010NYY_partial_21_0061,
  rs_R010_ueqv_R010NYY_partial_21_0062,
  rs_R010_ueqv_R010NYY_partial_21_0063,
  rs_R010_ueqv_R010NYY_partial_21_0064,
  rs_R010_ueqv_R010NYY_partial_21_0065,
  rs_R010_ueqv_R010NYY_partial_21_0066,
  rs_R010_ueqv_R010NYY_partial_21_0067,
  rs_R010_ueqv_R010NYY_partial_21_0068,
  rs_R010_ueqv_R010NYY_partial_21_0069,
  rs_R010_ueqv_R010NYY_partial_21_0070,
  rs_R010_ueqv_R010NYY_partial_21_0071,
  rs_R010_ueqv_R010NYY_partial_21_0072,
  rs_R010_ueqv_R010NYY_partial_21_0073,
  rs_R010_ueqv_R010NYY_partial_21_0074,
  rs_R010_ueqv_R010NYY_partial_21_0075,
  rs_R010_ueqv_R010NYY_partial_21_0076,
  rs_R010_ueqv_R010NYY_partial_21_0077,
  rs_R010_ueqv_R010NYY_partial_21_0078,
  rs_R010_ueqv_R010NYY_partial_21_0079,
  rs_R010_ueqv_R010NYY_partial_21_0080,
  rs_R010_ueqv_R010NYY_partial_21_0081,
  rs_R010_ueqv_R010NYY_partial_21_0082,
  rs_R010_ueqv_R010NYY_partial_21_0083,
  rs_R010_ueqv_R010NYY_partial_21_0084,
  rs_R010_ueqv_R010NYY_partial_21_0085,
  rs_R010_ueqv_R010NYY_partial_21_0086,
  rs_R010_ueqv_R010NYY_partial_21_0087,
  rs_R010_ueqv_R010NYY_partial_21_0088,
  rs_R010_ueqv_R010NYY_partial_21_0089
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_21_0000_0089 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (10, 2), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (10, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (9, 1), (11, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 3), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1005499290326003722623 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1005499290326003722623 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2963029593691536291 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1005499290326003722623 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1005499290326003722623 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39103115000790843005329 : Rat) / 151623612212951725056) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1463919936997099097 : Rat) / 23862702583089664) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8230060845926393 : Rat) / 1278359066951232) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1463919936997099097 : Rat) / 23862702583089664) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8230060845926393 : Rat) / 1278359066951232) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-40889925693053884342153 : Rat) / 151623612212951725056) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-101825173000826748551 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (9, 2), (11, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 8423534011830651392) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((39103115000790843005329 : Rat) / 303247224425903450112) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((-13825011908841381 : Rat) / 11931351291544832) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1463919936997099097 : Rat) / 47725405166179328) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((8230060845926393 : Rat) / 2556718133902464) [(0, 1), (10, 2), (16, 1)],
  term ((-13825011908841381 : Rat) / 11931351291544832) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1463919936997099097 : Rat) / 47725405166179328) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((8230060845926393 : Rat) / 2556718133902464) [(0, 1), (11, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 8423534011830651392) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((39103115000790843005329 : Rat) / 303247224425903450112) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 4), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-35120229148929916557 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-35120229148929916557 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((35120229148929916557 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((35120229148929916557 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((64291182930229263979 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((108973109346439617 : Rat) / 5965675645772416) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((108973109346439617 : Rat) / 5965675645772416) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((64291182930229263979 : Rat) / 2105883502957662848) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-64291182930229263979 : Rat) / 4211767005915325696) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108973109346439617 : Rat) / 11931351291544832) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108973109346439617 : Rat) / 11931351291544832) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((-64291182930229263979 : Rat) / 4211767005915325696) [(1, 1), (11, 3), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 263235437869707856) [(2, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 263235437869707856) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (8, 1), (10, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1240187014626620444 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 2982837822886208) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (10, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 2982837822886208) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (11, 2), (16, 1)],
  term ((-1240187014626620444 : Rat) / 16452214866856741) [(2, 1), (11, 3), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((47418999924570507099 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((47418999924570507099 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((-47418999924570507099 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-47418999924570507099 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-633364519242188879101 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-13980830005567959 : Rat) / 1255931714899456) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (11, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 3), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-13980830005567959 : Rat) / 1255931714899456) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-633364519242188879101 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((633364519242188879101 : Rat) / 33694136047322605568) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((13980830005567959 : Rat) / 2511863429798912) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((13980830005567959 : Rat) / 2511863429798912) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 3), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((633364519242188879101 : Rat) / 33694136047322605568) [(3, 1), (11, 3), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1659810741619 : Rat) / 3203907435968) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1659810741619 : Rat) / 3203907435968) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 3), (16, 1)],
  term ((19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 2), (11, 2), (16, 1)],
  term ((1659810741619 : Rat) / 6407814871936) [(4, 1), (10, 2), (16, 1)],
  term ((1659810741619 : Rat) / 6407814871936) [(4, 1), (11, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((281787930259682151447 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2963029593691536291 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((11708371984843365499 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((889378207816553547 : Rat) / 131617718934853928) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32014951853529923127 : Rat) / 1375270859074392064) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-281787930259682151447 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((889378207816553547 : Rat) / 131617718934853928) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32014951853529923127 : Rat) / 1375270859074392064) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3735380479304675259 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-188120954380935227455 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((281787930259682151447 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11708371984843365499 : Rat) / 8423534011830651392) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-889378207816553547 : Rat) / 263235437869707856) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((32014951853529923127 : Rat) / 2750541718148784128) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-889378207816553547 : Rat) / 263235437869707856) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((32014951853529923127 : Rat) / 2750541718148784128) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-11708371984843365499 : Rat) / 8423534011830651392) [(5, 1), (11, 3), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4038485035637750589323 : Rat) / 25270602035491954176) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-519348125927886109 : Rat) / 11931351291544832) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((15082161751961557 : Rat) / 2556718133902464) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((40810366185137949929329 : Rat) / 151623612212951725056) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((101825173000826748551 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-4259580814060982632 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((89593066888142169670345 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20675455600252955 : Rat) / 967406861476608) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1642627417236931 : Rat) / 134564112310656) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((1341738254995411561 : Rat) / 20453745071219712) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((17125807512653851 : Rat) / 2556718133902464) [(8, 1), (10, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-15468539338518517 : Rat) / 5113436267804928) [(8, 1), (10, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-15082161751961557 : Rat) / 5113436267804928) [(8, 1), (11, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 4), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((15082161751961557 : Rat) / 2556718133902464) [(8, 2), (10, 1), (16, 1)],
  term ((-4024766526635 : Rat) / 53264961122968) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((4038485035637750589323 : Rat) / 50541204070983908352) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((519348125927886109 : Rat) / 23862702583089664) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-20675455600252955 : Rat) / 967406861476608) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1642627417236931 : Rat) / 134564112310656) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1341738254995411561 : Rat) / 20453745071219712) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((17125807512653851 : Rat) / 2556718133902464) [(9, 1), (11, 1), (16, 1)],
  term ((-547820504928599765495 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-40810366185137949929329 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((96192942872433746343517 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-67853189927335617065 : Rat) / 12635301017745977088) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((1160678831118163333457 : Rat) / 16847068023661302784) [(9, 1), (11, 3), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-519348125927886109 : Rat) / 11931351291544832) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-4038485035637750589323 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (16, 1)],
  term ((4024766526635 : Rat) / 106529922245936) [(10, 1), (11, 2), (16, 1)],
  term ((2129790407030491316 : Rat) / 49356644600570223) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89593066888142169670345 : Rat) / 606494448851806900224) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 12635301017745977088) [(10, 2), (11, 2), (16, 1)],
  term ((20675455600252955 : Rat) / 1934813722953216) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1642627417236931 : Rat) / 269128224621312) [(10, 2), (14, 1), (16, 1)],
  term ((-1341738254995411561 : Rat) / 40907490142439424) [(10, 2), (15, 2), (16, 1)],
  term ((-17125807512653851 : Rat) / 5113436267804928) [(10, 2), (16, 1)],
  term ((4024766526635 : Rat) / 106529922245936) [(10, 3), (16, 1)],
  term ((20675455600252955 : Rat) / 1934813722953216) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1642627417236931 : Rat) / 269128224621312) [(11, 2), (14, 1), (16, 1)],
  term ((-1341738254995411561 : Rat) / 40907490142439424) [(11, 2), (15, 2), (16, 1)],
  term ((-17125807512653851 : Rat) / 5113436267804928) [(11, 2), (16, 1)],
  term ((2129790407030491316 : Rat) / 49356644600570223) [(11, 3), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-89593066888142169670345 : Rat) / 606494448851806900224) [(11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 4), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 12635301017745977088) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 89. -/
theorem rs_R010_ueqv_R010NYY_block_21_0000_0089_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_21_0000_0089
      rs_R010_ueqv_R010NYY_block_21_0000_0089 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
