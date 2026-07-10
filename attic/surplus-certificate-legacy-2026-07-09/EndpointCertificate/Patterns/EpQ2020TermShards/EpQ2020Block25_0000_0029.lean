/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 25:0-29

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 25 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_25_0000_0029 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0000 : Poly :=
[
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 25. -/
def ep_Q2_020_partial_25_0000 : Poly :=
[
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 25. -/
theorem ep_Q2_020_partial_25_0000_valid :
    mulPoly ep_Q2_020_coefficient_25_0000
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0001 : Poly :=
[
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 25. -/
def ep_Q2_020_partial_25_0001 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 3), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 25. -/
theorem ep_Q2_020_partial_25_0001_valid :
    mulPoly ep_Q2_020_coefficient_25_0001
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0002 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 25. -/
def ep_Q2_020_partial_25_0002 : Poly :=
[
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 25. -/
theorem ep_Q2_020_partial_25_0002_valid :
    mulPoly ep_Q2_020_coefficient_25_0002
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0003 : Poly :=
[
  term ((1825462360860120 : Rat) / 1230365000756557) [(0, 1), (16, 1)]
]

/-- Partial product 3 for generator 25. -/
def ep_Q2_020_partial_25_0003 : Poly :=
[
  term ((-3650924721720240 : Rat) / 1230365000756557) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((1825462360860120 : Rat) / 1230365000756557) [(0, 1), (1, 2), (16, 1)],
  term ((3650924721720240 : Rat) / 1230365000756557) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1825462360860120 : Rat) / 1230365000756557) [(0, 1), (6, 2), (16, 1)],
  term ((3650924721720240 : Rat) / 1230365000756557) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1825462360860120 : Rat) / 1230365000756557) [(0, 1), (7, 2), (16, 1)],
  term ((-3650924721720240 : Rat) / 1230365000756557) [(0, 2), (12, 1), (16, 1)],
  term ((1825462360860120 : Rat) / 1230365000756557) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 25. -/
