/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 14:0-27

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_14_0000_0027 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (12, 1)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0000 : Poly :=
[
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def ep_Q2_020_partial_14_0000 : Poly :=
[
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem ep_Q2_020_partial_14_0000_valid :
    mulPoly ep_Q2_020_coefficient_14_0000
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0001 : Poly :=
[
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def ep_Q2_020_partial_14_0001 : Poly :=
[
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem ep_Q2_020_partial_14_0001_valid :
    mulPoly ep_Q2_020_coefficient_14_0001
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0002 : Poly :=
[
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def ep_Q2_020_partial_14_0002 : Poly :=
[
  term ((-175474335331953288 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-175474335331953288 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem ep_Q2_020_partial_14_0002_valid :
    mulPoly ep_Q2_020_coefficient_14_0002
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0003 : Poly :=
[
  term ((-69747161215773987 : Rat) / 28298395017400811) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def ep_Q2_020_partial_14_0003 : Poly :=
[
  term ((139494322431547974 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-69747161215773987 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((139494322431547974 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-69747161215773987 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((-139494322431547974 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-139494322431547974 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((69747161215773987 : Rat) / 28298395017400811) [(0, 1), (12, 2), (16, 1)],
  term ((69747161215773987 : Rat) / 28298395017400811) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem ep_Q2_020_partial_14_0003_valid :
    mulPoly ep_Q2_020_coefficient_14_0003
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0004 : Poly :=
[
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def ep_Q2_020_partial_14_0004 : Poly :=
[
  term ((-50738995266249528 : Rat) / 28298395017400811) [(2, 1), (4, 2), (6, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem ep_Q2_020_partial_14_0004_valid :
    mulPoly ep_Q2_020_coefficient_14_0004
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0005 : Poly :=
[
  term ((-48512102961394764 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def ep_Q2_020_partial_14_0005 : Poly :=
[
  term ((97024205922789528 : Rat) / 28298395017400811) [(2, 1), (4, 2), (8, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((97024205922789528 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((-97024205922789528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-97024205922789528 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem ep_Q2_020_partial_14_0005_valid :
    mulPoly ep_Q2_020_coefficient_14_0005
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0006 : Poly :=
[
  term ((-109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def ep_Q2_020_partial_14_0006 : Poly :=
[
  term ((218091607544154948 : Rat) / 28298395017400811) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem ep_Q2_020_partial_14_0006_valid :
    mulPoly ep_Q2_020_coefficient_14_0006
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0007 : Poly :=
[
  term ((132188409100347474 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def ep_Q2_020_partial_14_0007 : Poly :=
[
  term ((-264376818200694948 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-264376818200694948 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-132188409100347474 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-132188409100347474 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem ep_Q2_020_partial_14_0007_valid :
    mulPoly ep_Q2_020_coefficient_14_0007
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0008 : Poly :=
[
  term ((-19143929519790480 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def ep_Q2_020_partial_14_0008 : Poly :=
[
  term ((38287859039580960 : Rat) / 28298395017400811) [(2, 1), (4, 2), (16, 1)],
  term ((-19143929519790480 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-19143929519790480 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((19143929519790480 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((19143929519790480 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem ep_Q2_020_partial_14_0008_valid :
    mulPoly ep_Q2_020_coefficient_14_0008
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0009 : Poly :=
[
  term ((109045803772077474 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def ep_Q2_020_partial_14_0009 : Poly :=
[
  term ((-218091607544154948 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem ep_Q2_020_partial_14_0009_valid :
    mulPoly ep_Q2_020_coefficient_14_0009
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0010 : Poly :=
[
  term ((-338972937811076727 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def ep_Q2_020_partial_14_0010 : Poly :=
[
  term ((677945875622153454 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-338972937811076727 : Rat) / 28298395017400811) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((677945875622153454 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-338972937811076727 : Rat) / 28298395017400811) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((-677945875622153454 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-677945875622153454 : Rat) / 28298395017400811) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((338972937811076727 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((338972937811076727 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem ep_Q2_020_partial_14_0010_valid :
    mulPoly ep_Q2_020_coefficient_14_0010
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0011 : Poly :=
[
  term ((36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def ep_Q2_020_partial_14_0011 : Poly :=
[
  term ((-73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem ep_Q2_020_partial_14_0011_valid :
    mulPoly ep_Q2_020_coefficient_14_0011
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0012 : Poly :=
[
  term ((234306667912533039 : Rat) / 56596790034801622) [(6, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def ep_Q2_020_partial_14_0012 : Poly :=
[
  term ((-234306667912533039 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 56596790034801622) [(2, 2), (6, 1), (16, 1)],
  term ((-234306667912533039 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 56596790034801622) [(3, 2), (6, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 28298395017400811) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-234306667912533039 : Rat) / 56596790034801622) [(6, 1), (12, 2), (16, 1)],
  term ((-234306667912533039 : Rat) / 56596790034801622) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem ep_Q2_020_partial_14_0012_valid :
    mulPoly ep_Q2_020_coefficient_14_0012
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0013 : Poly :=
[
  term ((110645878688788680 : Rat) / 28298395017400811) [(6, 2), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def ep_Q2_020_partial_14_0013 : Poly :=
[
  term ((-221291757377577360 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((110645878688788680 : Rat) / 28298395017400811) [(2, 2), (6, 2), (16, 1)],
  term ((-221291757377577360 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((110645878688788680 : Rat) / 28298395017400811) [(3, 2), (6, 2), (16, 1)],
  term ((221291757377577360 : Rat) / 28298395017400811) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((221291757377577360 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-110645878688788680 : Rat) / 28298395017400811) [(6, 2), (12, 2), (16, 1)],
  term ((-110645878688788680 : Rat) / 28298395017400811) [(6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem ep_Q2_020_partial_14_0013_valid :
    mulPoly ep_Q2_020_coefficient_14_0013
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0014 : Poly :=
[
  term ((-4453784609709528 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def ep_Q2_020_partial_14_0014 : Poly :=
[
  term ((8907569219419056 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem ep_Q2_020_partial_14_0014_valid :
    mulPoly ep_Q2_020_coefficient_14_0014
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0015 : Poly :=
[
  term ((2226892304854764 : Rat) / 28298395017400811) [(7, 2), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def ep_Q2_020_partial_14_0015 : Poly :=
[
  term ((-4453784609709528 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((2226892304854764 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((2226892304854764 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2226892304854764 : Rat) / 28298395017400811) [(7, 2), (12, 2), (16, 1)],
  term ((-2226892304854764 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem ep_Q2_020_partial_14_0015_valid :
    mulPoly ep_Q2_020_coefficient_14_0015
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0016 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def ep_Q2_020_partial_14_0016 : Poly :=
[
  term ((73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem ep_Q2_020_partial_14_0016_valid :
    mulPoly ep_Q2_020_coefficient_14_0016
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0017 : Poly :=
[
  term ((-315668509972248912 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def ep_Q2_020_partial_14_0017 : Poly :=
[
  term ((631337019944497824 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((631337019944497824 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem ep_Q2_020_partial_14_0017_valid :
    mulPoly ep_Q2_020_coefficient_14_0017
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0018 : Poly :=
[
  term ((66565453438243158 : Rat) / 28298395017400811) [(8, 1), (16, 1)]
]

/-- Partial product 18 for generator 14. -/
def ep_Q2_020_partial_14_0018 : Poly :=
[
  term ((-133130906876486316 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((66565453438243158 : Rat) / 28298395017400811) [(2, 2), (8, 1), (16, 1)],
  term ((-133130906876486316 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((66565453438243158 : Rat) / 28298395017400811) [(3, 2), (8, 1), (16, 1)],
  term ((133130906876486316 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((133130906876486316 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-66565453438243158 : Rat) / 28298395017400811) [(8, 1), (12, 2), (16, 1)],
  term ((-66565453438243158 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem ep_Q2_020_partial_14_0018_valid :
    mulPoly ep_Q2_020_coefficient_14_0018
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0019 : Poly :=
[
  term ((6308722559776626 : Rat) / 690204756521971) [(8, 2), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def ep_Q2_020_partial_14_0019 : Poly :=
[
  term ((-12617445119553252 : Rat) / 690204756521971) [(2, 1), (4, 1), (8, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(2, 2), (8, 2), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(3, 2), (8, 2), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(8, 2), (12, 2), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem ep_Q2_020_partial_14_0019_valid :
    mulPoly ep_Q2_020_coefficient_14_0019
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0020 : Poly :=
[
  term ((-659239419967364391 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 14. -/
def ep_Q2_020_partial_14_0020 : Poly :=
[
  term ((1318478839934728782 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem ep_Q2_020_partial_14_0020_valid :
    mulPoly ep_Q2_020_coefficient_14_0020
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0021 : Poly :=
[
  term ((2494809230951271 : Rat) / 975806724737959) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 14. -/
def ep_Q2_020_partial_14_0021 : Poly :=
[
  term ((-4989618461902542 : Rat) / 975806724737959) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((2494809230951271 : Rat) / 975806724737959) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4989618461902542 : Rat) / 975806724737959) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((2494809230951271 : Rat) / 975806724737959) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((4989618461902542 : Rat) / 975806724737959) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((4989618461902542 : Rat) / 975806724737959) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2494809230951271 : Rat) / 975806724737959) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2494809230951271 : Rat) / 975806724737959) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem ep_Q2_020_partial_14_0021_valid :
    mulPoly ep_Q2_020_coefficient_14_0021
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0022 : Poly :=
[
  term ((-121947789968544585 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 22 for generator 14. -/
def ep_Q2_020_partial_14_0022 : Poly :=
[
  term ((243895579937089170 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-121947789968544585 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((243895579937089170 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-121947789968544585 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((-243895579937089170 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((-243895579937089170 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((121947789968544585 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((121947789968544585 : Rat) / 28298395017400811) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem ep_Q2_020_partial_14_0022_valid :
    mulPoly ep_Q2_020_coefficient_14_0022
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0023 : Poly :=
[
  term ((179841458018166153 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 14. -/
def ep_Q2_020_partial_14_0023 : Poly :=
[
  term ((-359682916036332306 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-359682916036332306 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem ep_Q2_020_partial_14_0023_valid :
    mulPoly ep_Q2_020_coefficient_14_0023
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0024 : Poly :=
[
  term ((-395810584157130735 : Rat) / 56596790034801622) [(14, 1), (16, 1)]
]

/-- Partial product 24 for generator 14. -/
def ep_Q2_020_partial_14_0024 : Poly :=
[
  term ((395810584157130735 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 56596790034801622) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem ep_Q2_020_partial_14_0024_valid :
    mulPoly ep_Q2_020_coefficient_14_0024
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0025 : Poly :=
[
  term ((184965281180217030 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

/-- Partial product 25 for generator 14. -/
def ep_Q2_020_partial_14_0025 : Poly :=
[
  term ((-369930562360434060 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((184965281180217030 : Rat) / 28298395017400811) [(2, 2), (14, 2), (16, 1)],
  term ((-369930562360434060 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((184965281180217030 : Rat) / 28298395017400811) [(3, 2), (14, 2), (16, 1)],
  term ((369930562360434060 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((369930562360434060 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-184965281180217030 : Rat) / 28298395017400811) [(12, 2), (14, 2), (16, 1)],
  term ((-184965281180217030 : Rat) / 28298395017400811) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem ep_Q2_020_partial_14_0025_valid :
    mulPoly ep_Q2_020_coefficient_14_0025
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0026 : Poly :=
[
  term ((185176079088560382 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

/-- Partial product 26 for generator 14. -/
def ep_Q2_020_partial_14_0026 : Poly :=
[
  term ((-370352158177120764 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((185176079088560382 : Rat) / 28298395017400811) [(2, 2), (15, 2), (16, 1)],
  term ((-370352158177120764 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((185176079088560382 : Rat) / 28298395017400811) [(3, 2), (15, 2), (16, 1)],
  term ((370352158177120764 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((370352158177120764 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-185176079088560382 : Rat) / 28298395017400811) [(12, 2), (15, 2), (16, 1)],
  term ((-185176079088560382 : Rat) / 28298395017400811) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem ep_Q2_020_partial_14_0026_valid :
    mulPoly ep_Q2_020_coefficient_14_0026
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def ep_Q2_020_coefficient_14_0027 : Poly :=
[
  term ((-2225407019649576 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 27 for generator 14. -/
def ep_Q2_020_partial_14_0027 : Poly :=
[
  term ((4450814039299152 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((-2225407019649576 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((4450814039299152 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((-2225407019649576 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((-4450814039299152 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-4450814039299152 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((2225407019649576 : Rat) / 28298395017400811) [(12, 2), (16, 1)],
  term ((2225407019649576 : Rat) / 28298395017400811) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem ep_Q2_020_partial_14_0027_valid :
    mulPoly ep_Q2_020_coefficient_14_0027
        ep_Q2_020_generator_14_0000_0027 =
      ep_Q2_020_partial_14_0027 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_14_0000_0027 : List Poly :=
[
  ep_Q2_020_partial_14_0000,
  ep_Q2_020_partial_14_0001,
  ep_Q2_020_partial_14_0002,
  ep_Q2_020_partial_14_0003,
  ep_Q2_020_partial_14_0004,
  ep_Q2_020_partial_14_0005,
  ep_Q2_020_partial_14_0006,
  ep_Q2_020_partial_14_0007,
  ep_Q2_020_partial_14_0008,
  ep_Q2_020_partial_14_0009,
  ep_Q2_020_partial_14_0010,
  ep_Q2_020_partial_14_0011,
  ep_Q2_020_partial_14_0012,
  ep_Q2_020_partial_14_0013,
  ep_Q2_020_partial_14_0014,
  ep_Q2_020_partial_14_0015,
  ep_Q2_020_partial_14_0016,
  ep_Q2_020_partial_14_0017,
  ep_Q2_020_partial_14_0018,
  ep_Q2_020_partial_14_0019,
  ep_Q2_020_partial_14_0020,
  ep_Q2_020_partial_14_0021,
  ep_Q2_020_partial_14_0022,
  ep_Q2_020_partial_14_0023,
  ep_Q2_020_partial_14_0024,
  ep_Q2_020_partial_14_0025,
  ep_Q2_020_partial_14_0026,
  ep_Q2_020_partial_14_0027
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_14_0000_0027 : Poly :=
[
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-175474335331953288 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((139494322431547974 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (2, 2), (6, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (2, 2), (8, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-69747161215773987 : Rat) / 28298395017400811) [(0, 1), (2, 2), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-285415654200668748 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-175474335331953288 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((139494322431547974 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (3, 2), (6, 1), (16, 1)],
  term ((142707827100334374 : Rat) / 28298395017400811) [(0, 1), (3, 2), (8, 1), (16, 1)],
  term ((87737167665976644 : Rat) / 28298395017400811) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-69747161215773987 : Rat) / 28298395017400811) [(0, 1), (3, 2), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-139494322431547974 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((285415654200668748 : Rat) / 28298395017400811) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((175474335331953288 : Rat) / 28298395017400811) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-139494322431547974 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-142707827100334374 : Rat) / 28298395017400811) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((69747161215773987 : Rat) / 28298395017400811) [(0, 1), (12, 2), (16, 1)],
  term ((-87737167665976644 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((69747161215773987 : Rat) / 28298395017400811) [(0, 1), (13, 2), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((677945875622153454 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-234306667912533039 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-221291757377577360 : Rat) / 28298395017400811) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((631337019944497824 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-133130906876486316 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(2, 1), (4, 1), (8, 2), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4989618461902542 : Rat) / 975806724737959) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((243895579937089170 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-359682916036332306 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-369930562360434060 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-370352158177120764 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((4450814039299152 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(2, 1), (4, 2), (6, 1), (16, 1)],
  term ((97024205922789528 : Rat) / 28298395017400811) [(2, 1), (4, 2), (8, 1), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((-264376818200694948 : Rat) / 28298395017400811) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(2, 1), (4, 2), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(2, 2), (4, 1), (12, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-19143929519790480 : Rat) / 28298395017400811) [(2, 2), (4, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-338972937811076727 : Rat) / 28298395017400811) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 56596790034801622) [(2, 2), (6, 1), (16, 1)],
  term ((110645878688788680 : Rat) / 28298395017400811) [(2, 2), (6, 2), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((2226892304854764 : Rat) / 28298395017400811) [(2, 2), (7, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((66565453438243158 : Rat) / 28298395017400811) [(2, 2), (8, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(2, 2), (8, 2), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((2494809230951271 : Rat) / 975806724737959) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-121947789968544585 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 56596790034801622) [(2, 2), (14, 1), (16, 1)],
  term ((184965281180217030 : Rat) / 28298395017400811) [(2, 2), (14, 2), (16, 1)],
  term ((185176079088560382 : Rat) / 28298395017400811) [(2, 2), (15, 2), (16, 1)],
  term ((-2225407019649576 : Rat) / 28298395017400811) [(2, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((97024205922789528 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-264376818200694948 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((38287859039580960 : Rat) / 28298395017400811) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((677945875622153454 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-234306667912533039 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-221291757377577360 : Rat) / 28298395017400811) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((631337019944497824 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-133130906876486316 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((1318478839934728782 : Rat) / 28298395017400811) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4989618461902542 : Rat) / 975806724737959) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((243895579937089170 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-359682916036332306 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-369930562360434060 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-370352158177120764 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((4450814039299152 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((132188409100347474 : Rat) / 28298395017400811) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-19143929519790480 : Rat) / 28298395017400811) [(3, 2), (4, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-338972937811076727 : Rat) / 28298395017400811) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 56596790034801622) [(3, 2), (6, 1), (16, 1)],
  term ((110645878688788680 : Rat) / 28298395017400811) [(3, 2), (6, 2), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2226892304854764 : Rat) / 28298395017400811) [(3, 2), (7, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-315668509972248912 : Rat) / 28298395017400811) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((66565453438243158 : Rat) / 28298395017400811) [(3, 2), (8, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(3, 2), (8, 2), (16, 1)],
  term ((-659239419967364391 : Rat) / 28298395017400811) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((2494809230951271 : Rat) / 975806724737959) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-121947789968544585 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((179841458018166153 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 56596790034801622) [(3, 2), (14, 1), (16, 1)],
  term ((184965281180217030 : Rat) / 28298395017400811) [(3, 2), (14, 2), (16, 1)],
  term ((185176079088560382 : Rat) / 28298395017400811) [(3, 2), (15, 2), (16, 1)],
  term ((-2225407019649576 : Rat) / 28298395017400811) [(3, 2), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-97024205922789528 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-677945875622153454 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((48016212144037740 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((221291757377577360 : Rat) / 28298395017400811) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((133130906876486316 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-857710579854060 : Rat) / 975806724737959) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-395810584157130735 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((369930562360434060 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((370352158177120764 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4450814039299152 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((12510526294826244 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-224751650417298690 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((109045803772077474 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)],
  term ((-132188409100347474 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((19143929519790480 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((-97024205922789528 : Rat) / 28298395017400811) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((264376818200694948 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-218091607544154948 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)],
  term ((-677945875622153454 : Rat) / 28298395017400811) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((234306667912533039 : Rat) / 28298395017400811) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((221291757377577360 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-631337019944497824 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((133130906876486316 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1318478839934728782 : Rat) / 28298395017400811) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4989618461902542 : Rat) / 975806724737959) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-243895579937089170 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-395810584157130735 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((369930562360434060 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((370352158177120764 : Rat) / 28298395017400811) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4450814039299152 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)],
  term ((359682916036332306 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109045803772077474 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)],
  term ((218091607544154948 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((338972937811076727 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((338972937811076727 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-234306667912533039 : Rat) / 56596790034801622) [(6, 1), (12, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(6, 1), (12, 3), (16, 1)],
  term ((-234306667912533039 : Rat) / 56596790034801622) [(6, 1), (13, 2), (16, 1)],
  term ((-110645878688788680 : Rat) / 28298395017400811) [(6, 2), (12, 2), (16, 1)],
  term ((-110645878688788680 : Rat) / 28298395017400811) [(6, 2), (13, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(7, 1), (13, 3), (16, 1)],
  term ((-2226892304854764 : Rat) / 28298395017400811) [(7, 2), (12, 2), (16, 1)],
  term ((-2226892304854764 : Rat) / 28298395017400811) [(7, 2), (13, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-66565453438243158 : Rat) / 28298395017400811) [(8, 1), (12, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(8, 1), (12, 3), (16, 1)],
  term ((315668509972248912 : Rat) / 28298395017400811) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-66565453438243158 : Rat) / 28298395017400811) [(8, 1), (13, 2), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(8, 2), (12, 2), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(8, 2), (13, 2), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((659239419967364391 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2494809230951271 : Rat) / 975806724737959) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((121947789968544585 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((395810584157130735 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)],
  term ((-184965281180217030 : Rat) / 28298395017400811) [(12, 2), (14, 2), (16, 1)],
  term ((-185176079088560382 : Rat) / 28298395017400811) [(12, 2), (15, 2), (16, 1)],
  term ((2225407019649576 : Rat) / 28298395017400811) [(12, 2), (16, 1)],
  term ((-2494809230951271 : Rat) / 975806724737959) [(12, 3), (14, 1), (16, 1)],
  term ((121947789968544585 : Rat) / 28298395017400811) [(12, 3), (16, 1)],
  term ((395810584157130735 : Rat) / 56596790034801622) [(13, 2), (14, 1), (16, 1)],
  term ((-184965281180217030 : Rat) / 28298395017400811) [(13, 2), (14, 2), (16, 1)],
  term ((-185176079088560382 : Rat) / 28298395017400811) [(13, 2), (15, 2), (16, 1)],
  term ((2225407019649576 : Rat) / 28298395017400811) [(13, 2), (16, 1)],
  term ((-179841458018166153 : Rat) / 28298395017400811) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 27. -/
theorem ep_Q2_020_block_14_0000_0027_valid :
    checkProductSumEq ep_Q2_020_partials_14_0000_0027
      ep_Q2_020_block_14_0000_0027 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
