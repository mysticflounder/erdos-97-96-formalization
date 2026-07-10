/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 13:0-29

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_13_0000_0029 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0000 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 0 for generator 13. -/
def ep_Q2_054_partial_13_0000 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 2), (7, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (5, 1), (6, 1), (7, 2), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 3), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem ep_Q2_054_partial_13_0000_valid :
    mulPoly ep_Q2_054_coefficient_13_0000
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0001 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1 for generator 13. -/
def ep_Q2_054_partial_13_0001 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem ep_Q2_054_partial_13_0001_valid :
    mulPoly ep_Q2_054_coefficient_13_0001
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0002 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 13. -/
def ep_Q2_054_partial_13_0002 : Poly :=
[
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem ep_Q2_054_partial_13_0002_valid :
    mulPoly ep_Q2_054_coefficient_13_0002
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0003 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 3 for generator 13. -/
def ep_Q2_054_partial_13_0003 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem ep_Q2_054_partial_13_0003_valid :
    mulPoly ep_Q2_054_coefficient_13_0003
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0004 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 4 for generator 13. -/
def ep_Q2_054_partial_13_0004 : Poly :=
[
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 3), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (7, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem ep_Q2_054_partial_13_0004_valid :
    mulPoly ep_Q2_054_coefficient_13_0004
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0005 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 5 for generator 13. -/
def ep_Q2_054_partial_13_0005 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (7, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem ep_Q2_054_partial_13_0005_valid :
    mulPoly ep_Q2_054_coefficient_13_0005
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0006 : Poly :=
[
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 6 for generator 13. -/
def ep_Q2_054_partial_13_0006 : Poly :=
[
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem ep_Q2_054_partial_13_0006_valid :
    mulPoly ep_Q2_054_coefficient_13_0006
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0007 : Poly :=
[
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 7 for generator 13. -/
def ep_Q2_054_partial_13_0007 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (7, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem ep_Q2_054_partial_13_0007_valid :
    mulPoly ep_Q2_054_coefficient_13_0007
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0008 : Poly :=
[
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 8 for generator 13. -/
def ep_Q2_054_partial_13_0008 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem ep_Q2_054_partial_13_0008_valid :
    mulPoly ep_Q2_054_coefficient_13_0008
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0009 : Poly :=
[
  term ((-297675716070 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 9 for generator 13. -/
def ep_Q2_054_partial_13_0009 : Poly :=
[
  term ((595351432140 : Rat) / 45033486517) [(4, 1), (6, 1)],
  term ((-595351432140 : Rat) / 45033486517) [(4, 1), (6, 2)],
  term ((-595351432140 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)],
  term ((-297675716070 : Rat) / 45033486517) [(6, 1)],
  term ((297675716070 : Rat) / 45033486517) [(6, 1), (7, 2)],
  term ((297675716070 : Rat) / 45033486517) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem ep_Q2_054_partial_13_0009_valid :
    mulPoly ep_Q2_054_coefficient_13_0009
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0010 : Poly :=
[
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 10 for generator 13. -/
def ep_Q2_054_partial_13_0010 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (8, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 3), (8, 1), (13, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 3), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem ep_Q2_054_partial_13_0010_valid :
    mulPoly ep_Q2_054_coefficient_13_0010
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0011 : Poly :=
[
  term ((-2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 11 for generator 13. -/
def ep_Q2_054_partial_13_0011 : Poly :=
[
  term ((5893439645016 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (11, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 3), (11, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem ep_Q2_054_partial_13_0011_valid :
    mulPoly ep_Q2_054_coefficient_13_0011
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0012 : Poly :=
[
  term ((132238658115 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 12 for generator 13. -/
def ep_Q2_054_partial_13_0012 : Poly :=
[
  term ((-264477316230 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((264477316230 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((264477316230 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (13, 1)],
  term ((132238658115 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)],
  term ((-132238658115 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-132238658115 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem ep_Q2_054_partial_13_0012_valid :
    mulPoly ep_Q2_054_coefficient_13_0012
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0013 : Poly :=
[
  term ((1473359911254 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 13 for generator 13. -/
def ep_Q2_054_partial_13_0013 : Poly :=
[
  term ((-2946719822508 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (15, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 1), (7, 3), (15, 1)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem ep_Q2_054_partial_13_0013_valid :
    mulPoly ep_Q2_054_coefficient_13_0013
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0014 : Poly :=
[
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 13. -/
def ep_Q2_054_partial_13_0014 : Poly :=
[
  term ((91905676988148 : Rat) / 45033486517) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(4, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 3), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem ep_Q2_054_partial_13_0014_valid :
    mulPoly ep_Q2_054_coefficient_13_0014
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0015 : Poly :=
[
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 15 for generator 13. -/
def ep_Q2_054_partial_13_0015 : Poly :=
[
  term ((81651926988 : Rat) / 45033486517) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem ep_Q2_054_partial_13_0015_valid :
    mulPoly ep_Q2_054_coefficient_13_0015
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0016 : Poly :=
[
  term ((19879764922827 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 16 for generator 13. -/
def ep_Q2_054_partial_13_0016 : Poly :=
[
  term ((-39759529845654 : Rat) / 45033486517) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-19879764922827 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((19879764922827 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)],
  term ((-19879764922827 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem ep_Q2_054_partial_13_0016_valid :
    mulPoly ep_Q2_054_coefficient_13_0016
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0017 : Poly :=
[
  term ((736679955627 : Rat) / 45033486517) [(6, 2)]
]

/-- Partial product 17 for generator 13. -/
def ep_Q2_054_partial_13_0017 : Poly :=
[
  term ((-1473359911254 : Rat) / 45033486517) [(4, 1), (6, 2)],
  term ((1473359911254 : Rat) / 45033486517) [(4, 1), (6, 3)],
  term ((1473359911254 : Rat) / 45033486517) [(5, 1), (6, 2), (7, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (7, 2)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem ep_Q2_054_partial_13_0017_valid :
    mulPoly ep_Q2_054_coefficient_13_0017
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0018 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 18 for generator 13. -/
def ep_Q2_054_partial_13_0018 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem ep_Q2_054_partial_13_0018_valid :
    mulPoly ep_Q2_054_coefficient_13_0018
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0019 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 19 for generator 13. -/
def ep_Q2_054_partial_13_0019 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem ep_Q2_054_partial_13_0019_valid :
    mulPoly ep_Q2_054_coefficient_13_0019
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0020 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 20 for generator 13. -/
def ep_Q2_054_partial_13_0020 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem ep_Q2_054_partial_13_0020_valid :
    mulPoly ep_Q2_054_coefficient_13_0020
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0021 : Poly :=
[
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 21 for generator 13. -/
def ep_Q2_054_partial_13_0021 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem ep_Q2_054_partial_13_0021_valid :
    mulPoly ep_Q2_054_coefficient_13_0021
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0022 : Poly :=
[
  term ((1190702864280 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 22 for generator 13. -/
def ep_Q2_054_partial_13_0022 : Poly :=
[
  term ((2381405728560 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1)],
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(7, 1), (11, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem ep_Q2_054_partial_13_0022_valid :
    mulPoly ep_Q2_054_coefficient_13_0022
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0023 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 13. -/
def ep_Q2_054_partial_13_0023 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem ep_Q2_054_partial_13_0023_valid :
    mulPoly ep_Q2_054_coefficient_13_0023
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0024 : Poly :=
[
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 24 for generator 13. -/
def ep_Q2_054_partial_13_0024 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1), (15, 2)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem ep_Q2_054_partial_13_0024_valid :
    mulPoly ep_Q2_054_coefficient_13_0024
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0025 : Poly :=
[
  term ((-595351432140 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

/-- Partial product 25 for generator 13. -/
def ep_Q2_054_partial_13_0025 : Poly :=
[
  term ((-1190702864280 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(4, 1), (7, 1), (15, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(5, 1), (7, 2), (15, 1)],
  term ((595351432140 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1)],
  term ((-595351432140 : Rat) / 45033486517) [(7, 1), (15, 1)],
  term ((595351432140 : Rat) / 45033486517) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem ep_Q2_054_partial_13_0025_valid :
    mulPoly ep_Q2_054_coefficient_13_0025
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0026 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 26 for generator 13. -/
def ep_Q2_054_partial_13_0026 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 3), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 4), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem ep_Q2_054_partial_13_0026_valid :
    mulPoly ep_Q2_054_coefficient_13_0026
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0027 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 27 for generator 13. -/
def ep_Q2_054_partial_13_0027 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(5, 1), (7, 3), (8, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 4), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem ep_Q2_054_partial_13_0027_valid :
    mulPoly ep_Q2_054_coefficient_13_0027
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0028 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 28 for generator 13. -/
def ep_Q2_054_partial_13_0028 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 3), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(6, 2), (7, 2), (11, 1), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem ep_Q2_054_partial_13_0028_valid :
    mulPoly ep_Q2_054_coefficient_13_0028
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def ep_Q2_054_coefficient_13_0029 : Poly :=
[
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 29 for generator 13. -/
def ep_Q2_054_partial_13_0029 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(5, 1), (7, 3), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(6, 2), (7, 2), (13, 1), (15, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem ep_Q2_054_partial_13_0029_valid :
    mulPoly ep_Q2_054_coefficient_13_0029
        ep_Q2_054_generator_13_0000_0029 =
      ep_Q2_054_partial_13_0029 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_13_0000_0029 : List Poly :=
[
  ep_Q2_054_partial_13_0000,
  ep_Q2_054_partial_13_0001,
  ep_Q2_054_partial_13_0002,
  ep_Q2_054_partial_13_0003,
  ep_Q2_054_partial_13_0004,
  ep_Q2_054_partial_13_0005,
  ep_Q2_054_partial_13_0006,
  ep_Q2_054_partial_13_0007,
  ep_Q2_054_partial_13_0008,
  ep_Q2_054_partial_13_0009,
  ep_Q2_054_partial_13_0010,
  ep_Q2_054_partial_13_0011,
  ep_Q2_054_partial_13_0012,
  ep_Q2_054_partial_13_0013,
  ep_Q2_054_partial_13_0014,
  ep_Q2_054_partial_13_0015,
  ep_Q2_054_partial_13_0016,
  ep_Q2_054_partial_13_0017,
  ep_Q2_054_partial_13_0018,
  ep_Q2_054_partial_13_0019,
  ep_Q2_054_partial_13_0020,
  ep_Q2_054_partial_13_0021,
  ep_Q2_054_partial_13_0022,
  ep_Q2_054_partial_13_0023,
  ep_Q2_054_partial_13_0024,
  ep_Q2_054_partial_13_0025,
  ep_Q2_054_partial_13_0026,
  ep_Q2_054_partial_13_0027,
  ep_Q2_054_partial_13_0028,
  ep_Q2_054_partial_13_0029
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_13_0000_0029 : Poly :=
[
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 2), (7, 1), (13, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((878590800000 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (5, 1), (6, 1), (7, 2), (13, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-878590800000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 3), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 1), (7, 3), (13, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 1), (13, 1), (15, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (6, 3), (7, 1), (13, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (6, 3), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (7, 3), (13, 1), (15, 2)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (7, 4), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (7, 4), (13, 1), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((79375888062 : Rat) / 45033486517) [(1, 1), (6, 1), (13, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((-79375888062 : Rat) / 45033486517) [(1, 1), (6, 3), (13, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((158751776124 : Rat) / 45033486517) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 1), (7, 3), (11, 1), (13, 1)],
  term ((-158751776124 : Rat) / 45033486517) [(1, 1), (7, 3), (13, 1), (15, 1)],
  term ((595351432140 : Rat) / 45033486517) [(4, 1), (6, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((326607707952 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((8274845373576 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-4137422686788 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((81651926988 : Rat) / 45033486517) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2068711343394 : Rat) / 45033486517) [(4, 1), (6, 2)],
  term ((3431995312500 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (8, 1), (13, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((264477316230 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(4, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(4, 1), (6, 3)],
  term ((-367622707952592 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2381405728560 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((1190702864280 : Rat) / 45033486517) [(4, 1), (7, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-595351432140 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((-5893439645016 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (11, 1)],
  term ((264477316230 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (13, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(5, 1), (6, 1), (7, 2), (15, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(5, 1), (6, 2), (7, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(5, 1), (7, 2), (8, 1), (13, 1), (15, 2)],
  term ((326607707952 : Rat) / 45033486517) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((2381405728560 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-1190702864280 : Rat) / 45033486517) [(5, 1), (7, 2), (15, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(5, 1), (7, 3), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(5, 1), (7, 3), (8, 1), (13, 1), (15, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 3), (11, 1), (13, 1)],
  term ((528954632460 : Rat) / 45033486517) [(5, 1), (7, 3), (13, 1), (15, 1)],
  term ((-297675716070 : Rat) / 45033486517) [(6, 1)],
  term ((1715997656250 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-2946719822508 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1)],
  term ((132238658115 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1)],
  term ((1473359911254 : Rat) / 45033486517) [(6, 1), (7, 1), (15, 1)],
  term ((297675716070 : Rat) / 45033486517) [(6, 1), (7, 2)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (7, 2), (9, 1), (13, 1)],
  term ((-19879764922827 : Rat) / 45033486517) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 1), (7, 3), (8, 1), (13, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 1), (7, 3), (11, 1)],
  term ((-132238658115 : Rat) / 45033486517) [(6, 1), (7, 3), (13, 1)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 1), (7, 3), (15, 1)],
  term ((-45952838494074 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1)],
  term ((19879764922827 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)],
  term ((736679955627 : Rat) / 45033486517) [(6, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(6, 2), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(6, 2), (7, 1), (13, 1), (15, 2)],
  term ((595351432140 : Rat) / 45033486517) [(6, 2), (7, 1), (15, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 2), (7, 2)],
  term ((6863990625000 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(6, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(6, 2), (7, 2), (11, 1), (13, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(6, 2), (7, 2), (13, 1), (15, 1)],
  term ((297675716070 : Rat) / 45033486517) [(6, 3)],
  term ((-1715997656250 : Rat) / 45033486517) [(6, 3), (7, 1), (8, 1), (13, 1)],
  term ((2946719822508 : Rat) / 45033486517) [(6, 3), (7, 1), (11, 1)],
  term ((-132238658115 : Rat) / 45033486517) [(6, 3), (7, 1), (13, 1)],
  term ((-1473359911254 : Rat) / 45033486517) [(6, 3), (7, 1), (15, 1)],
  term ((45952838494074 : Rat) / 45033486517) [(6, 3), (8, 1), (13, 1), (15, 1)],
  term ((40825963494 : Rat) / 45033486517) [(6, 3), (9, 1), (13, 1)],
  term ((-19879764922827 : Rat) / 45033486517) [(6, 3), (13, 1), (15, 1)],
  term ((-736679955627 : Rat) / 45033486517) [(6, 4)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-81651926988 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1190702864280 : Rat) / 45033486517) [(7, 1), (11, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((39759529845654 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)],
  term ((-595351432140 : Rat) / 45033486517) [(7, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)],
  term ((264477316230 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 3), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 3), (8, 1), (13, 1), (15, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 3), (9, 1), (11, 1), (13, 1)],
  term ((81651926988 : Rat) / 45033486517) [(7, 3), (9, 1), (13, 1), (15, 1)],
  term ((-1190702864280 : Rat) / 45033486517) [(7, 3), (11, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-39759529845654 : Rat) / 45033486517) [(7, 3), (13, 1), (15, 2)],
  term ((595351432140 : Rat) / 45033486517) [(7, 3), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 4), (8, 1), (11, 1), (13, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 4), (8, 1), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 4), (11, 1), (13, 1)],
  term ((-264477316230 : Rat) / 45033486517) [(7, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 29. -/
theorem ep_Q2_054_block_13_0000_0029_valid :
    checkProductSumEq ep_Q2_054_partials_13_0000_0029
      ep_Q2_054_block_13_0000_0029 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
