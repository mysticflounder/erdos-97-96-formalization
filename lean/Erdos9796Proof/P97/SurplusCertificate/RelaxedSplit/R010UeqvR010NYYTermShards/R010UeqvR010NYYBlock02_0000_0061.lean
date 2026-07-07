/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 2:0-61

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_02_0000_0061 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0000 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0000 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 3), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0000
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0001 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0001 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (3, 1), (11, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 3), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0001
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0002 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0002 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0002
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0003 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 3 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0003 : Poly :=
[
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0003
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0004 : Poly :=
[
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0004 : Poly :=
[
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0004
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0005 : Poly :=
[
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0005 : Poly :=
[
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0005
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0006 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0006 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0006
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0007 : Poly :=
[
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0007 : Poly :=
[
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0007
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0008 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 8 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0008 : Poly :=
[
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 3), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0008
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0009 : Poly :=
[
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0009 : Poly :=
[
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0009
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0010 : Poly :=
[
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0010 : Poly :=
[
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0010
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0011 : Poly :=
[
  term ((9470325311286913 : Rat) / 5113436267804928) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0011 : Poly :=
[
  term ((9470325311286913 : Rat) / 5113436267804928) [(0, 1), (1, 2), (16, 1)],
  term ((-9470325311286913 : Rat) / 5113436267804928) [(0, 1), (10, 2), (16, 1)],
  term ((-9470325311286913 : Rat) / 5113436267804928) [(0, 1), (11, 2), (16, 1)],
  term ((9470325311286913 : Rat) / 5113436267804928) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0011
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0012 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0012 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 3), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0012
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0013 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0013 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (11, 3), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 3), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0013
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0014 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0014 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(1, 3), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0014
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0015 : Poly :=
[
  term ((57544717150497601491 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 15 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0015 : Poly :=
[
  term ((57544717150497601491 : Rat) / 33694136047322605568) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-57544717150497601491 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-57544717150497601491 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((57544717150497601491 : Rat) / 33694136047322605568) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0015
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0016 : Poly :=
[
  term ((-307727929755213655 : Rat) / 886687790719015936) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0016 : Poly :=
[
  term ((-307727929755213655 : Rat) / 886687790719015936) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((307727929755213655 : Rat) / 886687790719015936) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((307727929755213655 : Rat) / 886687790719015936) [(1, 1), (11, 3), (16, 1)],
  term ((-307727929755213655 : Rat) / 886687790719015936) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0016
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0017 : Poly :=
[
  term ((-615465265418789 : Rat) / 1934813722953216) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0017 : Poly :=
[
  term ((-615465265418789 : Rat) / 1934813722953216) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 1934813722953216) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 1934813722953216) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 1934813722953216) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0017
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0018 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 18 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0018 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0018
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0019 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 19 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0019 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(0, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(1, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0019
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0020 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0020 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0020
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0021 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0021 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0021
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0022 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0022 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0022
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0023 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 23 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0023 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0023
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0024 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0024 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0024
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0025 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0025 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0025
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0026 : Poly :=
[
  term ((9184513182051 : Rat) / 106529922245936) [(2, 1), (16, 1)]
]

/-- Partial product 26 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0026 : Poly :=
[
  term ((9184513182051 : Rat) / 106529922245936) [(0, 2), (2, 1), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(1, 2), (2, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (10, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0026
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0027 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 27 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0027 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0027
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0028 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0028 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0028
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0029 : Poly :=
[
  term ((-1175618734587767943 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 29 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0029 : Poly :=
[
  term ((-1175618734587767943 : Rat) / 2406724003380186112) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 2406724003380186112) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((1175618734587767943 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0029
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0030 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0030 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0030
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0031 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0031 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0031
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0032 : Poly :=
[
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0032 : Poly :=
[
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0032
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0033 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0033 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0033
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0034 : Poly :=
[
  term ((3297501003327384801 : Rat) / 1203362001690093056) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0034 : Poly :=
[
  term ((3297501003327384801 : Rat) / 1203362001690093056) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 1203362001690093056) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 1203362001690093056) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 1203362001690093056) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0034
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0035 : Poly :=
[
  term ((1237709435903 : Rat) / 777590673328) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0035 : Poly :=
[
  term ((1237709435903 : Rat) / 777590673328) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1237709435903 : Rat) / 777590673328) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1237709435903 : Rat) / 777590673328) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1237709435903 : Rat) / 777590673328) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0035
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0036 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 36 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0036 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0036
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0037 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 37 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0037 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0037
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0038 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0038 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0038
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0039 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 39 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0039 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0039
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0040 : Poly :=
[
  term ((-724990340615301 : Rat) / 106529922245936) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 40 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0040 : Poly :=
[
  term ((-724990340615301 : Rat) / 106529922245936) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0040
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0041 : Poly :=
[
  term ((-32298164849599 : Rat) / 213059844491872) [(4, 1), (16, 1)]
]

/-- Partial product 41 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0041 : Poly :=
[
  term ((-32298164849599 : Rat) / 213059844491872) [(0, 2), (4, 1), (16, 1)],
  term ((-32298164849599 : Rat) / 213059844491872) [(1, 2), (4, 1), (16, 1)],
  term ((32298164849599 : Rat) / 213059844491872) [(4, 1), (10, 2), (16, 1)],
  term ((32298164849599 : Rat) / 213059844491872) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0041
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0042 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 42 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0042 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0042_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0042
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0043 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0043 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0043_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0043
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0044 : Poly :=
[
  term ((-55830973695753640899 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 44 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0044 : Poly :=
[
  term ((-55830973695753640899 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-55830973695753640899 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((55830973695753640899 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((55830973695753640899 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0044_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0044
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0045 : Poly :=
[
  term ((1560709993403703 : Rat) / 426119688983744) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 45 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0045 : Poly :=
[
  term ((1560709993403703 : Rat) / 426119688983744) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((1560709993403703 : Rat) / 426119688983744) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1560709993403703 : Rat) / 426119688983744) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1560709993403703 : Rat) / 426119688983744) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0045_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0045
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0046 : Poly :=
[
  term ((63256364940945587055 : Rat) / 8423534011830651392) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0046 : Poly :=
[
  term ((63256364940945587055 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((63256364940945587055 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-63256364940945587055 : Rat) / 8423534011830651392) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-63256364940945587055 : Rat) / 8423534011830651392) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0046_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0046
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0047 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0047 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0047_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0047
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0048 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 48 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0048 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0048_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0048
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0049 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0049 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0049_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0049
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0050 : Poly :=
[
  term ((-6083493896867921 : Rat) / 1704478755934976) [(8, 1), (16, 1)]
]

/-- Partial product 50 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0050 : Poly :=
[
  term ((-6083493896867921 : Rat) / 1704478755934976) [(0, 2), (8, 1), (16, 1)],
  term ((-6083493896867921 : Rat) / 1704478755934976) [(1, 2), (8, 1), (16, 1)],
  term ((6083493896867921 : Rat) / 1704478755934976) [(8, 1), (10, 2), (16, 1)],
  term ((6083493896867921 : Rat) / 1704478755934976) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0050_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0050
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0051 : Poly :=
[
  term ((924009475790001011827 : Rat) / 12635301017745977088) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 51 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0051 : Poly :=
[
  term ((924009475790001011827 : Rat) / 12635301017745977088) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((924009475790001011827 : Rat) / 12635301017745977088) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-924009475790001011827 : Rat) / 12635301017745977088) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-924009475790001011827 : Rat) / 12635301017745977088) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0051_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0051
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0052 : Poly :=
[
  term ((418033808645315157 : Rat) / 23862702583089664) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0052 : Poly :=
[
  term ((418033808645315157 : Rat) / 23862702583089664) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((418033808645315157 : Rat) / 23862702583089664) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-418033808645315157 : Rat) / 23862702583089664) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-418033808645315157 : Rat) / 23862702583089664) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0052_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0052
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0053 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 2), (16, 1)]
]

/-- Partial product 53 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0053 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (9, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (9, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0053_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0053
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0054 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0054 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0054_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0054
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0055 : Poly :=
[
  term ((-3746561459515675 : Rat) / 1704478755934976) [(10, 1), (16, 1)]
]

/-- Partial product 55 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0055 : Poly :=
[
  term ((-3746561459515675 : Rat) / 1704478755934976) [(0, 2), (10, 1), (16, 1)],
  term ((-3746561459515675 : Rat) / 1704478755934976) [(1, 2), (10, 1), (16, 1)],
  term ((3746561459515675 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)],
  term ((3746561459515675 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0055_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0055
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0056 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 2), (16, 1)]
]

/-- Partial product 56 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0056 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 2), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0056_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0056
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0057 : Poly :=
[
  term ((-325215236435192213539 : Rat) / 4211767005915325696) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0057 : Poly :=
[
  term ((-325215236435192213539 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-325215236435192213539 : Rat) / 4211767005915325696) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((325215236435192213539 : Rat) / 4211767005915325696) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((325215236435192213539 : Rat) / 4211767005915325696) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0057_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0057
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0058 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(11, 2), (16, 1)]
]

/-- Partial product 58 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0058 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 2), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0058_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0058
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0059 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(14, 1), (16, 1)]
]

/-- Partial product 59 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0059 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(0, 2), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(1, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(10, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0059_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0059
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0060 : Poly :=
[
  term ((-690791465125910795 : Rat) / 35794053874634496) [(15, 2), (16, 1)]
]

/-- Partial product 60 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0060 : Poly :=
[
  term ((-690791465125910795 : Rat) / 35794053874634496) [(0, 2), (15, 2), (16, 1)],
  term ((-690791465125910795 : Rat) / 35794053874634496) [(1, 2), (15, 2), (16, 1)],
  term ((690791465125910795 : Rat) / 35794053874634496) [(10, 2), (15, 2), (16, 1)],
  term ((690791465125910795 : Rat) / 35794053874634496) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0060_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0060
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010NYY_coefficient_02_0061 : Poly :=
[
  term ((-245468128968599 : Rat) / 1278359066951232) [(16, 1)]
]

/-- Partial product 61 for generator 2. -/
def rs_R010_ueqv_R010NYY_partial_02_0061 : Poly :=
[
  term ((-245468128968599 : Rat) / 1278359066951232) [(0, 2), (16, 1)],
  term ((-245468128968599 : Rat) / 1278359066951232) [(1, 2), (16, 1)],
  term ((245468128968599 : Rat) / 1278359066951232) [(10, 2), (16, 1)],
  term ((245468128968599 : Rat) / 1278359066951232) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 2. -/
theorem rs_R010_ueqv_R010NYY_partial_02_0061_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_02_0061
        rs_R010_ueqv_R010NYY_generator_02_0000_0061 =
      rs_R010_ueqv_R010NYY_partial_02_0061 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_02_0000_0061 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_02_0000,
  rs_R010_ueqv_R010NYY_partial_02_0001,
  rs_R010_ueqv_R010NYY_partial_02_0002,
  rs_R010_ueqv_R010NYY_partial_02_0003,
  rs_R010_ueqv_R010NYY_partial_02_0004,
  rs_R010_ueqv_R010NYY_partial_02_0005,
  rs_R010_ueqv_R010NYY_partial_02_0006,
  rs_R010_ueqv_R010NYY_partial_02_0007,
  rs_R010_ueqv_R010NYY_partial_02_0008,
  rs_R010_ueqv_R010NYY_partial_02_0009,
  rs_R010_ueqv_R010NYY_partial_02_0010,
  rs_R010_ueqv_R010NYY_partial_02_0011,
  rs_R010_ueqv_R010NYY_partial_02_0012,
  rs_R010_ueqv_R010NYY_partial_02_0013,
  rs_R010_ueqv_R010NYY_partial_02_0014,
  rs_R010_ueqv_R010NYY_partial_02_0015,
  rs_R010_ueqv_R010NYY_partial_02_0016,
  rs_R010_ueqv_R010NYY_partial_02_0017,
  rs_R010_ueqv_R010NYY_partial_02_0018,
  rs_R010_ueqv_R010NYY_partial_02_0019,
  rs_R010_ueqv_R010NYY_partial_02_0020,
  rs_R010_ueqv_R010NYY_partial_02_0021,
  rs_R010_ueqv_R010NYY_partial_02_0022,
  rs_R010_ueqv_R010NYY_partial_02_0023,
  rs_R010_ueqv_R010NYY_partial_02_0024,
  rs_R010_ueqv_R010NYY_partial_02_0025,
  rs_R010_ueqv_R010NYY_partial_02_0026,
  rs_R010_ueqv_R010NYY_partial_02_0027,
  rs_R010_ueqv_R010NYY_partial_02_0028,
  rs_R010_ueqv_R010NYY_partial_02_0029,
  rs_R010_ueqv_R010NYY_partial_02_0030,
  rs_R010_ueqv_R010NYY_partial_02_0031,
  rs_R010_ueqv_R010NYY_partial_02_0032,
  rs_R010_ueqv_R010NYY_partial_02_0033,
  rs_R010_ueqv_R010NYY_partial_02_0034,
  rs_R010_ueqv_R010NYY_partial_02_0035,
  rs_R010_ueqv_R010NYY_partial_02_0036,
  rs_R010_ueqv_R010NYY_partial_02_0037,
  rs_R010_ueqv_R010NYY_partial_02_0038,
  rs_R010_ueqv_R010NYY_partial_02_0039,
  rs_R010_ueqv_R010NYY_partial_02_0040,
  rs_R010_ueqv_R010NYY_partial_02_0041,
  rs_R010_ueqv_R010NYY_partial_02_0042,
  rs_R010_ueqv_R010NYY_partial_02_0043,
  rs_R010_ueqv_R010NYY_partial_02_0044,
  rs_R010_ueqv_R010NYY_partial_02_0045,
  rs_R010_ueqv_R010NYY_partial_02_0046,
  rs_R010_ueqv_R010NYY_partial_02_0047,
  rs_R010_ueqv_R010NYY_partial_02_0048,
  rs_R010_ueqv_R010NYY_partial_02_0049,
  rs_R010_ueqv_R010NYY_partial_02_0050,
  rs_R010_ueqv_R010NYY_partial_02_0051,
  rs_R010_ueqv_R010NYY_partial_02_0052,
  rs_R010_ueqv_R010NYY_partial_02_0053,
  rs_R010_ueqv_R010NYY_partial_02_0054,
  rs_R010_ueqv_R010NYY_partial_02_0055,
  rs_R010_ueqv_R010NYY_partial_02_0056,
  rs_R010_ueqv_R010NYY_partial_02_0057,
  rs_R010_ueqv_R010NYY_partial_02_0058,
  rs_R010_ueqv_R010NYY_partial_02_0059,
  rs_R010_ueqv_R010NYY_partial_02_0060,
  rs_R010_ueqv_R010NYY_partial_02_0061
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_02_0000_0061 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 1), (1, 2), (3, 1), (5, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 1), (1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((9470325311286913 : Rat) / 5113436267804928) [(0, 1), (1, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (10, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (3, 1), (10, 2), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 1), (3, 1), (11, 3), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((-36811646155131 : Rat) / 30437120641696) [(0, 1), (4, 1), (11, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9470325311286913 : Rat) / 5113436267804928) [(0, 1), (10, 2), (16, 1)],
  term ((36811646155131 : Rat) / 60874241283392) [(0, 1), (10, 3), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9470325311286913 : Rat) / 5113436267804928) [(0, 1), (11, 2), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((57544717150497601491 : Rat) / 33694136047322605568) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-307727929755213655 : Rat) / 886687790719015936) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 1934813722953216) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(0, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(0, 2), (2, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 2406724003380186112) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((3297501003327384801 : Rat) / 1203362001690093056) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((1237709435903 : Rat) / 777590673328) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-32298164849599 : Rat) / 213059844491872) [(0, 2), (4, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55830973695753640899 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((1560709993403703 : Rat) / 426119688983744) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((63256364940945587055 : Rat) / 8423534011830651392) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6083493896867921 : Rat) / 1704478755934976) [(0, 2), (8, 1), (16, 1)],
  term ((924009475790001011827 : Rat) / 12635301017745977088) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((418033808645315157 : Rat) / 23862702583089664) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(0, 2), (9, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3746561459515675 : Rat) / 1704478755934976) [(0, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (10, 2), (16, 1)],
  term ((-325215236435192213539 : Rat) / 4211767005915325696) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(0, 2), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(0, 2), (14, 1), (16, 1)],
  term ((-690791465125910795 : Rat) / 35794053874634496) [(0, 2), (15, 2), (16, 1)],
  term ((-245468128968599 : Rat) / 1278359066951232) [(0, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(0, 3), (3, 1), (5, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(0, 3), (3, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((36811646155131 : Rat) / 30437120641696) [(0, 3), (4, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 8423534011830651392) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 8423534011830651392) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(0, 3), (9, 1), (11, 1), (16, 1)],
  term ((-13825011908841381 : Rat) / 5965675645772416) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-36811646155131 : Rat) / 60874241283392) [(0, 3), (10, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((13825011908841381 : Rat) / 5965675645772416) [(0, 3), (15, 2), (16, 1)],
  term ((9470325311286913 : Rat) / 5113436267804928) [(0, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (11, 3), (15, 1), (16, 1)],
  term ((-57544717150497601491 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-57544717150497601491 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((307727929755213655 : Rat) / 886687790719015936) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((615465265418789 : Rat) / 1934813722953216) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((615465265418789 : Rat) / 1934813722953216) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((307727929755213655 : Rat) / 886687790719015936) [(1, 1), (11, 3), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(1, 2), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(1, 2), (2, 1), (10, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 106529922245936) [(1, 2), (2, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 2406724003380186112) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((3297501003327384801 : Rat) / 1203362001690093056) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((1237709435903 : Rat) / 777590673328) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-32298164849599 : Rat) / 213059844491872) [(1, 2), (4, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55830973695753640899 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((1560709993403703 : Rat) / 426119688983744) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((63256364940945587055 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6083493896867921 : Rat) / 1704478755934976) [(1, 2), (8, 1), (16, 1)],
  term ((924009475790001011827 : Rat) / 12635301017745977088) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((418033808645315157 : Rat) / 23862702583089664) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(1, 2), (9, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3746561459515675 : Rat) / 1704478755934976) [(1, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (10, 2), (16, 1)],
  term ((-325215236435192213539 : Rat) / 4211767005915325696) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(1, 2), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(1, 2), (14, 1), (16, 1)],
  term ((-690791465125910795 : Rat) / 35794053874634496) [(1, 2), (15, 2), (16, 1)],
  term ((-245468128968599 : Rat) / 1278359066951232) [(1, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 3), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 3), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((57544717150497601491 : Rat) / 33694136047322605568) [(1, 3), (5, 1), (16, 1)],
  term ((-307727929755213655 : Rat) / 886687790719015936) [(1, 3), (11, 1), (16, 1)],
  term ((-615465265418789 : Rat) / 1934813722953216) [(1, 3), (15, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (11, 3), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (10, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 3), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 106529922245936) [(2, 1), (11, 2), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((1175618734587767943 : Rat) / 2406724003380186112) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 1), (8, 1), (11, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 1203362001690093056) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1237709435903 : Rat) / 777590673328) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1237709435903 : Rat) / 777590673328) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 1203362001690093056) [(3, 1), (11, 3), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((32298164849599 : Rat) / 213059844491872) [(4, 1), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 3), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((32298164849599 : Rat) / 213059844491872) [(4, 1), (11, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((55830973695753640899 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((55830973695753640899 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1560709993403703 : Rat) / 426119688983744) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-63256364940945587055 : Rat) / 8423534011830651392) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-63256364940945587055 : Rat) / 8423534011830651392) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1560709993403703 : Rat) / 426119688983744) [(5, 1), (11, 3), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6083493896867921 : Rat) / 1704478755934976) [(8, 1), (10, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 3), (16, 1)],
  term ((6083493896867921 : Rat) / 1704478755934976) [(8, 1), (11, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-924009475790001011827 : Rat) / 12635301017745977088) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-418033808645315157 : Rat) / 23862702583089664) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-418033808645315157 : Rat) / 23862702583089664) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-924009475790001011827 : Rat) / 12635301017745977088) [(9, 1), (11, 3), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3746561459515675 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)],
  term ((325215236435192213539 : Rat) / 4211767005915325696) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(10, 2), (11, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(10, 2), (14, 1), (16, 1)],
  term ((690791465125910795 : Rat) / 35794053874634496) [(10, 2), (15, 2), (16, 1)],
  term ((245468128968599 : Rat) / 1278359066951232) [(10, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 3), (14, 1), (16, 1)],
  term ((3746561459515675 : Rat) / 1704478755934976) [(10, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 4), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(11, 2), (14, 1), (16, 1)],
  term ((690791465125910795 : Rat) / 35794053874634496) [(11, 2), (15, 2), (16, 1)],
  term ((245468128968599 : Rat) / 1278359066951232) [(11, 2), (16, 1)],
  term ((325215236435192213539 : Rat) / 4211767005915325696) [(11, 3), (15, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 0 through 61. -/
theorem rs_R010_ueqv_R010NYY_block_02_0000_0061_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_02_0000_0061
      rs_R010_ueqv_R010NYY_block_02_0000_0061 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