theorem ep_Q2_020_partial_25_0003_valid :
    mulPoly ep_Q2_020_coefficient_25_0003
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0004 : Poly :=
[
  term ((-108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 4 for generator 25. -/
def ep_Q2_020_partial_25_0004 : Poly :=
[
  term ((216837972767867832 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((216837972767867832 : Rat) / 28298395017400811) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-216837972767867832 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((-216837972767867832 : Rat) / 28298395017400811) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 25. -/
theorem ep_Q2_020_partial_25_0004_valid :
    mulPoly ep_Q2_020_coefficient_25_0004
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0005 : Poly :=
[
  term ((178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 5 for generator 25. -/
def ep_Q2_020_partial_25_0005 : Poly :=
[
  term ((-356466096067495032 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 25. -/
theorem ep_Q2_020_partial_25_0005_valid :
    mulPoly ep_Q2_020_coefficient_25_0005
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0006 : Poly :=
[
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 25. -/
def ep_Q2_020_partial_25_0006 : Poly :=
[
  term ((-8907569219419056 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(4, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 25. -/
theorem ep_Q2_020_partial_25_0006_valid :
    mulPoly ep_Q2_020_coefficient_25_0006
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0007 : Poly :=
[
  term ((-60834190590904884 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 25. -/
def ep_Q2_020_partial_25_0007 : Poly :=
[
  term ((121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 25. -/
theorem ep_Q2_020_partial_25_0007_valid :
    mulPoly ep_Q2_020_coefficient_25_0007
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0008 : Poly :=
[
  term ((-118659088259146200 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 8 for generator 25. -/
def ep_Q2_020_partial_25_0008 : Poly :=
[
  term ((237318176518292400 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-118659088259146200 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((237318176518292400 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-118659088259146200 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-237318176518292400 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((118659088259146200 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((-237318176518292400 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((118659088259146200 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 25. -/
theorem ep_Q2_020_partial_25_0008_valid :
    mulPoly ep_Q2_020_coefficient_25_0008
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0009 : Poly :=
[
  term ((-25369497633124764 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 9 for generator 25. -/
def ep_Q2_020_partial_25_0009 : Poly :=
[
  term ((50738995266249528 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 25. -/
theorem ep_Q2_020_partial_25_0009_valid :
    mulPoly ep_Q2_020_coefficient_25_0009
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0010 : Poly :=
[
  term ((-36692854888581252 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 25. -/
def ep_Q2_020_partial_25_0010 : Poly :=
[
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 25. -/
theorem ep_Q2_020_partial_25_0010_valid :
    mulPoly ep_Q2_020_coefficient_25_0010
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0011 : Poly :=
[
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 11 for generator 25. -/
def ep_Q2_020_partial_25_0011 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 25. -/
theorem ep_Q2_020_partial_25_0011_valid :
    mulPoly ep_Q2_020_coefficient_25_0011
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0012 : Poly :=
[
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 12 for generator 25. -/
def ep_Q2_020_partial_25_0012 : Poly :=
[
  term ((-10530759582651852 : Rat) / 1230365000756557) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (12, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(6, 2), (12, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 25. -/
theorem ep_Q2_020_partial_25_0012_valid :
    mulPoly ep_Q2_020_coefficient_25_0012
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0013 : Poly :=
[
  term ((2066639290171272 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 13 for generator 25. -/
def ep_Q2_020_partial_25_0013 : Poly :=
[
  term ((-4133278580342544 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((2066639290171272 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((2066639290171272 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2066639290171272 : Rat) / 28298395017400811) [(6, 1), (7, 2), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 2), (12, 1), (16, 1)],
  term ((-2066639290171272 : Rat) / 28298395017400811) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 25. -/
theorem ep_Q2_020_partial_25_0013_valid :
    mulPoly ep_Q2_020_coefficient_25_0013
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0014 : Poly :=
[
  term ((2632689895662963 : Rat) / 1230365000756557) [(6, 2), (16, 1)]
]

/-- Partial product 14 for generator 25. -/
def ep_Q2_020_partial_25_0014 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(0, 2), (6, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(1, 2), (6, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 3), (12, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 25. -/
theorem ep_Q2_020_partial_25_0014_valid :
    mulPoly ep_Q2_020_coefficient_25_0014
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0015 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 25. -/
def ep_Q2_020_partial_25_0015 : Poly :=
[
  term ((10530759582651852 : Rat) / 1230365000756557) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(7, 2), (13, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 25. -/
theorem ep_Q2_020_partial_25_0015_valid :
    mulPoly ep_Q2_020_coefficient_25_0015
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0016 : Poly :=
[
  term ((2632689895662963 : Rat) / 1230365000756557) [(7, 2), (16, 1)]
]

/-- Partial product 16 for generator 25. -/
def ep_Q2_020_partial_25_0016 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(0, 2), (7, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(1, 2), (7, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (7, 2), (12, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(7, 3), (13, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 25. -/
theorem ep_Q2_020_partial_25_0016_valid :
    mulPoly ep_Q2_020_coefficient_25_0016
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0017 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 17 for generator 25. -/
def ep_Q2_020_partial_25_0017 : Poly :=
[
  term ((13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 25. -/
theorem ep_Q2_020_partial_25_0017_valid :
    mulPoly ep_Q2_020_coefficient_25_0017
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0018 : Poly :=
[
  term ((310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 25. -/
def ep_Q2_020_partial_25_0018 : Poly :=
[
  term ((-621618615099038628 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 25. -/
theorem ep_Q2_020_partial_25_0018_valid :
    mulPoly ep_Q2_020_coefficient_25_0018
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0019 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (16, 1)]
]

/-- Partial product 19 for generator 25. -/
def ep_Q2_020_partial_25_0019 : Poly :=
[
  term ((13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 2), (8, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 25. -/
theorem ep_Q2_020_partial_25_0019_valid :
    mulPoly ep_Q2_020_coefficient_25_0019
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0020 : Poly :=
[
  term ((1540723537949905221 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 25. -/
def ep_Q2_020_partial_25_0020 : Poly :=
[
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 56596790034801622) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 25. -/
theorem ep_Q2_020_partial_25_0020_valid :
    mulPoly ep_Q2_020_coefficient_25_0020
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0021 : Poly :=
[
  term ((-437565136387331109 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 25. -/
def ep_Q2_020_partial_25_0021 : Poly :=
[
  term ((437565136387331109 : Rat) / 56596790034801622) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 25. -/
theorem ep_Q2_020_partial_25_0021_valid :
    mulPoly ep_Q2_020_coefficient_25_0021
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0022 : Poly :=
[
  term ((13454450885202321 : Rat) / 2760819026087884) [(12, 1), (16, 1)]
]

/-- Partial product 22 for generator 25. -/
def ep_Q2_020_partial_25_0022 : Poly :=
[
  term ((-13454450885202321 : Rat) / 1380409513043942) [(0, 1), (12, 2), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(0, 2), (12, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 1380409513043942) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(1, 2), (12, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 1380409513043942) [(6, 1), (12, 2), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(6, 2), (12, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 1380409513043942) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 25. -/
theorem ep_Q2_020_partial_25_0022_valid :
    mulPoly ep_Q2_020_coefficient_25_0022
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0023 : Poly :=
[
  term ((113502610747420521 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 23 for generator 25. -/
def ep_Q2_020_partial_25_0023 : Poly :=
[
  term ((-113502610747420521 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(6, 1), (12, 3), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 25. -/
theorem ep_Q2_020_partial_25_0023_valid :
    mulPoly ep_Q2_020_coefficient_25_0023
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0024 : Poly :=
[
  term ((-437565136387331109 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 25. -/
def ep_Q2_020_partial_25_0024 : Poly :=
[
  term ((437565136387331109 : Rat) / 56596790034801622) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 25. -/
theorem ep_Q2_020_partial_25_0024_valid :
    mulPoly ep_Q2_020_coefficient_25_0024
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0025 : Poly :=
[
  term ((113502610747420521 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 25 for generator 25. -/
def ep_Q2_020_partial_25_0025 : Poly :=
[
  term ((-113502610747420521 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(7, 1), (13, 3), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 25. -/
theorem ep_Q2_020_partial_25_0025_valid :
    mulPoly ep_Q2_020_coefficient_25_0025
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0026 : Poly :=
[
  term ((1077717134951329173 : Rat) / 226387160139206488) [(14, 1), (16, 1)]
]

/-- Partial product 26 for generator 25. -/
def ep_Q2_020_partial_25_0026 : Poly :=
[
  term ((-1077717134951329173 : Rat) / 113193580069603244) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((1077717134951329173 : Rat) / 226387160139206488) [(0, 2), (14, 1), (16, 1)],
  term ((-1077717134951329173 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1077717134951329173 : Rat) / 226387160139206488) [(1, 2), (14, 1), (16, 1)],
  term ((1077717134951329173 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1077717134951329173 : Rat) / 226387160139206488) [(6, 2), (14, 1), (16, 1)],
  term ((1077717134951329173 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1077717134951329173 : Rat) / 226387160139206488) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 25. -/
theorem ep_Q2_020_partial_25_0026_valid :
    mulPoly ep_Q2_020_coefficient_25_0026
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0027 : Poly :=
[
  term ((-352599356249482797 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 27 for generator 25. -/
def ep_Q2_020_partial_25_0027 : Poly :=
[
  term ((352599356249482797 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 25. -/
theorem ep_Q2_020_partial_25_0027_valid :
    mulPoly ep_Q2_020_coefficient_25_0027
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0028 : Poly :=
[
  term ((-352599356249482797 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 28 for generator 25. -/
def ep_Q2_020_partial_25_0028 : Poly :=
[
  term ((352599356249482797 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 25. -/
theorem ep_Q2_020_partial_25_0028_valid :
    mulPoly ep_Q2_020_coefficient_25_0028
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 25. -/
def ep_Q2_020_coefficient_25_0029 : Poly :=
[
  term ((295991337279301683 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 29 for generator 25. -/
def ep_Q2_020_partial_25_0029 : Poly :=
[
  term ((-295991337279301683 : Rat) / 113193580069603244) [(0, 1), (12, 1), (16, 1)],
  term ((295991337279301683 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((-295991337279301683 : Rat) / 113193580069603244) [(1, 1), (13, 1), (16, 1)],
  term ((295991337279301683 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)],
  term ((-295991337279301683 : Rat) / 226387160139206488) [(6, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)],
  term ((-295991337279301683 : Rat) / 226387160139206488) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 25. -/
theorem ep_Q2_020_partial_25_0029_valid :
    mulPoly ep_Q2_020_coefficient_25_0029
        ep_Q2_020_generator_25_0000_0029 =
      ep_Q2_020_partial_25_0029 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_25_0000_0029 : List Poly :=
[
  ep_Q2_020_partial_25_0000,
  ep_Q2_020_partial_25_0001,
  ep_Q2_020_partial_25_0002,
  ep_Q2_020_partial_25_0003,
  ep_Q2_020_partial_25_0004,
  ep_Q2_020_partial_25_0005,
  ep_Q2_020_partial_25_0006,
  ep_Q2_020_partial_25_0007,
  ep_Q2_020_partial_25_0008,
  ep_Q2_020_partial_25_0009,
  ep_Q2_020_partial_25_0010,
  ep_Q2_020_partial_25_0011,
  ep_Q2_020_partial_25_0012,
  ep_Q2_020_partial_25_0013,
  ep_Q2_020_partial_25_0014,
  ep_Q2_020_partial_25_0015,
  ep_Q2_020_partial_25_0016,
  ep_Q2_020_partial_25_0017,
  ep_Q2_020_partial_25_0018,
  ep_Q2_020_partial_25_0019,
  ep_Q2_020_partial_25_0020,
  ep_Q2_020_partial_25_0021,
  ep_Q2_020_partial_25_0022,
  ep_Q2_020_partial_25_0023,
  ep_Q2_020_partial_25_0024,
  ep_Q2_020_partial_25_0025,
  ep_Q2_020_partial_25_0026,
  ep_Q2_020_partial_25_0027,
  ep_Q2_020_partial_25_0028,
  ep_Q2_020_partial_25_0029
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_25_0000_0029 : Poly :=
[
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3650924721720240 : Rat) / 1230365000756557) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((1825462360860120 : Rat) / 1230365000756557) [(0, 1), (1, 2), (16, 1)],
  term ((395525812768607520 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((237318176518292400 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((79837990019222976 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-386127522002613852 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-1825462360860120 : Rat) / 1230365000756557) [(0, 1), (6, 2), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 3), (16, 1)],
  term ((98287418799371340 : Rat) / 28298395017400811) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3650924721720240 : Rat) / 1230365000756557) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((-49143709399685670 : Rat) / 28298395017400811) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-1825462360860120 : Rat) / 1230365000756557) [(0, 1), (7, 2), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1077717134951329173 : Rat) / 113193580069603244) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-295991337279301683 : Rat) / 113193580069603244) [(0, 1), (12, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 1380409513043942) [(0, 1), (12, 2), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-174234055391030160 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-118659088259146200 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((193063761001306926 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((2066639290171272 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(0, 2), (6, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(0, 2), (7, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((215747411895033081 : Rat) / 113193580069603244) [(0, 2), (12, 1), (16, 1)],
  term ((401342713950663033 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((1077717134951329173 : Rat) / 226387160139206488) [(0, 2), (14, 1), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)],
  term ((1825462360860120 : Rat) / 1230365000756557) [(0, 3), (16, 1)],
  term ((216837972767867832 : Rat) / 28298395017400811) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((121668381181809768 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((237318176518292400 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((50738995266249528 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((73385709777162504 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4133278580342544 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 1380409513043942) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1077717134951329173 : Rat) / 113193580069603244) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 28298395017400811) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-295991337279301683 : Rat) / 113193580069603244) [(1, 1), (13, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 56596790034801622) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((-108418986383933916 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-60834190590904884 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-118659088259146200 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-25369497633124764 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-36692854888581252 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((2066639290171272 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(1, 2), (6, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((2632689895662963 : Rat) / 1230365000756557) [(1, 2), (7, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(1, 2), (12, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((-437565136387331109 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((1077717134951329173 : Rat) / 226387160139206488) [(1, 2), (14, 1), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((-216837972767867832 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-237318176518292400 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (16, 1)],
  term ((-221291757377577360 : Rat) / 28298395017400811) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((118659088259146200 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)],
  term ((108418986383933916 : Rat) / 28298395017400811) [(4, 1), (6, 3), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-121668381181809768 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-237318176518292400 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((60834190590904884 : Rat) / 28298395017400811) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((118659088259146200 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 2), (6, 1), (12, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 2), (6, 2), (16, 1)],
  term ((-50738995266249528 : Rat) / 28298395017400811) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((25369497633124764 : Rat) / 28298395017400811) [(4, 2), (7, 2), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-73385709777162504 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((36692854888581252 : Rat) / 28298395017400811) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((4133278580342544 : Rat) / 28298395017400811) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-2066639290171272 : Rat) / 28298395017400811) [(6, 1), (7, 2), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((1540723537949905221 : Rat) / 56596790034801622) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((1077717134951329173 : Rat) / 113193580069603244) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 1380409513043942) [(6, 1), (12, 2), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(6, 1), (12, 3), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 2), (7, 2), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 2), (8, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-535099371971924985 : Rat) / 113193580069603244) [(6, 2), (12, 1), (16, 1)],
  term ((370912330054564671 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((-1077717134951329173 : Rat) / 226387160139206488) [(6, 2), (14, 1), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((-295991337279301683 : Rat) / 226387160139206488) [(6, 2), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 3), (8, 1), (16, 1)],
  term ((-2066639290171272 : Rat) / 28298395017400811) [(6, 3), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(6, 4), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((1540723537949905221 : Rat) / 56596790034801622) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 1380409513043942) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((1077717134951329173 : Rat) / 113193580069603244) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-352599356249482797 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((295991337279301683 : Rat) / 113193580069603244) [(7, 1), (13, 1), (16, 1)],
  term ((-437565136387331109 : Rat) / 56596790034801622) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((113502610747420521 : Rat) / 28298395017400811) [(7, 1), (13, 3), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(7, 2), (8, 1), (16, 1)],
  term ((-1540723537949905221 : Rat) / 113193580069603244) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(7, 2), (12, 1), (16, 1)],
  term ((-113502610747420521 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((437565136387331109 : Rat) / 113193580069603244) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-597917551549405713 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)],
  term ((-1077717134951329173 : Rat) / 226387160139206488) [(7, 2), (14, 1), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((352599356249482797 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)],
  term ((-295991337279301683 : Rat) / 226387160139206488) [(7, 2), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(7, 3), (13, 1), (16, 1)],
  term ((-2632689895662963 : Rat) / 1230365000756557) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 0 through 29. -/
theorem ep_Q2_020_block_25_0000_0029_valid :
    checkProductSumEq ep_Q2_020_partials_25_0000_0029
      ep_Q2_020_block_25_0000_0029 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
