/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 29:0-52

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_29_0000_0052 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0000 : Poly :=
[
  term ((-26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def ep_Q2_020_partial_29_0000 : Poly :=
[
  term ((-53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem ep_Q2_020_partial_29_0000_valid :
    mulPoly ep_Q2_020_coefficient_29_0000
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0001 : Poly :=
[
  term ((156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def ep_Q2_020_partial_29_0001 : Poly :=
[
  term ((312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem ep_Q2_020_partial_29_0001_valid :
    mulPoly ep_Q2_020_coefficient_29_0001
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0002 : Poly :=
[
  term ((-172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def ep_Q2_020_partial_29_0002 : Poly :=
[
  term ((-345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem ep_Q2_020_partial_29_0002_valid :
    mulPoly ep_Q2_020_coefficient_29_0002
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0003 : Poly :=
[
  term ((-161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def ep_Q2_020_partial_29_0003 : Poly :=
[
  term ((-322116119139786918 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((322116119139786918 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((-322116119139786918 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem ep_Q2_020_partial_29_0003_valid :
    mulPoly ep_Q2_020_coefficient_29_0003
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0004 : Poly :=
[
  term ((60989221627632 : Rat) / 690204756521971) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def ep_Q2_020_partial_29_0004 : Poly :=
[
  term ((121978443255264 : Rat) / 690204756521971) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60989221627632 : Rat) / 690204756521971) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((121978443255264 : Rat) / 690204756521971) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60989221627632 : Rat) / 690204756521971) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((60989221627632 : Rat) / 690204756521971) [(0, 1), (14, 1), (16, 1)],
  term ((-121978443255264 : Rat) / 690204756521971) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem ep_Q2_020_partial_29_0004_valid :
    mulPoly ep_Q2_020_coefficient_29_0004
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0005 : Poly :=
[
  term ((1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def ep_Q2_020_partial_29_0005 : Poly :=
[
  term ((1441552034979537765 : Rat) / 113193580069603244) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (12, 2), (16, 1)],
  term ((1441552034979537765 : Rat) / 113193580069603244) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (13, 2), (16, 1)],
  term ((-1441552034979537765 : Rat) / 113193580069603244) [(0, 1), (14, 1), (16, 1)],
  term ((1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem ep_Q2_020_partial_29_0005_valid :
    mulPoly ep_Q2_020_coefficient_29_0005
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0006 : Poly :=
[
  term ((44225898180497088 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def ep_Q2_020_partial_29_0006 : Poly :=
[
  term ((88451796360994176 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((88451796360994176 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-88451796360994176 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((44225898180497088 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem ep_Q2_020_partial_29_0006_valid :
    mulPoly ep_Q2_020_coefficient_29_0006
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0007 : Poly :=
[
  term ((105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def ep_Q2_020_partial_29_0007 : Poly :=
[
  term ((211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem ep_Q2_020_partial_29_0007_valid :
    mulPoly ep_Q2_020_coefficient_29_0007
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0008 : Poly :=
[
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def ep_Q2_020_partial_29_0008 : Poly :=
[
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem ep_Q2_020_partial_29_0008_valid :
    mulPoly ep_Q2_020_coefficient_29_0008
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0009 : Poly :=
[
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def ep_Q2_020_partial_29_0009 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem ep_Q2_020_partial_29_0009_valid :
    mulPoly ep_Q2_020_coefficient_29_0009
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0010 : Poly :=
[
  term ((-3072345992037339 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def ep_Q2_020_partial_29_0010 : Poly :=
[
  term ((-6144691984074678 : Rat) / 975806724737959) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3072345992037339 : Rat) / 975806724737959) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((6144691984074678 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3072345992037339 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)],
  term ((-6144691984074678 : Rat) / 975806724737959) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((3072345992037339 : Rat) / 975806724737959) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem ep_Q2_020_partial_29_0010_valid :
    mulPoly ep_Q2_020_coefficient_29_0010
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0011 : Poly :=
[
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def ep_Q2_020_partial_29_0011 : Poly :=
[
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem ep_Q2_020_partial_29_0011_valid :
    mulPoly ep_Q2_020_coefficient_29_0011
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0012 : Poly :=
[
  term ((77820390186070284 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def ep_Q2_020_partial_29_0012 : Poly :=
[
  term ((155640780372140568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-77820390186070284 : Rat) / 28298395017400811) [(1, 2), (12, 2), (16, 1)],
  term ((155640780372140568 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77820390186070284 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((-155640780372140568 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((77820390186070284 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem ep_Q2_020_partial_29_0012_valid :
    mulPoly ep_Q2_020_coefficient_29_0012
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0013 : Poly :=
[
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def ep_Q2_020_partial_29_0013 : Poly :=
[
  term ((-899950999996041654 : Rat) / 28298395017400811) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem ep_Q2_020_partial_29_0013_valid :
    mulPoly ep_Q2_020_coefficient_29_0013
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0014 : Poly :=
[
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def ep_Q2_020_partial_29_0014 : Poly :=
[
  term ((-899950999996041654 : Rat) / 28298395017400811) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem ep_Q2_020_partial_29_0014_valid :
    mulPoly ep_Q2_020_coefficient_29_0014
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0015 : Poly :=
[
  term ((132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def ep_Q2_020_partial_29_0015 : Poly :=
[
  term ((264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem ep_Q2_020_partial_29_0015_valid :
    mulPoly ep_Q2_020_coefficient_29_0015
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0016 : Poly :=
[
  term ((802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def ep_Q2_020_partial_29_0016 : Poly :=
[
  term ((1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem ep_Q2_020_partial_29_0016_valid :
    mulPoly ep_Q2_020_coefficient_29_0016
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0017 : Poly :=
[
  term ((-175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def ep_Q2_020_partial_29_0017 : Poly :=
[
  term ((-350775346816913250 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((350775346816913250 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-350775346816913250 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem ep_Q2_020_partial_29_0017_valid :
    mulPoly ep_Q2_020_coefficient_29_0017
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0018 : Poly :=
[
  term ((-38422975251360366 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def ep_Q2_020_partial_29_0018 : Poly :=
[
  term ((-76845950502720732 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((38422975251360366 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-76845950502720732 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38422975251360366 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-38422975251360366 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((76845950502720732 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem ep_Q2_020_partial_29_0018_valid :
    mulPoly ep_Q2_020_coefficient_29_0018
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0019 : Poly :=
[
  term ((40249490117377233 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def ep_Q2_020_partial_29_0019 : Poly :=
[
  term ((80498980234754466 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-40249490117377233 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((80498980234754466 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40249490117377233 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((-80498980234754466 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((40249490117377233 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem ep_Q2_020_partial_29_0019_valid :
    mulPoly ep_Q2_020_coefficient_29_0019
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0020 : Poly :=
[
  term ((-266603710505549712 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def ep_Q2_020_partial_29_0020 : Poly :=
[
  term ((-533207421011099424 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((266603710505549712 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)],
  term ((-533207421011099424 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((266603710505549712 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((533207421011099424 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((-266603710505549712 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem ep_Q2_020_partial_29_0020_valid :
    mulPoly ep_Q2_020_coefficient_29_0020
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0021 : Poly :=
[
  term ((179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def ep_Q2_020_partial_29_0021 : Poly :=
[
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem ep_Q2_020_partial_29_0021_valid :
    mulPoly ep_Q2_020_coefficient_29_0021
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0022 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def ep_Q2_020_partial_29_0022 : Poly :=
[
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem ep_Q2_020_partial_29_0022_valid :
    mulPoly ep_Q2_020_coefficient_29_0022
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0023 : Poly :=
[
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def ep_Q2_020_partial_29_0023 : Poly :=
[
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem ep_Q2_020_partial_29_0023_valid :
    mulPoly ep_Q2_020_coefficient_29_0023
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0024 : Poly :=
[
  term ((-196779490252144755 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def ep_Q2_020_partial_29_0024 : Poly :=
[
  term ((-393558980504289510 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((196779490252144755 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((393558980504289510 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-196779490252144755 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((-393558980504289510 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((196779490252144755 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem ep_Q2_020_partial_29_0024_valid :
    mulPoly ep_Q2_020_coefficient_29_0024
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0025 : Poly :=
[
  term ((-93658205666230794 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def ep_Q2_020_partial_29_0025 : Poly :=
[
  term ((-187316411332461588 : Rat) / 28298395017400811) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((93658205666230794 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-187316411332461588 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((93658205666230794 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((187316411332461588 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93658205666230794 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem ep_Q2_020_partial_29_0025_valid :
    mulPoly ep_Q2_020_coefficient_29_0025
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0026 : Poly :=
[
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 26 for generator 29. -/
def ep_Q2_020_partial_29_0026 : Poly :=
[
  term ((-218091607544154948 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem ep_Q2_020_partial_29_0026_valid :
    mulPoly ep_Q2_020_coefficient_29_0026
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0027 : Poly :=
[
  term ((-883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def ep_Q2_020_partial_29_0027 : Poly :=
[
  term ((-883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem ep_Q2_020_partial_29_0027_valid :
    mulPoly ep_Q2_020_coefficient_29_0027
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0028 : Poly :=
[
  term ((921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 29. -/
def ep_Q2_020_partial_29_0028 : Poly :=
[
  term ((921980077189316301 : Rat) / 56596790034801622) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-921980077189316301 : Rat) / 56596790034801622) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)],
  term ((921980077189316301 : Rat) / 56596790034801622) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem ep_Q2_020_partial_29_0028_valid :
    mulPoly ep_Q2_020_coefficient_29_0028
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0029 : Poly :=
[
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def ep_Q2_020_partial_29_0029 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem ep_Q2_020_partial_29_0029_valid :
    mulPoly ep_Q2_020_coefficient_29_0029
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0030 : Poly :=
[
  term ((-37251560406902601 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def ep_Q2_020_partial_29_0030 : Poly :=
[
  term ((-74503120813805202 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((37251560406902601 : Rat) / 28298395017400811) [(6, 1), (12, 2), (16, 1)],
  term ((-74503120813805202 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((37251560406902601 : Rat) / 28298395017400811) [(6, 1), (13, 2), (16, 1)],
  term ((74503120813805202 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((-37251560406902601 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem ep_Q2_020_partial_29_0030_valid :
    mulPoly ep_Q2_020_coefficient_29_0030
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0031 : Poly :=
[
  term ((-206427230370125361 : Rat) / 56596790034801622) [(6, 2), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def ep_Q2_020_partial_29_0031 : Poly :=
[
  term ((-206427230370125361 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((206427230370125361 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((-206427230370125361 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((206427230370125361 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((206427230370125361 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((-206427230370125361 : Rat) / 56596790034801622) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem ep_Q2_020_partial_29_0031_valid :
    mulPoly ep_Q2_020_coefficient_29_0031
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0032 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def ep_Q2_020_partial_29_0032 : Poly :=
[
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem ep_Q2_020_partial_29_0032_valid :
    mulPoly ep_Q2_020_coefficient_29_0032
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0033 : Poly :=
[
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 29. -/
def ep_Q2_020_partial_29_0033 : Poly :=
[
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem ep_Q2_020_partial_29_0033_valid :
    mulPoly ep_Q2_020_coefficient_29_0033
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0034 : Poly :=
[
  term ((240990298788588429 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def ep_Q2_020_partial_29_0034 : Poly :=
[
  term ((240990298788588429 : Rat) / 56596790034801622) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 113193580069603244) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 56596790034801622) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((240990298788588429 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)],
  term ((240990298788588429 : Rat) / 56596790034801622) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 113193580069603244) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem ep_Q2_020_partial_29_0034_valid :
    mulPoly ep_Q2_020_coefficient_29_0034
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0035 : Poly :=
[
  term ((-278387256170935989 : Rat) / 56596790034801622) [(7, 2), (16, 1)]
]

/-- Partial product 35 for generator 29. -/
def ep_Q2_020_partial_29_0035 : Poly :=
[
  term ((-278387256170935989 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((278387256170935989 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((-278387256170935989 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((278387256170935989 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)],
  term ((278387256170935989 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((-278387256170935989 : Rat) / 56596790034801622) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem ep_Q2_020_partial_29_0035_valid :
    mulPoly ep_Q2_020_coefficient_29_0035
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0036 : Poly :=
[
  term ((-183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 36 for generator 29. -/
def ep_Q2_020_partial_29_0036 : Poly :=
[
  term ((-367949803462303650 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((367949803462303650 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((-367949803462303650 : Rat) / 28298395017400811) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem ep_Q2_020_partial_29_0036_valid :
    mulPoly ep_Q2_020_coefficient_29_0036
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0037 : Poly :=
[
  term ((1319326813645519833 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 37 for generator 29. -/
def ep_Q2_020_partial_29_0037 : Poly :=
[
  term ((1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1319326813645519833 : Rat) / 56596790034801622) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1319326813645519833 : Rat) / 56596790034801622) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1319326813645519833 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)],
  term ((-1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem ep_Q2_020_partial_29_0037_valid :
    mulPoly ep_Q2_020_coefficient_29_0037
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0038 : Poly :=
[
  term ((-682556264339766447 : Rat) / 56596790034801622) [(8, 1), (16, 1)]
]

/-- Partial product 38 for generator 29. -/
def ep_Q2_020_partial_29_0038 : Poly :=
[
  term ((-682556264339766447 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((682556264339766447 : Rat) / 56596790034801622) [(8, 1), (12, 2), (16, 1)],
  term ((-682556264339766447 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((682556264339766447 : Rat) / 56596790034801622) [(8, 1), (13, 2), (16, 1)],
  term ((682556264339766447 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)],
  term ((-682556264339766447 : Rat) / 56596790034801622) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem ep_Q2_020_partial_29_0038_valid :
    mulPoly ep_Q2_020_coefficient_29_0038
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0039 : Poly :=
[
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

/-- Partial product 39 for generator 29. -/
def ep_Q2_020_partial_29_0039 : Poly :=
[
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 2), (12, 2), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem ep_Q2_020_partial_29_0039_valid :
    mulPoly ep_Q2_020_coefficient_29_0039
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0040 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 29. -/
def ep_Q2_020_partial_29_0040 : Poly :=
[
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (13, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem ep_Q2_020_partial_29_0040_valid :
    mulPoly ep_Q2_020_coefficient_29_0040
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0041 : Poly :=
[
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 29. -/
def ep_Q2_020_partial_29_0041 : Poly :=
[
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem ep_Q2_020_partial_29_0041_valid :
    mulPoly ep_Q2_020_coefficient_29_0041
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0042 : Poly :=
[
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 29. -/
def ep_Q2_020_partial_29_0042 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem ep_Q2_020_partial_29_0042_valid :
    mulPoly ep_Q2_020_coefficient_29_0042
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0043 : Poly :=
[
  term ((313948899703506738 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 29. -/
def ep_Q2_020_partial_29_0043 : Poly :=
[
  term ((627897799407013476 : Rat) / 28298395017400811) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-313948899703506738 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((627897799407013476 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-313948899703506738 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-627897799407013476 : Rat) / 28298395017400811) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((313948899703506738 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem ep_Q2_020_partial_29_0043_valid :
    mulPoly ep_Q2_020_coefficient_29_0043
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0044 : Poly :=
[
  term ((-665666983451206221 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 44 for generator 29. -/
def ep_Q2_020_partial_29_0044 : Poly :=
[
  term ((-665666983451206221 : Rat) / 56596790034801622) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((665666983451206221 : Rat) / 113193580069603244) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-665666983451206221 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)],
  term ((665666983451206221 : Rat) / 56596790034801622) [(12, 1), (14, 2), (16, 1)],
  term ((-665666983451206221 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((665666983451206221 : Rat) / 113193580069603244) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem ep_Q2_020_partial_29_0044_valid :
    mulPoly ep_Q2_020_coefficient_29_0044
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0045 : Poly :=
[
  term ((322152267219448755 : Rat) / 56596790034801622) [(12, 1), (16, 1)]
]

/-- Partial product 45 for generator 29. -/
def ep_Q2_020_partial_29_0045 : Poly :=
[
  term ((322152267219448755 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-322152267219448755 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)],
  term ((-322152267219448755 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((322152267219448755 : Rat) / 56596790034801622) [(12, 1), (16, 1)],
  term ((322152267219448755 : Rat) / 28298395017400811) [(12, 2), (14, 1), (16, 1)],
  term ((-322152267219448755 : Rat) / 56596790034801622) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem ep_Q2_020_partial_29_0045_valid :
    mulPoly ep_Q2_020_coefficient_29_0045
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0046 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 46 for generator 29. -/
def ep_Q2_020_partial_29_0046 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 2), (14, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(12, 3), (14, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem ep_Q2_020_partial_29_0046_valid :
    mulPoly ep_Q2_020_coefficient_29_0046
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0047 : Poly :=
[
  term ((503320980829206651 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 29. -/
def ep_Q2_020_partial_29_0047 : Poly :=
[
  term ((503320980829206651 : Rat) / 56596790034801622) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-503320980829206651 : Rat) / 113193580069603244) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-503320980829206651 : Rat) / 56596790034801622) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((503320980829206651 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)],
  term ((503320980829206651 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((-503320980829206651 : Rat) / 113193580069603244) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem ep_Q2_020_partial_29_0047_valid :
    mulPoly ep_Q2_020_coefficient_29_0047
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0048 : Poly :=
[
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 48 for generator 29. -/
def ep_Q2_020_partial_29_0048 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(13, 2), (14, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(13, 3), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem ep_Q2_020_partial_29_0048_valid :
    mulPoly ep_Q2_020_coefficient_29_0048
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0049 : Poly :=
[
  term ((-102901114469069655 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

/-- Partial product 49 for generator 29. -/
def ep_Q2_020_partial_29_0049 : Poly :=
[
  term ((-102901114469069655 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)],
  term ((102901114469069655 : Rat) / 226387160139206488) [(12, 2), (14, 1), (16, 1)],
  term ((-102901114469069655 : Rat) / 113193580069603244) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((102901114469069655 : Rat) / 226387160139206488) [(13, 2), (14, 1), (16, 1)],
  term ((-102901114469069655 : Rat) / 226387160139206488) [(14, 1), (16, 1)],
  term ((102901114469069655 : Rat) / 113193580069603244) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem ep_Q2_020_partial_29_0049_valid :
    mulPoly ep_Q2_020_coefficient_29_0049
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0050 : Poly :=
[
  term ((523394578419353877 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 50 for generator 29. -/
def ep_Q2_020_partial_29_0050 : Poly :=
[
  term ((523394578419353877 : Rat) / 28298395017400811) [(12, 1), (14, 3), (16, 1)],
  term ((-523394578419353877 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((523394578419353877 : Rat) / 28298395017400811) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-523394578419353877 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((523394578419353877 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((-523394578419353877 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem ep_Q2_020_partial_29_0050_valid :
    mulPoly ep_Q2_020_coefficient_29_0050
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0051 : Poly :=
[
  term ((401901382069893501 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 51 for generator 29. -/
def ep_Q2_020_partial_29_0051 : Poly :=
[
  term ((401901382069893501 : Rat) / 28298395017400811) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-401901382069893501 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((401901382069893501 : Rat) / 28298395017400811) [(13, 1), (15, 3), (16, 1)],
  term ((-401901382069893501 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((-401901382069893501 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((401901382069893501 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem ep_Q2_020_partial_29_0051_valid :
    mulPoly ep_Q2_020_coefficient_29_0051
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def ep_Q2_020_coefficient_29_0052 : Poly :=
[
  term ((-187861998174619221 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 52 for generator 29. -/
def ep_Q2_020_partial_29_0052 : Poly :=
[
  term ((-187861998174619221 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)],
  term ((187861998174619221 : Rat) / 226387160139206488) [(12, 2), (16, 1)],
  term ((-187861998174619221 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)],
  term ((187861998174619221 : Rat) / 226387160139206488) [(13, 2), (16, 1)],
  term ((187861998174619221 : Rat) / 113193580069603244) [(14, 1), (16, 1)],
  term ((-187861998174619221 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem ep_Q2_020_partial_29_0052_valid :
    mulPoly ep_Q2_020_coefficient_29_0052
        ep_Q2_020_generator_29_0000_0052 =
      ep_Q2_020_partial_29_0052 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_29_0000_0052 : List Poly :=
[
  ep_Q2_020_partial_29_0000,
  ep_Q2_020_partial_29_0001,
  ep_Q2_020_partial_29_0002,
  ep_Q2_020_partial_29_0003,
  ep_Q2_020_partial_29_0004,
  ep_Q2_020_partial_29_0005,
  ep_Q2_020_partial_29_0006,
  ep_Q2_020_partial_29_0007,
  ep_Q2_020_partial_29_0008,
  ep_Q2_020_partial_29_0009,
  ep_Q2_020_partial_29_0010,
  ep_Q2_020_partial_29_0011,
  ep_Q2_020_partial_29_0012,
  ep_Q2_020_partial_29_0013,
  ep_Q2_020_partial_29_0014,
  ep_Q2_020_partial_29_0015,
  ep_Q2_020_partial_29_0016,
  ep_Q2_020_partial_29_0017,
  ep_Q2_020_partial_29_0018,
  ep_Q2_020_partial_29_0019,
  ep_Q2_020_partial_29_0020,
  ep_Q2_020_partial_29_0021,
  ep_Q2_020_partial_29_0022,
  ep_Q2_020_partial_29_0023,
  ep_Q2_020_partial_29_0024,
  ep_Q2_020_partial_29_0025,
  ep_Q2_020_partial_29_0026,
  ep_Q2_020_partial_29_0027,
  ep_Q2_020_partial_29_0028,
  ep_Q2_020_partial_29_0029,
  ep_Q2_020_partial_29_0030,
  ep_Q2_020_partial_29_0031,
  ep_Q2_020_partial_29_0032,
  ep_Q2_020_partial_29_0033,
  ep_Q2_020_partial_29_0034,
  ep_Q2_020_partial_29_0035,
  ep_Q2_020_partial_29_0036,
  ep_Q2_020_partial_29_0037,
  ep_Q2_020_partial_29_0038,
  ep_Q2_020_partial_29_0039,
  ep_Q2_020_partial_29_0040,
  ep_Q2_020_partial_29_0041,
  ep_Q2_020_partial_29_0042,
  ep_Q2_020_partial_29_0043,
  ep_Q2_020_partial_29_0044,
  ep_Q2_020_partial_29_0045,
  ep_Q2_020_partial_29_0046,
  ep_Q2_020_partial_29_0047,
  ep_Q2_020_partial_29_0048,
  ep_Q2_020_partial_29_0049,
  ep_Q2_020_partial_29_0050,
  ep_Q2_020_partial_29_0051,
  ep_Q2_020_partial_29_0052
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_29_0000_0052 : Poly :=
[
  term ((-53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((53029406194124232 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-26514703097062116 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-312386249546972502 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((156193124773486251 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)],
  term ((-345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((345939272028978192 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-172969636014489096 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)],
  term ((-322116119139786918 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((2730016511538685437 : Rat) / 113193580069603244) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((121978443255264 : Rat) / 690204756521971) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((-324616677226519830 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (12, 2), (16, 1)],
  term ((161058059569893459 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((121978443255264 : Rat) / 690204756521971) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1441552034979537765 : Rat) / 113193580069603244) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60989221627632 : Rat) / 690204756521971) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (13, 2), (16, 1)],
  term ((-49363786297676073 : Rat) / 3903226898951836) [(0, 1), (14, 1), (16, 1)],
  term ((-121978443255264 : Rat) / 690204756521971) [(0, 1), (14, 2), (16, 1)],
  term ((1441552034979537765 : Rat) / 226387160139206488) [(0, 1), (16, 1)],
  term ((88451796360994176 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((88451796360994176 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44225898180497088 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-88451796360994176 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((44225898180497088 : Rat) / 28298395017400811) [(0, 2), (16, 1)],
  term ((211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-211633882689534522 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((105816941344767261 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)],
  term ((-6144691984074678 : Rat) / 975806724737959) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3072345992037339 : Rat) / 975806724737959) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((6144691984074678 : Rat) / 975806724737959) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3072345992037339 : Rat) / 975806724737959) [(1, 1), (13, 1), (16, 1)],
  term ((-9036901382350242 : Rat) / 1230365000756557) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((3072345992037339 : Rat) / 975806724737959) [(1, 1), (13, 3), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)],
  term ((155640780372140568 : Rat) / 28298395017400811) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-77820390186070284 : Rat) / 28298395017400811) [(1, 2), (12, 2), (16, 1)],
  term ((155640780372140568 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77820390186070284 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((-155640780372140568 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((77820390186070284 : Rat) / 28298395017400811) [(1, 2), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(2, 1), (14, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-899950999996041654 : Rat) / 28298395017400811) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 28298395017400811) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((899950999996041654 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 28298395017400811) [(3, 1), (15, 1), (16, 1)],
  term ((264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-264513324450274242 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((132256662225137121 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)],
  term ((1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1605301944992284248 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((802650972496142124 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)],
  term ((-350775346816913250 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((431274327051667716 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76845950502720732 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-312352371565552884 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-40249490117377233 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((175387673408456625 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)],
  term ((-76845950502720732 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80498980234754466 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((38422975251360366 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-40249490117377233 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((-118921955486114832 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)],
  term ((76845950502720732 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((40249490117377233 : Rat) / 28298395017400811) [(4, 1), (16, 1)],
  term ((-533207421011099424 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((266603710505549712 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)],
  term ((-533207421011099424 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((266603710505549712 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((533207421011099424 : Rat) / 28298395017400811) [(4, 2), (14, 1), (16, 1)],
  term ((-266603710505549712 : Rat) / 28298395017400811) [(4, 2), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-359682916036332306 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)],
  term ((-393558980504289510 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187316411332461588 : Rat) / 28298395017400811) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((196779490252144755 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((93658205666230794 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((393558980504289510 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187316411332461588 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-196779490252144755 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((-299900774838058716 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((196779490252144755 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)],
  term ((187316411332461588 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93658205666230794 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 2), (16, 1)],
  term ((-883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((883491610036805121 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-883491610036805121 : Rat) / 56596790034801622) [(6, 1), (8, 1), (16, 1)],
  term ((921980077189316301 : Rat) / 56596790034801622) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1070986318816926705 : Rat) / 56596790034801622) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)],
  term ((47595324775981083 : Rat) / 2460730001513114) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((37251560406902601 : Rat) / 28298395017400811) [(6, 1), (12, 2), (16, 1)],
  term ((-921980077189316301 : Rat) / 113193580069603244) [(6, 1), (12, 3), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74503120813805202 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((37251560406902601 : Rat) / 28298395017400811) [(6, 1), (13, 2), (16, 1)],
  term ((-11853075515319102 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)],
  term ((-37251560406902601 : Rat) / 28298395017400811) [(6, 1), (16, 1)],
  term ((-206427230370125361 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((206427230370125361 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((-206427230370125361 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((206427230370125361 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((206427230370125361 : Rat) / 28298395017400811) [(6, 2), (14, 1), (16, 1)],
  term ((-206427230370125361 : Rat) / 56596790034801622) [(6, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-6986719158334128 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)],
  term ((240990298788588429 : Rat) / 56596790034801622) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 113193580069603244) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 56596790034801622) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((240990298788588429 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)],
  term ((240990298788588429 : Rat) / 56596790034801622) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-240990298788588429 : Rat) / 113193580069603244) [(7, 1), (13, 3), (16, 1)],
  term ((-278387256170935989 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((278387256170935989 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((-278387256170935989 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((278387256170935989 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)],
  term ((278387256170935989 : Rat) / 28298395017400811) [(7, 2), (14, 1), (16, 1)],
  term ((-278387256170935989 : Rat) / 56596790034801622) [(7, 2), (16, 1)],
  term ((-367949803462303650 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-10848498650946993 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)],
  term ((-2055226420570127133 : Rat) / 56596790034801622) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((682556264339766447 : Rat) / 56596790034801622) [(8, 1), (12, 2), (16, 1)],
  term ((183974901731151825 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)],
  term ((1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-682556264339766447 : Rat) / 28298395017400811) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1319326813645519833 : Rat) / 56596790034801622) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((682556264339766447 : Rat) / 56596790034801622) [(8, 1), (13, 2), (16, 1)],
  term ((2684439342325052727 : Rat) / 56596790034801622) [(8, 1), (14, 1), (16, 1)],
  term ((-1319326813645519833 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((-682556264339766447 : Rat) / 56596790034801622) [(8, 1), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 2), (12, 2), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 2), (13, 2), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 2), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 2), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (13, 1), (16, 1)],
  term ((939283817900854320 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (13, 3), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((627897799407013476 : Rat) / 28298395017400811) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-313948899703506738 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((627897799407013476 : Rat) / 28298395017400811) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 1), (16, 1)],
  term ((-23517154404943962 : Rat) / 975806724737959) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(11, 1), (13, 3), (16, 1)],
  term ((-627897799407013476 : Rat) / 28298395017400811) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((313948899703506738 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 28298395017400811) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((322152267219448755 : Rat) / 28298395017400811) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((765870240996911601 : Rat) / 113193580069603244) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-322152267219448755 : Rat) / 56596790034801622) [(12, 1), (13, 2), (16, 1)],
  term ((401901382069893501 : Rat) / 28298395017400811) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1071069025251810231 : Rat) / 56596790034801622) [(12, 1), (14, 1), (16, 1)],
  term ((1228432852433342787 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)],
  term ((523394578419353877 : Rat) / 28298395017400811) [(12, 1), (14, 3), (16, 1)],
  term ((322152267219448755 : Rat) / 56596790034801622) [(12, 1), (16, 1)],
  term ((-403117723283501271 : Rat) / 113193580069603244) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 2), (13, 2), (16, 1)],
  term ((2479712737133248935 : Rat) / 226387160139206488) [(12, 2), (14, 1), (16, 1)],
  term ((-20501061411561381 : Rat) / 975806724737959) [(12, 2), (14, 2), (16, 1)],
  term ((-401901382069893501 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((12524576335666287 : Rat) / 9842920006052456) [(12, 2), (16, 1)],
  term ((765870240996911601 : Rat) / 113193580069603244) [(12, 3), (14, 1), (16, 1)],
  term ((-322152267219448755 : Rat) / 56596790034801622) [(12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 4), (16, 1)],
  term ((-1109543076127482957 : Rat) / 113193580069603244) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((523394578419353877 : Rat) / 28298395017400811) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((157729491327293715 : Rat) / 56596790034801622) [(13, 1), (15, 1), (16, 1)],
  term ((401901382069893501 : Rat) / 28298395017400811) [(13, 1), (15, 3), (16, 1)],
  term ((-97505400622341105 : Rat) / 226387160139206488) [(13, 2), (14, 1), (16, 1)],
  term ((-523394578419353877 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((53774972831025 : Rat) / 30008902457477) [(13, 2), (15, 2), (16, 1)],
  term ((12524576335666287 : Rat) / 9842920006052456) [(13, 2), (16, 1)],
  term ((-403117723283501271 : Rat) / 113193580069603244) [(13, 3), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(13, 4), (16, 1)],
  term ((-401901382069893501 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((272822881880168787 : Rat) / 226387160139206488) [(14, 1), (16, 1)],
  term ((1149690271307777409 : Rat) / 113193580069603244) [(14, 2), (16, 1)],
  term ((-523394578419353877 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((401901382069893501 : Rat) / 56596790034801622) [(15, 2), (16, 1)],
  term ((-187861998174619221 : Rat) / 226387160139206488) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 52. -/
theorem ep_Q2_020_block_29_0000_0052_valid :
    checkProductSumEq ep_Q2_020_partials_29_0000_0052
      ep_Q2_020_block_29_0000_0052 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
