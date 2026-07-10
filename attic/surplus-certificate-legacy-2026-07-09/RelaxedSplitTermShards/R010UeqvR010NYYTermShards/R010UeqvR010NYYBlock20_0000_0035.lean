/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 20:0-35

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_20_0000_0035 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0000 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0000 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0000
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0001 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0001 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0001
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0002 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0002 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0002
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0003 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0003 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0003
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0004 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0004 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0004
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0005 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0005 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (7, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0005
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0006 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0006 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0006
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0007 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0007 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0007
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0008 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0008 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0008
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0009 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0009 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0009
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0010 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0010 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0010
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0011 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0011 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0011
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0012 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0012 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0012
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0013 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0013 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0013
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0014 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0014 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0014
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0015 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0015 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0015
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0016 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0016 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0016
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0017 : Poly :=
[
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (16, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0017 : Poly :=
[
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0017
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0018 : Poly :=
[
  term ((-220801422274092195321 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0018 : Poly :=
[
  term ((-220801422274092195321 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((220801422274092195321 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-220801422274092195321 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((220801422274092195321 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0018
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0019 : Poly :=
[
  term ((19902608933884158803623 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0019 : Poly :=
[
  term ((19902608933884158803623 : Rat) / 303247224425903450112) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-19902608933884158803623 : Rat) / 606494448851806900224) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((19902608933884158803623 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19902608933884158803623 : Rat) / 606494448851806900224) [(1, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0019
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0020 : Poly :=
[
  term ((38947206165508607 : Rat) / 95450810332358656) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0020 : Poly :=
[
  term ((38947206165508607 : Rat) / 47725405166179328) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38947206165508607 : Rat) / 95450810332358656) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((38947206165508607 : Rat) / 47725405166179328) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-38947206165508607 : Rat) / 95450810332358656) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0020
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0021 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0021 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0021
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0022 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 22 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0022 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0022
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0023 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0023 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0023
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0024 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 33694136047322605568) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0024 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0024
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0025 : Poly :=
[
  term ((921238143868634625 : Rat) / 47725405166179328) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0025 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 47725405166179328) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 47725405166179328) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0025
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0026 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 26 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0026 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0026
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0027 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0027 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0027
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0028 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0028 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0028
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0029 : Poly :=
[
  term ((11956610051270684139 : Rat) / 1052941751478831424) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0029 : Poly :=
[
  term ((11956610051270684139 : Rat) / 526470875739415712) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11956610051270684139 : Rat) / 1052941751478831424) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((11956610051270684139 : Rat) / 526470875739415712) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11956610051270684139 : Rat) / 1052941751478831424) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0029
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0030 : Poly :=
[
  term ((240937308571641895789 : Rat) / 12635301017745977088) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0030 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 12635301017745977088) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 12635301017745977088) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0030
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0031 : Poly :=
[
  term ((70302592550481639 : Rat) / 11931351291544832) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0031 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0031
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0032 : Poly :=
[
  term ((-4206973937520636480371 : Rat) / 37905903053237931264) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0032 : Poly :=
[
  term ((-4206973937520636480371 : Rat) / 18952951526618965632) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4206973937520636480371 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4206973937520636480371 : Rat) / 18952951526618965632) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4206973937520636480371 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0032
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0033 : Poly :=
[
  term ((69556067785407573619 : Rat) / 12635301017745977088) [(11, 2), (16, 1)]
]

/-- Partial product 33 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0033 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 12635301017745977088) [(6, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 12635301017745977088) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0033
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0034 : Poly :=
[
  term ((-129080492722903801 : Rat) / 5965675645772416) [(15, 2), (16, 1)]
]

/-- Partial product 34 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0034 : Poly :=
[
  term ((-129080492722903801 : Rat) / 2982837822886208) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((129080492722903801 : Rat) / 5965675645772416) [(6, 2), (15, 2), (16, 1)],
  term ((-129080492722903801 : Rat) / 2982837822886208) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((129080492722903801 : Rat) / 5965675645772416) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0034
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYY_coefficient_20_0035 : Poly :=
[
  term ((-3728508138334321 : Rat) / 2556718133902464) [(16, 1)]
]

/-- Partial product 35 for generator 20. -/
def rs_R010_ueqv_R010NYY_partial_20_0035 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 2556718133902464) [(6, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 2556718133902464) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 20. -/
theorem rs_R010_ueqv_R010NYY_partial_20_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_20_0035
        rs_R010_ueqv_R010NYY_generator_20_0000_0035 =
      rs_R010_ueqv_R010NYY_partial_20_0035 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_20_0000_0035 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_20_0000,
  rs_R010_ueqv_R010NYY_partial_20_0001,
  rs_R010_ueqv_R010NYY_partial_20_0002,
  rs_R010_ueqv_R010NYY_partial_20_0003,
  rs_R010_ueqv_R010NYY_partial_20_0004,
  rs_R010_ueqv_R010NYY_partial_20_0005,
  rs_R010_ueqv_R010NYY_partial_20_0006,
  rs_R010_ueqv_R010NYY_partial_20_0007,
  rs_R010_ueqv_R010NYY_partial_20_0008,
  rs_R010_ueqv_R010NYY_partial_20_0009,
  rs_R010_ueqv_R010NYY_partial_20_0010,
  rs_R010_ueqv_R010NYY_partial_20_0011,
  rs_R010_ueqv_R010NYY_partial_20_0012,
  rs_R010_ueqv_R010NYY_partial_20_0013,
  rs_R010_ueqv_R010NYY_partial_20_0014,
  rs_R010_ueqv_R010NYY_partial_20_0015,
  rs_R010_ueqv_R010NYY_partial_20_0016,
  rs_R010_ueqv_R010NYY_partial_20_0017,
  rs_R010_ueqv_R010NYY_partial_20_0018,
  rs_R010_ueqv_R010NYY_partial_20_0019,
  rs_R010_ueqv_R010NYY_partial_20_0020,
  rs_R010_ueqv_R010NYY_partial_20_0021,
  rs_R010_ueqv_R010NYY_partial_20_0022,
  rs_R010_ueqv_R010NYY_partial_20_0023,
  rs_R010_ueqv_R010NYY_partial_20_0024,
  rs_R010_ueqv_R010NYY_partial_20_0025,
  rs_R010_ueqv_R010NYY_partial_20_0026,
  rs_R010_ueqv_R010NYY_partial_20_0027,
  rs_R010_ueqv_R010NYY_partial_20_0028,
  rs_R010_ueqv_R010NYY_partial_20_0029,
  rs_R010_ueqv_R010NYY_partial_20_0030,
  rs_R010_ueqv_R010NYY_partial_20_0031,
  rs_R010_ueqv_R010NYY_partial_20_0032,
  rs_R010_ueqv_R010NYY_partial_20_0033,
  rs_R010_ueqv_R010NYY_partial_20_0034,
  rs_R010_ueqv_R010NYY_partial_20_0035
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_20_0000_0035 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (7, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (7, 2), (16, 1)],
  term ((-220801422274092195321 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((220801422274092195321 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-220801422274092195321 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((220801422274092195321 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((19902608933884158803623 : Rat) / 303247224425903450112) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((38947206165508607 : Rat) / 47725405166179328) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19902608933884158803623 : Rat) / 606494448851806900224) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-38947206165508607 : Rat) / 95450810332358656) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((19902608933884158803623 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((38947206165508607 : Rat) / 47725405166179328) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19902608933884158803623 : Rat) / 606494448851806900224) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-38947206165508607 : Rat) / 95450810332358656) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 67388272094645211136) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 33694136047322605568) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 47725405166179328) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 33694136047322605568) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 47725405166179328) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((11956610051270684139 : Rat) / 526470875739415712) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-11956610051270684139 : Rat) / 1052941751478831424) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((11956610051270684139 : Rat) / 526470875739415712) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-11956610051270684139 : Rat) / 1052941751478831424) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4206973937520636480371 : Rat) / 18952951526618965632) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-129080492722903801 : Rat) / 2982837822886208) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 12635301017745977088) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((4206973937520636480371 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 12635301017745977088) [(6, 2), (11, 2), (16, 1)],
  term ((129080492722903801 : Rat) / 5965675645772416) [(6, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 2556718133902464) [(6, 2), (16, 1)],
  term ((-4206973937520636480371 : Rat) / 18952951526618965632) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-129080492722903801 : Rat) / 2982837822886208) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 12635301017745977088) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((4206973937520636480371 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 12635301017745977088) [(7, 2), (11, 2), (16, 1)],
  term ((129080492722903801 : Rat) / 5965675645772416) [(7, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 2556718133902464) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 35. -/
theorem rs_R010_ueqv_R010NYY_block_20_0000_0035_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_20_0000_0035
      rs_R010_ueqv_R010NYY_block_20_0000_0035 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
