/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 18:0-41

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_18_0000_0041 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0000 : Poly :=
[
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0000 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 3), (1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0000
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0001 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0001 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 2), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 3), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0001
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0002 : Poly :=
[
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0002 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0002
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0003 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0003 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 2), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 3), (3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0003
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0004 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0004 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 3), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0004
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0005 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0005 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 2), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 3), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0005
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0006 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0006 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0006
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0007 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0007 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0007
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0008 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0008 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (1, 2), (3, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (15, 5), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 2), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 3), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0008
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0009 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0009 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0009
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0010 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0010 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0010
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0011 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0011 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0011
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0012 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0012 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0012
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0013 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0013 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0013
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0014 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0014 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0014
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0015 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0015 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0015
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0016 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0016 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (15, 4), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0016
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0017 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0017 : Poly :=
[
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (1, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (14, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 2), (6, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0017
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0018 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0018 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0018
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0019 : Poly :=
[
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0019 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0019
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0020 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0020 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0020
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0021 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0021 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0021
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0022 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0022 : Poly :=
[
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0022
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0023 : Poly :=
[
  term ((-711968041840092767 : Rat) / 95450810332358656) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0023 : Poly :=
[
  term ((711968041840092767 : Rat) / 47725405166179328) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0023
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0024 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0024 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0024
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0025 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 25 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0025 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0025
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0026 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0026 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0026
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0027 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0027 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0027
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0028 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0028 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0028
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0029 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 29 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0029 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (8, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0029
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0030 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 30 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0030 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0030
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0031 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0031 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0031
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0032 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0032 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0032
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0033 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 33 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0033 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0033
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0034 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0034 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0034
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0035 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0035 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0035
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0036 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0036 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0036
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0037 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 37 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0037 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0037
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0038 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0038 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0038
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0039 : Poly :=
[
  term ((3728508138334321 : Rat) / 1278359066951232) [(8, 1), (16, 1)]
]

/-- Partial product 39 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0039 : Poly :=
[
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 2), (8, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(1, 2), (8, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(8, 1), (14, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0039
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0040 : Poly :=
[
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0040 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0040
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYY_coefficient_18_0041 : Poly :=
[
  term ((711968041840092767 : Rat) / 95450810332358656) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 18. -/
def rs_R010_ueqv_R010NYY_partial_18_0041 : Poly :=
[
  term ((-711968041840092767 : Rat) / 47725405166179328) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 18. -/
theorem rs_R010_ueqv_R010NYY_partial_18_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_18_0041
        rs_R010_ueqv_R010NYY_generator_18_0000_0041 =
      rs_R010_ueqv_R010NYY_partial_18_0041 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_18_0000_0041 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_18_0000,
  rs_R010_ueqv_R010NYY_partial_18_0001,
  rs_R010_ueqv_R010NYY_partial_18_0002,
  rs_R010_ueqv_R010NYY_partial_18_0003,
  rs_R010_ueqv_R010NYY_partial_18_0004,
  rs_R010_ueqv_R010NYY_partial_18_0005,
  rs_R010_ueqv_R010NYY_partial_18_0006,
  rs_R010_ueqv_R010NYY_partial_18_0007,
  rs_R010_ueqv_R010NYY_partial_18_0008,
  rs_R010_ueqv_R010NYY_partial_18_0009,
  rs_R010_ueqv_R010NYY_partial_18_0010,
  rs_R010_ueqv_R010NYY_partial_18_0011,
  rs_R010_ueqv_R010NYY_partial_18_0012,
  rs_R010_ueqv_R010NYY_partial_18_0013,
  rs_R010_ueqv_R010NYY_partial_18_0014,
  rs_R010_ueqv_R010NYY_partial_18_0015,
  rs_R010_ueqv_R010NYY_partial_18_0016,
  rs_R010_ueqv_R010NYY_partial_18_0017,
  rs_R010_ueqv_R010NYY_partial_18_0018,
  rs_R010_ueqv_R010NYY_partial_18_0019,
  rs_R010_ueqv_R010NYY_partial_18_0020,
  rs_R010_ueqv_R010NYY_partial_18_0021,
  rs_R010_ueqv_R010NYY_partial_18_0022,
  rs_R010_ueqv_R010NYY_partial_18_0023,
  rs_R010_ueqv_R010NYY_partial_18_0024,
  rs_R010_ueqv_R010NYY_partial_18_0025,
  rs_R010_ueqv_R010NYY_partial_18_0026,
  rs_R010_ueqv_R010NYY_partial_18_0027,
  rs_R010_ueqv_R010NYY_partial_18_0028,
  rs_R010_ueqv_R010NYY_partial_18_0029,
  rs_R010_ueqv_R010NYY_partial_18_0030,
  rs_R010_ueqv_R010NYY_partial_18_0031,
  rs_R010_ueqv_R010NYY_partial_18_0032,
  rs_R010_ueqv_R010NYY_partial_18_0033,
  rs_R010_ueqv_R010NYY_partial_18_0034,
  rs_R010_ueqv_R010NYY_partial_18_0035,
  rs_R010_ueqv_R010NYY_partial_18_0036,
  rs_R010_ueqv_R010NYY_partial_18_0037,
  rs_R010_ueqv_R010NYY_partial_18_0038,
  rs_R010_ueqv_R010NYY_partial_18_0039,
  rs_R010_ueqv_R010NYY_partial_18_0040,
  rs_R010_ueqv_R010NYY_partial_18_0041
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_18_0000_0041 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-521908533233466982311 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((625268100393954944953 : Rat) / 3094359432917382144) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (1, 1), (7, 1), (11, 2), (16, 1)],
  term ((35805210844830731 : Rat) / 1255931714899456) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (14, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 2), (7, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (1, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 3), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (7, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (15, 5), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (14, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (15, 4), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 2), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 2), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 2), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 2), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 2), (6, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 2), (8, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 3), (1, 1), (5, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 3), (1, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 3), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 3), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 3), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 3), (3, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 3), (3, 1), (15, 3), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 3), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 3), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 3), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((521908533233466982311 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-625268100393954944953 : Rat) / 3094359432917382144) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-35805210844830731 : Rat) / 1255931714899456) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 134776544189290422272) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(1, 2), (8, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 606494448851806900224) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 95450810332358656) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (8, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(1, 3), (5, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (8, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(1, 3), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(1, 3), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 4), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (8, 1), (15, 4), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 5), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((614669487801636391401 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(8, 1), (14, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (15, 4), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 41. -/
theorem rs_R010_ueqv_R010NYY_block_18_0000_0041_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_18_0000_0041
      rs_R010_ueqv_R010NYY_block_18_0000_0041 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
