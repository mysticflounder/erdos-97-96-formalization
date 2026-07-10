/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 9:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_09_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0000 : Poly :=
[
  term ((34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0000 : Poly :=
[
  term ((34483291445106024993 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((34483291445106024993 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-34483291445106024993 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0000
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0001 : Poly :=
[
  term ((-56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0001 : Poly :=
[
  term ((-56547350786450023191 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((-56547350786450023191 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((56547350786450023191 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0001
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0002 : Poly :=
[
  term ((-77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0002 : Poly :=
[
  term ((-77052698005037193 : Rat) / 11931351291544832) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-77052698005037193 : Rat) / 11931351291544832) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((77052698005037193 : Rat) / 11931351291544832) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0002
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0003 : Poly :=
[
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0003 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0003
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0004 : Poly :=
[
  term ((45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0004 : Poly :=
[
  term ((45743890519138780635 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 3), (16, 1)],
  term ((45743890519138780635 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0004
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0005 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0005 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0005
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0006 : Poly :=
[
  term ((13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0006 : Poly :=
[
  term ((13152842222095000911 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((13152842222095000911 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0006
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0007 : Poly :=
[
  term ((-23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0007 : Poly :=
[
  term ((-23855701531660927437 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23855701531660927437 : Rat) / 8423534011830651392) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 8423534011830651392) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0007
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0008 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0008 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0008
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0009 : Poly :=
[
  term ((-87528790244075539 : Rat) / 23862702583089664) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0009 : Poly :=
[
  term ((-87528790244075539 : Rat) / 11931351291544832) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((87528790244075539 : Rat) / 23862702583089664) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-87528790244075539 : Rat) / 23862702583089664) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((87528790244075539 : Rat) / 23862702583089664) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-87528790244075539 : Rat) / 11931351291544832) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((87528790244075539 : Rat) / 11931351291544832) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0009
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0010 : Poly :=
[
  term ((247437128563111349 : Rat) / 23862702583089664) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0010 : Poly :=
[
  term ((247437128563111349 : Rat) / 11931351291544832) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 23862702583089664) [(0, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0010
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0011 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0011 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(0, 1), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(0, 1), (13, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(0, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0011
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0012 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0012 : Poly :=
[
  term ((-10925110817965791 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (13, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0012
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0013 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0013 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0013
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0014 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0014 : Poly :=
[
  term ((363534495967615059 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (13, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0014
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0015 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0015 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0015
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0016 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0016 : Poly :=
[
  term ((-333796423576923 : Rat) / 426119688983744) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0016
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0017 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0017 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0017
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0018 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0018 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0018
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0019 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0019 : Poly :=
[
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0019
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0020 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0020 : Poly :=
[
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0020
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0021 : Poly :=
[
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0021 : Poly :=
[
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0021
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0022 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0022 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0022
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0023 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0023 : Poly :=
[
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0023
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0024 : Poly :=
[
  term ((-14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0024 : Poly :=
[
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0024
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0025 : Poly :=
[
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0025 : Poly :=
[
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0025
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0026 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0026 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0026
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0027 : Poly :=
[
  term ((-45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0027 : Poly :=
[
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0027
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0028 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0028 : Poly :=
[
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0028
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0029 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0029 : Poly :=
[
  term ((21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0029
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0030 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0030 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0030
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0031 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0031 : Poly :=
[
  term ((-21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0031
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0032 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0032 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0032
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0033 : Poly :=
[
  term ((128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0033 : Poly :=
[
  term ((128266782904163919 : Rat) / 1921426553793488) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 1921426553793488) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128266782904163919 : Rat) / 1921426553793488) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0033
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0034 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0034 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0034
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0035 : Poly :=
[
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0035 : Poly :=
[
  term ((-24126516024986757 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0035
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0036 : Poly :=
[
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0036 : Poly :=
[
  term ((24126516024986757 : Rat) / 372854727860776) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 372854727860776) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 372854727860776) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0036
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0037 : Poly :=
[
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0037 : Poly :=
[
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 601681000845046528) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0037
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0038 : Poly :=
[
  term ((231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0038 : Poly :=
[
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-231947569921110843987 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0038
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0039 : Poly :=
[
  term ((-13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0039 : Poly :=
[
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0039
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0040 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0040 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (13, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0040
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0041 : Poly :=
[
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0041 : Poly :=
[
  term ((64238671173708934705 : Rat) / 263235437869707856) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 263235437869707856) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 263235437869707856) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0041
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0042 : Poly :=
[
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0042 : Poly :=
[
  term ((-247437128563111349 : Rat) / 5965675645772416) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 5965675645772416) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0042_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0042
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0043 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0043 : Poly :=
[
  term ((9184513182051 : Rat) / 3804640080212) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 3804640080212) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (13, 3), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0043_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0043
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0044 : Poly :=
[
  term ((-27681743111572205 : Rat) / 47725405166179328) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0044 : Poly :=
[
  term ((-27681743111572205 : Rat) / 23862702583089664) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 23862702583089664) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 47725405166179328) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 47725405166179328) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27681743111572205 : Rat) / 47725405166179328) [(1, 1), (15, 1), (16, 1)],
  term ((-27681743111572205 : Rat) / 23862702583089664) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0044_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0044
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0045 : Poly :=
[
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0045 : Poly :=
[
  term ((247437128563111349 : Rat) / 2982837822886208) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 2982837822886208) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 1), (15, 3), (16, 1)],
  term ((247437128563111349 : Rat) / 2982837822886208) [(1, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0045_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0045
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0046 : Poly :=
[
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0046 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0046_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0046
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0047 : Poly :=
[
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0047 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0047_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0047
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0048 : Poly :=
[
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0048 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0048_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0048
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0049 : Poly :=
[
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0049 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0049_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0049
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0050 : Poly :=
[
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0050 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0050_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0050
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0051 : Poly :=
[
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0051 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0051_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0051
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0052 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0052 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0052_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0052
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0053 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0053 : Poly :=
[
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0053_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0053
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0054 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0054 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0054_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0054
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0055 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0055 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0055_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0055
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0056 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0056 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0056_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0056
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0057 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0057 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0057_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0057
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0058 : Poly :=
[
  term ((-15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0058 : Poly :=
[
  term ((-15573138520409236971 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((15573138520409236971 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-15573138520409236971 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0058_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0058
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0059 : Poly :=
[
  term ((321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0059 : Poly :=
[
  term ((321683818528992735 : Rat) / 56915770350207104) [(0, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 56915770350207104) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((321683818528992735 : Rat) / 56915770350207104) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0059_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0059
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0060 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0060 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0060_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0060
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0061 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0061 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0061_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0061
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0062 : Poly :=
[
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 62 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0062 : Poly :=
[
  term ((-5251737526729202151 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0062_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0062
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0063 : Poly :=
[
  term ((467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0063 : Poly :=
[
  term ((467700031897819471539 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-467700031897819471539 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((467700031897819471539 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0063_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0063
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0064 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 64 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0064 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0064_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0064
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0065 : Poly :=
[
  term ((-47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0065 : Poly :=
[
  term ((-47342146877851761 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((47342146877851761 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47342146877851761 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0065_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0065
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0066 : Poly :=
[
  term ((18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0066 : Poly :=
[
  term ((18208518029942985 : Rat) / 5372151793259344) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18208518029942985 : Rat) / 5372151793259344) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((18208518029942985 : Rat) / 5372151793259344) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0066_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0066
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0067 : Poly :=
[
  term ((-169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0067 : Poly :=
[
  term ((-169952820204169083 : Rat) / 36191338396694528) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((169952820204169083 : Rat) / 36191338396694528) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-169952820204169083 : Rat) / 36191338396694528) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0067_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0067
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0068 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 68 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0068 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0068_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0068
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0069 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 69 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0069 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0069_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0069
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0070 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0070 : Poly :=
[
  term ((-921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0070_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0070
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0071 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 71 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0071 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0071_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0071
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0072 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0072 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0072_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0072
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0073 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 73 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0073 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0073_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0073
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0074 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0074 : Poly :=
[
  term ((921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0074_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0074
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0075 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (15, 4), (16, 1)]
]

/-- Partial product 75 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0075 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (12, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0075_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0075
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0076 : Poly :=
[
  term ((4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0076 : Poly :=
[
  term ((4563625763654639583 : Rat) / 110835973839876992) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4563625763654639583 : Rat) / 110835973839876992) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((4563625763654639583 : Rat) / 110835973839876992) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0076_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0076
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0077 : Poly :=
[
  term ((273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0077 : Poly :=
[
  term ((273926876411870378295 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((273926876411870378295 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0077_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0077
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0078 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 78 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0078 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0078_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0078
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0079 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 79 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0079 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0079_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0079
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0080 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 80 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0080 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (9, 1), (11, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0080_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0080
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0081 : Poly :=
[
  term ((17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0081 : Poly :=
[
  term ((17895649451550861 : Rat) / 2982837822886208) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17895649451550861 : Rat) / 2982837822886208) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((17895649451550861 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0081_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0081
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0082 : Poly :=
[
  term ((-6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0082 : Poly :=
[
  term ((-6226343586666561 : Rat) / 372854727860776) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((6226343586666561 : Rat) / 372854727860776) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6226343586666561 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0082_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0082
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0083 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0083 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0083_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0083
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0084 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0084 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0084_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0084
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0085 : Poly :=
[
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 85 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0085 : Poly :=
[
  term ((4303016838416635575 : Rat) / 526470875739415712) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 526470875739415712) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 526470875739415712) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0085_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0085
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0086 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 86 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0086 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0086_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0086
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0087 : Poly :=
[
  term ((24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0087 : Poly :=
[
  term ((24845504887116597 : Rat) / 2982837822886208) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 2982837822886208) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0087_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0087
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0088 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 88 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0088 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0088_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0088
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0089 : Poly :=
[
  term ((1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0089 : Poly :=
[
  term ((1575316149192998589 : Rat) / 37605062552815408) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1575316149192998589 : Rat) / 37605062552815408) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1575316149192998589 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0089_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0089
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0090 : Poly :=
[
  term ((-593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0090 : Poly :=
[
  term ((-593660798456220804369 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((593660798456220804369 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-593660798456220804369 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0090_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0090
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0091 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 91 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0091 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0091_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0091
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0092 : Poly :=
[
  term ((28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 92 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0092 : Poly :=
[
  term ((28161419651804986305 : Rat) / 2406724003380186112) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28161419651804986305 : Rat) / 2406724003380186112) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((28161419651804986305 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0092_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0092
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0093 : Poly :=
[
  term ((-3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0093 : Poly :=
[
  term ((-3010133347891634801861 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3010133347891634801861 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3010133347891634801861 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0093_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0093
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0094 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 94 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0094 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0094_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0094
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0095 : Poly :=
[
  term ((-1446451168833333 : Rat) / 852239377967488) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 95 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0095 : Poly :=
[
  term ((-1446451168833333 : Rat) / 426119688983744) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1446451168833333 : Rat) / 426119688983744) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1446451168833333 : Rat) / 426119688983744) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((1446451168833333 : Rat) / 852239377967488) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1446451168833333 : Rat) / 852239377967488) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1446451168833333 : Rat) / 852239377967488) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0095_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0095
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0096 : Poly :=
[
  term ((45210854711563495 : Rat) / 6817915023739904) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0096 : Poly :=
[
  term ((45210854711563495 : Rat) / 3408957511869952) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-45210854711563495 : Rat) / 3408957511869952) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((45210854711563495 : Rat) / 3408957511869952) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45210854711563495 : Rat) / 6817915023739904) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-45210854711563495 : Rat) / 6817915023739904) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((45210854711563495 : Rat) / 6817915023739904) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0096_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0096
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0097 : Poly :=
[
  term ((556327372628205 : Rat) / 121748482566784) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 97 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0097 : Poly :=
[
  term ((556327372628205 : Rat) / 60874241283392) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-556327372628205 : Rat) / 60874241283392) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((556327372628205 : Rat) / 60874241283392) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-556327372628205 : Rat) / 121748482566784) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-556327372628205 : Rat) / 121748482566784) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((556327372628205 : Rat) / 121748482566784) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0097_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0097
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0098 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0098 : Poly :=
[
  term ((-10925110817965791 : Rat) / 37605062552815408) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0098_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0098
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYY_coefficient_09_0099 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 9. -/
def rs_R010_ueqv_R010NYY_partial_09_0099 : Poly :=
[
  term ((363534495967615059 : Rat) / 37605062552815408) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 9. -/
theorem rs_R010_ueqv_R010NYY_partial_09_0099_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_09_0099
        rs_R010_ueqv_R010NYY_generator_09_0000_0099 =
      rs_R010_ueqv_R010NYY_partial_09_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_09_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_09_0000,
  rs_R010_ueqv_R010NYY_partial_09_0001,
  rs_R010_ueqv_R010NYY_partial_09_0002,
  rs_R010_ueqv_R010NYY_partial_09_0003,
  rs_R010_ueqv_R010NYY_partial_09_0004,
  rs_R010_ueqv_R010NYY_partial_09_0005,
  rs_R010_ueqv_R010NYY_partial_09_0006,
  rs_R010_ueqv_R010NYY_partial_09_0007,
  rs_R010_ueqv_R010NYY_partial_09_0008,
  rs_R010_ueqv_R010NYY_partial_09_0009,
  rs_R010_ueqv_R010NYY_partial_09_0010,
  rs_R010_ueqv_R010NYY_partial_09_0011,
  rs_R010_ueqv_R010NYY_partial_09_0012,
  rs_R010_ueqv_R010NYY_partial_09_0013,
  rs_R010_ueqv_R010NYY_partial_09_0014,
  rs_R010_ueqv_R010NYY_partial_09_0015,
  rs_R010_ueqv_R010NYY_partial_09_0016,
  rs_R010_ueqv_R010NYY_partial_09_0017,
  rs_R010_ueqv_R010NYY_partial_09_0018,
  rs_R010_ueqv_R010NYY_partial_09_0019,
  rs_R010_ueqv_R010NYY_partial_09_0020,
  rs_R010_ueqv_R010NYY_partial_09_0021,
  rs_R010_ueqv_R010NYY_partial_09_0022,
  rs_R010_ueqv_R010NYY_partial_09_0023,
  rs_R010_ueqv_R010NYY_partial_09_0024,
  rs_R010_ueqv_R010NYY_partial_09_0025,
  rs_R010_ueqv_R010NYY_partial_09_0026,
  rs_R010_ueqv_R010NYY_partial_09_0027,
  rs_R010_ueqv_R010NYY_partial_09_0028,
  rs_R010_ueqv_R010NYY_partial_09_0029,
  rs_R010_ueqv_R010NYY_partial_09_0030,
  rs_R010_ueqv_R010NYY_partial_09_0031,
  rs_R010_ueqv_R010NYY_partial_09_0032,
  rs_R010_ueqv_R010NYY_partial_09_0033,
  rs_R010_ueqv_R010NYY_partial_09_0034,
  rs_R010_ueqv_R010NYY_partial_09_0035,
  rs_R010_ueqv_R010NYY_partial_09_0036,
  rs_R010_ueqv_R010NYY_partial_09_0037,
  rs_R010_ueqv_R010NYY_partial_09_0038,
  rs_R010_ueqv_R010NYY_partial_09_0039,
  rs_R010_ueqv_R010NYY_partial_09_0040,
  rs_R010_ueqv_R010NYY_partial_09_0041,
  rs_R010_ueqv_R010NYY_partial_09_0042,
  rs_R010_ueqv_R010NYY_partial_09_0043,
  rs_R010_ueqv_R010NYY_partial_09_0044,
  rs_R010_ueqv_R010NYY_partial_09_0045,
  rs_R010_ueqv_R010NYY_partial_09_0046,
  rs_R010_ueqv_R010NYY_partial_09_0047,
  rs_R010_ueqv_R010NYY_partial_09_0048,
  rs_R010_ueqv_R010NYY_partial_09_0049,
  rs_R010_ueqv_R010NYY_partial_09_0050,
  rs_R010_ueqv_R010NYY_partial_09_0051,
  rs_R010_ueqv_R010NYY_partial_09_0052,
  rs_R010_ueqv_R010NYY_partial_09_0053,
  rs_R010_ueqv_R010NYY_partial_09_0054,
  rs_R010_ueqv_R010NYY_partial_09_0055,
  rs_R010_ueqv_R010NYY_partial_09_0056,
  rs_R010_ueqv_R010NYY_partial_09_0057,
  rs_R010_ueqv_R010NYY_partial_09_0058,
  rs_R010_ueqv_R010NYY_partial_09_0059,
  rs_R010_ueqv_R010NYY_partial_09_0060,
  rs_R010_ueqv_R010NYY_partial_09_0061,
  rs_R010_ueqv_R010NYY_partial_09_0062,
  rs_R010_ueqv_R010NYY_partial_09_0063,
  rs_R010_ueqv_R010NYY_partial_09_0064,
  rs_R010_ueqv_R010NYY_partial_09_0065,
  rs_R010_ueqv_R010NYY_partial_09_0066,
  rs_R010_ueqv_R010NYY_partial_09_0067,
  rs_R010_ueqv_R010NYY_partial_09_0068,
  rs_R010_ueqv_R010NYY_partial_09_0069,
  rs_R010_ueqv_R010NYY_partial_09_0070,
  rs_R010_ueqv_R010NYY_partial_09_0071,
  rs_R010_ueqv_R010NYY_partial_09_0072,
  rs_R010_ueqv_R010NYY_partial_09_0073,
  rs_R010_ueqv_R010NYY_partial_09_0074,
  rs_R010_ueqv_R010NYY_partial_09_0075,
  rs_R010_ueqv_R010NYY_partial_09_0076,
  rs_R010_ueqv_R010NYY_partial_09_0077,
  rs_R010_ueqv_R010NYY_partial_09_0078,
  rs_R010_ueqv_R010NYY_partial_09_0079,
  rs_R010_ueqv_R010NYY_partial_09_0080,
  rs_R010_ueqv_R010NYY_partial_09_0081,
  rs_R010_ueqv_R010NYY_partial_09_0082,
  rs_R010_ueqv_R010NYY_partial_09_0083,
  rs_R010_ueqv_R010NYY_partial_09_0084,
  rs_R010_ueqv_R010NYY_partial_09_0085,
  rs_R010_ueqv_R010NYY_partial_09_0086,
  rs_R010_ueqv_R010NYY_partial_09_0087,
  rs_R010_ueqv_R010NYY_partial_09_0088,
  rs_R010_ueqv_R010NYY_partial_09_0089,
  rs_R010_ueqv_R010NYY_partial_09_0090,
  rs_R010_ueqv_R010NYY_partial_09_0091,
  rs_R010_ueqv_R010NYY_partial_09_0092,
  rs_R010_ueqv_R010NYY_partial_09_0093,
  rs_R010_ueqv_R010NYY_partial_09_0094,
  rs_R010_ueqv_R010NYY_partial_09_0095,
  rs_R010_ueqv_R010NYY_partial_09_0096,
  rs_R010_ueqv_R010NYY_partial_09_0097,
  rs_R010_ueqv_R010NYY_partial_09_0098,
  rs_R010_ueqv_R010NYY_partial_09_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_09_0000_0099 : Poly :=
[
  term ((-10925110817965791 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((39377741091554699361 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-137979077883195796407 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-67706398144883349 : Rat) / 11931351291544832) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 526470875739415712) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-659718235034656454151 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (5, 1), (13, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((128266782904163919 : Rat) / 1921426553793488) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 1921426553793488) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 372854727860776) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 372854727860776) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((202463083317432552057 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 4211767005915325696) [(0, 1), (1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-231947569921110843987 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 263235437869707856) [(0, 1), (1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 263235437869707856) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27681743111572205 : Rat) / 23862702583089664) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 2982837822886208) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)],
  term ((742311385689334047 : Rat) / 11931351291544832) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-87528790244075539 : Rat) / 11931351291544832) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 23862702583089664) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 2982837822886208) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15573138520409236971 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((321683818528992735 : Rat) / 56915770350207104) [(0, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((15573138520409236971 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 56915770350207104) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5251737526729202151 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((5251737526729202151 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((467700031897819471539 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-467700031897819471539 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-47342146877851761 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18208518029942985 : Rat) / 5372151793259344) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-169952820204169083 : Rat) / 36191338396694528) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((47342146877851761 : Rat) / 37605062552815408) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34483291445106024993 : Rat) / 33694136047322605568) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-18208518029942985 : Rat) / 5372151793259344) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((96354683527593720633 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (7, 1), (15, 4), (16, 1)],
  term ((4563625763654639583 : Rat) / 110835973839876992) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((273926876411870378295 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4563625763654639583 : Rat) / 110835973839876992) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (9, 1), (11, 2), (16, 1)],
  term ((17895649451550861 : Rat) / 2982837822886208) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6226343586666561 : Rat) / 372854727860776) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17895649451550861 : Rat) / 2982837822886208) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6226343586666561 : Rat) / 372854727860776) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4303016838416635575 : Rat) / 526470875739415712) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4303016838416635575 : Rat) / 526470875739415712) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((24845504887116597 : Rat) / 2982837822886208) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24845504887116597 : Rat) / 2982837822886208) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1575316149192998589 : Rat) / 37605062552815408) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-593660798456220804369 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((28161419651804986305 : Rat) / 2406724003380186112) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1575316149192998589 : Rat) / 37605062552815408) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((56547350786450023191 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((593660798456220804369 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(0, 1), (3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-126838644174542463663 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((-3010133347891634801861 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((3010133347891634801861 : Rat) / 4211767005915325696) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(0, 1), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1446451168833333 : Rat) / 426119688983744) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((45210854711563495 : Rat) / 3408957511869952) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((556327372628205 : Rat) / 60874241283392) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1446451168833333 : Rat) / 426119688983744) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((77052698005037193 : Rat) / 23862702583089664) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-196764340492990829 : Rat) / 11931351291544832) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-556327372628205 : Rat) / 60874241283392) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (13, 3), (16, 1)],
  term ((-219906078344885484717 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-23855701531660927437 : Rat) / 16847068023661302784) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(0, 1), (11, 2), (16, 1)],
  term ((87528790244075539 : Rat) / 23862702583089664) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(0, 1), (12, 2), (16, 1)],
  term ((-87528790244075539 : Rat) / 23862702583089664) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(0, 1), (13, 2), (16, 1)],
  term ((87528790244075539 : Rat) / 23862702583089664) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 23862702583089664) [(0, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(0, 1), (16, 1)],
  term ((34483291445106024993 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-34483291445106024993 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-56547350786450023191 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((56547350786450023191 : Rat) / 8423534011830651392) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-77052698005037193 : Rat) / 11931351291544832) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((77052698005037193 : Rat) / 11931351291544832) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((45743890519138780635 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-45743890519138780635 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((13152842222095000911 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-23855701531660927437 : Rat) / 8423534011830651392) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13152842222095000911 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((23855701531660927437 : Rat) / 8423534011830651392) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(0, 2), (11, 2), (16, 1)],
  term ((-87528790244075539 : Rat) / 11931351291544832) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(0, 2), (12, 1), (16, 1)],
  term ((87528790244075539 : Rat) / 11931351291544832) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(0, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(0, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((321683818528992735 : Rat) / 56915770350207104) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15573138520409236971 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5251737526729202151 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((467700031897819471539 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((18208518029942985 : Rat) / 5372151793259344) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23302932179504298663 : Rat) / 4813448006760372224) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 1), (3, 1), (5, 1), (13, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((273926876411870378295 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((4563625763654639583 : Rat) / 110835973839876992) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6226343586666561 : Rat) / 372854727860776) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((17895649451550861 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4303016838416635575 : Rat) / 526470875739415712) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 2982837822886208) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-593660798456220804369 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((39794523522768668193 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 2350316409550963) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 1), (3, 1), (11, 1), (13, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3010133347891634801861 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((6267952716750829 : Rat) / 486993930267136) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((556327372628205 : Rat) / 60874241283392) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 26632480561484) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14432905278411711867 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-45743890519138780635 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((128266782904163919 : Rat) / 3842853107586976) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((231947569921110843987 : Rat) / 4211767005915325696) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13152842222095000911 : Rat) / 16847068023661302784) [(1, 1), (11, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (11, 2), (13, 3), (16, 1)],
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 47725405166179328) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)],
  term ((27681743111572205 : Rat) / 47725405166179328) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (13, 3), (16, 1)],
  term ((-27681743111572205 : Rat) / 47725405166179328) [(1, 1), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45743890519138780635 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((128266782904163919 : Rat) / 1921426553793488) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 372854727860776) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13152842222095000911 : Rat) / 8423534011830651392) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 263235437869707856) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (13, 2), (16, 1)],
  term ((-27681743111572205 : Rat) / 23862702583089664) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 2982837822886208) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (13, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((15573138520409236971 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((321683818528992735 : Rat) / 113831540700414208) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((467700031897819471539 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((47342146877851761 : Rat) / 75210125105630816) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((18208518029942985 : Rat) / 10744303586518688) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-169952820204169083 : Rat) / 72382676793389056) [(3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (12, 2), (15, 4), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4563625763654639583 : Rat) / 221671947679753984) [(3, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((273926876411870378295 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17895649451550861 : Rat) / 5965675645772416) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6226343586666561 : Rat) / 745709455721552) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((24845504887116597 : Rat) / 5965675645772416) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term ((-28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1575316149192998589 : Rat) / 75210125105630816) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-593660798456220804369 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((28161419651804986305 : Rat) / 4813448006760372224) [(3, 1), (11, 1), (16, 1)],
  term ((3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 2), (15, 3), (16, 1)],
  term ((3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((-3010133347891634801861 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((1446451168833333 : Rat) / 852239377967488) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-45210854711563495 : Rat) / 6817915023739904) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-556327372628205 : Rat) / 121748482566784) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1446451168833333 : Rat) / 852239377967488) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45210854711563495 : Rat) / 6817915023739904) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-556327372628205 : Rat) / 121748482566784) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((1446451168833333 : Rat) / 852239377967488) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((45210854711563495 : Rat) / 6817915023739904) [(3, 1), (15, 1), (16, 1)],
  term ((556327372628205 : Rat) / 121748482566784) [(3, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 99. -/
theorem rs_R010_ueqv_R010NYY_block_09_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_09_0000_0099
      rs_R010_ueqv_R010NYY_block_09_0000_0099 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
