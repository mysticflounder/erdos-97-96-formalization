/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 15:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_15_0000_0099 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0000 : Poly :=
[
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0000 : Poly :=
[
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (16, 1)],
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0000
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0001 : Poly :=
[
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0001 : Poly :=
[
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0001
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0002 : Poly :=
[
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0002 : Poly :=
[
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0002
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0003 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0003 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0003
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0004 : Poly :=
[
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0004 : Poly :=
[
  term ((-4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((-4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0004
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0005 : Poly :=
[
  term ((-922119256306572640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0005 : Poly :=
[
  term ((1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((-922119256306572640 : Rat) / 17966088315235317) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-922119256306572640 : Rat) / 17966088315235317) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((922119256306572640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((922119256306572640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0005
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0006 : Poly :=
[
  term ((-6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0006 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0006
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0007 : Poly :=
[
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0007 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0007
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0008 : Poly :=
[
  term ((285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0008 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0008
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0009 : Poly :=
[
  term ((-540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0009 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 2), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0009
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0010 : Poly :=
[
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0010 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0010
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0011 : Poly :=
[
  term ((-736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0011 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0011
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0012 : Poly :=
[
  term ((-925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0012 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0012
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0013 : Poly :=
[
  term (-1 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0013 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 2), (16, 1)],
  term (-1 : Rat) [(2, 2), (4, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (4, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (14, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(4, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0013
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0014 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0014 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0014
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0015 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0015 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0015
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0016 : Poly :=
[
  term ((-197502913207570024 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0016 : Poly :=
[
  term ((395005826415140048 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((395005826415140048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0016
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0017 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0017 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0017
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0018 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0018 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0018
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0019 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0019 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0019
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0020 : Poly :=
[
  term ((272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0020 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0020
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0021 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0021 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0021
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0022 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0022 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0022
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0023 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0023 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0023
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0024 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0024 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0024
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0025 : Poly :=
[
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 25 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0025 : Poly :=
[
  term ((156666479476886520908 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((156666479476886520908 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0025
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0026 : Poly :=
[
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0026 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0026
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0027 : Poly :=
[
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0027 : Poly :=
[
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0027
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0028 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0028 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0028
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0029 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0029 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0029
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0030 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0030 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0030
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0031 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0031 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0031
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0032 : Poly :=
[
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0032 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0032
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0033 : Poly :=
[
  term ((93059807278436307154 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0033 : Poly :=
[
  term ((-186119614556872614308 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((93059807278436307154 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-186119614556872614308 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((93059807278436307154 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((186119614556872614308 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-93059807278436307154 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-93059807278436307154 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((186119614556872614308 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0033
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0034 : Poly :=
[
  term ((62613299096857600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0034 : Poly :=
[
  term ((-125226598193715200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((125226598193715200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-62613299096857600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-62613299096857600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((125226598193715200 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0034
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0035 : Poly :=
[
  term ((3601397804737080320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0035 : Poly :=
[
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((7202795609474160640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0035
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0036 : Poly :=
[
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0036 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0036
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0037 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0037 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0037
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0038 : Poly :=
[
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 38 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0038 : Poly :=
[
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0038
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0039 : Poly :=
[
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0039 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0039
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0040 : Poly :=
[
  term ((70366179940618240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0040 : Poly :=
[
  term ((-140732359881236480 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0040
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0041 : Poly :=
[
  term ((2603240659710960640 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0041 : Poly :=
[
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((5206481319421921280 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0041
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0042 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0042 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0042
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0043 : Poly :=
[
  term ((26757673303976090662 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0043 : Poly :=
[
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((26757673303976090662 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((26757673303976090662 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0043
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0044 : Poly :=
[
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0044 : Poly :=
[
  term ((5357297021367993224 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0044
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0045 : Poly :=
[
  term ((263626917938296795372 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0045 : Poly :=
[
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((527253835876593590744 : Rat) / 149717402626960975) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0045
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0046 : Poly :=
[
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0046 : Poly :=
[
  term ((26714448232729600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0046
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0047 : Poly :=
[
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 47 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0047 : Poly :=
[
  term ((55399881464987154820 : Rat) / 161694794837117853) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((55399881464987154820 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0047
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0048 : Poly :=
[
  term ((6780026135680000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 48 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0048 : Poly :=
[
  term ((-13560052271360000 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6780026135680000 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13560052271360000 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6780026135680000 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13560052271360000 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6780026135680000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6780026135680000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((13560052271360000 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0048
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0049 : Poly :=
[
  term ((-8476618411654400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0049 : Poly :=
[
  term ((16953236823308800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8476618411654400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((16953236823308800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8476618411654400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16953236823308800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8476618411654400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8476618411654400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16953236823308800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0049
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0050 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0050 : Poly :=
[
  term ((6448371121561600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0050
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0051 : Poly :=
[
  term ((-3120539775988423040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0051 : Poly :=
[
  term ((6241079551976846080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3120539775988423040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6241079551976846080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3120539775988423040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6241079551976846080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3120539775988423040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3120539775988423040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6241079551976846080 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0051
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0052 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 52 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0052 : Poly :=
[
  term ((172980456656537600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0052
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0053 : Poly :=
[
  term ((71756066210796800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 53 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0053 : Poly :=
[
  term ((-143512132421593600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((71756066210796800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-143512132421593600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((71756066210796800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((143512132421593600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-71756066210796800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-71756066210796800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((143512132421593600 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0053
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0054 : Poly :=
[
  term ((-1312932596577541850656 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0054 : Poly :=
[
  term ((2625865193155083701312 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1312932596577541850656 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((2625865193155083701312 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1312932596577541850656 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2625865193155083701312 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((1312932596577541850656 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1312932596577541850656 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((-2625865193155083701312 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0054
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0055 : Poly :=
[
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0055 : Poly :=
[
  term ((2289557278265358080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0055
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0056 : Poly :=
[
  term ((224184782411345473444 : Rat) / 808473974185589265) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0056 : Poly :=
[
  term ((-448369564822690946888 : Rat) / 808473974185589265) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((224184782411345473444 : Rat) / 808473974185589265) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-448369564822690946888 : Rat) / 808473974185589265) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((224184782411345473444 : Rat) / 808473974185589265) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((448369564822690946888 : Rat) / 808473974185589265) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-224184782411345473444 : Rat) / 808473974185589265) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-224184782411345473444 : Rat) / 808473974185589265) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((448369564822690946888 : Rat) / 808473974185589265) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0056
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0057 : Poly :=
[
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0057 : Poly :=
[
  term ((-470929192168422400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0057
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0058 : Poly :=
[
  term ((462271338122746880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0058 : Poly :=
[
  term ((-924542676245493760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-924542676245493760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((924542676245493760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0058
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0059 : Poly :=
[
  term ((823892668000890880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 59 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0059 : Poly :=
[
  term ((-1647785336001781760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((823892668000890880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1647785336001781760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((823892668000890880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1647785336001781760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-823892668000890880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-823892668000890880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((1647785336001781760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0059
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0060 : Poly :=
[
  term ((-385661181380554240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0060 : Poly :=
[
  term ((771322362761108480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-385661181380554240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((771322362761108480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-385661181380554240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-771322362761108480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((385661181380554240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((385661181380554240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-771322362761108480 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0060
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0061 : Poly :=
[
  term ((104760185087595520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 61 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0061 : Poly :=
[
  term ((-209520370175191040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((104760185087595520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-209520370175191040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((104760185087595520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((209520370175191040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-104760185087595520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-104760185087595520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((209520370175191040 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0061
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0062 : Poly :=
[
  term ((-164761449872445440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 62 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0062 : Poly :=
[
  term ((329522899744890880 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-164761449872445440 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((329522899744890880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-164761449872445440 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-329522899744890880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((164761449872445440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((164761449872445440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-329522899744890880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0062
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0063 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0063 : Poly :=
[
  term ((4750053127536640 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0063
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0064 : Poly :=
[
  term ((-1848836710642464844496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0064 : Poly :=
[
  term ((3697673421284929688992 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1848836710642464844496 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((3697673421284929688992 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1848836710642464844496 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3697673421284929688992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1848836710642464844496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((1848836710642464844496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-3697673421284929688992 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0064
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0065 : Poly :=
[
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 65 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0065 : Poly :=
[
  term ((2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 2), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0065
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0066 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0066 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0066
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0067 : Poly :=
[
  term ((-1567132380792258560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 67 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0067 : Poly :=
[
  term ((3134264761584517120 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-1567132380792258560 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((3134264761584517120 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((-1567132380792258560 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-3134264761584517120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 2), (16, 1)],
  term ((1567132380792258560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((1567132380792258560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 3), (16, 1)],
  term ((-3134264761584517120 : Rat) / 53898264945705951) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0067
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0068 : Poly :=
[
  term ((233925793952327680 : Rat) / 5988696105078439) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 68 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0068 : Poly :=
[
  term ((-467851587904655360 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((233925793952327680 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((-467851587904655360 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 3), (16, 1)],
  term ((233925793952327680 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 3), (16, 1)],
  term ((467851587904655360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-233925793952327680 : Rat) / 5988696105078439) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-233925793952327680 : Rat) / 5988696105078439) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((467851587904655360 : Rat) / 5988696105078439) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0068
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0069 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0069 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 2), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0069
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0070 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 70 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0070 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0070
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0071 : Poly :=
[
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0071 : Poly :=
[
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0071
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0072 : Poly :=
[
  term ((18219578671687551034 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 72 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0072 : Poly :=
[
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((36439157343375102068 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0072
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0073 : Poly :=
[
  term ((-151408292637942940643 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 73 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0073 : Poly :=
[
  term ((302816585275885881286 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-151408292637942940643 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((302816585275885881286 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-151408292637942940643 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-302816585275885881286 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((151408292637942940643 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((151408292637942940643 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-302816585275885881286 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0073
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0074 : Poly :=
[
  term ((19542351902768599444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 74 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0074 : Poly :=
[
  term ((-39084703805537198888 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((19542351902768599444 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39084703805537198888 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((19542351902768599444 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((39084703805537198888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19542351902768599444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19542351902768599444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((39084703805537198888 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0074
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0075 : Poly :=
[
  term ((-54664460640878322221 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0075 : Poly :=
[
  term ((109328921281756644442 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-54664460640878322221 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((109328921281756644442 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-54664460640878322221 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-109328921281756644442 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((54664460640878322221 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((54664460640878322221 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-109328921281756644442 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0075
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0076 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0076 : Poly :=
[
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0076
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0077 : Poly :=
[
  term ((-33224920220772856633 : Rat) / 53898264945705951) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0077 : Poly :=
[
  term ((66449840441545713266 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-33224920220772856633 : Rat) / 53898264945705951) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((66449840441545713266 : Rat) / 53898264945705951) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-33224920220772856633 : Rat) / 53898264945705951) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-66449840441545713266 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((33224920220772856633 : Rat) / 53898264945705951) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((33224920220772856633 : Rat) / 53898264945705951) [(5, 1), (15, 3), (16, 1)],
  term ((-66449840441545713266 : Rat) / 53898264945705951) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0077
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0078 : Poly :=
[
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0078 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0078
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0079 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0079 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0079
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0080 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 80 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0080 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0080
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0081 : Poly :=
[
  term ((2042473912223357888 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 81 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0081 : Poly :=
[
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0081
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0082 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 82 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0082 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0082
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0083 : Poly :=
[
  term ((-1532035410359764288 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 83 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0083 : Poly :=
[
  term ((3064070820719528576 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1532035410359764288 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((3064070820719528576 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-1532035410359764288 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3064070820719528576 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1532035410359764288 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((1532035410359764288 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3064070820719528576 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0083
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0084 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0084 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0084
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0085 : Poly :=
[
  term ((9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 85 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0085 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0085
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0086 : Poly :=
[
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0086 : Poly :=
[
  term ((1297181658193910016 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(2, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(3, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0086
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0087 : Poly :=
[
  term ((286430036980512672896 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0087 : Poly :=
[
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0087
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0088 : Poly :=
[
  term ((2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 88 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0088 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0088
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0089 : Poly :=
[
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 89 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0089 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0089
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0090 : Poly :=
[
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0090 : Poly :=
[
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0090
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0091 : Poly :=
[
  term ((3080790363933349568 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 91 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0091 : Poly :=
[
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6161580727866699136 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0091
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0092 : Poly :=
[
  term ((-721972303300594912 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 92 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0092 : Poly :=
[
  term ((1443944606601189824 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-721972303300594912 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1443944606601189824 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-721972303300594912 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1443944606601189824 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((721972303300594912 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((721972303300594912 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1443944606601189824 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0092
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0093 : Poly :=
[
  term ((-4623367203234896512 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 93 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0093 : Poly :=
[
  term ((9246734406469793024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4623367203234896512 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((9246734406469793024 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4623367203234896512 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9246734406469793024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((4623367203234896512 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4623367203234896512 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-9246734406469793024 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0093
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0094 : Poly :=
[
  term ((6706741247243093408 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0094 : Poly :=
[
  term ((-13413482494486186816 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((6706741247243093408 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-13413482494486186816 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((6706741247243093408 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((13413482494486186816 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6706741247243093408 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6706741247243093408 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13413482494486186816 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0094
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0095 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0095 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0095
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0096 : Poly :=
[
  term ((-21965294948446084520 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0096 : Poly :=
[
  term ((43930589896892169040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21965294948446084520 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((43930589896892169040 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-21965294948446084520 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-43930589896892169040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((21965294948446084520 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((21965294948446084520 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-43930589896892169040 : Rat) / 53898264945705951) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0096
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0097 : Poly :=
[
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 97 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0097 : Poly :=
[
  term ((6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0097
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0098 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0098 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(2, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(3, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0098
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YNN_coefficient_15_0099 : Poly :=
[
  term ((-55858091390743304704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 99 for generator 15. -/
def rs_R010_ueqv_R010YNN_partial_15_0099 : Poly :=
[
  term ((111716182781486609408 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-55858091390743304704 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((111716182781486609408 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((-55858091390743304704 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-111716182781486609408 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((55858091390743304704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((55858091390743304704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)],
  term ((-111716182781486609408 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 15. -/
theorem rs_R010_ueqv_R010YNN_partial_15_0099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_15_0099
        rs_R010_ueqv_R010YNN_generator_15_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_15_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_15_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_15_0000,
  rs_R010_ueqv_R010YNN_partial_15_0001,
  rs_R010_ueqv_R010YNN_partial_15_0002,
  rs_R010_ueqv_R010YNN_partial_15_0003,
  rs_R010_ueqv_R010YNN_partial_15_0004,
  rs_R010_ueqv_R010YNN_partial_15_0005,
  rs_R010_ueqv_R010YNN_partial_15_0006,
  rs_R010_ueqv_R010YNN_partial_15_0007,
  rs_R010_ueqv_R010YNN_partial_15_0008,
  rs_R010_ueqv_R010YNN_partial_15_0009,
  rs_R010_ueqv_R010YNN_partial_15_0010,
  rs_R010_ueqv_R010YNN_partial_15_0011,
  rs_R010_ueqv_R010YNN_partial_15_0012,
  rs_R010_ueqv_R010YNN_partial_15_0013,
  rs_R010_ueqv_R010YNN_partial_15_0014,
  rs_R010_ueqv_R010YNN_partial_15_0015,
  rs_R010_ueqv_R010YNN_partial_15_0016,
  rs_R010_ueqv_R010YNN_partial_15_0017,
  rs_R010_ueqv_R010YNN_partial_15_0018,
  rs_R010_ueqv_R010YNN_partial_15_0019,
  rs_R010_ueqv_R010YNN_partial_15_0020,
  rs_R010_ueqv_R010YNN_partial_15_0021,
  rs_R010_ueqv_R010YNN_partial_15_0022,
  rs_R010_ueqv_R010YNN_partial_15_0023,
  rs_R010_ueqv_R010YNN_partial_15_0024,
  rs_R010_ueqv_R010YNN_partial_15_0025,
  rs_R010_ueqv_R010YNN_partial_15_0026,
  rs_R010_ueqv_R010YNN_partial_15_0027,
  rs_R010_ueqv_R010YNN_partial_15_0028,
  rs_R010_ueqv_R010YNN_partial_15_0029,
  rs_R010_ueqv_R010YNN_partial_15_0030,
  rs_R010_ueqv_R010YNN_partial_15_0031,
  rs_R010_ueqv_R010YNN_partial_15_0032,
  rs_R010_ueqv_R010YNN_partial_15_0033,
  rs_R010_ueqv_R010YNN_partial_15_0034,
  rs_R010_ueqv_R010YNN_partial_15_0035,
  rs_R010_ueqv_R010YNN_partial_15_0036,
  rs_R010_ueqv_R010YNN_partial_15_0037,
  rs_R010_ueqv_R010YNN_partial_15_0038,
  rs_R010_ueqv_R010YNN_partial_15_0039,
  rs_R010_ueqv_R010YNN_partial_15_0040,
  rs_R010_ueqv_R010YNN_partial_15_0041,
  rs_R010_ueqv_R010YNN_partial_15_0042,
  rs_R010_ueqv_R010YNN_partial_15_0043,
  rs_R010_ueqv_R010YNN_partial_15_0044,
  rs_R010_ueqv_R010YNN_partial_15_0045,
  rs_R010_ueqv_R010YNN_partial_15_0046,
  rs_R010_ueqv_R010YNN_partial_15_0047,
  rs_R010_ueqv_R010YNN_partial_15_0048,
  rs_R010_ueqv_R010YNN_partial_15_0049,
  rs_R010_ueqv_R010YNN_partial_15_0050,
  rs_R010_ueqv_R010YNN_partial_15_0051,
  rs_R010_ueqv_R010YNN_partial_15_0052,
  rs_R010_ueqv_R010YNN_partial_15_0053,
  rs_R010_ueqv_R010YNN_partial_15_0054,
  rs_R010_ueqv_R010YNN_partial_15_0055,
  rs_R010_ueqv_R010YNN_partial_15_0056,
  rs_R010_ueqv_R010YNN_partial_15_0057,
  rs_R010_ueqv_R010YNN_partial_15_0058,
  rs_R010_ueqv_R010YNN_partial_15_0059,
  rs_R010_ueqv_R010YNN_partial_15_0060,
  rs_R010_ueqv_R010YNN_partial_15_0061,
  rs_R010_ueqv_R010YNN_partial_15_0062,
  rs_R010_ueqv_R010YNN_partial_15_0063,
  rs_R010_ueqv_R010YNN_partial_15_0064,
  rs_R010_ueqv_R010YNN_partial_15_0065,
  rs_R010_ueqv_R010YNN_partial_15_0066,
  rs_R010_ueqv_R010YNN_partial_15_0067,
  rs_R010_ueqv_R010YNN_partial_15_0068,
  rs_R010_ueqv_R010YNN_partial_15_0069,
  rs_R010_ueqv_R010YNN_partial_15_0070,
  rs_R010_ueqv_R010YNN_partial_15_0071,
  rs_R010_ueqv_R010YNN_partial_15_0072,
  rs_R010_ueqv_R010YNN_partial_15_0073,
  rs_R010_ueqv_R010YNN_partial_15_0074,
  rs_R010_ueqv_R010YNN_partial_15_0075,
  rs_R010_ueqv_R010YNN_partial_15_0076,
  rs_R010_ueqv_R010YNN_partial_15_0077,
  rs_R010_ueqv_R010YNN_partial_15_0078,
  rs_R010_ueqv_R010YNN_partial_15_0079,
  rs_R010_ueqv_R010YNN_partial_15_0080,
  rs_R010_ueqv_R010YNN_partial_15_0081,
  rs_R010_ueqv_R010YNN_partial_15_0082,
  rs_R010_ueqv_R010YNN_partial_15_0083,
  rs_R010_ueqv_R010YNN_partial_15_0084,
  rs_R010_ueqv_R010YNN_partial_15_0085,
  rs_R010_ueqv_R010YNN_partial_15_0086,
  rs_R010_ueqv_R010YNN_partial_15_0087,
  rs_R010_ueqv_R010YNN_partial_15_0088,
  rs_R010_ueqv_R010YNN_partial_15_0089,
  rs_R010_ueqv_R010YNN_partial_15_0090,
  rs_R010_ueqv_R010YNN_partial_15_0091,
  rs_R010_ueqv_R010YNN_partial_15_0092,
  rs_R010_ueqv_R010YNN_partial_15_0093,
  rs_R010_ueqv_R010YNN_partial_15_0094,
  rs_R010_ueqv_R010YNN_partial_15_0095,
  rs_R010_ueqv_R010YNN_partial_15_0096,
  rs_R010_ueqv_R010YNN_partial_15_0097,
  rs_R010_ueqv_R010YNN_partial_15_0098,
  rs_R010_ueqv_R010YNN_partial_15_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_15_0000_0099 : Poly :=
[
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((102172962744473600 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-51086481372236800 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((51086481372236800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-102172962744473600 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((-922119256306572640 : Rat) / 17966088315235317) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-922119256306572640 : Rat) / 17966088315235317) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((922119256306572640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-2331693580767353200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((922119256306572640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((4663387161534706400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1844238512613145280 : Rat) / 17966088315235317) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((395005826415140048 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((156666479476886520908 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-186119614556872614308 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55399881464987154820 : Rat) / 161694794837117853) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13560052271360000 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((16953236823308800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6241079551976846080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-143512132421593600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((2625865193155083701312 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-448369564822690946888 : Rat) / 808473974185589265) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-924542676245493760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1647785336001781760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((771322362761108480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-209520370175191040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((329522899744890880 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3697673421284929688992 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((3134264761584517120 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-467851587904655360 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((302816585275885881286 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-39084703805537198888 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((109328921281756644442 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((66449840441545713266 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((3064070820719528576 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1443944606601189824 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((9246734406469793024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13413482494486186816 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((43930589896892169040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((111716182781486609408 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (4, 2), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term (-1 : Rat) [(2, 2), (4, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((93059807278436307154 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((26757673303976090662 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((6780026135680000 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8476618411654400 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3120539775988423040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((71756066210796800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1312932596577541850656 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((224184782411345473444 : Rat) / 808473974185589265) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((823892668000890880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-385661181380554240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((104760185087595520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-164761449872445440 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1848836710642464844496 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1567132380792258560 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((233925793952327680 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-151408292637942940643 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((19542351902768599444 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-54664460640878322221 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33224920220772856633 : Rat) / 53898264945705951) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1532035410359764288 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(2, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(2, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-721972303300594912 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4623367203234896512 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6706741247243093408 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21965294948446084520 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(2, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-55858091390743304704 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((395005826415140048 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((156666479476886520908 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-186119614556872614308 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((55399881464987154820 : Rat) / 161694794837117853) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-13560052271360000 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((16953236823308800 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6241079551976846080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-143512132421593600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((2625865193155083701312 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-448369564822690946888 : Rat) / 808473974185589265) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-924542676245493760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1647785336001781760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((771322362761108480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-209520370175191040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((329522899744890880 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3697673421284929688992 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((3134264761584517120 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((-467851587904655360 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 3), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 4), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((302816585275885881286 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-39084703805537198888 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((109328921281756644442 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((66449840441545713266 : Rat) / 53898264945705951) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)],
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((3064070820719528576 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1443944606601189824 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((9246734406469793024 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13413482494486186816 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((43930589896892169040 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((111716182781486609408 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term (-1 : Rat) [(3, 2), (4, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((93059807278436307154 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((26757673303976090662 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((6780026135680000 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8476618411654400 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3120539775988423040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((71756066210796800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1312932596577541850656 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((224184782411345473444 : Rat) / 808473974185589265) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((823892668000890880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-385661181380554240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((104760185087595520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-164761449872445440 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1848836710642464844496 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1567132380792258560 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((233925793952327680 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-151408292637942940643 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((19542351902768599444 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-54664460640878322221 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33224920220772856633 : Rat) / 53898264945705951) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1532035410359764288 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(3, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(3, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-721972303300594912 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4623367203234896512 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6706741247243093408 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21965294948446084520 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(3, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-55858091390743304704 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((186119614556872614308 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((125226598193715200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(4, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-16953236823308800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13560052271360000 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6241079551976846080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((143512132421593600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-166633573026457600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((448369564822690946888 : Rat) / 808473974185589265) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2155671694934878104392 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-771322362761108480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((454007844422056960 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-329522899744890880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((209520370175191040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-3697673421284929688992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((467851587904655360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-2594218026261585920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 2), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-302816585275885881286 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((14297107921798408024 : Rat) / 89830441576176585) [(4, 1), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-109328921281756644442 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((39084703805537198888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-66449840441545713266 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3064070820719528576 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1443944606601189824 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6897774426442367744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((13413482494486186816 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9246734406469793024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-43930589896892169040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-97830000407424144128 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (14, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 2), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (14, 2), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93059807278436307154 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((-93059807278436307154 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-62613299096857600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-62613299096857600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6780026135680000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8476618411654400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6780026135680000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((8476618411654400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((3120539775988423040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((3120539775988423040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-71756066210796800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((-71756066210796800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1312932596577541850656 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-224184782411345473444 : Rat) / 808473974185589265) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((1312932596577541850656 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((-224184782411345473444 : Rat) / 808473974185589265) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-823892668000890880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((385661181380554240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-823892668000890880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((385661181380554240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-104760185087595520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((164761449872445440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-104760185087595520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((164761449872445440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((1848836710642464844496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((1848836710642464844496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 2), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((1567132380792258560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((-233925793952327680 : Rat) / 5988696105078439) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((1567132380792258560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 3), (16, 1)],
  term ((-233925793952327680 : Rat) / 5988696105078439) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 2), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((151408292637942940643 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((151408292637942940643 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19542351902768599444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((54664460640878322221 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19542351902768599444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((54664460640878322221 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((33224920220772856633 : Rat) / 53898264945705951) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((33224920220772856633 : Rat) / 53898264945705951) [(5, 1), (15, 3), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((380765904135854720 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((-297239603830903040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-19171767719756896192 : Rat) / 269491324728529755) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1532035410359764288 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-481707227905957705288 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7709509245299264384 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((186119614556872614308 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((125226598193715200 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((26904311774205179584 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-273403245569692532096 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((7716173377956784896 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((4770977048297098792696 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((13560052271360000 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16953236823308800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-343026526117212352 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((721972303300594912 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-29039480849982445664 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((143512132421593600 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4623367203234896512 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6706741247243093408 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((4623367203234896512 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-6706741247243093408 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2625865193155083701312 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((21965294948446084520 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((448369564822690946888 : Rat) / 808473974185589265) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2186193074464525160 : Rat) / 5988696105078439) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((1457498736620630720 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((1647785336001781760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-771322362761108480 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((209520370175191040 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-329522899744890880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((55644339000004155904 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((55858091390743304704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)],
  term ((-3697673421284929688992 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-3134264761584517120 : Rat) / 53898264945705951) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((467851587904655360 : Rat) / 5988696105078439) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-302816585275885881286 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((39084703805537198888 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-109328921281756644442 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-66449840441545713266 : Rat) / 53898264945705951) [(5, 2), (15, 2), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064070820719528576 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1443944606601189824 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9246734406469793024 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13413482494486186816 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43930589896892169040 : Rat) / 53898264945705951) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-111716182781486609408 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 99. -/
theorem rs_R010_ueqv_R010YNN_block_15_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_15_0000_0099
      rs_R010_ueqv_R010YNN_block_15_0000_0099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
