/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 11:0-17

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_11_0000_0017 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0000 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0000 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0000
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0001 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0001 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0001
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0002 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0002 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0002
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0003 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0003 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0003
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0004 : Poly :=
[
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0004 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0004
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0005 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0005 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0005
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0006 : Poly :=
[
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0006 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0006
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0007 : Poly :=
[
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0007 : Poly :=
[
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0007
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0008 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0008 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0008
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0009 : Poly :=
[
  term ((-15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0009 : Poly :=
[
  term ((-30871928905370982784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30871928905370982784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0009
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0010 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0010 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0010
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0011 : Poly :=
[
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0011 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0011
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0012 : Poly :=
[
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0012 : Poly :=
[
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0012
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0013 : Poly :=
[
  term ((16341797216288998592 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0013 : Poly :=
[
  term ((32683594432577997184 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((32683594432577997184 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16341797216288998592 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16341797216288998592 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0013
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0014 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0014 : Poly :=
[
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0014
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0015 : Poly :=
[
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0015 : Poly :=
[
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0015
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0016 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0016 : Poly :=
[
  term ((3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0016
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YNN_coefficient_11_0017 : Poly :=
[
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R010_ueqv_R010YNN_partial_11_0017 : Poly :=
[
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R010_ueqv_R010YNN_partial_11_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_11_0017
        rs_R010_ueqv_R010YNN_generator_11_0000_0017 =
      rs_R010_ueqv_R010YNN_partial_11_0017 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_11_0000_0017 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_11_0000,
  rs_R010_ueqv_R010YNN_partial_11_0001,
  rs_R010_ueqv_R010YNN_partial_11_0002,
  rs_R010_ueqv_R010YNN_partial_11_0003,
  rs_R010_ueqv_R010YNN_partial_11_0004,
  rs_R010_ueqv_R010YNN_partial_11_0005,
  rs_R010_ueqv_R010YNN_partial_11_0006,
  rs_R010_ueqv_R010YNN_partial_11_0007,
  rs_R010_ueqv_R010YNN_partial_11_0008,
  rs_R010_ueqv_R010YNN_partial_11_0009,
  rs_R010_ueqv_R010YNN_partial_11_0010,
  rs_R010_ueqv_R010YNN_partial_11_0011,
  rs_R010_ueqv_R010YNN_partial_11_0012,
  rs_R010_ueqv_R010YNN_partial_11_0013,
  rs_R010_ueqv_R010YNN_partial_11_0014,
  rs_R010_ueqv_R010YNN_partial_11_0015,
  rs_R010_ueqv_R010YNN_partial_11_0016,
  rs_R010_ueqv_R010YNN_partial_11_0017
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_11_0000_0017 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-30871928905370982784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((32683594432577997184 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-30871928905370982784 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((32683594432577997184 : Rat) / 269491324728529755) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-16341797216288998592 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-16341797216288998592 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 17. -/
theorem rs_R010_ueqv_R010YNN_block_11_0000_0017_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_11_0000_0017
      rs_R010_ueqv_R010YNN_block_11_0000_0017 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
