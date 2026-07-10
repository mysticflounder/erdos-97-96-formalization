/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 26:0-38

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 26 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_26_0000_0038 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0000 : Poly :=
[
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 26. -/
def ep_Q2_020_partial_26_0000 : Poly :=
[
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem ep_Q2_020_partial_26_0000_valid :
    mulPoly ep_Q2_020_coefficient_26_0000
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0001 : Poly :=
[
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 26. -/
def ep_Q2_020_partial_26_0001 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem ep_Q2_020_partial_26_0001_valid :
    mulPoly ep_Q2_020_coefficient_26_0001
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0002 : Poly :=
[
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def ep_Q2_020_partial_26_0002 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((143920051601621256 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem ep_Q2_020_partial_26_0002_valid :
    mulPoly ep_Q2_020_coefficient_26_0002
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0003 : Poly :=
[
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 26. -/
def ep_Q2_020_partial_26_0003 : Poly :=
[
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 3), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem ep_Q2_020_partial_26_0003_valid :
    mulPoly ep_Q2_020_coefficient_26_0003
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0004 : Poly :=
[
  term ((289865645123346 : Rat) / 975806724737959) [(0, 1), (16, 1)]
]

/-- Partial product 4 for generator 26. -/
def ep_Q2_020_partial_26_0004 : Poly :=
[
  term ((-579731290246692 : Rat) / 975806724737959) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((289865645123346 : Rat) / 975806724737959) [(0, 1), (1, 2), (16, 1)],
  term ((579731290246692 : Rat) / 975806724737959) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((579731290246692 : Rat) / 975806724737959) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289865645123346 : Rat) / 975806724737959) [(0, 1), (14, 2), (16, 1)],
  term ((-289865645123346 : Rat) / 975806724737959) [(0, 1), (15, 2), (16, 1)],
  term ((-579731290246692 : Rat) / 975806724737959) [(0, 2), (12, 1), (16, 1)],
  term ((289865645123346 : Rat) / 975806724737959) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem ep_Q2_020_partial_26_0004_valid :
    mulPoly ep_Q2_020_coefficient_26_0004
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0005 : Poly :=
[
  term ((-67188984011146392 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def ep_Q2_020_partial_26_0005 : Poly :=
[
  term ((134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem ep_Q2_020_partial_26_0005_valid :
    mulPoly ep_Q2_020_coefficient_26_0005
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0006 : Poly :=
[
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 26. -/
def ep_Q2_020_partial_26_0006 : Poly :=
[
  term ((-268755936044585568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (15, 3), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem ep_Q2_020_partial_26_0006_valid :
    mulPoly ep_Q2_020_coefficient_26_0006
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0007 : Poly :=
[
  term ((157728508927917609 : Rat) / 28298395017400811) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 7 for generator 26. -/
def ep_Q2_020_partial_26_0007 : Poly :=
[
  term ((-315457017855835218 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem ep_Q2_020_partial_26_0007_valid :
    mulPoly ep_Q2_020_coefficient_26_0007
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0008 : Poly :=
[
  term ((157728508927917609 : Rat) / 28298395017400811) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 26. -/
def ep_Q2_020_partial_26_0008 : Poly :=
[
  term ((-315457017855835218 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem ep_Q2_020_partial_26_0008_valid :
    mulPoly ep_Q2_020_coefficient_26_0008
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0009 : Poly :=
[
  term ((-49309522543983693 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 9 for generator 26. -/
def ep_Q2_020_partial_26_0009 : Poly :=
[
  term ((98619045087967386 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-49309522543983693 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((98619045087967386 : Rat) / 28298395017400811) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-49309522543983693 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-98619045087967386 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-98619045087967386 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((49309522543983693 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((49309522543983693 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem ep_Q2_020_partial_26_0009_valid :
    mulPoly ep_Q2_020_coefficient_26_0009
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0010 : Poly :=
[
  term ((-178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 10 for generator 26. -/
def ep_Q2_020_partial_26_0010 : Poly :=
[
  term ((356466096067495032 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem ep_Q2_020_partial_26_0010_valid :
    mulPoly ep_Q2_020_coefficient_26_0010
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0011 : Poly :=
[
  term ((-4453784609709528 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 11 for generator 26. -/
def ep_Q2_020_partial_26_0011 : Poly :=
[
  term ((8907569219419056 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem ep_Q2_020_partial_26_0011_valid :
    mulPoly ep_Q2_020_coefficient_26_0011
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0012 : Poly :=
[
  term ((13181166208487778 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 12 for generator 26. -/
def ep_Q2_020_partial_26_0012 : Poly :=
[
  term ((-26362332416975556 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((13181166208487778 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-26362332416975556 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((13181166208487778 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((26362332416975556 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((26362332416975556 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13181166208487778 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13181166208487778 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem ep_Q2_020_partial_26_0012_valid :
    mulPoly ep_Q2_020_coefficient_26_0012
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0013 : Poly :=
[
  term ((238269525202142802 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 13 for generator 26. -/
def ep_Q2_020_partial_26_0013 : Poly :=
[
  term ((-476539050404285604 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((238269525202142802 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-476539050404285604 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((238269525202142802 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((476539050404285604 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((476539050404285604 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-238269525202142802 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((-238269525202142802 : Rat) / 28298395017400811) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem ep_Q2_020_partial_26_0013_valid :
    mulPoly ep_Q2_020_coefficient_26_0013
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0014 : Poly :=
[
  term ((-8733301724382663 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 14 for generator 26. -/
def ep_Q2_020_partial_26_0014 : Poly :=
[
  term ((17466603448765326 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-8733301724382663 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((17466603448765326 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-8733301724382663 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-17466603448765326 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-17466603448765326 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((8733301724382663 : Rat) / 28298395017400811) [(4, 2), (14, 2), (16, 1)],
  term ((8733301724382663 : Rat) / 28298395017400811) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem ep_Q2_020_partial_26_0014_valid :
    mulPoly ep_Q2_020_coefficient_26_0014
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0015 : Poly :=
[
  term ((-157728508927917609 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 26. -/
def ep_Q2_020_partial_26_0015 : Poly :=
[
  term ((315457017855835218 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem ep_Q2_020_partial_26_0015_valid :
    mulPoly ep_Q2_020_coefficient_26_0015
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0016 : Poly :=
[
  term ((131951243430072 : Rat) / 30008902457477) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 26. -/
def ep_Q2_020_partial_26_0016 : Poly :=
[
  term ((-263902486860144 : Rat) / 30008902457477) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((131951243430072 : Rat) / 30008902457477) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-263902486860144 : Rat) / 30008902457477) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((131951243430072 : Rat) / 30008902457477) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((263902486860144 : Rat) / 30008902457477) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-131951243430072 : Rat) / 30008902457477) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-131951243430072 : Rat) / 30008902457477) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((263902486860144 : Rat) / 30008902457477) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem ep_Q2_020_partial_26_0016_valid :
    mulPoly ep_Q2_020_coefficient_26_0016
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0017 : Poly :=
[
  term ((72328312529178 : Rat) / 30008902457477) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 26. -/
def ep_Q2_020_partial_26_0017 : Poly :=
[
  term ((-144656625058356 : Rat) / 30008902457477) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem ep_Q2_020_partial_26_0017_valid :
    mulPoly ep_Q2_020_coefficient_26_0017
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0018 : Poly :=
[
  term ((-36164156264589 : Rat) / 30008902457477) [(5, 2), (16, 1)]
]

/-- Partial product 18 for generator 26. -/
def ep_Q2_020_partial_26_0018 : Poly :=
[
  term ((72328312529178 : Rat) / 30008902457477) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((-36164156264589 : Rat) / 30008902457477) [(0, 2), (5, 2), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-36164156264589 : Rat) / 30008902457477) [(1, 2), (5, 2), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((36164156264589 : Rat) / 30008902457477) [(5, 2), (14, 2), (16, 1)],
  term ((36164156264589 : Rat) / 30008902457477) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem ep_Q2_020_partial_26_0018_valid :
    mulPoly ep_Q2_020_coefficient_26_0018
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0019 : Poly :=
[
  term ((3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 19 for generator 26. -/
def ep_Q2_020_partial_26_0019 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem ep_Q2_020_partial_26_0019_valid :
    mulPoly ep_Q2_020_coefficient_26_0019
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0020 : Poly :=
[
  term ((-5265379791325926 : Rat) / 1230365000756557) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 26. -/
def ep_Q2_020_partial_26_0020 : Poly :=
[
  term ((10530759582651852 : Rat) / 1230365000756557) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(6, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem ep_Q2_020_partial_26_0020_valid :
    mulPoly ep_Q2_020_coefficient_26_0020
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0021 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 26. -/
def ep_Q2_020_partial_26_0021 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem ep_Q2_020_partial_26_0021_valid :
    mulPoly ep_Q2_020_coefficient_26_0021
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0022 : Poly :=
[
  term ((41111458874390880 : Rat) / 28298395017400811) [(6, 1), (16, 1)]
]

/-- Partial product 22 for generator 26. -/
def ep_Q2_020_partial_26_0022 : Poly :=
[
  term ((-82222917748781760 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((41111458874390880 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((-82222917748781760 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((41111458874390880 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((82222917748781760 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((82222917748781760 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41111458874390880 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)],
  term ((-41111458874390880 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem ep_Q2_020_partial_26_0022_valid :
    mulPoly ep_Q2_020_coefficient_26_0022
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0023 : Poly :=
[
  term ((36624773727421311 : Rat) / 56596790034801622) [(6, 2), (16, 1)]
]

/-- Partial product 23 for generator 26. -/
def ep_Q2_020_partial_26_0023 : Poly :=
[
  term ((-36624773727421311 : Rat) / 28298395017400811) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 56596790034801622) [(0, 2), (6, 2), (16, 1)],
  term ((-36624773727421311 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 56596790034801622) [(1, 2), (6, 2), (16, 1)],
  term ((36624773727421311 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36624773727421311 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-36624773727421311 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem ep_Q2_020_partial_26_0023_valid :
    mulPoly ep_Q2_020_coefficient_26_0023
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0024 : Poly :=
[
  term ((49143709399685670 : Rat) / 28298395017400811) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 26. -/
def ep_Q2_020_partial_26_0024 : Poly :=
[
  term ((-98287418799371340 : Rat) / 28298395017400811) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((49143709399685670 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-98287418799371340 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((49143709399685670 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((98287418799371340 : Rat) / 28298395017400811) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-49143709399685670 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-49143709399685670 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((98287418799371340 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem ep_Q2_020_partial_26_0024_valid :
    mulPoly ep_Q2_020_coefficient_26_0024
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0025 : Poly :=
[
  term ((108584799528231939 : Rat) / 56596790034801622) [(7, 2), (16, 1)]
]

/-- Partial product 25 for generator 26. -/
def ep_Q2_020_partial_26_0025 : Poly :=
[
  term ((-108584799528231939 : Rat) / 28298395017400811) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 56596790034801622) [(0, 2), (7, 2), (16, 1)],
  term ((-108584799528231939 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 56596790034801622) [(1, 2), (7, 2), (16, 1)],
  term ((108584799528231939 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108584799528231939 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((-108584799528231939 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem ep_Q2_020_partial_26_0025_valid :
    mulPoly ep_Q2_020_coefficient_26_0025
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0026 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 26 for generator 26. -/
def ep_Q2_020_partial_26_0026 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 26. -/
theorem ep_Q2_020_partial_26_0026_valid :
    mulPoly ep_Q2_020_coefficient_26_0026
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0027 : Poly :=
[
  term ((-310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 26. -/
def ep_Q2_020_partial_26_0027 : Poly :=
[
  term ((621618615099038628 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 26. -/
theorem ep_Q2_020_partial_26_0027_valid :
    mulPoly ep_Q2_020_coefficient_26_0027
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0028 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (16, 1)]
]

/-- Partial product 28 for generator 26. -/
def ep_Q2_020_partial_26_0028 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (14, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 26. -/
theorem ep_Q2_020_partial_26_0028_valid :
    mulPoly ep_Q2_020_coefficient_26_0028
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0029 : Poly :=
[
  term ((-242305118074940775 : Rat) / 113193580069603244) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 26. -/
def ep_Q2_020_partial_26_0029 : Poly :=
[
  term ((242305118074940775 : Rat) / 56596790034801622) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((242305118074940775 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 56596790034801622) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 56596790034801622) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((242305118074940775 : Rat) / 113193580069603244) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((242305118074940775 : Rat) / 113193580069603244) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 26. -/
theorem ep_Q2_020_partial_26_0029_valid :
    mulPoly ep_Q2_020_coefficient_26_0029
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0030 : Poly :=
[
  term ((81173001310999785 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 26. -/
def ep_Q2_020_partial_26_0030 : Poly :=
[
  term ((-81173001310999785 : Rat) / 56596790034801622) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 56596790034801622) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 113193580069603244) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81173001310999785 : Rat) / 113193580069603244) [(12, 1), (14, 3), (16, 1)],
  term ((81173001310999785 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 26. -/
theorem ep_Q2_020_partial_26_0030_valid :
    mulPoly ep_Q2_020_coefficient_26_0030
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0031 : Poly :=
[
  term ((-549047536660940541 : Rat) / 113193580069603244) [(12, 1), (16, 1)]
]

/-- Partial product 31 for generator 26. -/
def ep_Q2_020_partial_26_0031 : Poly :=
[
  term ((549047536660940541 : Rat) / 56596790034801622) [(0, 1), (12, 2), (16, 1)],
  term ((-549047536660940541 : Rat) / 113193580069603244) [(0, 2), (12, 1), (16, 1)],
  term ((549047536660940541 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-549047536660940541 : Rat) / 113193580069603244) [(1, 2), (12, 1), (16, 1)],
  term ((-549047536660940541 : Rat) / 56596790034801622) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((549047536660940541 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)],
  term ((549047536660940541 : Rat) / 113193580069603244) [(12, 1), (15, 2), (16, 1)],
  term ((-549047536660940541 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 26. -/
theorem ep_Q2_020_partial_26_0031_valid :
    mulPoly ep_Q2_020_coefficient_26_0031
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0032 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 32 for generator 26. -/
def ep_Q2_020_partial_26_0032 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 26. -/
theorem ep_Q2_020_partial_26_0032_valid :
    mulPoly ep_Q2_020_coefficient_26_0032
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0033 : Poly :=
[
  term ((81173001310999785 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 26. -/
def ep_Q2_020_partial_26_0033 : Poly :=
[
  term ((-81173001310999785 : Rat) / 56596790034801622) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 56596790034801622) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 56596790034801622) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 113193580069603244) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 113193580069603244) [(13, 1), (15, 3), (16, 1)],
  term ((81173001310999785 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 26. -/
theorem ep_Q2_020_partial_26_0033_valid :
    mulPoly ep_Q2_020_coefficient_26_0033
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0034 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 34 for generator 26. -/
def ep_Q2_020_partial_26_0034 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 26. -/
theorem ep_Q2_020_partial_26_0034_valid :
    mulPoly ep_Q2_020_coefficient_26_0034
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0035 : Poly :=
[
  term ((178844374089231393 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 35 for generator 26. -/
def ep_Q2_020_partial_26_0035 : Poly :=
[
  term ((-357688748178462786 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((178844374089231393 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((-357688748178462786 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((178844374089231393 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((357688748178462786 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((357688748178462786 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178844374089231393 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((-178844374089231393 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 26. -/
theorem ep_Q2_020_partial_26_0035_valid :
    mulPoly ep_Q2_020_coefficient_26_0035
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0036 : Poly :=
[
  term ((-184543871674500513 : Rat) / 113193580069603244) [(14, 2), (16, 1)]
]

/-- Partial product 36 for generator 26. -/
def ep_Q2_020_partial_26_0036 : Poly :=
[
  term ((184543871674500513 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-184543871674500513 : Rat) / 113193580069603244) [(0, 2), (14, 2), (16, 1)],
  term ((184543871674500513 : Rat) / 56596790034801622) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-184543871674500513 : Rat) / 113193580069603244) [(1, 2), (14, 2), (16, 1)],
  term ((-184543871674500513 : Rat) / 56596790034801622) [(12, 1), (14, 3), (16, 1)],
  term ((-184543871674500513 : Rat) / 56596790034801622) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((184543871674500513 : Rat) / 113193580069603244) [(14, 2), (15, 2), (16, 1)],
  term ((184543871674500513 : Rat) / 113193580069603244) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 26. -/
theorem ep_Q2_020_partial_26_0036_valid :
    mulPoly ep_Q2_020_coefficient_26_0036
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0037 : Poly :=
[
  term ((2540979174974793 : Rat) / 4921460003026228) [(15, 2), (16, 1)]
]

/-- Partial product 37 for generator 26. -/
def ep_Q2_020_partial_26_0037 : Poly :=
[
  term ((-2540979174974793 : Rat) / 2460730001513114) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 4921460003026228) [(0, 2), (15, 2), (16, 1)],
  term ((-2540979174974793 : Rat) / 2460730001513114) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 4921460003026228) [(1, 2), (15, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 2460730001513114) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 2460730001513114) [(13, 1), (15, 3), (16, 1)],
  term ((-2540979174974793 : Rat) / 4921460003026228) [(14, 2), (15, 2), (16, 1)],
  term ((-2540979174974793 : Rat) / 4921460003026228) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 26. -/
theorem ep_Q2_020_partial_26_0037_valid :
    mulPoly ep_Q2_020_coefficient_26_0037
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 26. -/
def ep_Q2_020_coefficient_26_0038 : Poly :=
[
  term ((-4285504885760222829 : Rat) / 452774320278412976) [(16, 1)]
]

/-- Partial product 38 for generator 26. -/
def ep_Q2_020_partial_26_0038 : Poly :=
[
  term ((4285504885760222829 : Rat) / 226387160139206488) [(0, 1), (12, 1), (16, 1)],
  term ((-4285504885760222829 : Rat) / 452774320278412976) [(0, 2), (16, 1)],
  term ((4285504885760222829 : Rat) / 226387160139206488) [(1, 1), (13, 1), (16, 1)],
  term ((-4285504885760222829 : Rat) / 452774320278412976) [(1, 2), (16, 1)],
  term ((-4285504885760222829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)],
  term ((-4285504885760222829 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)],
  term ((4285504885760222829 : Rat) / 452774320278412976) [(14, 2), (16, 1)],
  term ((4285504885760222829 : Rat) / 452774320278412976) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 26. -/
theorem ep_Q2_020_partial_26_0038_valid :
    mulPoly ep_Q2_020_coefficient_26_0038
        ep_Q2_020_generator_26_0000_0038 =
      ep_Q2_020_partial_26_0038 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_26_0000_0038 : List Poly :=
[
  ep_Q2_020_partial_26_0000,
  ep_Q2_020_partial_26_0001,
  ep_Q2_020_partial_26_0002,
  ep_Q2_020_partial_26_0003,
  ep_Q2_020_partial_26_0004,
  ep_Q2_020_partial_26_0005,
  ep_Q2_020_partial_26_0006,
  ep_Q2_020_partial_26_0007,
  ep_Q2_020_partial_26_0008,
  ep_Q2_020_partial_26_0009,
  ep_Q2_020_partial_26_0010,
  ep_Q2_020_partial_26_0011,
  ep_Q2_020_partial_26_0012,
  ep_Q2_020_partial_26_0013,
  ep_Q2_020_partial_26_0014,
  ep_Q2_020_partial_26_0015,
  ep_Q2_020_partial_26_0016,
  ep_Q2_020_partial_26_0017,
  ep_Q2_020_partial_26_0018,
  ep_Q2_020_partial_26_0019,
  ep_Q2_020_partial_26_0020,
  ep_Q2_020_partial_26_0021,
  ep_Q2_020_partial_26_0022,
  ep_Q2_020_partial_26_0023,
  ep_Q2_020_partial_26_0024,
  ep_Q2_020_partial_26_0025,
  ep_Q2_020_partial_26_0026,
  ep_Q2_020_partial_26_0027,
  ep_Q2_020_partial_26_0028,
  ep_Q2_020_partial_26_0029,
  ep_Q2_020_partial_26_0030,
  ep_Q2_020_partial_26_0031,
  ep_Q2_020_partial_26_0032,
  ep_Q2_020_partial_26_0033,
  ep_Q2_020_partial_26_0034,
  ep_Q2_020_partial_26_0035,
  ep_Q2_020_partial_26_0036,
  ep_Q2_020_partial_26_0037,
  ep_Q2_020_partial_26_0038
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_26_0000_0038 : Poly :=
[
  term ((178687840000739688 : Rat) / 28298395017400811) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-268755936044585568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-579731290246692 : Rat) / 975806724737959) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((289865645123346 : Rat) / 975806724737959) [(0, 1), (1, 2), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(0, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((98619045087967386 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-205050172417715244 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-476539050404285604 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-178687840000739688 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((89343920000369844 : Rat) / 28298395017400811) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((17466603448765326 : Rat) / 28298395017400811) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-263902486860144 : Rat) / 30008902457477) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-100752366857437980 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-82222917748781760 : Rat) / 28298395017400811) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((-35980012900405314 : Rat) / 28298395017400811) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-36624773727421311 : Rat) / 28298395017400811) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-98287418799371340 : Rat) / 28298395017400811) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-108584799528231939 : Rat) / 28298395017400811) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((242305118074940775 : Rat) / 56596790034801622) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((206667101892242727 : Rat) / 56596790034801622) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-340876540761308718 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((443757724139757609 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-202362572626041495 : Rat) / 56596790034801622) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((4285504885760222829 : Rat) / 226387160139206488) [(0, 1), (12, 1), (16, 1)],
  term ((206667101892242727 : Rat) / 56596790034801622) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((549047536660940541 : Rat) / 56596790034801622) [(0, 1), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((579731290246692 : Rat) / 975806724737959) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-289865645123346 : Rat) / 975806724737959) [(0, 1), (14, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 1), (14, 3), (16, 1)],
  term ((-289865645123346 : Rat) / 975806724737959) [(0, 1), (15, 2), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-49309522543983693 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((174234055391030160 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((13181166208487778 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((238269525202142802 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((-8733301724382663 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((131951243430072 : Rat) / 30008902457477) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-36164156264589 : Rat) / 30008902457477) [(0, 2), (5, 2), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-193063761001306926 : Rat) / 28298395017400811) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((41111458874390880 : Rat) / 28298395017400811) [(0, 2), (6, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 56596790034801622) [(0, 2), (6, 2), (16, 1)],
  term ((49143709399685670 : Rat) / 28298395017400811) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 56596790034801622) [(0, 2), (7, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 113193580069603244) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-725094806822756919 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-616296366329556813 : Rat) / 113193580069603244) [(0, 2), (12, 1), (16, 1)],
  term ((-312890917589668857 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((178844374089231393 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((-184543871674500513 : Rat) / 113193580069603244) [(0, 2), (14, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 4921460003026228) [(0, 2), (15, 2), (16, 1)],
  term ((-4285504885760222829 : Rat) / 452774320278412976) [(0, 2), (16, 1)],
  term ((-89343920000369844 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)],
  term ((35980012900405314 : Rat) / 28298395017400811) [(0, 3), (6, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((289865645123346 : Rat) / 975806724737959) [(0, 3), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((98619045087967386 : Rat) / 28298395017400811) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((356466096067495032 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((8907569219419056 : Rat) / 28298395017400811) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-26362332416975556 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-476539050404285604 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((17466603448765326 : Rat) / 28298395017400811) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-144656625058356 : Rat) / 30008902457477) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263902486860144 : Rat) / 30008902457477) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((10530759582651852 : Rat) / 1230365000756557) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-82222917748781760 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-36624773727421311 : Rat) / 28298395017400811) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-98287418799371340 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-108584799528231939 : Rat) / 28298395017400811) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((621618615099038628 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26450817969644793 : Rat) / 56596790034801622) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-81173001310999785 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((549047536660940541 : Rat) / 56596790034801622) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((268755936044585568 : Rat) / 28298395017400811) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-357688748178462786 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((184543871674500513 : Rat) / 56596790034801622) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((479069351064750897 : Rat) / 56596790034801622) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((4285504885760222829 : Rat) / 226387160139206488) [(1, 1), (13, 1), (16, 1)],
  term ((-81173001310999785 : Rat) / 56596790034801622) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-134377968022292784 : Rat) / 28298395017400811) [(1, 1), (15, 3), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-49309522543983693 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-178233048033747516 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-4453784609709528 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((13181166208487778 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((238269525202142802 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((-8733301724382663 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((131951243430072 : Rat) / 30008902457477) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((72328312529178 : Rat) / 30008902457477) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-36164156264589 : Rat) / 30008902457477) [(1, 2), (5, 2), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-5265379791325926 : Rat) / 1230365000756557) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((41111458874390880 : Rat) / 28298395017400811) [(1, 2), (6, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 56596790034801622) [(1, 2), (6, 2), (16, 1)],
  term ((49143709399685670 : Rat) / 28298395017400811) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 56596790034801622) [(1, 2), (7, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-310809307549519314 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 113193580069603244) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((81173001310999785 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-549047536660940541 : Rat) / 113193580069603244) [(1, 2), (12, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((-993850742867342487 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((178844374089231393 : Rat) / 28298395017400811) [(1, 2), (14, 1), (16, 1)],
  term ((-184543871674500513 : Rat) / 113193580069603244) [(1, 2), (14, 2), (16, 1)],
  term ((2540979174974793 : Rat) / 4921460003026228) [(1, 2), (15, 2), (16, 1)],
  term ((-4285504885760222829 : Rat) / 452774320278412976) [(1, 2), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(1, 3), (11, 1), (16, 1)],
  term ((134377968022292784 : Rat) / 28298395017400811) [(1, 3), (15, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((315457017855835218 : Rat) / 28298395017400811) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-157728508927917609 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-98619045087967386 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-98619045087967386 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((49309522543983693 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((49309522543983693 : Rat) / 28298395017400811) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-356466096067495032 : Rat) / 28298395017400811) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 2), (16, 1)],
  term ((178233048033747516 : Rat) / 28298395017400811) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((476539050404285604 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((30816117026685084 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((4453784609709528 : Rat) / 28298395017400811) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8907569219419056 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((26362332416975556 : Rat) / 28298395017400811) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((476539050404285604 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13181166208487778 : Rat) / 28298395017400811) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-238269525202142802 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)],
  term ((-13181166208487778 : Rat) / 28298395017400811) [(4, 1), (14, 3), (16, 1)],
  term ((-238269525202142802 : Rat) / 28298395017400811) [(4, 1), (15, 2), (16, 1)],
  term ((-17466603448765326 : Rat) / 28298395017400811) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-17466603448765326 : Rat) / 28298395017400811) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((8733301724382663 : Rat) / 28298395017400811) [(4, 2), (14, 2), (16, 1)],
  term ((8733301724382663 : Rat) / 28298395017400811) [(4, 2), (15, 2), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-315457017855835218 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((157728508927917609 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((263902486860144 : Rat) / 30008902457477) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144656625058356 : Rat) / 30008902457477) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131951243430072 : Rat) / 30008902457477) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((12705381628284 : Rat) / 30008902457477) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((263902486860144 : Rat) / 30008902457477) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 1), (15, 3), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-72328312529178 : Rat) / 30008902457477) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((36164156264589 : Rat) / 30008902457477) [(5, 2), (14, 2), (16, 1)],
  term ((36164156264589 : Rat) / 30008902457477) [(5, 2), (15, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((82222917748781760 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((293816127858744906 : Rat) / 28298395017400811) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((5265379791325926 : Rat) / 1230365000756557) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10530759582651852 : Rat) / 1230365000756557) [(6, 1), (12, 2), (14, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((82222917748781760 : Rat) / 28298395017400811) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-41111458874390880 : Rat) / 28298395017400811) [(6, 1), (14, 2), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (14, 3), (16, 1)],
  term ((-41111458874390880 : Rat) / 28298395017400811) [(6, 1), (15, 2), (16, 1)],
  term ((36624773727421311 : Rat) / 28298395017400811) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((36624773727421311 : Rat) / 28298395017400811) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36624773727421311 : Rat) / 56596790034801622) [(6, 2), (14, 2), (16, 1)],
  term ((-36624773727421311 : Rat) / 56596790034801622) [(6, 2), (15, 2), (16, 1)],
  term ((98287418799371340 : Rat) / 28298395017400811) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-49143709399685670 : Rat) / 28298395017400811) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-49143709399685670 : Rat) / 28298395017400811) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((98287418799371340 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 28298395017400811) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((108584799528231939 : Rat) / 28298395017400811) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108584799528231939 : Rat) / 56596790034801622) [(7, 2), (14, 2), (16, 1)],
  term ((-108584799528231939 : Rat) / 56596790034801622) [(7, 2), (15, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-817235557332345360 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-621618615099038628 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (14, 2), (16, 1)],
  term ((310809307549519314 : Rat) / 28298395017400811) [(8, 1), (14, 3), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (15, 2), (16, 1)],
  term ((-242305118074940775 : Rat) / 56596790034801622) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-242305118074940775 : Rat) / 56596790034801622) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((242305118074940775 : Rat) / 113193580069603244) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((242305118074940775 : Rat) / 113193580069603244) [(11, 1), (15, 3), (16, 1)],
  term ((81173001310999785 : Rat) / 28298395017400811) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-549047536660940541 : Rat) / 56596790034801622) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((871025383849773 : Rat) / 2760819026087884) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4285504885760222829 : Rat) / 226387160139206488) [(12, 1), (14, 1), (16, 1)],
  term ((1979802529374791685 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)],
  term ((-450260744660000811 : Rat) / 113193580069603244) [(12, 1), (14, 3), (16, 1)],
  term ((549047536660940541 : Rat) / 113193580069603244) [(12, 1), (15, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-549047536660940541 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)],
  term ((79628047749195 : Rat) / 42426379336433) [(12, 2), (14, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 3), (14, 1), (16, 1)],
  term ((357688748178462786 : Rat) / 28298395017400811) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-450260744660000811 : Rat) / 113193580069603244) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4285504885760222829 : Rat) / 226387160139206488) [(13, 1), (15, 1), (16, 1)],
  term ((871025383849773 : Rat) / 2760819026087884) [(13, 1), (15, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((79628047749195 : Rat) / 42426379336433) [(13, 2), (15, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(13, 3), (15, 1), (16, 1)],
  term ((-178844374089231393 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((63050675325040137 : Rat) / 56596790034801622) [(14, 2), (15, 2), (16, 1)],
  term ((4285504885760222829 : Rat) / 452774320278412976) [(14, 2), (16, 1)],
  term ((-178844374089231393 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((184543871674500513 : Rat) / 113193580069603244) [(14, 4), (16, 1)],
  term ((4285504885760222829 : Rat) / 452774320278412976) [(15, 2), (16, 1)],
  term ((-2540979174974793 : Rat) / 4921460003026228) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 38. -/
theorem ep_Q2_020_block_26_0000_0038_valid :
    checkProductSumEq ep_Q2_020_partials_26_0000_0038
      ep_Q2_020_block_26_0000_0038 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
