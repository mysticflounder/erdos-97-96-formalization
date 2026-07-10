/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 30:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_30_0000_0099 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0000 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 0 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0000 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0000
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0001 : Poly :=
[
  term ((219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0001 : Poly :=
[
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0001
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0002 : Poly :=
[
  term ((1795378340455062269037 : Rat) / 134776544189290422272) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0002 : Poly :=
[
  term ((1795378340455062269037 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1795378340455062269037 : Rat) / 134776544189290422272) [(0, 1), (1, 1), (5, 1), (12, 2), (16, 1)],
  term ((1795378340455062269037 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1795378340455062269037 : Rat) / 134776544189290422272) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0002
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0003 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0003 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0003
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0004 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0004 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0004
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0005 : Poly :=
[
  term ((-44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0005 : Poly :=
[
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0005
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0006 : Poly :=
[
  term ((-3771504544811383479403 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0006 : Poly :=
[
  term ((-3771504544811383479403 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3771504544811383479403 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3771504544811383479403 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3771504544811383479403 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0006
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0007 : Poly :=
[
  term ((-247437128563111349 : Rat) / 47725405166179328) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0007 : Poly :=
[
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0007
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0008 : Poly :=
[
  term ((-2939520471261447989 : Rat) / 95450810332358656) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0008 : Poly :=
[
  term ((-2939520471261447989 : Rat) / 47725405166179328) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2939520471261447989 : Rat) / 95450810332358656) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2939520471261447989 : Rat) / 47725405166179328) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2939520471261447989 : Rat) / 95450810332358656) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0008
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0009 : Poly :=
[
  term ((10925110817965791 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0009 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0009
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0010 : Poly :=
[
  term ((-363534495967615059 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0010 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0010
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0011 : Poly :=
[
  term ((333796423576923 : Rat) / 1704478755934976) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0011 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(0, 1), (2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0011
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0012 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0012 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0012
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0013 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0013 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0013
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0014 : Poly :=
[
  term ((32421071444940969933 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0014 : Poly :=
[
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0014
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0015 : Poly :=
[
  term ((24126516024986757 : Rat) / 5965675645772416) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0015 : Poly :=
[
  term ((24126516024986757 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0015
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0016 : Poly :=
[
  term ((24259046380348383 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0016 : Poly :=
[
  term ((24259046380348383 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((24259046380348383 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0016
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0017 : Poly :=
[
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (16, 1)]
]

/-- Partial product 17 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0017 : Poly :=
[
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0017
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0018 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 18 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0018 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0018
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0019 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0019 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0019
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0020 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0020 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0020
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0021 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0021 : Poly :=
[
  term ((32775332453897373 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0021
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0022 : Poly :=
[
  term ((-54625554089828955 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 22 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0022 : Poly :=
[
  term ((-54625554089828955 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((54625554089828955 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((-54625554089828955 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((54625554089828955 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0022
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0023 : Poly :=
[
  term ((-105609404573669313 : Rat) / 300840500422523264) [(0, 1), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0023 : Poly :=
[
  term ((-105609404573669313 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((105609404573669313 : Rat) / 300840500422523264) [(0, 1), (3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-105609404573669313 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((105609404573669313 : Rat) / 300840500422523264) [(0, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0023
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0024 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0024 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0024
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0025 : Poly :=
[
  term ((-1706944702107819778833 : Rat) / 67388272094645211136) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0025 : Poly :=
[
  term ((-1706944702107819778833 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((1706944702107819778833 : Rat) / 67388272094645211136) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-1706944702107819778833 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1706944702107819778833 : Rat) / 67388272094645211136) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0025
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0026 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0026 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0026
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0027 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0027 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0027
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0028 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0028 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0028
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0029 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 29 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0029 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0029
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0030 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0030 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0030
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0031 : Poly :=
[
  term ((1817672479838075295 : Rat) / 150420250211261632) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0031 : Poly :=
[
  term ((1817672479838075295 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 150420250211261632) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((1817672479838075295 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 150420250211261632) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0031
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0032 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0032 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0032
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0033 : Poly :=
[
  term ((-1668982117884615 : Rat) / 1704478755934976) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0033 : Poly :=
[
  term ((-1668982117884615 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1668982117884615 : Rat) / 1704478755934976) [(0, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1668982117884615 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1668982117884615 : Rat) / 1704478755934976) [(0, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0033
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0034 : Poly :=
[
  term ((3514166794353612237 : Rat) / 300840500422523264) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0034 : Poly :=
[
  term ((3514166794353612237 : Rat) / 150420250211261632) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3514166794353612237 : Rat) / 300840500422523264) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3514166794353612237 : Rat) / 150420250211261632) [(0, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3514166794353612237 : Rat) / 300840500422523264) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0034
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0035 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0035 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0035
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0036 : Poly :=
[
  term ((10572095829067799258095 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0036 : Poly :=
[
  term ((10572095829067799258095 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10572095829067799258095 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((10572095829067799258095 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10572095829067799258095 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0036
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0037 : Poly :=
[
  term ((-3226698761243589 : Rat) / 3408957511869952) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0037 : Poly :=
[
  term ((-3226698761243589 : Rat) / 1704478755934976) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3226698761243589 : Rat) / 3408957511869952) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3226698761243589 : Rat) / 1704478755934976) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3226698761243589 : Rat) / 3408957511869952) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0037
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0038 : Poly :=
[
  term ((1854458301934298063 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0038 : Poly :=
[
  term ((1854458301934298063 : Rat) / 11931351291544832) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1854458301934298063 : Rat) / 23862702583089664) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1854458301934298063 : Rat) / 11931351291544832) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1854458301934298063 : Rat) / 23862702583089664) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0038
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0039 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 39 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0039 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (12, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0039
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0040 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 40 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0040 : Poly :=
[
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0040
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0041 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0041 : Poly :=
[
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0041
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0042 : Poly :=
[
  term ((-36811646155131 : Rat) / 121748482566784) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 42 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0042 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 121748482566784) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 121748482566784) [(0, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0042_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0042
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0043 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 43 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0043 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0043_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0043
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0044 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0044 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0044_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0044
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0045 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0045 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0045_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0045
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0046 : Poly :=
[
  term ((219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 46 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0046 : Poly :=
[
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0046_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0046
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0047 : Poly :=
[
  term ((-243595948617411613575 : Rat) / 19253792027041488896) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 47 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0047 : Poly :=
[
  term ((-243595948617411613575 : Rat) / 9626896013520744448) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((243595948617411613575 : Rat) / 19253792027041488896) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-243595948617411613575 : Rat) / 9626896013520744448) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((243595948617411613575 : Rat) / 19253792027041488896) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0047_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0047
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0048 : Poly :=
[
  term ((1416352153783970493 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 48 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0048 : Poly :=
[
  term ((1416352153783970493 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0048_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0048
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0049 : Poly :=
[
  term ((-5871051767111242011 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 49 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0049 : Poly :=
[
  term ((-5871051767111242011 : Rat) / 601681000845046528) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5871051767111242011 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-5871051767111242011 : Rat) / 601681000845046528) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5871051767111242011 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0049_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0049
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0050 : Poly :=
[
  term ((-34322706156971249889 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0050 : Poly :=
[
  term ((-34322706156971249889 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((34322706156971249889 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-34322706156971249889 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((34322706156971249889 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0050_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0050
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0051 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0051 : Poly :=
[
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0051_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0051
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0052 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0052 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0052_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0052
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0053 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0053 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0053_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0053
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0054 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0054 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0054_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0054
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0055 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (11, 2), (16, 1)]
]

/-- Partial product 55 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0055 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0055_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0055
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0056 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0056 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0056_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0056
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0057 : Poly :=
[
  term ((3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 57 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0057 : Poly :=
[
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0057_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0057
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0058 : Poly :=
[
  term ((-12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0058 : Poly :=
[
  term ((-12270548718377 : Rat) / 30437120641696) [(0, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 30437120641696) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0058_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0058
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0059 : Poly :=
[
  term ((12270548718377 : Rat) / 121748482566784) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 59 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0059 : Poly :=
[
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 121748482566784) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 121748482566784) [(0, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0059_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0059
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0060 : Poly :=
[
  term ((-44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0060 : Poly :=
[
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0060_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0060
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0061 : Poly :=
[
  term ((2273782329470246221507 : Rat) / 28880688040562233344) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 61 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0061 : Poly :=
[
  term ((2273782329470246221507 : Rat) / 14440344020281116672) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2273782329470246221507 : Rat) / 28880688040562233344) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2273782329470246221507 : Rat) / 14440344020281116672) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2273782329470246221507 : Rat) / 28880688040562233344) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0061_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0061
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0062 : Poly :=
[
  term ((-247437128563111349 : Rat) / 47725405166179328) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0062 : Poly :=
[
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0062_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0062
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0063 : Poly :=
[
  term ((343723596778011319 : Rat) / 13635830047479808) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0063 : Poly :=
[
  term ((343723596778011319 : Rat) / 6817915023739904) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-343723596778011319 : Rat) / 13635830047479808) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((343723596778011319 : Rat) / 6817915023739904) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-343723596778011319 : Rat) / 13635830047479808) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0063_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0063
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0064 : Poly :=
[
  term ((72423490995745 : Rat) / 121748482566784) [(0, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 64 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0064 : Poly :=
[
  term ((72423490995745 : Rat) / 60874241283392) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-72423490995745 : Rat) / 121748482566784) [(0, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((72423490995745 : Rat) / 60874241283392) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72423490995745 : Rat) / 121748482566784) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0064_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0064
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0065 : Poly :=
[
  term ((6293849707961387 : Rat) / 2556718133902464) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 65 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0065 : Poly :=
[
  term ((6293849707961387 : Rat) / 1278359066951232) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6293849707961387 : Rat) / 2556718133902464) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((6293849707961387 : Rat) / 1278359066951232) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6293849707961387 : Rat) / 2556718133902464) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0065_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0065
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0066 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 2), (16, 1)]
]

/-- Partial product 66 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0066 : Poly :=
[
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 2), (12, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0066_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0066
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0067 : Poly :=
[
  term ((-37027324729568104539 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0067 : Poly :=
[
  term ((-37027324729568104539 : Rat) / 4211767005915325696) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((37027324729568104539 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-37027324729568104539 : Rat) / 4211767005915325696) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((37027324729568104539 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0067_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0067
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0068 : Poly :=
[
  term ((-8086348793449461 : Rat) / 1704478755934976) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0068 : Poly :=
[
  term ((-8086348793449461 : Rat) / 852239377967488) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((8086348793449461 : Rat) / 1704478755934976) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8086348793449461 : Rat) / 852239377967488) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 1704478755934976) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0068_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0068
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0069 : Poly :=
[
  term ((-37959478822768150828945 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0069 : Poly :=
[
  term ((-37959478822768150828945 : Rat) / 75811806106475862528) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37959478822768150828945 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-37959478822768150828945 : Rat) / 75811806106475862528) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((37959478822768150828945 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0069_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0069
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0070 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 3610086005070279168) [(0, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 70 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0070 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 3610086005070279168) [(0, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 3610086005070279168) [(0, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0070_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0070
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0071 : Poly :=
[
  term ((86439610123207742417 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 71 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0071 : Poly :=
[
  term ((86439610123207742417 : Rat) / 902521501267569792) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-86439610123207742417 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((86439610123207742417 : Rat) / 902521501267569792) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-86439610123207742417 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0071_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0071
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0072 : Poly :=
[
  term ((151616515999448403 : Rat) / 47725405166179328) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0072 : Poly :=
[
  term ((151616515999448403 : Rat) / 23862702583089664) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151616515999448403 : Rat) / 47725405166179328) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((151616515999448403 : Rat) / 23862702583089664) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-151616515999448403 : Rat) / 47725405166179328) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0072_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0072
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0073 : Poly :=
[
  term ((-37618951534780297 : Rat) / 30680617606829568) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 73 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0073 : Poly :=
[
  term ((-37618951534780297 : Rat) / 15340308803414784) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((37618951534780297 : Rat) / 30680617606829568) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-37618951534780297 : Rat) / 15340308803414784) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((37618951534780297 : Rat) / 30680617606829568) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0073_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0073
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0074 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0074 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0074_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0074
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0075 : Poly :=
[
  term ((-362330902405195847 : Rat) / 61361235213659136) [(0, 1), (16, 1)]
]

/-- Partial product 75 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0075 : Poly :=
[
  term ((-362330902405195847 : Rat) / 30680617606829568) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((362330902405195847 : Rat) / 61361235213659136) [(0, 1), (12, 2), (16, 1)],
  term ((-362330902405195847 : Rat) / 30680617606829568) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((362330902405195847 : Rat) / 61361235213659136) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0075_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0075
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0076 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0076 : Poly :=
[
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0076_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0076
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0077 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0077 : Poly :=
[
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0077_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0077
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0078 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 78 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0078 : Poly :=
[
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0078_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0078
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0079 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0079 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0079_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0079
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0080 : Poly :=
[
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0080 : Poly :=
[
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0080_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0080
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0081 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0081 : Poly :=
[
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0081_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0081
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0082 : Poly :=
[
  term ((420107987636881458735 : Rat) / 134776544189290422272) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 82 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0082 : Poly :=
[
  term ((420107987636881458735 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-420107987636881458735 : Rat) / 134776544189290422272) [(1, 1), (2, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((420107987636881458735 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-420107987636881458735 : Rat) / 134776544189290422272) [(1, 1), (2, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0082_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0082
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0083 : Poly :=
[
  term ((659718235034656454151 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0083 : Poly :=
[
  term ((659718235034656454151 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-659718235034656454151 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((659718235034656454151 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-659718235034656454151 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0083_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0083
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0084 : Poly :=
[
  term ((52552107957154509147 : Rat) / 19253792027041488896) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 84 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0084 : Poly :=
[
  term ((52552107957154509147 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-52552107957154509147 : Rat) / 19253792027041488896) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((52552107957154509147 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-52552107957154509147 : Rat) / 19253792027041488896) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0084_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0084
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0085 : Poly :=
[
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 85 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0085 : Poly :=
[
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0085_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0085
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0086 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0086 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0086_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0086
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0087 : Poly :=
[
  term ((24126516024986757 : Rat) / 2982837822886208) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0087 : Poly :=
[
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0087_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0087
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0088 : Poly :=
[
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 88 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0088 : Poly :=
[
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0088_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0088
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0089 : Poly :=
[
  term ((-1429721646896735741273 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 89 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0089 : Poly :=
[
  term ((-1429721646896735741273 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1429721646896735741273 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1429721646896735741273 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1429721646896735741273 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0089_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0089
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0090 : Poly :=
[
  term ((-11026641195993082509 : Rat) / 910652325603313664) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0090 : Poly :=
[
  term ((-11026641195993082509 : Rat) / 455326162801656832) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11026641195993082509 : Rat) / 910652325603313664) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11026641195993082509 : Rat) / 455326162801656832) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11026641195993082509 : Rat) / 910652325603313664) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0090_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0090
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0091 : Poly :=
[
  term ((128340888887873763 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 91 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0091 : Poly :=
[
  term ((128340888887873763 : Rat) / 4813448006760372224) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-128340888887873763 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((128340888887873763 : Rat) / 4813448006760372224) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128340888887873763 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0091_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0091
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0092 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0092 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0092_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0092
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0093 : Poly :=
[
  term ((-809086350486215887 : Rat) / 95450810332358656) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0093 : Poly :=
[
  term ((-809086350486215887 : Rat) / 47725405166179328) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((809086350486215887 : Rat) / 95450810332358656) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-809086350486215887 : Rat) / 47725405166179328) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((809086350486215887 : Rat) / 95450810332358656) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0093_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0093
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0094 : Poly :=
[
  term ((-60868175496997789 : Rat) / 13635830047479808) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0094 : Poly :=
[
  term ((-60868175496997789 : Rat) / 6817915023739904) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((60868175496997789 : Rat) / 13635830047479808) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-60868175496997789 : Rat) / 6817915023739904) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((60868175496997789 : Rat) / 13635830047479808) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0094_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0094
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0095 : Poly :=
[
  term ((-742311385689334047 : Rat) / 47725405166179328) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

/-- Partial product 95 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0095 : Poly :=
[
  term ((-742311385689334047 : Rat) / 23862702583089664) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((742311385689334047 : Rat) / 47725405166179328) [(1, 1), (2, 1), (12, 2), (15, 3), (16, 1)],
  term ((-742311385689334047 : Rat) / 23862702583089664) [(1, 1), (2, 1), (13, 1), (15, 4), (16, 1)],
  term ((742311385689334047 : Rat) / 47725405166179328) [(1, 1), (2, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0095_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0095
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0096 : Poly :=
[
  term ((-36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (2, 2), (5, 1), (16, 1)]
]

/-- Partial product 96 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0096 : Poly :=
[
  term ((-36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (2, 2), (5, 1), (12, 2), (16, 1)],
  term ((-36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (2, 2), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0096_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0096
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0097 : Poly :=
[
  term ((97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0097 : Poly :=
[
  term ((97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (2, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0097_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0097
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0098 : Poly :=
[
  term ((72379548074960271 : Rat) / 23862702583089664) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0098 : Poly :=
[
  term ((72379548074960271 : Rat) / 11931351291544832) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72379548074960271 : Rat) / 23862702583089664) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((72379548074960271 : Rat) / 11931351291544832) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-72379548074960271 : Rat) / 23862702583089664) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0098_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0098
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0099 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 99 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0099 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0099_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0099
        rs_R010_ueqv_R010NYY_generator_30_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_30_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_30_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_30_0000,
  rs_R010_ueqv_R010NYY_partial_30_0001,
  rs_R010_ueqv_R010NYY_partial_30_0002,
  rs_R010_ueqv_R010NYY_partial_30_0003,
  rs_R010_ueqv_R010NYY_partial_30_0004,
  rs_R010_ueqv_R010NYY_partial_30_0005,
  rs_R010_ueqv_R010NYY_partial_30_0006,
  rs_R010_ueqv_R010NYY_partial_30_0007,
  rs_R010_ueqv_R010NYY_partial_30_0008,
  rs_R010_ueqv_R010NYY_partial_30_0009,
  rs_R010_ueqv_R010NYY_partial_30_0010,
  rs_R010_ueqv_R010NYY_partial_30_0011,
  rs_R010_ueqv_R010NYY_partial_30_0012,
  rs_R010_ueqv_R010NYY_partial_30_0013,
  rs_R010_ueqv_R010NYY_partial_30_0014,
  rs_R010_ueqv_R010NYY_partial_30_0015,
  rs_R010_ueqv_R010NYY_partial_30_0016,
  rs_R010_ueqv_R010NYY_partial_30_0017,
  rs_R010_ueqv_R010NYY_partial_30_0018,
  rs_R010_ueqv_R010NYY_partial_30_0019,
  rs_R010_ueqv_R010NYY_partial_30_0020,
  rs_R010_ueqv_R010NYY_partial_30_0021,
  rs_R010_ueqv_R010NYY_partial_30_0022,
  rs_R010_ueqv_R010NYY_partial_30_0023,
  rs_R010_ueqv_R010NYY_partial_30_0024,
  rs_R010_ueqv_R010NYY_partial_30_0025,
  rs_R010_ueqv_R010NYY_partial_30_0026,
  rs_R010_ueqv_R010NYY_partial_30_0027,
  rs_R010_ueqv_R010NYY_partial_30_0028,
  rs_R010_ueqv_R010NYY_partial_30_0029,
  rs_R010_ueqv_R010NYY_partial_30_0030,
  rs_R010_ueqv_R010NYY_partial_30_0031,
  rs_R010_ueqv_R010NYY_partial_30_0032,
  rs_R010_ueqv_R010NYY_partial_30_0033,
  rs_R010_ueqv_R010NYY_partial_30_0034,
  rs_R010_ueqv_R010NYY_partial_30_0035,
  rs_R010_ueqv_R010NYY_partial_30_0036,
  rs_R010_ueqv_R010NYY_partial_30_0037,
  rs_R010_ueqv_R010NYY_partial_30_0038,
  rs_R010_ueqv_R010NYY_partial_30_0039,
  rs_R010_ueqv_R010NYY_partial_30_0040,
  rs_R010_ueqv_R010NYY_partial_30_0041,
  rs_R010_ueqv_R010NYY_partial_30_0042,
  rs_R010_ueqv_R010NYY_partial_30_0043,
  rs_R010_ueqv_R010NYY_partial_30_0044,
  rs_R010_ueqv_R010NYY_partial_30_0045,
  rs_R010_ueqv_R010NYY_partial_30_0046,
  rs_R010_ueqv_R010NYY_partial_30_0047,
  rs_R010_ueqv_R010NYY_partial_30_0048,
  rs_R010_ueqv_R010NYY_partial_30_0049,
  rs_R010_ueqv_R010NYY_partial_30_0050,
  rs_R010_ueqv_R010NYY_partial_30_0051,
  rs_R010_ueqv_R010NYY_partial_30_0052,
  rs_R010_ueqv_R010NYY_partial_30_0053,
  rs_R010_ueqv_R010NYY_partial_30_0054,
  rs_R010_ueqv_R010NYY_partial_30_0055,
  rs_R010_ueqv_R010NYY_partial_30_0056,
  rs_R010_ueqv_R010NYY_partial_30_0057,
  rs_R010_ueqv_R010NYY_partial_30_0058,
  rs_R010_ueqv_R010NYY_partial_30_0059,
  rs_R010_ueqv_R010NYY_partial_30_0060,
  rs_R010_ueqv_R010NYY_partial_30_0061,
  rs_R010_ueqv_R010NYY_partial_30_0062,
  rs_R010_ueqv_R010NYY_partial_30_0063,
  rs_R010_ueqv_R010NYY_partial_30_0064,
  rs_R010_ueqv_R010NYY_partial_30_0065,
  rs_R010_ueqv_R010NYY_partial_30_0066,
  rs_R010_ueqv_R010NYY_partial_30_0067,
  rs_R010_ueqv_R010NYY_partial_30_0068,
  rs_R010_ueqv_R010NYY_partial_30_0069,
  rs_R010_ueqv_R010NYY_partial_30_0070,
  rs_R010_ueqv_R010NYY_partial_30_0071,
  rs_R010_ueqv_R010NYY_partial_30_0072,
  rs_R010_ueqv_R010NYY_partial_30_0073,
  rs_R010_ueqv_R010NYY_partial_30_0074,
  rs_R010_ueqv_R010NYY_partial_30_0075,
  rs_R010_ueqv_R010NYY_partial_30_0076,
  rs_R010_ueqv_R010NYY_partial_30_0077,
  rs_R010_ueqv_R010NYY_partial_30_0078,
  rs_R010_ueqv_R010NYY_partial_30_0079,
  rs_R010_ueqv_R010NYY_partial_30_0080,
  rs_R010_ueqv_R010NYY_partial_30_0081,
  rs_R010_ueqv_R010NYY_partial_30_0082,
  rs_R010_ueqv_R010NYY_partial_30_0083,
  rs_R010_ueqv_R010NYY_partial_30_0084,
  rs_R010_ueqv_R010NYY_partial_30_0085,
  rs_R010_ueqv_R010NYY_partial_30_0086,
  rs_R010_ueqv_R010NYY_partial_30_0087,
  rs_R010_ueqv_R010NYY_partial_30_0088,
  rs_R010_ueqv_R010NYY_partial_30_0089,
  rs_R010_ueqv_R010NYY_partial_30_0090,
  rs_R010_ueqv_R010NYY_partial_30_0091,
  rs_R010_ueqv_R010NYY_partial_30_0092,
  rs_R010_ueqv_R010NYY_partial_30_0093,
  rs_R010_ueqv_R010NYY_partial_30_0094,
  rs_R010_ueqv_R010NYY_partial_30_0095,
  rs_R010_ueqv_R010NYY_partial_30_0096,
  rs_R010_ueqv_R010NYY_partial_30_0097,
  rs_R010_ueqv_R010NYY_partial_30_0098,
  rs_R010_ueqv_R010NYY_partial_30_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_30_0000_0099 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((1795378340455062269037 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1795378340455062269037 : Rat) / 134776544189290422272) [(0, 1), (1, 1), (5, 1), (12, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1795378340455062269037 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1795378340455062269037 : Rat) / 134776544189290422272) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3771504544811383479403 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3771504544811383479403 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3771504544811383479403 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3771504544811383479403 : Rat) / 67388272094645211136) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2939520471261447989 : Rat) / 47725405166179328) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2939520471261447989 : Rat) / 95450810332358656) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2939520471261447989 : Rat) / 47725405166179328) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2939520471261447989 : Rat) / 95450810332358656) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(0, 1), (2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(0, 1), (2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(0, 1), (2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 2982837822886208) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((24259046380348383 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((24259046380348383 : Rat) / 2982837822886208) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (2, 1), (11, 2), (13, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-54625554089828955 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((54625554089828955 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54625554089828955 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((54625554089828955 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1706944702107819778833 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105609404573669313 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((105609404573669313 : Rat) / 300840500422523264) [(0, 1), (3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((1706944702107819778833 : Rat) / 67388272094645211136) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-105609404573669313 : Rat) / 150420250211261632) [(0, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1706944702107819778833 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((105609404573669313 : Rat) / 300840500422523264) [(0, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((1706944702107819778833 : Rat) / 67388272094645211136) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((1817672479838075295 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 150420250211261632) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1817672479838075295 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 150420250211261632) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1668982117884615 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(0, 1), (3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1668982117884615 : Rat) / 1704478755934976) [(0, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1668982117884615 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1668982117884615 : Rat) / 1704478755934976) [(0, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10572095829067799258095 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3514166794353612237 : Rat) / 150420250211261632) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3514166794353612237 : Rat) / 300840500422523264) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10572095829067799258095 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((3514166794353612237 : Rat) / 150420250211261632) [(0, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10572095829067799258095 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3514166794353612237 : Rat) / 300840500422523264) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10572095829067799258095 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((1854458301934298063 : Rat) / 11931351291544832) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3226698761243589 : Rat) / 1704478755934976) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3226698761243589 : Rat) / 3408957511869952) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1854458301934298063 : Rat) / 23862702583089664) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3226698761243589 : Rat) / 1704478755934976) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1854458301934298063 : Rat) / 11931351291544832) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (13, 1), (15, 4), (16, 1)],
  term ((3226698761243589 : Rat) / 3408957511869952) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1854458301934298063 : Rat) / 23862702583089664) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((36811646155131 : Rat) / 15218560320848) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 121748482566784) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 121748482566784) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-243595948617411613575 : Rat) / 9626896013520744448) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((243595948617411613575 : Rat) / 19253792027041488896) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-243595948617411613575 : Rat) / 9626896013520744448) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 67388272094645211136) [(0, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((243595948617411613575 : Rat) / 19253792027041488896) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-5871051767111242011 : Rat) / 601681000845046528) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1416352153783970493 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((5871051767111242011 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1416352153783970493 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5871051767111242011 : Rat) / 601681000845046528) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1416352153783970493 : Rat) / 2406724003380186112) [(0, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((5871051767111242011 : Rat) / 1203362001690093056) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-34322706156971249889 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34322706156971249889 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1053067423388896177947 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((34322706156971249889 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 3), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (11, 2), (12, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 1), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 30437120641696) [(0, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 121748482566784) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-12270548718377 : Rat) / 30437120641696) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12270548718377 : Rat) / 60874241283392) [(0, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12270548718377 : Rat) / 121748482566784) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((2273782329470246221507 : Rat) / 14440344020281116672) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2273782329470246221507 : Rat) / 28880688040562233344) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-44651845446442906155 : Rat) / 16847068023661302784) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2273782329470246221507 : Rat) / 14440344020281116672) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44651845446442906155 : Rat) / 33694136047322605568) [(0, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2273782329470246221507 : Rat) / 28880688040562233344) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((343723596778011319 : Rat) / 6817915023739904) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-343723596778011319 : Rat) / 13635830047479808) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((343723596778011319 : Rat) / 6817915023739904) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-343723596778011319 : Rat) / 13635830047479808) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6293849707961387 : Rat) / 1278359066951232) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((72423490995745 : Rat) / 60874241283392) [(0, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-72423490995745 : Rat) / 121748482566784) [(0, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6293849707961387 : Rat) / 2556718133902464) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((72423490995745 : Rat) / 60874241283392) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6293849707961387 : Rat) / 1278359066951232) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72423490995745 : Rat) / 121748482566784) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6293849707961387 : Rat) / 2556718133902464) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 2), (12, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((-37027324729568104539 : Rat) / 4211767005915325696) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-37959478822768150828945 : Rat) / 75811806106475862528) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8086348793449461 : Rat) / 852239377967488) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((37027324729568104539 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8086348793449461 : Rat) / 1704478755934976) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37959478822768150828945 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8086348793449461 : Rat) / 852239377967488) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37959478822768150828945 : Rat) / 75811806106475862528) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8086348793449461 : Rat) / 1704478755934976) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((36626495132503699065541 : Rat) / 151623612212951725056) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((37027324729568104539 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((86439610123207742417 : Rat) / 902521501267569792) [(0, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 3610086005070279168) [(0, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-86439610123207742417 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((86439610123207742417 : Rat) / 902521501267569792) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 3610086005070279168) [(0, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-86439610123207742417 : Rat) / 1805043002535139584) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((151616515999448403 : Rat) / 23862702583089664) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-362330902405195847 : Rat) / 30680617606829568) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-37618951534780297 : Rat) / 15340308803414784) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-151616515999448403 : Rat) / 47725405166179328) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((37618951534780297 : Rat) / 30680617606829568) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((362330902405195847 : Rat) / 61361235213659136) [(0, 1), (12, 2), (16, 1)],
  term ((-37618951534780297 : Rat) / 15340308803414784) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-362330902405195847 : Rat) / 30680617606829568) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 11931351291544832) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((37618951534780297 : Rat) / 30680617606829568) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((376234089431454113 : Rat) / 5965675645772416) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((362330902405195847 : Rat) / 61361235213659136) [(0, 1), (13, 2), (16, 1)],
  term ((-151616515999448403 : Rat) / 47725405166179328) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((659718235034656454151 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((52552107957154509147 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((420107987636881458735 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-420107987636881458735 : Rat) / 134776544189290422272) [(1, 1), (2, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-659718235034656454151 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-52552107957154509147 : Rat) / 19253792027041488896) [(1, 1), (2, 1), (5, 1), (12, 2), (16, 1)],
  term ((420107987636881458735 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52552107957154509147 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((659718235034656454151 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-420107987636881458735 : Rat) / 134776544189290422272) [(1, 1), (2, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-659718235034656454151 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-52552107957154509147 : Rat) / 19253792027041488896) [(1, 1), (2, 1), (5, 1), (13, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 526470875739415712) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 1), (2, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (2, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 1), (2, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 1), (2, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11026641195993082509 : Rat) / 455326162801656832) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((128340888887873763 : Rat) / 4813448006760372224) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1429721646896735741273 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1429721646896735741273 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((11026641195993082509 : Rat) / 910652325603313664) [(1, 1), (2, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-128340888887873763 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1429721646896735741273 : Rat) / 33694136047322605568) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((128340888887873763 : Rat) / 4813448006760372224) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11026641195993082509 : Rat) / 455326162801656832) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1429721646896735741273 : Rat) / 67388272094645211136) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11026641195993082509 : Rat) / 910652325603313664) [(1, 1), (2, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128340888887873763 : Rat) / 9626896013520744448) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-60868175496997789 : Rat) / 6817915023739904) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-742311385689334047 : Rat) / 23862702583089664) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-809086350486215887 : Rat) / 47725405166179328) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((809086350486215887 : Rat) / 95450810332358656) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((60868175496997789 : Rat) / 13635830047479808) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((742311385689334047 : Rat) / 47725405166179328) [(1, 1), (2, 1), (12, 2), (15, 3), (16, 1)],
  term ((-809086350486215887 : Rat) / 47725405166179328) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60868175496997789 : Rat) / 6817915023739904) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-742311385689334047 : Rat) / 23862702583089664) [(1, 1), (2, 1), (13, 1), (15, 4), (16, 1)],
  term ((809086350486215887 : Rat) / 95450810332358656) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((60868175496997789 : Rat) / 13635830047479808) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((742311385689334047 : Rat) / 47725405166179328) [(1, 1), (2, 1), (13, 2), (15, 3), (16, 1)],
  term ((-36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (2, 2), (5, 1), (12, 2), (16, 1)],
  term ((-36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (2, 2), (5, 1), (13, 2), (16, 1)],
  term ((97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (2, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (2, 2), (11, 1), (13, 2), (16, 1)],
  term ((72379548074960271 : Rat) / 11931351291544832) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72379548074960271 : Rat) / 23862702583089664) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((72379548074960271 : Rat) / 11931351291544832) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-72379548074960271 : Rat) / 23862702583089664) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 99. -/
theorem rs_R010_ueqv_R010NYY_block_30_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_30_0000_0099
      rs_R010_ueqv_R010NYY_block_30_0000_0099 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
