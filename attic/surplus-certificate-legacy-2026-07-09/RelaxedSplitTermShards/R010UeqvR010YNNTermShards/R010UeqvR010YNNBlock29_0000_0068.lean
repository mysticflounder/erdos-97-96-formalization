/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 29:0-68

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_29_0000_0068 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0000 : Poly :=
[
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0000 : Poly :=
[
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0000
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0001 : Poly :=
[
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0001 : Poly :=
[
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0001
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0002 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0002 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0002
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0003 : Poly :=
[
  term ((-6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0003 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0003
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0004 : Poly :=
[
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0004 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0004
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0005 : Poly :=
[
  term ((285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0005 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0005
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0006 : Poly :=
[
  term ((-540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0006 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0006
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0007 : Poly :=
[
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0007 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0007
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0008 : Poly :=
[
  term ((-736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0008 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0008
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0009 : Poly :=
[
  term ((-925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0009 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0009
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0010 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0010 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0010
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0011 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0011 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0011
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0012 : Poly :=
[
  term ((-72550035137786344 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0012 : Poly :=
[
  term ((145100070275572688 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-145100070275572688 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((72550035137786344 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-145100070275572688 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((72550035137786344 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0012
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0013 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0013 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0013
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0014 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0014 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0014
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0015 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0015 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0015
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0016 : Poly :=
[
  term ((272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0016 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0016
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0017 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0017 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0017
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0018 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0018 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0018
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0019 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0019 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0019
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0020 : Poly :=
[
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0020 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0020
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0021 : Poly :=
[
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0021 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0021
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0022 : Poly :=
[
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0022 : Poly :=
[
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0022
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0023 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0023 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0023
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0024 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0024 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0024
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0025 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0025 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0025
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0026 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0026 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0026
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0027 : Poly :=
[
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0027 : Poly :=
[
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0027
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0028 : Poly :=
[
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0028 : Poly :=
[
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0028
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0029 : Poly :=
[
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0029 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0029
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0030 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0030 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0030
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0031 : Poly :=
[
  term ((127811296277147016904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0031 : Poly :=
[
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((127811296277147016904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((127811296277147016904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((255622592554294033808 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127811296277147016904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((255622592554294033808 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-127811296277147016904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0031
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0032 : Poly :=
[
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0032 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0032
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0033 : Poly :=
[
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0033 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0033
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0034 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0034 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0034
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0035 : Poly :=
[
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 35 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0035 : Poly :=
[
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0035
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0036 : Poly :=
[
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0036 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0036
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0037 : Poly :=
[
  term ((-27919336206575260610 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 37 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0037 : Poly :=
[
  term ((55838672413150521220 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-27919336206575260610 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((55838672413150521220 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27919336206575260610 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-55838672413150521220 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((27919336206575260610 : Rat) / 161694794837117853) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-55838672413150521220 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27919336206575260610 : Rat) / 161694794837117853) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0037
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0038 : Poly :=
[
  term ((-2769288839662246720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0038 : Poly :=
[
  term ((5538577679324493440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2769288839662246720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2769288839662246720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2769288839662246720 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2769288839662246720 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0038
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0039 : Poly :=
[
  term ((164968749428492800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 39 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0039 : Poly :=
[
  term ((-329937498856985600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((164968749428492800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-329937498856985600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((164968749428492800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((329937498856985600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-164968749428492800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((329937498856985600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-164968749428492800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0039
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0040 : Poly :=
[
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0040 : Poly :=
[
  term ((1815855772417352960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0040
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0041 : Poly :=
[
  term ((74470784835102469454 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 41 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0041 : Poly :=
[
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((74470784835102469454 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((74470784835102469454 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((148941569670204938908 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-74470784835102469454 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((148941569670204938908 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-74470784835102469454 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0041
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0042 : Poly :=
[
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0042 : Poly :=
[
  term ((-470929192168422400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0042
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0043 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0043 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0043
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0044 : Poly :=
[
  term ((-369397773674209280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0044 : Poly :=
[
  term ((738795547348418560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-369397773674209280 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((738795547348418560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-369397773674209280 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-738795547348418560 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((369397773674209280 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-738795547348418560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((369397773674209280 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0044
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0045 : Poly :=
[
  term ((-1840164946212986316496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0045 : Poly :=
[
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1840164946212986316496 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1840164946212986316496 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1840164946212986316496 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((1840164946212986316496 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0045
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0046 : Poly :=
[
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 46 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0046 : Poly :=
[
  term ((2220440722773647360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0046
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0047 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0047 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0047
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0048 : Poly :=
[
  term ((716373131206727680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 48 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0048 : Poly :=
[
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((1432746262413455360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-716373131206727680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((1432746262413455360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-716373131206727680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0048
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0049 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0049 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0049
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0050 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0050 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0050
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0051 : Poly :=
[
  term ((-440673445484839874 : Rat) / 53898264945705951) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 51 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0051 : Poly :=
[
  term ((881346890969679748 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-881346890969679748 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((440673445484839874 : Rat) / 53898264945705951) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-881346890969679748 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((440673445484839874 : Rat) / 53898264945705951) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0051
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0052 : Poly :=
[
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0052 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0052
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0053 : Poly :=
[
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0053 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0053
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0054 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 54 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0054 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0054
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0055 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 55 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0055 : Poly :=
[
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0055
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0056 : Poly :=
[
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0056 : Poly :=
[
  term ((9841861464530432128 : Rat) / 89830441576176585) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((9841861464530432128 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0056
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0057 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0057 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0057
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0058 : Poly :=
[
  term ((9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0058 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(0, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0058
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0059 : Poly :=
[
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0059 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0059
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0060 : Poly :=
[
  term ((2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 60 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0060 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0060
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0061 : Poly :=
[
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 61 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0061 : Poly :=
[
  term ((2002115877403114880 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2002115877403114880 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2002115877403114880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1001057938701557440 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2002115877403114880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1001057938701557440 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0061
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0062 : Poly :=
[
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0062 : Poly :=
[
  term ((33503671367515433104 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((33503671367515433104 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0062
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0063 : Poly :=
[
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 63 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0063 : Poly :=
[
  term ((6895907067232796800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0063
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0064 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0064 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(2, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0064
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0065 : Poly :=
[
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 65 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0065 : Poly :=
[
  term ((2324216883438907776 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((2324216883438907776 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-2324216883438907776 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((1162108441719453888 : Rat) / 29943480525392195) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((-2324216883438907776 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((1162108441719453888 : Rat) / 29943480525392195) [(3, 2), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0065
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0066 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0066 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0066
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0067 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0067 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(2, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 2), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0067
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def rs_R010_ueqv_R010YNN_coefficient_29_0068 : Poly :=
[
  term (1 : Rat) [(16, 1)]
]

/-- Partial product 68 for generator 29. -/
def rs_R010_ueqv_R010YNN_partial_29_0068 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem rs_R010_ueqv_R010YNN_partial_29_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_29_0068
        rs_R010_ueqv_R010YNN_generator_29_0000_0068 =
      rs_R010_ueqv_R010YNN_partial_29_0068 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_29_0000_0068 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_29_0000,
  rs_R010_ueqv_R010YNN_partial_29_0001,
  rs_R010_ueqv_R010YNN_partial_29_0002,
  rs_R010_ueqv_R010YNN_partial_29_0003,
  rs_R010_ueqv_R010YNN_partial_29_0004,
  rs_R010_ueqv_R010YNN_partial_29_0005,
  rs_R010_ueqv_R010YNN_partial_29_0006,
  rs_R010_ueqv_R010YNN_partial_29_0007,
  rs_R010_ueqv_R010YNN_partial_29_0008,
  rs_R010_ueqv_R010YNN_partial_29_0009,
  rs_R010_ueqv_R010YNN_partial_29_0010,
  rs_R010_ueqv_R010YNN_partial_29_0011,
  rs_R010_ueqv_R010YNN_partial_29_0012,
  rs_R010_ueqv_R010YNN_partial_29_0013,
  rs_R010_ueqv_R010YNN_partial_29_0014,
  rs_R010_ueqv_R010YNN_partial_29_0015,
  rs_R010_ueqv_R010YNN_partial_29_0016,
  rs_R010_ueqv_R010YNN_partial_29_0017,
  rs_R010_ueqv_R010YNN_partial_29_0018,
  rs_R010_ueqv_R010YNN_partial_29_0019,
  rs_R010_ueqv_R010YNN_partial_29_0020,
  rs_R010_ueqv_R010YNN_partial_29_0021,
  rs_R010_ueqv_R010YNN_partial_29_0022,
  rs_R010_ueqv_R010YNN_partial_29_0023,
  rs_R010_ueqv_R010YNN_partial_29_0024,
  rs_R010_ueqv_R010YNN_partial_29_0025,
  rs_R010_ueqv_R010YNN_partial_29_0026,
  rs_R010_ueqv_R010YNN_partial_29_0027,
  rs_R010_ueqv_R010YNN_partial_29_0028,
  rs_R010_ueqv_R010YNN_partial_29_0029,
  rs_R010_ueqv_R010YNN_partial_29_0030,
  rs_R010_ueqv_R010YNN_partial_29_0031,
  rs_R010_ueqv_R010YNN_partial_29_0032,
  rs_R010_ueqv_R010YNN_partial_29_0033,
  rs_R010_ueqv_R010YNN_partial_29_0034,
  rs_R010_ueqv_R010YNN_partial_29_0035,
  rs_R010_ueqv_R010YNN_partial_29_0036,
  rs_R010_ueqv_R010YNN_partial_29_0037,
  rs_R010_ueqv_R010YNN_partial_29_0038,
  rs_R010_ueqv_R010YNN_partial_29_0039,
  rs_R010_ueqv_R010YNN_partial_29_0040,
  rs_R010_ueqv_R010YNN_partial_29_0041,
  rs_R010_ueqv_R010YNN_partial_29_0042,
  rs_R010_ueqv_R010YNN_partial_29_0043,
  rs_R010_ueqv_R010YNN_partial_29_0044,
  rs_R010_ueqv_R010YNN_partial_29_0045,
  rs_R010_ueqv_R010YNN_partial_29_0046,
  rs_R010_ueqv_R010YNN_partial_29_0047,
  rs_R010_ueqv_R010YNN_partial_29_0048,
  rs_R010_ueqv_R010YNN_partial_29_0049,
  rs_R010_ueqv_R010YNN_partial_29_0050,
  rs_R010_ueqv_R010YNN_partial_29_0051,
  rs_R010_ueqv_R010YNN_partial_29_0052,
  rs_R010_ueqv_R010YNN_partial_29_0053,
  rs_R010_ueqv_R010YNN_partial_29_0054,
  rs_R010_ueqv_R010YNN_partial_29_0055,
  rs_R010_ueqv_R010YNN_partial_29_0056,
  rs_R010_ueqv_R010YNN_partial_29_0057,
  rs_R010_ueqv_R010YNN_partial_29_0058,
  rs_R010_ueqv_R010YNN_partial_29_0059,
  rs_R010_ueqv_R010YNN_partial_29_0060,
  rs_R010_ueqv_R010YNN_partial_29_0061,
  rs_R010_ueqv_R010YNN_partial_29_0062,
  rs_R010_ueqv_R010YNN_partial_29_0063,
  rs_R010_ueqv_R010YNN_partial_29_0064,
  rs_R010_ueqv_R010YNN_partial_29_0065,
  rs_R010_ueqv_R010YNN_partial_29_0066,
  rs_R010_ueqv_R010YNN_partial_29_0067,
  rs_R010_ueqv_R010YNN_partial_29_0068
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_29_0000_0068 : Poly :=
[
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((55838672413150521220 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-329937498856985600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((738795547348418560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((9841861464530432128 : Rat) / 89830441576176585) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(0, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((2002115877403114880 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((33503671367515433104 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2324216883438907776 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((127811296277147016904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27919336206575260610 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2769288839662246720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((164968749428492800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((74470784835102469454 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-369397773674209280 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1840164946212986316496 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((55838672413150521220 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-329937498856985600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-148941569670204938908 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((738795547348418560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3680329892425972632992 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((9841861464530432128 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2002115877403114880 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((33503671367515433104 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((2324216883438907776 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((127811296277147016904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27919336206575260610 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2769288839662246720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((164968749428492800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((74470784835102469454 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-369397773674209280 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1840164946212986316496 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-145100070275572688 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((255622592554294033808 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55838672413150521220 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((329937498856985600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((148941569670204938908 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-738795547348418560 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1432746262413455360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-881346890969679748 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2002115877403114880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2324216883438907776 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((72550035137786344 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-127811296277147016904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((27919336206575260610 : Rat) / 161694794837117853) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((2769288839662246720 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-164968749428492800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-74470784835102469454 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((369397773674209280 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1840164946212986316496 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-716373131206727680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((440673445484839874 : Rat) / 53898264945705951) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((1001057938701557440 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(2, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1162108441719453888 : Rat) / 29943480525392195) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(2, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-145100070275572688 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((255622592554294033808 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-55838672413150521220 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((329937498856985600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((148941569670204938908 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-738795547348418560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3680329892425972632992 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((1432746262413455360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-881346890969679748 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9841861464530432128 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2002115877403114880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33503671367515433104 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2324216883438907776 : Rat) / 29943480525392195) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((72550035137786344 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-127811296277147016904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((27919336206575260610 : Rat) / 161694794837117853) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((2769288839662246720 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-164968749428492800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-74470784835102469454 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((369397773674209280 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1840164946212986316496 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-716373131206727680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((440673445484839874 : Rat) / 53898264945705951) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((4920930732265216064 : Rat) / 89830441576176585) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((1001057938701557440 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1162108441719453888 : Rat) / 29943480525392195) [(3, 2), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 68. -/
theorem rs_R010_ueqv_R010YNN_block_29_0000_0068_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_29_0000_0068
      rs_R010_ueqv_R010YNN_block_29_0000_0068 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
