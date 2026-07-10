/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 17:0-51

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_17_0000_0051 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0000 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def ep_Q2_020_partial_17_0000 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem ep_Q2_020_partial_17_0000_valid :
    mulPoly ep_Q2_020_coefficient_17_0000
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0001 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def ep_Q2_020_partial_17_0001 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem ep_Q2_020_partial_17_0001_valid :
    mulPoly ep_Q2_020_coefficient_17_0001
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0002 : Poly :=
[
  term ((-3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def ep_Q2_020_partial_17_0002 : Poly :=
[
  term ((6926425561042416 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem ep_Q2_020_partial_17_0002_valid :
    mulPoly ep_Q2_020_coefficient_17_0002
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0003 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def ep_Q2_020_partial_17_0003 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem ep_Q2_020_partial_17_0003_valid :
    mulPoly ep_Q2_020_coefficient_17_0003
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0004 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def ep_Q2_020_partial_17_0004 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem ep_Q2_020_partial_17_0004_valid :
    mulPoly ep_Q2_020_coefficient_17_0004
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0005 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def ep_Q2_020_partial_17_0005 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem ep_Q2_020_partial_17_0005_valid :
    mulPoly ep_Q2_020_coefficient_17_0005
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0006 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def ep_Q2_020_partial_17_0006 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem ep_Q2_020_partial_17_0006_valid :
    mulPoly ep_Q2_020_coefficient_17_0006
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0007 : Poly :=
[
  term ((3897510720885000 : Rat) / 28298395017400811) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def ep_Q2_020_partial_17_0007 : Poly :=
[
  term ((-7795021441770000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem ep_Q2_020_partial_17_0007_valid :
    mulPoly ep_Q2_020_coefficient_17_0007
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0008 : Poly :=
[
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def ep_Q2_020_partial_17_0008 : Poly :=
[
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem ep_Q2_020_partial_17_0008_valid :
    mulPoly ep_Q2_020_coefficient_17_0008
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0009 : Poly :=
[
  term ((178857398516688 : Rat) / 1230365000756557) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def ep_Q2_020_partial_17_0009 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem ep_Q2_020_partial_17_0009_valid :
    mulPoly ep_Q2_020_coefficient_17_0009
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0010 : Poly :=
[
  term ((-93831711343985934 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def ep_Q2_020_partial_17_0010 : Poly :=
[
  term ((187663422687971868 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-93831711343985934 : Rat) / 28298395017400811) [(0, 1), (1, 2), (16, 1)],
  term ((-187663422687971868 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-187663422687971868 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((93831711343985934 : Rat) / 28298395017400811) [(0, 1), (10, 2), (16, 1)],
  term ((93831711343985934 : Rat) / 28298395017400811) [(0, 1), (11, 2), (16, 1)],
  term ((187663422687971868 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-93831711343985934 : Rat) / 28298395017400811) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem ep_Q2_020_partial_17_0010_valid :
    mulPoly ep_Q2_020_coefficient_17_0010
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0011 : Poly :=
[
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def ep_Q2_020_partial_17_0011 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem ep_Q2_020_partial_17_0011_valid :
    mulPoly ep_Q2_020_coefficient_17_0011
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0012 : Poly :=
[
  term ((-865803195130302 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def ep_Q2_020_partial_17_0012 : Poly :=
[
  term ((1731606390260604 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-865803195130302 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((865803195130302 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((865803195130302 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((1731606390260604 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-865803195130302 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem ep_Q2_020_partial_17_0012_valid :
    mulPoly ep_Q2_020_coefficient_17_0012
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0013 : Poly :=
[
  term ((59966688167342190 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def ep_Q2_020_partial_17_0013 : Poly :=
[
  term ((-119933376334684380 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((119933376334684380 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-59966688167342190 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-59966688167342190 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((119933376334684380 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem ep_Q2_020_partial_17_0013_valid :
    mulPoly ep_Q2_020_coefficient_17_0013
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0014 : Poly :=
[
  term ((-3130008763652931 : Rat) / 975806724737959) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def ep_Q2_020_partial_17_0014 : Poly :=
[
  term ((6260017527305862 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-3130008763652931 : Rat) / 975806724737959) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-6260017527305862 : Rat) / 975806724737959) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6260017527305862 : Rat) / 975806724737959) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((3130008763652931 : Rat) / 975806724737959) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((3130008763652931 : Rat) / 975806724737959) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((6260017527305862 : Rat) / 975806724737959) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3130008763652931 : Rat) / 975806724737959) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem ep_Q2_020_partial_17_0014_valid :
    mulPoly ep_Q2_020_coefficient_17_0014
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0015 : Poly :=
[
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def ep_Q2_020_partial_17_0015 : Poly :=
[
  term ((12468133626900612 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (11, 3), (16, 1)],
  term ((12468133626900612 : Rat) / 975806724737959) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem ep_Q2_020_partial_17_0015_valid :
    mulPoly ep_Q2_020_coefficient_17_0015
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0016 : Poly :=
[
  term ((-3897510720885000 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def ep_Q2_020_partial_17_0016 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem ep_Q2_020_partial_17_0016_valid :
    mulPoly ep_Q2_020_coefficient_17_0016
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0017 : Poly :=
[
  term ((-45804653517652074 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def ep_Q2_020_partial_17_0017 : Poly :=
[
  term ((91609307035304148 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-45804653517652074 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-91609307035304148 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-91609307035304148 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((45804653517652074 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((45804653517652074 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((91609307035304148 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-45804653517652074 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem ep_Q2_020_partial_17_0017_valid :
    mulPoly ep_Q2_020_coefficient_17_0017
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0018 : Poly :=
[
  term ((-178857398516688 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def ep_Q2_020_partial_17_0018 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem ep_Q2_020_partial_17_0018_valid :
    mulPoly ep_Q2_020_coefficient_17_0018
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0019 : Poly :=
[
  term ((44714349629172 : Rat) / 1230365000756557) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def ep_Q2_020_partial_17_0019 : Poly :=
[
  term ((-89428699258344 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((44714349629172 : Rat) / 1230365000756557) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((89428699258344 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((89428699258344 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44714349629172 : Rat) / 1230365000756557) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-44714349629172 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((44714349629172 : Rat) / 1230365000756557) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem ep_Q2_020_partial_17_0019_valid :
    mulPoly ep_Q2_020_coefficient_17_0019
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0020 : Poly :=
[
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def ep_Q2_020_partial_17_0020 : Poly :=
[
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem ep_Q2_020_partial_17_0020_valid :
    mulPoly ep_Q2_020_coefficient_17_0020
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0021 : Poly :=
[
  term ((-75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def ep_Q2_020_partial_17_0021 : Poly :=
[
  term ((151695815324587776 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((151695815324587776 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem ep_Q2_020_partial_17_0021_valid :
    mulPoly ep_Q2_020_coefficient_17_0021
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0022 : Poly :=
[
  term ((-16161659642432304 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def ep_Q2_020_partial_17_0022 : Poly :=
[
  term ((32323319284864608 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16161659642432304 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((32323319284864608 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16161659642432304 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-32323319284864608 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-32323319284864608 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((16161659642432304 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((16161659642432304 : Rat) / 28298395017400811) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem ep_Q2_020_partial_17_0022_valid :
    mulPoly ep_Q2_020_coefficient_17_0022
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0023 : Poly :=
[
  term ((-49008008613254526 : Rat) / 28298395017400811) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def ep_Q2_020_partial_17_0023 : Poly :=
[
  term ((98016017226509052 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((98016017226509052 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-98016017226509052 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-98016017226509052 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((49008008613254526 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((49008008613254526 : Rat) / 28298395017400811) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem ep_Q2_020_partial_17_0023_valid :
    mulPoly ep_Q2_020_coefficient_17_0023
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0024 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def ep_Q2_020_partial_17_0024 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem ep_Q2_020_partial_17_0024_valid :
    mulPoly ep_Q2_020_coefficient_17_0024
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0025 : Poly :=
[
  term ((5681256215938410 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def ep_Q2_020_partial_17_0025 : Poly :=
[
  term ((-11362512431876820 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((5681256215938410 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-11362512431876820 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((5681256215938410 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((11362512431876820 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((11362512431876820 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5681256215938410 : Rat) / 28298395017400811) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5681256215938410 : Rat) / 28298395017400811) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem ep_Q2_020_partial_17_0025_valid :
    mulPoly ep_Q2_020_coefficient_17_0025
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0026 : Poly :=
[
  term ((21589049082281076 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 17. -/
def ep_Q2_020_partial_17_0026 : Poly :=
[
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem ep_Q2_020_partial_17_0026_valid :
    mulPoly ep_Q2_020_coefficient_17_0026
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0027 : Poly :=
[
  term ((-10794524541140538 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def ep_Q2_020_partial_17_0027 : Poly :=
[
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-10794524541140538 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-10794524541140538 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((10794524541140538 : Rat) / 28298395017400811) [(6, 1), (10, 2), (16, 1)],
  term ((10794524541140538 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem ep_Q2_020_partial_17_0027_valid :
    mulPoly ep_Q2_020_coefficient_17_0027
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0028 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def ep_Q2_020_partial_17_0028 : Poly :=
[
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem ep_Q2_020_partial_17_0028_valid :
    mulPoly ep_Q2_020_coefficient_17_0028
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0029 : Poly :=
[
  term ((-75628329596564844 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 29 for generator 17. -/
def ep_Q2_020_partial_17_0029 : Poly :=
[
  term ((151256659193129688 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-75628329596564844 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((151256659193129688 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-75628329596564844 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-151256659193129688 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((75628329596564844 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((75628329596564844 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-151256659193129688 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem ep_Q2_020_partial_17_0029_valid :
    mulPoly ep_Q2_020_coefficient_17_0029
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0030 : Poly :=
[
  term ((114346394036992338 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 17. -/
def ep_Q2_020_partial_17_0030 : Poly :=
[
  term ((-228692788073984676 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((114346394036992338 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-228692788073984676 : Rat) / 28298395017400811) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((114346394036992338 : Rat) / 28298395017400811) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-114346394036992338 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-114346394036992338 : Rat) / 28298395017400811) [(7, 1), (11, 3), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem ep_Q2_020_partial_17_0030_valid :
    mulPoly ep_Q2_020_coefficient_17_0030
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0031 : Poly :=
[
  term ((26384301451592676 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 17. -/
def ep_Q2_020_partial_17_0031 : Poly :=
[
  term ((-52768602903185352 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((26384301451592676 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-52768602903185352 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((26384301451592676 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((52768602903185352 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26384301451592676 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-26384301451592676 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((52768602903185352 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem ep_Q2_020_partial_17_0031_valid :
    mulPoly ep_Q2_020_coefficient_17_0031
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0032 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 17. -/
def ep_Q2_020_partial_17_0032 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem ep_Q2_020_partial_17_0032_valid :
    mulPoly ep_Q2_020_coefficient_17_0032
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0033 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 33 for generator 17. -/
def ep_Q2_020_partial_17_0033 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem ep_Q2_020_partial_17_0033_valid :
    mulPoly ep_Q2_020_coefficient_17_0033
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0034 : Poly :=
[
  term ((289907621868945011 : Rat) / 28298395017400811) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 17. -/
def ep_Q2_020_partial_17_0034 : Poly :=
[
  term ((-579815243737890022 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-579815243737890022 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem ep_Q2_020_partial_17_0034_valid :
    mulPoly ep_Q2_020_coefficient_17_0034
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0035 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 35 for generator 17. -/
def ep_Q2_020_partial_17_0035 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem ep_Q2_020_partial_17_0035_valid :
    mulPoly ep_Q2_020_coefficient_17_0035
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0036 : Poly :=
[
  term ((75371576317876971 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 17. -/
def ep_Q2_020_partial_17_0036 : Poly :=
[
  term ((-150743152635753942 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem ep_Q2_020_partial_17_0036_valid :
    mulPoly ep_Q2_020_coefficient_17_0036
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0037 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 17. -/
def ep_Q2_020_partial_17_0037 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem ep_Q2_020_partial_17_0037_valid :
    mulPoly ep_Q2_020_coefficient_17_0037
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0038 : Poly :=
[
  term ((-401092848642569541 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 17. -/
def ep_Q2_020_partial_17_0038 : Poly :=
[
  term ((802185697285139082 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-401092848642569541 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((802185697285139082 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-401092848642569541 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-802185697285139082 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-802185697285139082 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((401092848642569541 : Rat) / 28298395017400811) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((401092848642569541 : Rat) / 28298395017400811) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem ep_Q2_020_partial_17_0038_valid :
    mulPoly ep_Q2_020_coefficient_17_0038
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0039 : Poly :=
[
  term ((-4797566462729128 : Rat) / 28298395017400811) [(9, 2), (16, 1)]
]

/-- Partial product 39 for generator 17. -/
def ep_Q2_020_partial_17_0039 : Poly :=
[
  term ((9595132925458256 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(0, 2), (9, 2), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 17. -/
theorem ep_Q2_020_partial_17_0039_valid :
    mulPoly ep_Q2_020_coefficient_17_0039
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0040 : Poly :=
[
  term ((18188383364130000 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 40 for generator 17. -/
def ep_Q2_020_partial_17_0040 : Poly :=
[
  term ((-36376766728260000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((18188383364130000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36376766728260000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((18188383364130000 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36376766728260000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36376766728260000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-18188383364130000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18188383364130000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 17. -/
theorem ep_Q2_020_partial_17_0040_valid :
    mulPoly ep_Q2_020_coefficient_17_0040
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0041 : Poly :=
[
  term ((45165868231018221 : Rat) / 28298395017400811) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 17. -/
def ep_Q2_020_partial_17_0041 : Poly :=
[
  term ((-90331736462036442 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-90331736462036442 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((90331736462036442 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((90331736462036442 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-45165868231018221 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-45165868231018221 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 17. -/
theorem ep_Q2_020_partial_17_0041_valid :
    mulPoly ep_Q2_020_coefficient_17_0041
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0042 : Poly :=
[
  term ((834667859744544 : Rat) / 1230365000756557) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 17. -/
def ep_Q2_020_partial_17_0042 : Poly :=
[
  term ((-1669335719489088 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((834667859744544 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1669335719489088 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((834667859744544 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1669335719489088 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1669335719489088 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-834667859744544 : Rat) / 1230365000756557) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-834667859744544 : Rat) / 1230365000756557) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 17. -/
theorem ep_Q2_020_partial_17_0042_valid :
    mulPoly ep_Q2_020_coefficient_17_0042
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0043 : Poly :=
[
  term ((-6623543751097890 : Rat) / 690204756521971) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 17. -/
def ep_Q2_020_partial_17_0043 : Poly :=
[
  term ((13247087502195780 : Rat) / 690204756521971) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((13247087502195780 : Rat) / 690204756521971) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13247087502195780 : Rat) / 690204756521971) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13247087502195780 : Rat) / 690204756521971) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((6623543751097890 : Rat) / 690204756521971) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6623543751097890 : Rat) / 690204756521971) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 17. -/
theorem ep_Q2_020_partial_17_0043_valid :
    mulPoly ep_Q2_020_coefficient_17_0043
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0044 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 44 for generator 17. -/
def ep_Q2_020_partial_17_0044 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(0, 2), (11, 2), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(1, 2), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(7, 1), (11, 3), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 17. -/
theorem ep_Q2_020_partial_17_0044_valid :
    mulPoly ep_Q2_020_coefficient_17_0044
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0045 : Poly :=
[
  term ((-3997779211156146 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 45 for generator 17. -/
def ep_Q2_020_partial_17_0045 : Poly :=
[
  term ((7995558422312292 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((3997779211156146 : Rat) / 28298395017400811) [(10, 2), (12, 1), (16, 1)],
  term ((3997779211156146 : Rat) / 28298395017400811) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 17. -/
theorem ep_Q2_020_partial_17_0045_valid :
    mulPoly ep_Q2_020_coefficient_17_0045
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0046 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 17. -/
def ep_Q2_020_partial_17_0046 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 17. -/
theorem ep_Q2_020_partial_17_0046_valid :
    mulPoly ep_Q2_020_coefficient_17_0046
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0047 : Poly :=
[
  term ((20853914813192346 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 17. -/
def ep_Q2_020_partial_17_0047 : Poly :=
[
  term ((-41707829626384692 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((20853914813192346 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41707829626384692 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((20853914813192346 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((41707829626384692 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((41707829626384692 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20853914813192346 : Rat) / 28298395017400811) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20853914813192346 : Rat) / 28298395017400811) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 17. -/
theorem ep_Q2_020_partial_17_0047_valid :
    mulPoly ep_Q2_020_coefficient_17_0047
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0048 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 17. -/
def ep_Q2_020_partial_17_0048 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 17. -/
theorem ep_Q2_020_partial_17_0048_valid :
    mulPoly ep_Q2_020_coefficient_17_0048
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0049 : Poly :=
[
  term ((5178725771038089 : Rat) / 1230365000756557) [(14, 1), (16, 1)]
]

/-- Partial product 49 for generator 17. -/
def ep_Q2_020_partial_17_0049 : Poly :=
[
  term ((-10357451542076178 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((5178725771038089 : Rat) / 1230365000756557) [(0, 2), (14, 1), (16, 1)],
  term ((-10357451542076178 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((5178725771038089 : Rat) / 1230365000756557) [(1, 2), (14, 1), (16, 1)],
  term ((10357451542076178 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((10357451542076178 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5178725771038089 : Rat) / 1230365000756557) [(10, 2), (14, 1), (16, 1)],
  term ((-5178725771038089 : Rat) / 1230365000756557) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 17. -/
theorem ep_Q2_020_partial_17_0049_valid :
    mulPoly ep_Q2_020_coefficient_17_0049
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0050 : Poly :=
[
  term ((236248536129815484 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 50 for generator 17. -/
def ep_Q2_020_partial_17_0050 : Poly :=
[
  term ((-472497072259630968 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((236248536129815484 : Rat) / 28298395017400811) [(0, 2), (15, 2), (16, 1)],
  term ((-472497072259630968 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((236248536129815484 : Rat) / 28298395017400811) [(1, 2), (15, 2), (16, 1)],
  term ((472497072259630968 : Rat) / 28298395017400811) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((472497072259630968 : Rat) / 28298395017400811) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-236248536129815484 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)],
  term ((-236248536129815484 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 17. -/
theorem ep_Q2_020_partial_17_0050_valid :
    mulPoly ep_Q2_020_coefficient_17_0050
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 17. -/
def ep_Q2_020_coefficient_17_0051 : Poly :=
[
  term ((957191082295341 : Rat) / 113193580069603244) [(16, 1)]
]

/-- Partial product 51 for generator 17. -/
def ep_Q2_020_partial_17_0051 : Poly :=
[
  term ((-957191082295341 : Rat) / 56596790034801622) [(0, 1), (6, 1), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(0, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 56596790034801622) [(1, 1), (7, 1), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(1, 2), (16, 1)],
  term ((957191082295341 : Rat) / 56596790034801622) [(6, 1), (10, 1), (16, 1)],
  term ((957191082295341 : Rat) / 56596790034801622) [(7, 1), (11, 1), (16, 1)],
  term ((-957191082295341 : Rat) / 113193580069603244) [(10, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 113193580069603244) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 17. -/
theorem ep_Q2_020_partial_17_0051_valid :
    mulPoly ep_Q2_020_coefficient_17_0051
        ep_Q2_020_generator_17_0000_0051 =
      ep_Q2_020_partial_17_0051 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_17_0000_0051 : List Poly :=
[
  ep_Q2_020_partial_17_0000,
  ep_Q2_020_partial_17_0001,
  ep_Q2_020_partial_17_0002,
  ep_Q2_020_partial_17_0003,
  ep_Q2_020_partial_17_0004,
  ep_Q2_020_partial_17_0005,
  ep_Q2_020_partial_17_0006,
  ep_Q2_020_partial_17_0007,
  ep_Q2_020_partial_17_0008,
  ep_Q2_020_partial_17_0009,
  ep_Q2_020_partial_17_0010,
  ep_Q2_020_partial_17_0011,
  ep_Q2_020_partial_17_0012,
  ep_Q2_020_partial_17_0013,
  ep_Q2_020_partial_17_0014,
  ep_Q2_020_partial_17_0015,
  ep_Q2_020_partial_17_0016,
  ep_Q2_020_partial_17_0017,
  ep_Q2_020_partial_17_0018,
  ep_Q2_020_partial_17_0019,
  ep_Q2_020_partial_17_0020,
  ep_Q2_020_partial_17_0021,
  ep_Q2_020_partial_17_0022,
  ep_Q2_020_partial_17_0023,
  ep_Q2_020_partial_17_0024,
  ep_Q2_020_partial_17_0025,
  ep_Q2_020_partial_17_0026,
  ep_Q2_020_partial_17_0027,
  ep_Q2_020_partial_17_0028,
  ep_Q2_020_partial_17_0029,
  ep_Q2_020_partial_17_0030,
  ep_Q2_020_partial_17_0031,
  ep_Q2_020_partial_17_0032,
  ep_Q2_020_partial_17_0033,
  ep_Q2_020_partial_17_0034,
  ep_Q2_020_partial_17_0035,
  ep_Q2_020_partial_17_0036,
  ep_Q2_020_partial_17_0037,
  ep_Q2_020_partial_17_0038,
  ep_Q2_020_partial_17_0039,
  ep_Q2_020_partial_17_0040,
  ep_Q2_020_partial_17_0041,
  ep_Q2_020_partial_17_0042,
  ep_Q2_020_partial_17_0043,
  ep_Q2_020_partial_17_0044,
  ep_Q2_020_partial_17_0045,
  ep_Q2_020_partial_17_0046,
  ep_Q2_020_partial_17_0047,
  ep_Q2_020_partial_17_0048,
  ep_Q2_020_partial_17_0049,
  ep_Q2_020_partial_17_0050,
  ep_Q2_020_partial_17_0051
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_17_0000_0051 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((1731606390260604 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((6260017527305862 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((12468133626900612 : Rat) / 975806724737959) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((91609307035304148 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15623949609241362 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((187663422687971868 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-93831711343985934 : Rat) / 28298395017400811) [(0, 1), (1, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((151695815324587776 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((32323319284864608 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((98016017226509052 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11362512431876820 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-11544042601737360 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((151256659193129688 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-228692788073984676 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-52768602903185352 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-579815243737890022 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((802185697285139082 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-187663422687971868 : Rat) / 28298395017400811) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-36376766728260000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-90331736462036442 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1669335719489088 : Rat) / 1230365000756557) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13247087502195780 : Rat) / 690204756521971) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-589410376663348278 : Rat) / 28298395017400811) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41707829626384692 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10357451542076178 : Rat) / 1230365000756557) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-472497072259630968 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 56596790034801622) [(0, 1), (6, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15623949609241362 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-187663422687971868 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((12991702402950000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((596191328388960 : Rat) / 1230365000756557) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((93831711343985934 : Rat) / 28298395017400811) [(0, 1), (10, 2), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7811974804620681 : Rat) / 28298395017400811) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((93831711343985934 : Rat) / 28298395017400811) [(0, 1), (11, 2), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-865803195130302 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-3130008763652931 : Rat) / 975806724737959) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45804653517652074 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((44714349629172 : Rat) / 1230365000756557) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-16161659642432304 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((5681256215938410 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5965099473039714 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((176868898146831330 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-75628329596564844 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((114346394036992338 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((26384301451592676 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-401092848642569541 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(0, 2), (9, 2), (16, 1)],
  term ((18188383364130000 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((834667859744544 : Rat) / 1230365000756557) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(0, 2), (11, 2), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20853914813192346 : Rat) / 28298395017400811) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((5178725771038089 : Rat) / 1230365000756557) [(0, 2), (14, 1), (16, 1)],
  term ((236248536129815484 : Rat) / 28298395017400811) [(0, 2), (15, 2), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(0, 2), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((7811974804620681 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(0, 3), (15, 2), (16, 1)],
  term ((-93831711343985934 : Rat) / 28298395017400811) [(0, 3), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1731606390260604 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((151695815324587776 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((39249744845907024 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((96284410836248448 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11362512431876820 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((865803195130302 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((865803195130302 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((119933376334684380 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-6260017527305862 : Rat) / 975806724737959) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-12468133626900612 : Rat) / 975806724737959) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-91609307035304148 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((89428699258344 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-761355752029760020 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((802185697285139082 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-59966688167342190 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-44171788170030000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-181941043497340590 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2027050516522464 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545187447672968892 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1010952940010808216 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41707829626384692 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10357451542076178 : Rat) / 1230365000756557) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-472497072259630968 : Rat) / 28298395017400811) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 56596790034801622) [(1, 1), (7, 1), (16, 1)],
  term ((287840103203242512 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((151256659193129688 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-4728670075621752 : Rat) / 1230365000756557) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-52768602903185352 : Rat) / 28298395017400811) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 3), (9, 2), (16, 1)],
  term ((3130008763652931 : Rat) / 975806724737959) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((3130008763652931 : Rat) / 975806724737959) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((45804653517652074 : Rat) / 28298395017400811) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-44714349629172 : Rat) / 1230365000756557) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((3897510720885000 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((45804653517652074 : Rat) / 28298395017400811) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-44714349629172 : Rat) / 1230365000756557) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (11, 3), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((1731606390260604 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((2886010650434340 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-75847907662293888 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-16161659642432304 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-49008008613254526 : Rat) / 28298395017400811) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((5681256215938410 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((21589049082281076 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((-10794524541140538 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((105912178695305154 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((475922269217110086 : Rat) / 28298395017400811) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((7795021441770000 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((91609307035304148 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((357714797033376 : Rat) / 1230365000756557) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((24327441368650764 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(1, 2), (7, 2), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-401092848642569541 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4797566462729128 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)],
  term ((18188383364130000 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((834667859744544 : Rat) / 1230365000756557) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(1, 2), (11, 2), (16, 1)],
  term ((-3997779211156146 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20853914813192346 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((5178725771038089 : Rat) / 1230365000756557) [(1, 2), (14, 1), (16, 1)],
  term ((236248536129815484 : Rat) / 28298395017400811) [(1, 2), (15, 2), (16, 1)],
  term ((957191082295341 : Rat) / 113193580069603244) [(1, 2), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 3), (5, 1), (14, 1), (16, 1)],
  term ((-865803195130302 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)],
  term ((59966688167342190 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)],
  term ((-3130008763652931 : Rat) / 975806724737959) [(1, 3), (9, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 3), (11, 1), (16, 1)],
  term ((-3897510720885000 : Rat) / 28298395017400811) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-45804653517652074 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)],
  term ((-178857398516688 : Rat) / 1230365000756557) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((44714349629172 : Rat) / 1230365000756557) [(1, 3), (15, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32323319284864608 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-98016017226509052 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11362512431876820 : Rat) / 28298395017400811) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-151695815324587776 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11362512431876820 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32323319284864608 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-98016017226509052 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((75847907662293888 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((16161659642432304 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((49008008613254526 : Rat) / 28298395017400811) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5681256215938410 : Rat) / 28298395017400811) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5681256215938410 : Rat) / 28298395017400811) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((16161659642432304 : Rat) / 28298395017400811) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((49008008613254526 : Rat) / 28298395017400811) [(5, 1), (11, 3), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-151256659193129688 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((52768602903185352 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((579815243737890022 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-802185697285139082 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((36376766728260000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((90331736462036442 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1669335719489088 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13247087502195780 : Rat) / 690204756521971) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41707829626384692 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10357451542076178 : Rat) / 1230365000756557) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((472497072259630968 : Rat) / 28298395017400811) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((957191082295341 : Rat) / 56596790034801622) [(6, 1), (10, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((10794524541140538 : Rat) / 28298395017400811) [(6, 1), (10, 2), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((10794524541140538 : Rat) / 28298395017400811) [(6, 1), (11, 2), (16, 1)],
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-21589049082281076 : Rat) / 28298395017400811) [(6, 2), (10, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((75628329596564844 : Rat) / 28298395017400811) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((150743152635753942 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-802185697285139082 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((655443573334454866 : Rat) / 28298395017400811) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-9595132925458256 : Rat) / 28298395017400811) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-114346394036992338 : Rat) / 28298395017400811) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-26384301451592676 : Rat) / 28298395017400811) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41707829626384692 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10357451542076178 : Rat) / 1230365000756557) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((472497072259630968 : Rat) / 28298395017400811) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((957191082295341 : Rat) / 56596790034801622) [(7, 1), (11, 1), (16, 1)],
  term ((36376766728260000 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((90331736462036442 : Rat) / 28298395017400811) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((1669335719489088 : Rat) / 1230365000756557) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-569514889041619656 : Rat) / 28298395017400811) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((475063982626355940 : Rat) / 28298395017400811) [(7, 1), (11, 3), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-287840103203242512 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-151256659193129688 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((52768602903185352 : Rat) / 28298395017400811) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((228692788073984676 : Rat) / 28298395017400811) [(7, 2), (11, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 1), (11, 2), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(7, 3), (9, 2), (11, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((401092848642569541 : Rat) / 28298395017400811) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-75371576317876971 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((401092848642569541 : Rat) / 28298395017400811) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-289907621868945011 : Rat) / 28298395017400811) [(9, 1), (11, 3), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (10, 2), (16, 1)],
  term ((4797566462729128 : Rat) / 28298395017400811) [(9, 2), (11, 2), (16, 1)],
  term ((-18188383364130000 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45165868231018221 : Rat) / 28298395017400811) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-834667859744544 : Rat) / 1230365000756557) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6623543751097890 : Rat) / 690204756521971) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(10, 2), (11, 2), (16, 1)],
  term ((3997779211156146 : Rat) / 28298395017400811) [(10, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20853914813192346 : Rat) / 28298395017400811) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5178725771038089 : Rat) / 1230365000756557) [(10, 2), (14, 1), (16, 1)],
  term ((-236248536129815484 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 113193580069603244) [(10, 2), (16, 1)],
  term ((3997779211156146 : Rat) / 28298395017400811) [(11, 2), (12, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20853914813192346 : Rat) / 28298395017400811) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5178725771038089 : Rat) / 1230365000756557) [(11, 2), (14, 1), (16, 1)],
  term ((-236248536129815484 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((-957191082295341 : Rat) / 113193580069603244) [(11, 2), (16, 1)],
  term ((-18188383364130000 : Rat) / 28298395017400811) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-45165868231018221 : Rat) / 28298395017400811) [(11, 3), (13, 1), (16, 1)],
  term ((-834667859744544 : Rat) / 1230365000756557) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((6623543751097890 : Rat) / 690204756521971) [(11, 3), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 51. -/
theorem ep_Q2_020_block_17_0000_0051_valid :
    checkProductSumEq ep_Q2_020_partials_17_0000_0051
      ep_Q2_020_block_17_0000_0051 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
